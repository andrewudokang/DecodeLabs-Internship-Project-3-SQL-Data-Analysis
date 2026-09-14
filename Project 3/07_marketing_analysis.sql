--Status by referral source--
select 
ReferralSource,
OrderStatus,
Count(OrderID) as Number
From Dataset
Group by ReferralSource, OrderStatus
Order by 
	SUM(Count(OrderID)) OVER(Partition by ReferralSource) DESC,
	ReferralSource,
	Number DESC

----Marketing----
--Revenue by referral source--
select 
ReferralSource,
Round(Sum(TotalPrice),2) as Revenue
From Dataset
Group by ReferralSource
Order by Revenue desc

--AOV by referral source--
select 
ReferralSource,
round(sum(TotalPrice)/Count(OrderID),2) as Average_Order_Value
From Dataset
Group by ReferralSource
Order by Average_Order_Value desc