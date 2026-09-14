--Revenue by product--
select
Product,
round(Sum(TotalPrice),2) as Total_Sales
from Dataset
group by Product
order by Total_Sales desc

--Quantity by product--
select
Product,
round(Sum(Quantity),2) as Total_Quantity
from Dataset
group by Product
order by Total_Quantity desc

--Average order value by product--
select
Product,
round(sum(TotalPrice)/Count(OrderID),2) as Average_Order_Value
from Dataset
group by Product
order by Average_Order_Value desc

--Product revenue contribution--
Select
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Monitor')/Sum(TotalPrice)*1.0 * 100,2) as 'Monitor',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Phone')/Sum(TotalPrice)*1.0 * 100,2) as 'Phone',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Tablet')/Sum(TotalPrice)*1.0 * 100,2)  as 'Tablet',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Chair')/Sum(TotalPrice)*1.0 * 100,2) as 'Chair',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Laptop')/Sum(TotalPrice)*1.0 * 100,2) as 'Laptop',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Desk')/Sum(TotalPrice)*1.0 * 100,2) as 'Desk',
Round((select
Sum(TotalPrice)*1.0
from Dataset
where Product = 'Printer')/Sum(TotalPrice)*1.0 * 100,2) as 'Printer'
from Dataset