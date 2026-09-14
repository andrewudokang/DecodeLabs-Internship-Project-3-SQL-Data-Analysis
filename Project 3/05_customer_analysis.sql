--Unique vs repeat customers--
select 
COUNT(distinct CustomerID) as Unique_Customers,
count(CustomerID) - COUNT(distinct CustomerID) as Repeat_Customers
from Dataset

--Repeat-customer rate--
select 
round((count(CustomerID) - COUNT(distinct CustomerID)*1.0)/COUNT(distinct CustomerID),3) as '%Repeat_Customers'
from Dataset

--Top customers--
Select Top 10
CustomerID, round(Sum(TotalPrice),2) as Total_Sales
From Dataset
Group by CustomerID
Order by Total_Sales desc

----Customer revenue concentration----
----High-value Customers----
Select
CustomerID, round(Sum(TotalPrice),2) as Total_Sales
From Dataset
Group by CustomerID
having round(Sum(TotalPrice),2) > 1053
Order by round(Sum(TotalPrice),2) desc

----Lower-value Customers----
Select
CustomerID, round(Sum(TotalPrice),2) as Total_Sales
From Dataset
Group by CustomerID
having round(Sum(TotalPrice),2) < 1053
Order by round(Sum(TotalPrice),2) desc

--Average customer value--
select
round(sum(TotalPrice)/Count(distinct CustomerID),2)*1.0 as Average_Customer_Value
from Dataset