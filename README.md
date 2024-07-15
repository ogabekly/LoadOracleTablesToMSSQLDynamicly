# Load Oracle Tables To MSSQL Dynamicly

Summary:
This project dynamically transfers data from Oracle databases tables to SQL Server using SSIS Script Task based on control tables defining source-target mappings. Key features include reading mappings, fetching data from Oracle, and bulk inserting into SQL Server.

Keywords: SSIS, C#, Oracle, SQL Server, Data Transfer, ETL, SqlBulkCopy

Setup

Clone the Repository:
  git clone https://github.com/yourusername/OracleToMSSQLDynamicTableTransfer.git
  cd OracleToMSSQLDynamicTableTransfer

Open the SLN and the package, then define the following package parameters(self-explanatory):
  OracleConnectionString
  SQLServerConnectionString
  MasterControlTableName
  MappingControlTableName
  LogTableName


Create SQL Server Tables:
  Execute the provided SQL script OracleToSQL_table_ddl.sql to create the necessary control tables and log table in your SQL Server database.
















