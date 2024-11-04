Create Database Finance;
Use Finance;

#Data Engineering

#Rename Table and Column

Rename table `financial analytics data` to Finance;
select*from finance;
Alter table Finance
Rename column Name to Company_name;
Alter table Finance
Rename column `S.No.`to Serial_number;
Alter table Finance
Rename column `Mar Cap - Crore`to `Market Cap (Crore)`;
Alter table Finance
Rename column `Sales Qtr - Crore`to `Sales (Quarter) (Crore)`;


#Summary of key metrics like average, maximum, and minimum values of Market Cap (Crore) and Sales (Quarter) (Crore)
SELECT 
    COUNT(*) AS Total_Companies,
    AVG(`Market Cap (Crore)`) AS Avg_Market_Cap,
    MAX(`Market Cap (Crore)`) AS Max_Market_Cap,
    MIN(`Market Cap (Crore)`) AS Min_Market_Cap,
    AVG(`Sales (Quarter) (Crore)`) AS Avg_Sales,
    MAX(`Sales (Quarter) (Crore)`) AS Max_Sales,
    MIN(`Sales (Quarter) (Crore)`) AS Min_Sales
FROM Finance;


#Top 5 Companies by Market Cap
Select Company_name,`Market Cap (Crore)`
From finance
order by`Market Cap (Crore)` Desc
limit 5;

#Top Companies by Market Cap
Select Company_name,`Sales (Quarter) (Crore)`
From finance
order by`Sales (Quarter) (Crore)` Desc
Limit 5;

#Distribution of Company by Large, small and medium as per its capital value
select
case
When `Market Cap (Crore)`>500000 Then 'Very Large Company(Market Cap (Crore)>500000)'
When `Market Cap (Crore)`>200000 Then 'Large Company(Market Cap (Crore)>200000)'
When `Market Cap (Crore)`>100000 Then 'Medium Company(Market Cap (Crore)>100000)'
Else 'Small Cap(Market Cap (Crore)`<100000)'
End as Market_Cap_Category,
count(*) as Company_count
from Finance
group by Market_Cap_Category;

#Companies with greater than it average sale
select Company_name, `Sales (Quarter) (Crore)`
From Finance
where `Sales (Quarter) (Crore)`>(Select avg(`Sales (Quarter) (Crore)`) from finance);

# Sales and Capital Ratio
select company_name,`Market Cap (Crore)`,`Sales (Quarter) (Crore)`,
round(`Sales (Quarter) (Crore)`/`Market Cap (Crore)`,2)as Market_Cap_to_Sales_Ratio
from finance
order by Market_Cap_to_Sales_Ratio desc;

# Big market capital company with low sales
select company_name,`Market Cap (Crore)`,`Sales (Quarter) (Crore)`
from finance
where `Market Cap (Crore)` > 200000 and `Sales (Quarter) (Crore)` < 15000
order by `Market Cap (Crore)` desc;

#Market_Cap_Category with its average sales
select
case
When `Market Cap (Crore)`>500000 Then 'Very Large Company(Market Cap (Crore)>500000)'
When `Market Cap (Crore)`>200000 Then 'Large Company(Market Cap (Crore)>200000)'
When `Market Cap (Crore)`>100000 Then 'Medium Company(Market Cap (Crore)>100000)'
Else 'Small Cap(Market Cap (Crore)`<100000)'
End as Market_Cap_Category,
count(*) as Company_count,
round(avg(`Sales (Quarter) (Crore)`),2)
from Finance
group by Market_Cap_Category;

