-- Creación de la base de datos
CREATE DATABASE sales_supplies_dwh;
GO

-- Creación de los logins para los usuarios
USE master;
GO
CREATE LOGIN readonly_ss_dwh WITH PASSWORD = 'yVST&$LvUwpLeim6';
GO
CREATE LOGIN admin_ss_dwh WITH PASSWORD = 'V6R!7ATNyxbG%tD^';
GO

-- Adición de los permisos de los usuarios para la base de datos
-- El usuario sales solo podrá consultar la información de la base de datos
USE sales_supplies_dwh;
GO
CREATE USER readonly_ss_dwh FOR LOGIN readonly_ss_dwh;
GO
ALTER ROLE db_datareader ADD MEMBER readonly_ss_dwh;
GO
-- El usuario admin tendrá permisos de lectura y escritura, además permisos DDL
CREATE USER admin_ss_dwh FOR LOGIN admin_ss_dwh;
GO
ALTER ROLE db_datareader ADD MEMBER admin_ss_dwh;
ALTER ROLE db_datawriter ADD MEMBER admin_ss_dwh;
ALTER ROLE db_ddladmin ADD MEMBER admin_ss_dwh;
GO
GRANT CREATE TABLE TO admin_ss_dwh;
GO

-- Creación de las tablas bases

CREATE TABLE sales (
    id nvarchar(64),
    storeLocation nvarchar(50),
    date datetime,
    itemName nvarchar(50),
    itemPrice float,
    itemQuantity decimal(28,0),
    couponUsed decimal(28,0),
    purchaseMethod nvarchar(50)
);

CREATE TABLE customers (
    sale_id nvarchar(64),
    gender nvarchar(50),
    age decimal(28,0),
    email nvarchar(50),
    satisfaction decimal(28,0)
);