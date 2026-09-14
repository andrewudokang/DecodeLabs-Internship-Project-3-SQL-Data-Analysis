--Total gross order value--
select
Round(SUM(TotalPrice),2) as Total_Sales
From Dataset

--Average order value--
select
round(sum(TotalPrice)/Count(OrderID),2) as Average_Order_Value
from Dataset