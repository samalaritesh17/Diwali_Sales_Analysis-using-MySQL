--Print the table
select * from DiwaliSalesData;

--removed unwanted columns
alter table DiwaliSalesData
drop column c14;

--Total Count of people in each Age Group
select c5,count(c6) as Count_of_people
from DiwaliSalesData
group by c5 
order by c5;


--People whose count is more than 500 in an occupation
select c10, count(c1) as Count_of_people
from DiwaliSalesData
group by c10
having Count_of_people > 500;


--which occupation people have more particiapted in diwali sales
select c10,sum(c13) as Total_Spent
from DiwaliSalesData
group by c10
order by c10 desc;


--Average sales on each product_type
select c11 as Product_Type,round(avg(c13),2) as Average_Amount_Spent
from DiwaliSalesData
group by c11
order by Average_Amount_Spent desc;


--Users who made more sales during diwali
select c2,sum(c13) as Total_Amount_Spent
from DiwaliSalesData
group by c2
order by Total_Amount_Spent Desc
limit 5;


--Total number of orders placed gender wise
select c4,sum(c12) as Total_Orders_per_Gender
from DiwaliSalesData
group by c4
order by Total_Orders_per_Gender desc;


--Average age of people who have participated in diwali sales
select round(avg(c6),2) as Average_Age
from DiwaliSalesData;


--Highest purchased product type by married people
SELECT p.c11
FROM DiwaliSalesData d
JOIN (
    SELECT c11, COUNT(*) AS total_sales
    FROM DiwaliSalesData
    GROUP BY c11
) p ON d.c11 = p.c11
WHERE d.c7 = 1
GROUP BY p.c11
ORDER BY MAX(p.total_sales) DESC
LIMIT 1;


--Total amount spent by people whose age is less than or equal to 30
select sum(c13) as Total_Amount_Spent
from DiwaliSalesData
where c6 <= 30;


--customers who have made more than 5 orders and their total sales amount spent
SELECT d.c2 AS Customer_Name, SUM(d.c13) AS Total_Amount_Above5Orders
FROM DiwaliSalesData d
JOIN (
    SELECT c2, SUM(c12) AS Total_Orders
    FROM DiwaliSalesData
    GROUP BY c2
    HAVING SUM(c12) > 5 -- Filter out customers with more than 5 orders
) p ON d.c2 = p.c2
GROUP BY d.c2
ORDER BY SUM(d.c13) DESC; -- Ordering by total amount spent


--most sold product type during diwali sale
select c11, sum(c13) as Total_Amount_Sales
from DiwaliSalesData
group by c11
order by Total_Amount_Sales DESC
limit 3;


--most sales by male and married users
select c11 as Product_Type,sum(c13) as Total_Sales
from DiwaliSalesData
where c4 = 'M' and c7 = 1
group by c11
order by Total_Sales desc;


--highest average order value for a product type
select c11 as Product_Type,round(avg(c12),2) as Average_Order_Value
from DiwaliSalesData
group by c11
order by Average_Order_Value DESC
limit 1;


--number of orders made by each user
select c2, sum(c12) as Total_Orders
from DiwaliSalesData
group by c2
order by Total_Orders desc;


--Total Amount spent by the people whose age is less than 30
select c11,sum(c13) as Total_Sales_Amount
from DiwaliSalesData
where c6 < 30
group by c11
order by Total_Sales_Amount desc;


--Total Amount spent by people whose age in between 25 and 35
select c11,sum(c13) as Total_Sales
from DiwaliSalesData
where c5 between 25 and 35
group by c11
order by Total_Sales desc;


--Total Number of male
select count(c4) as Male_Gender from DiwaliSalesData
where c4 = 'M';


--Total number of female
select count(c4) as Male_Gender from DiwaliSalesData
where c4 = 'F';

--top 5 most ordered products.....
select c3,sum(c12) as Total_Orders
from DiwaliSalesData
group by c2
order by Total_Orders Desc
limit 5;

--most ordered products by female
select c3, sum(c12) as Total_Orders_Female
from DiwaliSalesData
where c4 = 'F'
group by c3
order by Total_Orders_Female desc
limit 5;


--most ordered products by men
select c3, sum(c12) as Total_Orders_Female
from DiwaliSalesData
where c4 = 'M'
group by c3
order by Total_Orders_Female desc
limit 5;


--top 5 most orders received state wise
select c8,sum(c12) as Total_Orders
from DiwaliSalesData
group by c8
order by Total_Orders Desc
limit 5;


select * from DiwaliSalesData;



--top 5 most sales state wise
select c8 as State_Name,sum(c13) as Total_Sales_Amount
from DiwaliSalesData
group by c8
order by Total_Sales_Amount desc
limit 5;


--which age group has participated more in diwali sales
select c5 as Age_Group,sum(c12) as Total_Orders
from DiwaliSalesData
group by c5
order by Total_Orders desc;



--how many states are there in each zone
select c9 as State_Zone, count(DISTINCT c8) as Total_States_in_Zone
from DiwaliSalesData
group by c9
order by Total_States_in_Zone;



--which zone has most number of orders
select c9 as State_Zone, sum(c12) as Total_Orders
from DiwaliSalesData
group by c9
order by Total_Orders Desc;

--Total Sales per Marital Status
select c7 as Marital_Status,sum(c13) as Total_Sales
from DiwaliSalesData
group by c7;




--top 5 most ordered products by Age group 0 to 17
select c3 as product_id,count(c12) as Total_Orders from DiwaliSalesData
where c5 = '0-17'
group by c3
order by Total_Orders Desc
limit 5;



--top 5 most ordered products by Age group 18-25
select c3 as product_id,count(c12) as Total_Orders from DiwaliSalesData
where c5 = '18-25'
group by c3
order by Total_Orders Desc
limit 5;



--top 5 most ordered products by Age Group 26-35
select c3 as product_id,count(c12) as Total_Orders from DiwaliSalesData
where c5 = '26-35'
group by c3
order by Total_Orders Desc
limit 5;


--uttarpradesh state top 5 product sales
select distinct c3 as product_id, count(c12) as Total_Orders
from DiwaliSalesData
where c8 = 'Uttar Pradesh'
group by c3
order by Total_Orders desc
limit 5;



--Telangana state top 5 product sales
select distinct c3 as product_id, count(c12) as Total_Orders
from DiwaliSalesData
where c8 = 'Telangana'
group by c3
order by Total_Orders desc
limit 5;



