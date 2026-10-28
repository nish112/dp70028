CREATE TABLE [Sales].[Dim_Item] (
    [ItemID]   VARCHAR (255) NOT NULL,
    [ItemName] VARCHAR (255) NOT NULL
);


GO

ALTER TABLE [Sales].[Dim_Item]
    ADD CONSTRAINT [PK_Dim_Item] PRIMARY KEY NONCLUSTERED ([ItemID] ASC) NOT ENFORCED;


GO