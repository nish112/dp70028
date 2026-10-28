[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "0c2eae19-b642-411a-af8c-240806b1265b"]}[Data]{[lakehouseId = "8ab23e9b-96b7-475c-8be3-c15bc929a875"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "orders_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared orders = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/orders.csv"), [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type}, {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}),
  #"Choose columns" = Table.SelectColumns(#"Changed column type", {"SalesOrderID", "OrderDate", "CustomerID", "ProductID", "OrderQty", "LineItemTotal"}),
  #"Added custom" = Table.AddColumn(#"Choose columns", "Month", each Date.Month([OrderDate])),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Added custom", {{"Month", Int64.Type}})
in
  #"Changed column type 1";
shared orders_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = true, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "0c2eae19-b642-411a-af8c-240806b1265b"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "8ab23e9b-96b7-475c-8be3-c15bc929a875"]}[Data],
  Navigation_3 = Navigation_2{[Id = "dbo", ItemKind = "Schema"]}[Data],
  TableNavigation = Navigation_3{[Id = "orders", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
