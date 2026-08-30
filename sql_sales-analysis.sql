create database SalesDB
use SalesDb

create table Sales(
SaleID int identity(1,1) primary key,
SaleDate date,
ProductName varchar(100),
Category Varchar(50),
Region varchar(50),
Salesperson varchar(100),
Quantity int,
UnitPrice decimal(10,2),
Totalsales decimal(10,2),
Profit decimal(10,2));

insert into sales(SaleDate,ProductName,Category,Region,Salesperson,Quantity,UnitPrice, Totalsales,Profit) values('2025-01-15','Laptop','Electronics','Durban','Thabo',2,15000.00,30000.00,5000.00),
('2025-01-20','Phone','Electronics','Durban','Thabo',5,8000.00,40000.00,8000.00),
('2025-02-11','Laptop','Electronics','JBH','Lerato',3,17500.00,52000.00,10500.00),
('2025-02-15','Desk','Furniture','Cape Town','John',20,3500.00,7000.00,1400.00),
('2025-02-18','chair','Furniture','Durban','Thandiswa',1,3500.00,3500.00,700.00),
('2025-05-15','Fan','Home and Kitchen','Cape Town','Thabiso',2,900.00,1800.00,360.00),
('2025-05-17','Tablet','Electronics','Durban','Thandeka',2,15000.00,30000.00,6000.00),
('2025-01-05','Mouse','Electonics','Cape Town','Amahle',10,300.00,3000.00,600.00),
('2025-09-15','Keyboard','Electronics','Durban','David',12,15000.00,18000.00,3600.00),
('2025-08-25','Laptop','Electronics','Durban','Nokwethemba',2,15000.00,30000.00,0000.00),
('2025-03-12','Table','Furniture','Durban','Owethu',2,3500.00,7000.00,1400.00),
('2025-04-23','USB Cable','Electronics','Durban','Njabulo',2,150.00,300.00,60.00),
('2025-11-04','Wardrobe','Furniture','Durban','Amon',2,8000.00,1600.00,320.00),
('2025-10-15','Laptop','Electronics','JHB','Thandokuhle',2,12000.00,24000.00,4800.00),
('2025-11-10','Powerbank','Electronics','Durban','Musawenkosi',2,800.00,1600.00,320.00),
('2025-04-19','Tv Stand','Furniture','Durban','khethiwe',2,4500.00,9000.00,1800.00),
('2025-07-28','Camera','Electronics','Durban','Thandeka',2,12000.00,24000.00,4800.00)

select * from Sales

--1 Total Revenue and profit
select sum(TotalSales) as TotalRevenue,
sum(Profit) as TotalProfit,
Round((sum(Profit)*100.0)/sum(TotalSales),2) as Profits
from Sales

--check column names
sp_help 'sales'

--2.Top 3 selling Products
select top 3 productname,sum(TotalSales) as Revenue
From sales
group by ProductName
Order by Revenue DESC;

--3. sales by region
select region, sum(totalsales) as Revenue,
sum(profit) as Profit
from Sales
group by region
order by Revenue DESC;

--4.Monthly Sales Trend
select FORMAT(SaleDate,'yyyy-MM')as Month,
sum(totalsales) as MonthyRevenue
from sales
group by format (SaleDate,'yyyy-MM')
order by Month;

-- another version
select 
	FORMAT(SaleDate,'MMMM yyyy')as Month,
	sum(totalsales) as MonthyRevenue
from sales
group by format (SaleDate,'MMMMM yyyy'), YEAR(SaleDate), MONTH(SaleDate)
order by YEAR(SaleDate), MONTH(SaleDate);


--Using Subquery
SELECT 
	MonthName ,
	SUM(TotalSales) AS MonthlyRevenue

from (
		SELECT 
			TotalSales,
			FORMAT(SaleDate, 'MMMM yyyy')as MonthName,
			year(Saledate)as Yr,
			Month(saleDate)AS mth
		from Sales) AS t
		group by MonthName, yr,mth
		ORDer by yr,mth;


--Best Sales Person
select SalesPerson, SUM(TotalSales)AS TotalSales, Sum(Profit) As TotalProfit
from Sales
GROUP By SalesPerson
Order by TotalSales DESC;

--Category Performance
SELECT Category,
	SUM (Quantity) AS UnitsSold,
	SUM(TotalSales) AS Revenue
From sales
GROUP by Category

--Products with low profit
SELECT ProductName,
	Sum(TotalSales) AS Revenue,
	ROUND(Sum(Profit)*100.0/Sum(TotalSales),2) As Margin
From Sales
Group By productName
Having (Sum(Profit)*100.0/Sum(TotalSales) <20)
ORDER by Margin;

-- another version , nullif :prevent divide by zero errors
SELECT ProductName,
	Sum(TotalSales) AS Revenue,
	ROUND(Sum(Profit)*100.0 / NULLIF(Sum(TotalSales),0),2) As Margin
From Sales
Group By productName
Having (Sum(Profit)*100.0/NULLIF(Sum(TotalSales),0) <20)
ORDER by Margin;

--Average Order Value
SELECT AVG(TotalSales) AS AVGOrderValue FROM Sales;

--REpeat Customers by SalesPerson
Select SalesPerson, count(SaleId) as NumberOfSales
From Sales
Group by SalesPerson;

--Month over Month Growth
with MonthlySales As(
	SELECT FORMAT(SaleDate,'yyyy-MM') As Month , Sum(TotalSales) AS Revenue
	FRom Sales
	GROUP BY Format(SaleDate,'yyyy-MM'))
SElect * from MonthlySales 
Order BY Month;

--Best and worst dale profit per product
select 
	ProductName,
	SUM(TotalSales) AS TotalRevenue,
	SUM(Profit)AS TotalProfit,
	ROUND((SUM(Profit)*100.0) /NUllIF(sum(TotalSales),0),2) As OverallMargin ,
	Round(MIN(Profit * 100.0/NUllIF(TotalSales,0)),2) As WorstSaleMargin,
	Round(MAX(Profit * 100.0/NUllIF(TotalSales,0)),2) As BestSaleMargin
FROM Sales
Group By ProductName
Order by OverallMargin DESC;

--Update Nokwethaba's Profit
update Sales
set Profit = 4000.00
Where Salesperson = 'Nokwethemba';

-- Add the Cost Column
Alter table sales
Add cost decimal(10,2);
Update Sales set Cost = Totalsales - Profit

-- Top 5 highest sales
select top 4 ProductName , 
Totalsales from sales 
order by totalsales desc

--all Durban Electronics sales
Select * from Sales
where Region = 'Durban' AND Category ='Electronics';

-- Sales between 2 dates
Select * from sales 
where SaleDate between '2025-02-01' AND '2025-05-01';

-- find anyone with profit less than 500
Select * from Sales where profit < 500;

--Give everyone in cape town a 10% profit boost
update Sales SET Profit = Profit *1.10 
where  Region = 'Cape Town';

select SaleID , Region, Profit
from Sales


select * from Sales