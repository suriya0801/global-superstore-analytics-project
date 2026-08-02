/*============================================================
 Project : Global Superstore Sales Performance Analysis
 prepared by : Suriya R
 Tool    : MySQL Workbench
============================================================*/
CREATE DATABASE global_superstore;
use global_superstore;
CREATE TABLE superstore_global (
    Category         VARCHAR(50),
    City             VARCHAR(100),
    Country          VARCHAR(100),
    Customer_ID      VARCHAR(20),
    Customer_Name    VARCHAR(100),
    Discount         DECIMAL(5,2),
    Market           VARCHAR(20),
    Order_Date       VARCHAR(20),
    Order_ID         VARCHAR(30),
    Order_Priority   VARCHAR(20),
    Product_ID       VARCHAR(30),
    Product_Name     VARCHAR(255),
    Profit           DECIMAL(12,4),
    Quantity         INT,
    Region           VARCHAR(50),
    Row_ID           INT,
    Sales            DECIMAL(12,4),
    Segment          VARCHAR(30),
    Ship_Date        VARCHAR(20),
    Ship_Mode        VARCHAR(30),
    Shipping_Cost    DECIMAL(10,4),
    State            VARCHAR(100),
    Sub_Category     VARCHAR(50),
    Year             INT
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_global.csv'
INTO TABLE superstore_global
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT count( *) as total_rows FROM superstore_global;
select count(*) as total_column from information_schema.columns where table_name='superstore_global';
describe superstore_global;
UPDATE superstore_global
SET order_date = DATE_FORMAT(
    STR_TO_DATE(order_date, '%d-%m-%Y'),
    '%Y-%m-%d'
);
ALTER TABLE superstore_global
MODIFY COLUMN order_date DATE;
SELECT COUNT(*)
FROM superstore_global
WHERE STR_TO_DATE(order_date, '%d-%m-%Y') IS NULL;
UPDATE superstore_global
SET ship_date = DATE_FORMAT(
    STR_TO_DATE(ship_date, '%d-%m-%Y'),
    '%Y-%m-%d'
);

ALTER TABLE superstore_global
MODIFY COLUMN ship_date DATE;
describe superstore_global;
