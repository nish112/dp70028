CREATE TABLE [Sales].[Fact_Sales] (
    [CustomerID]           VARCHAR (255) NOT NULL,
    [ItemID]               VARCHAR (255) NOT NULL,
    [SalesOrderNumber]     VARCHAR (30)  NULL,
    [SalesOrderLineNumber] INT           NULL,
    [OrderDate]            DATE          NULL,
    [Quantity]             INT           NULL,
    [TaxAmount]            FLOAT (53)    NULL,
    [UnitPrice]            FLOAT (53)    NULL
);


GO