
CREATE SCHEMA lcm
GO
CREATE SCHEMA cnt
GO
CREATE TABLE cnt.DimContract(
	[ContractKey] int IDENTITY(1,1) NOT NULL,
	[ContractGuid] uniqueidentifier NOT NULL,
	[ContractBaseGuid] uniqueidentifier NOT NULL,
	[ContractNo] nvarchar(128),
	[ContractSubject] nvarchar(512),
	[State] uniqueidentifier, 
	[StateTitle] nvarchar(256),
	[ContractTypeGuid] uniqueidentifier,
	[ContractTypeTitle] nvarchar(256),
	[ContractServiceItemSelectionTypeTitle] nvarchar(256),
	[NatureTitle] nvarchar(128),
	[ContractCategoryTitle] nvarchar(256),
	[FundingResourceTitle] nvarchar(256),
	[GatewayItemGuid] uniqueidentifier
 CONSTRAINT PK_DimContract_ContractKey PRIMARY KEY CLUSTERED (ContractKey)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------------------------------------------------------------
CREATE TABLE cnt.FactContract(
	[ContractID] int IDENTITY(1,1) NOT NULL,
	[ContractKey] int NOT NULL,
	[RegisteredDate] date,
	[RegistrarUserID] int,
	[Date] date,
	[StartDate] date,
	[EndDate] date,
	[DepartmentID] int,
	[FinancialActivityTypeID] int,
	[IncreaseDecreasePercent] decimal(5,2),
	[MinusPlusCoefficient] decimal(3,2),
	[RefundPrepaymentPercent] decimal(5,2),
	[Duration] int,
	[PersonKey] int,
	[ContractAmount] decimal(18,3),
	[NetAmount] decimal(18,3),
	[GrossAmount] decimal(18,3)
 CONSTRAINT PK_FactContract_ContractID   PRIMARY KEY CLUSTERED (ContractID),
 CONSTRAINT FK_FactContract_DimContract  FOREIGN KEY (ContractKey)    REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactContract_DimDate1     FOREIGN KEY (RegisteredDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactContract_DimDate2     FOREIGN KEY (Date)           REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactContract_DimDate3     FOREIGN KEY (StartDate)      REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactContract_DimDate4     FOREIGN KEY (EndDate)        REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactContract_DimPerson    FOREIGN KEY (PersonKey)      REFERENCES com.DimPerson(PersonKey)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------------------------------------------------------------
CREATE TABLE cnt.DimDetailType(
	[DetailTypeKey] int IDENTITY(1,1) NOT NULL,
	[DetailTypeGuid] uniqueidentifier NOT NULL,
	[DetailTypeTitle] nvarchar(256),
	[Subject] int
 CONSTRAINT PK_DimDetailType_DetailTypeKey PRIMARY KEY CLUSTERED (DetailTypeKey)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------------------------------------------------
CREATE TABLE cnt.FactContractDetail(
	[ContractDetailID] int IDENTITY(1,1) NOT NULL,
	[DetailTypeKey] int NOT NULL,
	[ContractKey] int NOT NULL,
	[TotalAmount] decimal(18,3),
	[RemainAmount] decimal(18,3),
	[TotalAdditionAmount] decimal(18,3),
	[TotalSubtractionAmount] decimal(18,3)
 CONSTRAINT PK_FactContractDetail_ContractDetailID  PRIMARY KEY CLUSTERED (ContractDetailID),
 CONSTRAINT FK_FactContractDetail_DimContract       FOREIGN KEY (ContractKey) REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactContractDetail_DimDetailType FOREIGN KEY (DetailTypeKey) REFERENCES cnt.DimDetailType(DetailTypeKey)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE cnt.DimWorkStatement(
	[WorkStatementKey] int IDENTITY(1,1) NOT NULL,
	[WorkStatementGuid] uniqueidentifier NOT NULL,
	[ContractBaseGuid] uniqueidentifier NOT NULL,
	[State] uniqueidentifier,
	[StateTitle] nvarchar(256),
	[Type] int, 
	[TypeTitle] nvarchar(256),
	[GatewayItemGuid] uniqueidentifier
 CONSTRAINT PK_DimWorkStatement_WorkStatementKey PRIMARY KEY CLUSTERED (WorkStatementKey)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------------------------------------------
CREATE TABLE cnt.FactWorkStatement(
	[WorkStatementGuid] uniqueidentifier NOT NULL,
	[WorkStatementKey] int NOT NULL,
	[ContractKey] int NOT NULL,
	[Code] nvarchar(256),
	[StartDate] date,
	[EndDate] date,
	[RegistrarUserID] int,
	[RegistrationDate] date,
	[ConfirmedDate] date,
	[PaymentDate] date,
	[FirstAmount] decimal(18,3),
	[Amount] decimal(18,3),
	[PaidAmount] decimal(18,3),
	[PayableAmount] decimal(18,3),
	[FiscalSubtractionAdditionAmount] decimal(18,3),
	[WorkstatementsPaidAmount]  decimal(18,3),
	[FiscalYear] int,
	[ProjectKey] int,
	[CostCenterKey] int
 CONSTRAINT PK_FactWorkStatement_WorkStatementGuid   PRIMARY KEY CLUSTERED (WorkStatementGuid),
 CONSTRAINT FK_FactWorkStatement_DimWorkStatement  FOREIGN KEY (WorkStatementKey)    REFERENCES cnt.DimWorkStatement(WorkStatementKey),
 CONSTRAINT FK_FactWorkStatement_DimContract  FOREIGN KEY (ContractKey)       REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactWorkStatement_DimDate1     FOREIGN KEY (StartDate)         REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactWorkStatement_DimDate2     FOREIGN KEY (EndDate)           REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactWorkStatement_DimDate3     FOREIGN KEY (RegistrationDate)  REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactWorkStatement_DimDate4     FOREIGN KEY (ConfirmedDate)     REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactWorkStatement_DimDate5     FOREIGN KEY (PaymentDate)       REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactWorkStatement_DimProject    FOREIGN KEY (ProjectKey)         REFERENCES gen.DimProject(ProjectKey),
 CONSTRAINT FK_FactWorkStatement_DimCostCenter FOREIGN KEY (CostCenterKey)         REFERENCES gen.DimCostCenter(CostCenterKey)
)WITH(DATA_COMPRESSION=PAGE)
--------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE cnt.FactWorkStatementDetail(
	[WorkStatementDetailID] int IDENTITY(1,1) NOT NULL,
	[WorkStatementKey] int NOT NULL,
	[ContractKey] int NOT NULL,
	[WorkStatementGuid] uniqueidentifier NOT NULL,
	[DetailTypeKey] int,
	[Amount] decimal(18,3),
	[EquivalentAmount] decimal(18,3),
	[TotalAdditionAmount] decimal(18,3),
	[TotalSubtractionAmount] decimal(18,3),
	[TotalAmount] decimal(18,3),
	[RemainAmount]  decimal(18,3)
 CONSTRAINT PK_FactWorkStatementDetail_WorkStatementDetailID   PRIMARY KEY CLUSTERED (WorkStatementDetailID),
 CONSTRAINT FK_FactWorkStatementDetail_DimWorkStatement  FOREIGN KEY (WorkStatementKey)    REFERENCES cnt.DimWorkStatement(WorkStatementKey),
 CONSTRAINT FK_FactWorkStatementDetail_DimContract  FOREIGN KEY (ContractKey)       REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactWorkStatementDetail_DimDetailType FOREIGN KEY (DetailTypeKey) REFERENCES cnt.DimDetailType(DetailTypeKey)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------------------------

CREATE TABLE cnt.DimSuretyBondSubject(
	[SuretySubjectKey] int IDENTITY(1,1) NOT NULL,
	[SuretySubjectGuid] uniqueidentifier NOT NULL,
	[SuretySubjectName] nvarchar(256),
	[Active] bit	
 CONSTRAINT PK_DimSuretyBondSubject_SuretySubjectKey  PRIMARY KEY CLUSTERED (SuretySubjectKey)
 )WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------------------------------------
CREATE TABLE cnt.DimSuretyBondState(
	[SuretyBondStateKey] int IDENTITY(1,1) NOT NULL,
	[SuretyBondStateID] int NOT NULL,
	[SuretyBondLatinTitle] varchar(128),
	[SuretyBondPersianTitle] nvarchar(128)	
 CONSTRAINT PK_DimSuretyBondState_SuretyBondStateKey  PRIMARY KEY CLUSTERED (SuretyBondStateKey)
 )WITH(DATA_COMPRESSION=PAGE)

  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (0,'Draft',N'پیش نویس')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (1,'Obtained',N'اخذ شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (2,'Released',N'آزاد شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (3,'SendForObtainGive',N'ارسال برای اخذ/ارائه')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (4,'Given',N'ارائه شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (5,'SendForReleased',N'ارسال برای آزادسازی')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (6,'LegalProceed',N'حقوقی شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (7,'SendForLegal',N'ارسال برای حقوقی')  	
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (8,'Extended',N'تمدید شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (9,'Reduced',N'تقلیل شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (10,'ReducedExtended',N'تقلیل شده/تمدید شده')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (11,'ExtendRequest',N'درخواست تمدید')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (12,'ReduceRequest',N'درخواست تقلیل')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (13,'ReduceExtendRequest',N'درخواست تقلیل/تمدید')
  INSERT cnt.DimSuretyBondState (SuretyBondStateID,SuretyBondLatinTitle,SuretyBondPersianTitle) VALUES (14,'ReturnToDraft',N'بازگشت به پیش نویس')

----------------------------------------------------------------------------
CREATE TABLE lcm.DimSuretyBondType(
	[SuretyBondTypeKey] int IDENTITY(1,1) NOT NULL,
	[SuretyBondTypeGuid] uniqueidentifier NOT NULL,
	[SuretyBondTypeName] nvarchar(256),
	[Active] bit	
 CONSTRAINT PK_DimSuretyBondType_SuretyBondTypeKey  PRIMARY KEY CLUSTERED (SuretyBondTypeKey)
 )WITH(DATA_COMPRESSION=PAGE)
 -------------------------------------------------------------------------
CREATE TABLE cnt.FactSuretyBond(
	[SuretyBondGuid] uniqueidentifier NOT NULL,
	[ContractKey] int NOT NULL,
	[Number] nvarchar(128),
	[SuretyBondTypeKey] int NOT NULL,
	[SuretySubjectKey] int NOT NULL,
	[SuretyBondStateKey] int NOT NULL,
    [DefinedStatus] int,
	[Amount] decimal(18,3),
	[ObtainedAmount] decimal(18,3),
    [ValidityDate] date,
    [IssueDate] date,
    [ObtainedDate] date,
    [ReleaseDate] date,
    [LegalDate] date,
    [RegisteredDate] date,
    [RegistrarUserID] int,
    [Description] nvarchar(max),
    [PersonKey] int,
    [SepamNumber] nvarchar(256),
    [FinancialActivityTypeID] int,
    [ProjectKey] int

 CONSTRAINT PK_FactSuretyBond_SuretyBondGuid   PRIMARY KEY CLUSTERED (SuretyBondGuid),
 CONSTRAINT FK_FactSuretyBond_DimContract  FOREIGN KEY (ContractKey)    REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactSuretyBond_DimSuretyBondType  FOREIGN KEY (SuretyBondTypeKey) REFERENCES lcm.DimSuretyBondType(SuretyBondTypeKey),
 CONSTRAINT FK_FactSuretyBond_DimSuretyBondSubject FOREIGN KEY (SuretySubjectKey) REFERENCES cnt.DimSuretyBondSubject(SuretySubjectKey),
 CONSTRAINT FK_FactSuretyBond_DimSuretyBondState  FOREIGN KEY (SuretyBondStateKey) REFERENCES cnt.DimSuretyBondState(SuretyBondStateKey),
 CONSTRAINT FK_FactSuretyBond_DimDate1  FOREIGN KEY (ValidityDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimDate2  FOREIGN KEY (IssueDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimDate3  FOREIGN KEY (ObtainedDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimDate4  FOREIGN KEY (ReleaseDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimDate5  FOREIGN KEY (LegalDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimDate6  FOREIGN KEY (RegisteredDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactSuretyBond_DimPerson  FOREIGN KEY (PersonKey)  REFERENCES com.DimPerson(PersonKey),
 CONSTRAINT FK_FactSuretyBond_DimProject FOREIGN KEY (ProjectKey) REFERENCES gen.DimProject(ProjectKey),
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------
CREATE TABLE cnt.FactItemService(
	[ItemServiceID] int IDENTITY(1,1) NOT NULL,
	[ContractKey] int NOT NULL,
	[Type] Tinyint NOT NULL,
	[Quantity] decimal(18,3),
	[UnitPrice] decimal(18,3),
	[ItemKey] int,
	[ServiceKey] int,
	[DiscountQuantity] int,
	[DiscountAmount] decimal(18,3),
	[DiscountPercent] decimal(5,2),
	[DiscountRemained] int,
	[ProjectKey] int,
	[CostCenterKey] int,
    [TotalPrice] decimal(18,3),
    [RemainedNumbers] decimal(18,3),
    [TotalQuantity] decimal(18,3)

 CONSTRAINT PK_FactItemService_ItemServiceID   PRIMARY KEY CLUSTERED (ItemServiceID),
 CONSTRAINT FK_FactItemService_DimContract  FOREIGN KEY (ContractKey)    REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactItemService_DimProject    FOREIGN KEY (ProjectKey)      REFERENCES gen.DimProject(ProjectKey),
 CONSTRAINT FK_FactItemService_DimCostCenter    FOREIGN KEY (CostCenterKey)      REFERENCES gen.DimCostCenter(CostCenterKey)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------------------------------

CREATE TABLE cnt.FactAcquittances(
	[AcquittancesID] int IDENTITY(1,1) NOT NULL,
	[ContractKey] int NOT NULL,
	[ReceivedDate] date,
	[IssueDate] date,
	[State] nvarchar(256),
	[Description] nvarchar(max),
	[FiscalSubtractionAdditionKey] int,
	[Amount] decimal(18,3),
	[TotalAmount] decimal(18,3),
	[RemainAmount] decimal(18,3),
    [TaxBranchKey] int,
    [InsuranceBranchKey] int
 CONSTRAINT PK_FactAcquittances_AcquittancesID   PRIMARY KEY CLUSTERED (AcquittancesID),
 CONSTRAINT FK_FactAcquittances_DimContract  FOREIGN KEY (ContractKey)  REFERENCES cnt.DimContract(ContractKey),
 CONSTRAINT FK_FactAcquittances_DimDate1     FOREIGN KEY (ReceivedDate) REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactAcquittances_DimDate2     FOREIGN KEY (IssueDate)    REFERENCES com.DimDate(Date),
 CONSTRAINT FK_FactAcquittances_DimDetailType   FOREIGN KEY (FiscalSubtractionAdditionKey)  REFERENCES cnt.DimDetailType(DetailTypeKey)
)WITH(DATA_COMPRESSION=PAGE)
