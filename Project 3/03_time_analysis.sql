--Aggregated Monthly revenue--
select
datepart(month,date) Month_num,
datename(month,date) as Months,
ROUND(SUM(TotalPrice),2) as Monthly_Revenue
From Dataset
Group by datepart(month,date), DATENAME(month,date)
Order by Monthly_Revenue desc

--Monthly revenue--
select
datepart(year,date) as Years,
datepart(month,date) Month_num,
datename(month,date) as Months,
ROUND(SUM(TotalPrice),2) as Monthly_Revenue
From Dataset
Group by datepart(month,date), DATENAME(month,date), datepart(year,date)
Order by Years asc

--Aggregated Monthly order volume--
select
datename(month,date) as Months,
COUNT(OrderID) as Monthly_Order
From Dataset
Group by DATENAME(month,date)
Order by COUNT(OrderID) desc

--Monthly order volume--
select
datepart(year,date) as Years,
datepart(month,date) Month_num,
datename(month,date) as Months,
COUNT(OrderID) as Monthly_Order
From Dataset
Group by datepart(month,date), DATENAME(month,date), datepart(year,date)
Order by Years asc

--Aggegated MoM growth--
With MonthlySales as (
Select datepart(month,date) as Date_name,datename(month,date) as Date_num, Sum(TotalPrice) as Total_Sales
from Dataset
Group by datename(month,date), datepart(month,date)
)
Select Date_name, Date_num, Total_Sales,
((Total_Sales-(LAG(Total_Sales) over (order by Date_num asc)))/(LAG(Total_Sales) over (order by Date_name asc)))*100 as MoM
From MonthlySales

--MoM growth--
With MonthlySales as (
Select datepart(year,date) as Years, datepart(month,date) as Date_name,datename(month,date) as Date_num, Sum(TotalPrice) as Total_Sales
from Dataset
Group by datepart(month,date), datename(month,date), datepart(year,date)
)
Select Years, Date_name, Date_num, Total_Sales,
((Total_Sales-(LAG(Total_Sales) over (order by Years asc)))/(LAG(Total_Sales) over (order by Years asc)))*100 as MoM
From MonthlySales

--Yearly revenue--
Select datename(year,date) as Years, round(Sum(TotalPrice),2) as Total_Sales
from Dataset
Group by datename(year,date)

--YoY growth--
With YearlySales as (
Select datename(year,date) as Years, round(Sum(TotalPrice),2) as Total_Sales
from Dataset
Group by datename(year,date)
)
Select Years, Total_Sales,
((Total_Sales-(LAG(Total_Sales) over (order by Years asc)))/(LAG(Total_Sales) over (order by Years asc)))*100 as YoY
From YearlySales

--Product performance over time(Years)--
With RankedCalc as (
Select product as Products,datename(year,date) as Years, round(Sum(TotalPrice),2) as Total_Sales,
RANK() over(partition by datename(year,date) order by round(Sum(TotalPrice),2) desc) as RankedProducts
from Dataset
Group by product, datename(year,date)
)
Select Products, Years, RankedProducts
From RankedCalc

--Product performance over time(Months)--
With RankedCalc as (
Select product as Products, datepart(year,date) as Years, datepart(month,date) as Months_num, datename(month,date) as Months, round(Sum(TotalPrice),2) as Total_Sales,
RANK() over(partition by datepart(month,date) order by round(Sum(TotalPrice),2) desc) as RankedProducts
from Dataset
Group by product, datepart(year,date), datename(month,date), datepart(month,date)
)
Select Products, Years, Months, RankedProducts, Total_Sales
From RankedCalc

--Aggregted Product performance over time(Months)--
With RankedCalc as (
Select product as Products,datepart(month,date) as Months_num, datename(month,date) as Months, round(Sum(TotalPrice),2) as Total_Sales,
RANK() over(partition by datepart(month,date) order by round(Sum(TotalPrice),2) desc) as RankedProducts
from Dataset
Group by product, datename(month,date), datepart(month,date)
)
Select Products, Months, RankedProducts, Total_Sales
From RankedCalc

