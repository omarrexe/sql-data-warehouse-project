/*
=============================================================
Create Database and Schemas
=============================================================

Script Purpose:
This script creates a new database named 'DataWarehouse'.
It first checks whether the database already exists; if it does,the database is dropped and then recreated. 
Afterward, the script sets up three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouse' database if it exists. 
All data within the database will be permanently deleted. 
Proceed with caution and ensure that proper backups are in place before executing this script.
*/


--Add a simple TRY...CATCH block to handle unexpected errors during script execution
BEGIN TRY

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

END TRY
BEGIN CATCH
    PRINT 'An error occurred: ' + ERROR_MESSAGE();
END CATCH;
