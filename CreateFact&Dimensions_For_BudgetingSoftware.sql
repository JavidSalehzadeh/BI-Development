CREATE SCHEMA bdg
GO
CREATE SCHEMA gen
GO
CREATE SCHEMA com
GO
CREATE TABLE bdg.DimActionType(
	[ActionTypeID] int NOT NULL,
	[ActionTypeGuid] uniqueidentifier NOT NULL,
	[ActionTypeIndex] int,
	[ActionTypeTitle] nvarchar(256) 
 CONSTRAINT PK_DimActionType_ActionTypeID PRIMARY KEY CLUSTERED (ActionTypeID)
)WITH(DATA_COMPRESSION=PAGE)
---------------------------------------
CREATE TABLE bdg.DimPaymentType(
	[PaymentTypeID] int NOT NULL,
	[PaymentTypeGuid] uniqueidentifier NOT NULL,
	[PaymentTypeTitle] nvarchar(512),
	[PaymentTypeIndex] int,
	[PaymentTypeNatureID] int,
 CONSTRAINT PK_DimPaymentType_PaymentTypeID PRIMARY KEY CLUSTERED (PaymentTypeID)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------
CREATE TABLE bdg.DimCostChapter(
	[CostChapterID] int NOT NULL,
	[CostChapterGuid] uniqueidentifier NOT NULL,
	[CostChapterCode] nvarchar(256),
	[CostChapterTitle] nvarchar(2048),
	[CostChapterParentID] int,
	[CostChapterLevel] smallint,
 CONSTRAINT PK_DimCostChapter_CostChapterID PRIMARY KEY CLUSTERED (CostChapterID)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------
CREATE TABLE bdg.DimProgram(
	[ProgramID] int NOT NULL,
	[ProgramGuid] uniqueidentifier NOT NULL,
	[ProgramCode] nvarchar(256),
	[ProgramTitle] nvarchar(2048),
	[ProgramParentID] int,
	[ProgramLevel] smallint,
 CONSTRAINT PK_DimProgram_ProgramID PRIMARY KEY CLUSTERED (ProgramID)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------
CREATE TABLE bdg.DimCreditType(
	[CreditTypeID] int NOT NULL,
	[CreditTypeGuid] uniqueidentifier NOT NULL,
	[CreditTypeCode] nvarchar(256),
	[CreditTypeTitle] nvarchar(2048),
	[CreditTypeParentID] int,
	[CreditTypeLevel] smallint,
 CONSTRAINT PK_DimCreditType_CreditTypeID PRIMARY KEY CLUSTERED (CreditTypeID)
)WITH(DATA_COMPRESSION=PAGE)
---------------------------------------
CREATE TABLE bdg.DimSourceType(
	[SourceTypeID] int NOT NULL,
	[SourceTypeGuid] uniqueidentifier NOT NULL,
	[SourceTypeCode] nvarchar(256),
	[SourceTypeTitle] nvarchar(2048),
	[SourceTypeParentID] int,
	[SourceTypeLevel] smallint,
 CONSTRAINT PK_DimSourceType_SourceTypeID PRIMARY KEY CLUSTERED (SourceTypeID)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------
CREATE TABLE bdg.DimYear(
	[YearID] int NOT NULL,
	[YearGuid] uniqueidentifier NOT NULL,
	[YearCode] nvarchar(256),
	[YearTitle] nvarchar(2048),
	[YearParentID] int,
	[YearLevel] smallint,
 CONSTRAINT PK_DimYear_YearID PRIMARY KEY CLUSTERED (YearID)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------
CREATE TABLE bdg.DimFiscalPeriod(
	[FiscalPeriodID] int NOT NULL,
	[FiscalPeriodGuid] uniqueidentifier NOT NULL,
	[FiscalPeriodCode] nvarchar(256),
	[FiscalPeriodTitle] nvarchar(2048),
	[FiscalPeriodParentID] int,
	[FiscalPeriodLevel] smallint,
 CONSTRAINT PK_DimFiscalPeriod_FiscalPeriodID PRIMARY KEY CLUSTERED (FiscalPeriodID)
)WITH(DATA_COMPRESSION=PAGE)
---------------------------------------------------------------------------
CREATE TABLE bdg.DimRow(
	[RowID] int NOT NULL,
	[RowGuid] uniqueidentifier NOT NULL,
	[RowCode] nvarchar(256),
	[RowTitle] nvarchar(2048),
	[RowParentID] int,
	[RowLevel] smallint,
 CONSTRAINT PK_DimRow_RowID PRIMARY KEY CLUSTERED (RowID)
)WITH(DATA_COMPRESSION=PAGE)
--------------------------------------------------------
CREATE TABLE bdg.DimSubOffice(
	[SubOfficeID] int NOT NULL,
	[SubOfficeGuid] uniqueidentifier NOT NULL,
	[SubOfficeCode] nvarchar(256),
	[SubOfficeTitle] nvarchar(2048),
	[SubOfficeParentID] int,
	[SubOfficeLevel] smallint,
 CONSTRAINT PK_DimSubOffice_SubOfficeID PRIMARY KEY CLUSTERED (SubOfficeID)
)WITH(DATA_COMPRESSION=PAGE)
--------------------------------------------------------------
CREATE TABLE bdg.DimOtherSourceType(
	[OtherSourceTypeID] int NOT NULL,
	[OtherSourceTypeGuid] uniqueidentifier NOT NULL,
	[OtherSourceTypeCode] nvarchar(256),
	[OtherSourceTypeTitle] nvarchar(2048),
	[OtherSourceTypeParentID] int,
	[OtherSourceTypeLevel] smallint,
 CONSTRAINT PK_DimOtherSourceType_OtherSourceTypeID PRIMARY KEY CLUSTERED (OtherSourceTypeID)
)WITH(DATA_COMPRESSION=PAGE)
-----------------------------------------------------------
CREATE TABLE bdg.DimCurrentCapital(
	[CurrentCapitalID] int NOT NULL,
	[CurrentCapitalGuid] uniqueidentifier NOT NULL,
	[CurrentCapitalCode] nvarchar(256),
	[CurrentCapitalTitle] nvarchar(2048),
	[CurrentCapitalParentID] int,
	[CurrentCapitalLevel] smallint,
 CONSTRAINT PK_DimCurrentCapital_CurrentCapitalID PRIMARY KEY CLUSTERED (CurrentCapitalID)
)WITH(DATA_COMPRESSION=PAGE)
-----------------------------------------------------
CREATE TABLE bdg.DimCreditReceiveType(
	[CreditReceiveTypeID] int NOT NULL,
	[CreditReceiveTypeGuid] uniqueidentifier NOT NULL,
	[CreditReceiveTypeCode] nvarchar(256),
	[CreditReceiveTypeTitle] nvarchar(2048),
	[CreditReceiveTypeParentID] int,
	[CreditReceiveTypeLevel] smallint,
 CONSTRAINT PK_DimCreditReceiveType_CreditReceiveTypeID PRIMARY KEY CLUSTERED (CreditReceiveTypeID)
)WITH(DATA_COMPRESSION=PAGE)
----------------------------------------------------
CREATE TABLE bdg.DimDebtSubject(
	[DebtSubjectID] int NOT NULL,
	[DebtSubjectGuid] uniqueidentifier NOT NULL,
	[DebtSubjectCode] nvarchar(256),
	[DebtSubjectTitle] nvarchar(2048),
	[DebtSubjectParentID] int,
	[DebtSubjectLevel] smallint,
 CONSTRAINT PK_DimDebtSubject_DebtSubjectID PRIMARY KEY CLUSTERED (DebtSubjectID)
)WITH(DATA_COMPRESSION=PAGE)
----------------------------------------------------
CREATE TABLE bdg.DimCapitalChapter(
	[CapitalChapterID] int NOT NULL,
	[CapitalChapterGuid] uniqueidentifier NOT NULL,
	[CapitalChapterCode] nvarchar(256),
	[CapitalChapterTitle] nvarchar(2048),
	[CapitalChapterParentID] int,
	[CapitalChapterLevel] smallint,
 CONSTRAINT PK_DimCapitalChapter_CapitalChapterID PRIMARY KEY CLUSTERED (CapitalChapterID)
)WITH(DATA_COMPRESSION=PAGE)
-------------------------------------------------------
CREATE TABLE gen.DimProject(
	[ProjectKey] int IDENTITY(1,1) NOT NULL,
	[ProjectGuid] uniqueidentifier NOT NULL,
	[ProjectParentGuid] uniqueidentifier,
	[ProjectCode] varchar(16),
	[ProjectTitle] nvarchar(128),
	[ProjectID] int,
	[ProjectParentID] int,
	[ProjectLevel] smallint,
 CONSTRAINT PK_DimProject_ProjectKey PRIMARY KEY CLUSTERED (ProjectKey)
)WITH(DATA_COMPRESSION=PAGE)
------------------------------------------------------
CREATE TABLE gen.DimCostCenter(
	[CostCenterKey] int IDENTITY(1,1) NOT NULL,
	[CostCenterGuid] uniqueidentifier NOT NULL,
	[CostCenterParentGuid] uniqueidentifier,
	[CostCenterCode] varchar(16),
	[CostCenterTitle] nvarchar(128),
	[CostCenterID] int,
	[CostCenterParentID] int,
	[CostCenterLevel] smallint,
 CONSTRAINT PK_DimCostCenter_CostCenterKey PRIMARY KEY CLUSTERED (CostCenterKey)
)WITH(DATA_COMPRESSION=PAGE)
--------------------------------------------------------------------------
CREATE TABLE com.DimPerson(
	[PersonKey] int IDENTITY(1,1) NOT NULL,
	[PersonGuid] uniqueidentifier NOT NULL,
	[PersonCode] varchar(16),
	[DisplayName] nvarchar(128),
	[PersonType] int,
	[PersonTypeTitle] nvarchar(128),
	[DomainCode] nvarchar(128),
	[IDNo] nvarchar(32),
	[Ssn] nvarchar(128),
	[EconomicCode] nvarchar(64),
	[RegisterNumber] nvarchar(64),
	[EconomicalUniqueIdentifier] nvarchar(16),
	[PersonID] int,
 CONSTRAINT PK_DimPerson_PersonKey PRIMARY KEY CLUSTERED (PersonKey)
)WITH(DATA_COMPRESSION=PAGE)
--------------------------------------------------------------------
CREATE TABLE com.DimFiscalYear(
	[FiscalYear] [int] NOT NULL,
	[FiscalYearGuid] uniqueidentifier NOT NULL,
 CONSTRAINT PK_DimFiscalYear_FiscalYear PRIMARY KEY CLUSTERED (FiscalYear)
)WITH(DATA_COMPRESSION=PAGE)
-----------------------------------------------------------------------
dimdate
-----------------------------------------------------------------------------
Create Table bdg.FactActionDetail
(
	 ActionDetailID int,
	 ActionCode nvarchar(32),
	 IssueDate date,
	 FiscalYear int,
	 TotalAmount Decimal(18,2),
	 ReturnAmount Decimal(18,2),
	 ActionTypeID int,
	 PaymentTypeID int,
	 CostChapterID int,
	 ProgramID int,
	 CreditTypeID int,
	 SourceTypeID int,
	 YearID int,
     FiscalPeriodID int,
     RowID int,
     SubOfficeID int,
     OtherSourceTypeID int,
     CurrentCapitalID int,
     CreditReceiveTypeID int,
     DebtSubjectID int,
     CapitalChapterID int,
     ProjectKey int,
     CostCenterKey int,
     PersonKey int,
	 DepartmentID int,
     PerformanceGuaranteeAmount Decimal(18,2),
     SupplyBondAssuranceAmount Decimal(18,2),
     TaxAmount Decimal(18,2),
     InsuranceAmount Decimal(18,2),
     VATAmount Decimal(18,2),
     EmployerInsuranceAmount Decimal(18,2),
     ContractorInsuranceAmount Decimal(18,2),
	 ExtraField1 int,
	 ExtraField2 int,
     ExtraField3 int,
     ExtraField4 int,
     ExtraField5 int,
     ExtraField6 int,
     ExtraField7 int,
     ExtraField8 int,
     ExtraField9 int,
     ExtraField10 int
 CONSTRAINT PK_FactActionDetail_ActionDetailID       PRIMARY KEY CLUSTERED (ActionDetailID),
 CONSTRAINT FK_FactActionDetail_DimActionType        FOREIGN KEY (ActionTypeID)        REFERENCES bdg.DimActionType(ActionTypeID),
 CONSTRAINT FK_FactActionDetail_DimPaymentType       FOREIGN KEY (PaymentTypeID)       REFERENCES bdg.DimPaymentType(PaymentTypeID),
 CONSTRAINT FK_FactActionDetail_DimCostChapter       FOREIGN KEY (CostChapterID)       REFERENCES bdg.DimCostChapter(CostChapterID),
 CONSTRAINT FK_FactActionDetail_DimProgram           FOREIGN KEY (ProgramID)           REFERENCES bdg.DimProgram(ProgramID),
 CONSTRAINT FK_FactActionDetail_DimCreditType        FOREIGN KEY (CreditTypeID)        REFERENCES bdg.DimCreditType(CreditTypeID),
 CONSTRAINT FK_FactActionDetail_DimSourceType        FOREIGN KEY (SourceTypeID)        REFERENCES bdg.DimSourceType(SourceTypeID),
 CONSTRAINT FK_FactActionDetail_DimYear              FOREIGN KEY (YearID)              REFERENCES bdg.DimYear(YearID),
 CONSTRAINT FK_FactActionDetail_DimFiscalPeriod      FOREIGN KEY (FiscalPeriodID)      REFERENCES bdg.DimFiscalPeriod(FiscalPeriodID),
 CONSTRAINT FK_FactActionDetail_DimRow               FOREIGN KEY (RowID)               REFERENCES bdg.DimRow(RowID),
 CONSTRAINT FK_FactActionDetail_DimSubOffice         FOREIGN KEY (SubOfficeID)         REFERENCES bdg.DimSubOffice(SubOfficeID),
 CONSTRAINT FK_FactActionDetail_DimOtherSourceType   FOREIGN KEY (OtherSourceTypeID)   REFERENCES bdg.DimOtherSourceType(OtherSourceTypeID),
 CONSTRAINT FK_FactActionDetail_DimCurrentCapital    FOREIGN KEY (CurrentCapitalID)    REFERENCES bdg.DimCurrentCapital(CurrentCapitalID),
 CONSTRAINT FK_FactActionDetail_DimCreditReceiveType FOREIGN KEY (CreditReceiveTypeID) REFERENCES bdg.DimCreditReceiveType(CreditReceiveTypeID),
 CONSTRAINT FK_FactActionDetail_DimDebtSubject       FOREIGN KEY (DebtSubjectID)       REFERENCES bdg.DimDebtSubject(DebtSubjectID),
 CONSTRAINT FK_FactActionDetail_DimCapitalChapter    FOREIGN KEY (CapitalChapterID)    REFERENCES bdg.DimCapitalChapter(CapitalChapterID),
 CONSTRAINT FK_FactActionDetail_DimProject           FOREIGN KEY (ProjectKey)          REFERENCES gen.DimProject(ProjectKey),
 CONSTRAINT FK_FactActionDetail_DimCostCenter        FOREIGN KEY (CostCenterKey)       REFERENCES gen.DimCostCenter(CostCenterKey),
 CONSTRAINT FK_FactActionDetail_DimPerson            FOREIGN KEY (PersonKey)           REFERENCES com.DimPerson(PersonKey),
 CONSTRAINT FK_FactActionDetail_DimFiscalYear        FOREIGN KEY (FiscalYear)          REFERENCES com.DimFiscalYear(FiscalYear),
 CONSTRAINT FK_FactActionDetail_DimDate              FOREIGN KEY (IssueDate)           REFERENCES com.DimDate(Date)
)WITH(DATA_COMPRESSION=PAGE)
-----------------------------------------------------------------------------------
