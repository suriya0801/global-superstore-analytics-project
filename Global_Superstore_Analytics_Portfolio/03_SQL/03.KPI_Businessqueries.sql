/*1.How much total revenue did the company generate?
    To understand the company's overall sales performance.*/

SELECT round(sum(sales),0)as Total_sales
 from superstore_global;
 
/*2. How much total profit did the company earn?
     Profit indicates the company's financial performance after considering costs. 
     It helps determine whether the business is generating healthy returns.*/

SELECT
round(sum(profit),0)as Total_profit
 from superstore_global;
 
 /*3.How many customer orders were placed?
 To evaluate business activity and customer demand.*/
 
 SELECT 
 count(distinct order_id)as total_orders 
 from superstore_global;

/*4. How many unique customers made purchases during the analysis period?
     To determine the size of the active customer base and understand the business's customer reach.*/
 
 SELECT 
 count(distinct customer_id)as total_customers
 from superstore_global;
 
/*5. How many product units were sold during the analysis period?
     To measure total sales volume and understand the demand for products.*/

 SELECT 
 sum(quantity) as total_quantity_sold
 from superstore_global;
 
 /*6.What is the average sales value generated per customer order?
     To understand customer purchasing behavior by measuring the average revenue generated from each order.*/

select round(sum(sales)/count(distinct order_id),2)as average_sales from superstore_global;

/*7.What percentage of total sales was converted into profit?
    To evaluate how efficiently the company converts revenue into profit and assess overall financial performance.*/

select round(sum(profit)/sum(sales)*100,2) as profit_margin from superstore_global;

/*8.Which products generated the highest sales revenue?
    To identify the company's best-selling products. This helps management prioritize inventory, marketing campaigns, and future purchasing decisions.*/

select 
product_name,round(sum(sales),2) as total_sales from superstore_global 
group by product_name order by sum(sales) desc;

/*9.Which products generated the lowest sales revenue?
    To identify underperforming products that may require promotional strategies, 
pricing adjustments, or discontinuation*/

select 
product_name,round(sum(sales),2) as total_sales from superstore_global 
group by product_name order by sum(sales) asc;

/*10.Which product categories generate the highest sales revenue?
     To compare the sales performance of each product category and 
identify the categories contributing the most to overall business revenue.*/

select 
category,round(sum(sales),2) as total_sales from superstore_global 
group by category order by sum(sales) desc;

/*11.Which product sub categories generate the highest profit?
To determine which categories contribute the most to the company's profitability and support strategic business decisions.*/

select 
sub_category,round(sum(sales),2) as total_sales from superstore_global 
group by sub_category order by sum(sales) desc;

/*12.Which customers contributed the highest profit to the business?
To identify the most profitable customers and support strategies focused on retaining high-value customers and improving long-term profitability*/

select customer_name,sum(profit) as total_profit from superstore_global
group by customer_name order by sum(profit) desc;

/*13.Which customers placed the highest number of orders?
To identify the most frequent customers and understand purchasing behavior. 
This helps the business recognize loyal customers and develop customer retention strategies.*/

select customer_name,count(distinct order_id) 
as total_orders from superstore_global 
group by customer_name 
order by count(distinct order_id) desc;

/*14.How did sales performance change across different years?
To evaluate annual sales trends and identify business growth or decline over time. 
This analysis supports long-term strategic planning and performance evaluation.*/

select year,round(sum(sales),2) as total_sales from superstore_global group by 
year order by sum(sales);

/*15.Which months generated the highest and lowest sales revenue?
To analyze monthly sales patterns, identify seasonal demand, and support inventory planning, marketing campaigns, and resource allocation.*/

select monthname(order_date )as months,round(sum(sales),2) as total_sales from superstore_global group by month(order_date),monthname(order_date)
 order by month(order_date)  ;
 
 /*16.How did sales performance vary across different quarters of the year?
 To compare quarterly sales performance, identify seasonal business trends, and support quarterly business planning and forecasting.*/

 select quarter(order_date )as quarter,round(sum(sales),2) as total_sales from superstore_global group by quarter(order_date),quarter(order_date)
 order by quarter(order_date) ;
 
/*17.How did monthly profit change throughout the analysis period?
To evaluate monthly profitability trends, identify periods of high or low profit, and support financial planning and decision-making.*/

select year(order_date) as year,monthname(order_date) as months ,round(sum(profit),2) total_profit from superstore_global 
group by year(order_date),month(order_date),monthname(order_date)
order by year(order_date),month(order_date);
 
/*18.Which countries generated the highest sales revenue?
To evaluate sales performance across different countries and identify the markets contributing the most to overall business revenue.
This helps support regional expansion and market-specific business strategies.*/
select country,round(sum(sales),1) as total_sales from superstore_global group by country order by sum(sales) desc;

/*19.Which global market generated the highest sales revenue?
To compare the performance of different global markets and identify the strongest markets for business growth and investment.*/
select market,round(sum(sales),1) as total_sales from superstore_global group by market order by sum(sales) desc;

/*20.Which regions generated the highest sales revenue?
To analyze regional sales performance and identify high-performing and low-performing regions for better resource allocation and strategic planning.*/
select region,round(sum(sales),1) as total_sales from superstore_global group by region order by sum(sales) desc;

/*21.Which cities generated the highest sales revenue?
     To identify the top-performing cities and support location-based marketing, 
inventory planning, and business expansion decisions*/

select city,round(sum(sales),1) as total_sales from superstore_global group by city order by sum(sales) desc limit 10;


/*22. Which shipping method handled the highest sales revenue?
      To understand customer shipping preferences and evaluate the contribution of each shipping mode to overall sales performance.*/

select ship_mode,round(sum(sales),2) as total_sales from superstore_global group by ship_mode order by sum(sales) desc;

/*23. How does shipping cost vary across different markets?
	To compare shipping expenses across global markets and identify regions with
    higher logistics costs that may require operational improvements.*/

 select market,round(sum(shipping_cost),2) as total_shipping_cost from superstore_global 
 group by market order by sum(shipping_cost) desc;
 
/*24. What is the average shipping cost incurred for customer orders?
      To evaluate the average logistics cost associated with fulfilling customer orders 
      and support cost optimization initiatives.*/

select round(avg(shipping_cost),2) as avg_shippin_cost from superstore_global;

/*25. What is the average discount offered for each product category?
      To compare discounting strategies across product categories and
      evaluate whether discounts are being applied consistently.*/
      
 SELECT  category,avg(discount) as average_discount from superstore_global group by category;
 
/*26. Which products received the highest discounts?
	To identify products that rely heavily on discounts and 
    evaluate whether these discount strategies are effective in driving sales while maintaining profitability.*/

SELECT product_name,round(max(discount),1) as max_discount from 
superstore_global group by product_name order by max(discount) desc ;

/*27. How do discounts impact business profitability?
       To analyze the relationship between discounts and profit, 
       helping the business determine whether higher discounts are reducing profitability
	   and whether pricing strategies need adjustment.*/
 
 SELECT discount,round(sum(sales) ,2)as total_sales ,round(sum(profit),2) as total_profit 
 from superstore_global group by discount order by discount ;






 

 