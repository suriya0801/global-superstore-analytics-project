/*============================================================
 Project : Global Superstore Sales Performance Analysis
 File    : Data Validation.sql
 prepared by : Suriya R
 Tool    : MySQL Workbench
 Purpose : Validate and clean the dataset before analysis.
============================================================*/
/*============================================================
  View Dataset
============================================================*/
-- Check for duplicate Row IDs
SELECT * from superstore_global;
SELECT 
row_id,count(*)as duplicate_count from superstore_global group by row_id having count(*)>1;
/*============================================================
        MISSING VALUE VALIDATION
============================================================*/
-- Check NULL values in important columns
SELECT 
sum(customer_name is null),sum(customer_id is null),sum(category is null),sum(city is null),
sum(product_name is null),sum(product_id is null),sum(country is null),sum(sales is null),
sum(profit is null),sum(shipping_cost is null) from superstore_global;
/*============================================================
          BLANK VALUE VALIDATION
============================================================*/
SELECT * 
from superstore_global where trim(customer_name)='';
SELECT  * 
from superstore_global where trim(category)='';
SELECT *
from superstore_global where trim(product_name)='';
SELECT *
from superstore_global where trim(city)='';
SELECT *
from superstore_global where trim(country)='';
select*
from superstore_global where sales<0;
/*============================================================
        NUMERIC RANGE VALIDATION
============================================================*/
SELECT
 min(quantity) as miniquantity,
 max(quantity)as maxiquantity from superstore_global;
SELECT
 min(discount) as minidiscount,
 max(discount)as maxidiscount from superstore_global;
 /*============================================================
        ORDER & SHIPPING DATE VALIDATION
============================================================*/
 SELECT
 min(shipping_cost) as minshippingcost,
 max(shipping_cost)as maxishippingcost from superstore_global;
 SELECT *
 from superstore_global where ship_date<order_date ;
 /*============================================================
        CATEGORICAL DATA VALIDATION
============================================================*/
SELECT 
 distinct category from superstore_global;
SELECT
 distinct segment from superstore_global;
SELECT 
 distinct market  from superstore_global;
SELECT *
 from superstore_global order by profit asc limit 10;
SELECT *
 from superstore_global order by profit desc limit 10;
  