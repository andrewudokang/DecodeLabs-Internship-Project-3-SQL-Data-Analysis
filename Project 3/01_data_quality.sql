--Record count and Unique orders--
select
count(OrderID) as Total_Orders
from Dataset

--Unique customers--
select 
count (distinct CustomerID) as Total_Customers
from Dataset

--Duplicate IDs--
select 
CustomerID
from Dataset
group by CustomerID
having count ( CustomerID) > 1

--Quantity × UnitPrice = TotalPrice validation--
select 
CustomerID
from Dataset
where ROUND(Quantity * UnitPrice,2) <> ROUND(TotalPrice,2)