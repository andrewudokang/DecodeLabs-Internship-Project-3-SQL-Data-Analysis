--Order-status distribution--
--Completed/delivered/Order Status sales--
Select
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Cancelled')/Count(OrderID)*1.0 * 100,2) as 'Cancelled Orders',
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Returned')/Count(OrderID)*1.0 * 100,2) as 'Returned Orders',
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Pending')/Count(OrderID)*1.0 * 100,2)  as 'Pending Orders',
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Shipped')/Count(OrderID)*1.0 * 100,2) as 'Shipped Orders',
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Delivered')/Count(OrderID)*1.0 * 100,2) as 'Delivered Orders'
from Dataset

--Revenue by status--
select
OrderStatus,
round(Sum(TotalPrice),2) as Total_Sales
from Dataset
group by OrderStatus
order by round(Sum(TotalPrice),2) desc

--Cancellation rate--
select
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Cancelled')/Count(OrderID)*1.0 * 100,2) as 'Cancellation Rate'
from Dataset

--Return Rate--
select
Round((select
Count(OrderID)*1.0
from Dataset
where OrderStatus = 'Returned')/Count(OrderID)*1.0 * 100,2) as 'Return Rate'
from Dataset

--Status by product--
select 
Product,
OrderStatus,
Count(OrderID) as Number
From Dataset
Group by Product, OrderStatus
Order by 
	SUM(Count(OrderID)) OVER(Partition by Product) DESC,
	Product,
	Number DESC