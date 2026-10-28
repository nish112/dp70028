# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "8ab23e9b-96b7-475c-8be3-c15bc929a875",
# META       "default_lakehouse_name": "lakehousedemo",
# META       "default_lakehouse_workspace_id": "0c2eae19-b642-411a-af8c-240806b1265b",
# META       "known_lakehouses": [
# META         {
# META           "id": "8ab23e9b-96b7-475c-8be3-c15bc929a875"
# META         }
# META       ]
# META     }
# META   }
# META }

# PARAMETERS CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!
table_name = "dbo.sales"


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

from pyspark.sql.functions import *

# Read the new sales data
df = spark.read.format("csv").option("header","true").load("Files/new_data/*.csv")

## Add month and year columns
df = df.withColumn("Year", year(col("OrderDate"))).withColumn("Month", month(col("OrderDate")))

# Derive FirstName and LastName columns
df = df.withColumn("FirstName", split(col("CustomerName"), " ").getItem(0)).withColumn("LastName", split(col("CustomerName"), " ").getItem(1))

# Filter and reorder columns
df = df["SalesOrderNumber", "SalesOrderLineNumber", "OrderDate", "Year", "Month", "FirstName", "LastName", "EmailAddress", "Item", "Quantity", "UnitPrice", "TaxAmount"]

# Load the data into a table
df.write.format("delta").mode("append").saveAsTable(table_name)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
