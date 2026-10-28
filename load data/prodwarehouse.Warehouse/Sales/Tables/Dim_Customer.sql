CREATE TABLE [Sales].[Dim_Customer] (
    [CustomerID]   VARCHAR (255) NOT NULL,
    [CustomerName] VARCHAR (255) NOT NULL,
    [EmailAddress] VARCHAR (255) NOT NULL
);


GO

ALTER TABLE [Sales].[Dim_Customer]
    ADD CONSTRAINT [PK_Dim_Customer] PRIMARY KEY NONCLUSTERED ([CustomerID] ASC) NOT ENFORCED;


GO