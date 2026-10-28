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

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.sql("SELECT * FROM lakehousedemo.dbo.sales LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.read.format("parquet").option("header","true").load("Files/sales/sales.csv")
# df now is a Spark DataFrame containing CSV data from "Files/sales/sales.csv".
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
