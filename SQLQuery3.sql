USE [WideWorldImportersDW]
GO

CREATE VIEW [dbo].[vDimDate]
AS
SELECT  [Date]
		,[Month]	= DATEFROMPARTS([Calendar Year],[Calendar Month Number],1)
		,[Year]		= DATEFROMPARTS([Calendar Year],1,1)
		,[Short Month]			AS [ShortMonth]
        ,[Calendar Year Label]	AS	[CalendarYearLabel]
        ,[ISO Week Number]		AS	[ISOWeekNumber]
  FROM [WideWorldImportersDW].[Dimension].[Date]
GO


CREATE VIEW [dbo].[vDimCity]
AS
SELECT [City Key]		AS	[CityKey]
      ,[WWI City ID]	AS	[WWICityID]
      ,[City]			AS	[City]
      ,[State Province]	AS	[StateProvince]
      ,[Country]		AS	[Country]
      ,[Continent]		AS	[Continent]
      ,[Sales Territory]AS	[SalesTerritory]
      ,[Region]			AS	[Region]
      ,[Subregion]     	AS	[Subregion]     
  FROM [WideWorldImportersDW].[Dimension].[City]
GO

CREATE VIEW [dbo].[vDimCustomer]
AS
SELECT [Customer Key]		AS	[CustomerKey]
      ,[WWI Customer ID]	AS	[WWICustomerID]
      ,[Customer]			AS	[Customer]
      ,[Bill To Customer]	AS	[BillToCustomer]
      ,[Category]			AS	[Category]
      ,[Buying Group]		AS	[BuyingGroup]
      ,[Primary Contact]	AS	[PrimaryContact]
      ,[Postal Code]		AS	[PostalCode]
      ,[Lineage Key]		AS	[LineageKey]
  FROM [WideWorldImportersDW].[Dimension].[Customer]
  GO

  CREATE VIEW [dbo].[vDimStockItem]
  AS
  SELECT [Stock Item Key]			AS	[StockItemKey]
		,[WWI Stock Item ID]		AS	[WWIStockItemID]
		,[Stock Item]				AS	[StockItem]
		,[Color]					AS	[Color]
		,[Selling Package]			AS	[SellingPackage]
		,[Buying Package]			AS	[BuyingPackage]
		,[Brand]					AS	[Brand]
		,[Size]						AS	[Size]
		,[Lead Time Days]			AS	[LeadTimeDays]
		,[Quantity Per Outer]		AS	[QuantityPerOuter]
		,[Is Chiller Stock]			AS	[IsChillerStock]
		,[Barcode]					AS	[Barcode]
		,[Tax Rate]					AS	[TaxRate]
		,[Unit Price]				AS	[UnitPrice]
		,[Recommended Retail Price]	AS	[RecommendedRetailPrice]
		,[Typical Weight Per Unit]	AS	[TypicalWeight Per Unit]
		,[Photo]					AS	[Photo]
		,[Lineage Key]				AS	[LineageKey]
  FROM [WideWorldImportersDW].[Dimension].[Stock Item]
  GO


  CREATE VIEW [dbo].[vDimEmployee]
  AS
  SELECT [Employee Key]		AS	[EmployeeKey]
		,[WWI Employee ID]	AS	[WWIEmployeeID]
		,[Employee]			AS	[Employee]
		,[Preferred Name]	AS	[PreferredName]
		,[Is Salesperson]	AS	[IsSalesperson]
		,[Photo]			AS	[Photo]
		,[Lineage Key]		AS	[LineageKey]
  FROM [WideWorldImportersDW].[Dimension].[Employee]
  GO

  CREATE VIEW [dbo].[vFactOrder]
  AS
  SELECT [Order Key]			AS	[OrderKey]
		,[City Key]				AS	[CityKey]
		,[Customer Key]			AS	[CustomerKey]
		,[Stock Item Key]		AS	[StockItemKey]
		,[Order Date Key]		AS	[OrderDateKey]
		,[Picked Date Key]		AS	[PickedDateKey]
		,[Salesperson Key]		AS	[SalespersonKey]	
		,[WWI Order ID]			AS	[WWIOrderID]
		,[WWI Backorder ID]		AS	[WWIBackorderID]
		,[Description]			AS	[Description]
		,[Package]				AS	[Package]
		,[Quantity]				AS	[Quantity]
		,[Unit Price]			AS	[UnitPrice]
		,[Tax Rate]				AS	[TaxRate]
		,[Total Excluding Tax]	AS	[TotalExcludingTax]
		,[Tax Amount]			AS	[TaxAmount]
		,[Total Including Tax]	AS	[TotalIncludingTax]
		,[Lineage Key]			AS	[LineageKey]
  FROM [WideWorldImportersDW].[Fact].[Order]
  GO

  CREATE VIEW [dbo].[vFactSale]
  AS
  SELECT [Sale Key]				AS	[SaleKey]
		,[City Key]				AS	[CityKey]
		,[Customer Key]			AS	[CustomerKey]
		,[Bill To Customer Key]	AS	[BillToCustomerKey]
		,[Stock Item Key]		AS	[StockItemKey]
		,[Invoice Date Key]		AS	[InvoiceDateKey]
		,[Delivery Date Key]	AS	[DeliveryDateKey]
		,[Salesperson Key]		AS	[SalespersonKey]
		,[WWI Invoice ID]		AS	[WWIInvoiceID]
		,[Description]			AS	[Description]
		,[Package]				AS	[Package]
		,[Quantity]				AS	[Quantity]
		,[Unit Price]			AS	[UnitPrice]
		,[Tax Rate]				AS	[TaxRate]
		,[Total Excluding Tax]	AS	[TotalExcludingTax]
		,[Tax Amount]			AS	[TaxAmount]
		,[Profit]				AS	[Profit]
		,[Total Including Tax]	AS	[TotalIncludingTax]
		,[Total Dry Items]		AS	[TotalDryItems]
		,[Total Chiller Items]	AS	[TotalChillerItems]
		,[Lineage Key]			AS	[LineageKey]
  FROM [WideWorldImportersDW].[Fact].[Sale]
  GO

  CREATE VIEW [dbo].[vFactMovement]
  AS
  SELECT [Movement Key]						AS	[MovementKey]
		,[Date Key]							AS	[DateKey]
		,[Stock Item Key]					AS	[StockItemKey]
		,[Customer Key]						AS	[CustomerKey]
		,[Supplier Key]						AS	[SupplierKey]
		,[Transaction Type Key]				AS	[TransactionTypeKey]
		,[WWI Stock Item Transaction ID]	AS	[WWIStockItemTransactionID]
		,[WWI Invoice ID]					AS	[WWIInvoiceID]
		,[WWI Purchase Order ID]			AS	[WWIPurchaseOrderID]
		,[Quantity]							AS	[Quantity]
		,[Lineage Key]						AS	[LineageKey]
  FROM [WideWorldImportersDW].[Fact].[Movement]
  GO