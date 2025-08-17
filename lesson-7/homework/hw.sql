Easy-Level Tasks (10)

1.Write a query to find the minimum (MIN) price of a product in the Products table.
Select MIN(Price) AS MinQiy
FROM Products;

SELECT TOP 1 ProductName, 
Category, 
Price
FROM Products
ORDER BY Price ASC;

SELECT ProductName, 
Category, 	
Price
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
2.Write a query to find the maximum (MAX) Salary from the Employees table.
Select MAX(Salary) AS MaxMaosh
FROM Employees;

Select * FROM Employees

Select TOP 1 DepartmentName, 
LastName, 	
FirstName, 
Salary
FROM Employees
Order BY Salary DESC;

Select DepartmentName, 
LastName, 
FirstName, 
Salary
FROM Employees
WHERE Salary = (Select MAX(Salary) FROM Employees);
3.Write a query to count the number of rows in the Customers table.
Select 
COUNT(CustomerID) AS Mijoz
FROM Customers;

Select COUNT(*) AS Mijoz
FROM Orders
4.Write a query to count the number of unique product categories from the Products table.
Select 
COUNT(DISTINCT Category) AS UnukCateg
FROM Products;
Select * FROM Products;
5.Write a query to find the total sales amount for the product with id 7 in the Sales table.
	Select SaleID, 
SUM(SaleAmount) AS UmumQiy
	FROM Sales
	WHERE SaleID = 7
	Group BY SaleID;

6.Write a query to calculate the average age of employees in the Employees table.
Select AVG(Age) AS OrtaYosh
	FROM Employees;

	Select ROUND(AVG(Age), 1) AS OrtaYosh
	FROM Employees;

7.Write a query to count the number of employees in each department.
	1-usul
Select DepartmentName, 
COUNT(*) AS HodimSoni
	FROM Employees
	Group BY DepartmentName;

	2-usul agar vakant bo’lsa uni ham sonini chiqarish mumkin.
	Select DepartmentName, 
COUNT(EmployeeID) AS HodimSoni
	FROM Employees
	Group BY DepartmentName;

8.Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
Select Category,  
MAX(Price) AS MaxQiy, 
MIN(Price) AS MinQiy
FROM Products
Group BY Category;
9.Write a query to calculate the total sales per Customer in the Sales table.
Select CustomerID, 
SUM(SaleAmount) AS UmumSavdo
FROM Sales
Group BY CustomerID;

Select * FROM Sales;

10.Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).
Select DepartmentName, 
COUNT(EmployeeID) AS HodimSoni
FROM Employees
Group BY DepartmentName
HAVING COUNT(EmployeeID) > 5;



Easy-Level Tasks (10)
11.Write a query to calculate the total sales and average sales for each product category from the Sales table.
Select  Category,  
SUM(SaleAmount) AS UmumSavdo, 
		AVG(SaleAmount) AS OrtaQiy
FROM Sales
Group BY Category;

12.Write a query to count the number of employees from the Department HR.
Select DepartmentName, 
COUNT(EmployeeID) AS HodimSoni
FROM Employees
WHERE DepartmentName = 'HR'
Group BY DepartmentName;

13.Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
	1-usul
Select  DepartmentName,
			MAX(Salary) AS MaxOylik,
			MIN(Salary) AS MinOylik
	FROM Employees
	Group BY DepartmentName;
2-usul ID bo’yicha

	Select  EmployeeID,
			MAX(Salary) AS MaxOylik,
			MIN(Salary) AS MinOylik
	FROM Employees
	Group BY EmployeeID;

14.Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
	Select  DepartmentName, 
			AVG(Salary) AS OrtaOylik
			FROM Employees
			Group BY DepartmentName;

15.Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
Select DepartmentName, 
			AVG(Salary) AS OrtaOylik,
			COUNT(*) AS HodimSoni
			FROM Employees
			Group BY DepartmentName; 

16.Write a query to filter product categories with an average price greater than 400.
Select Category, AVG(Price) AS OrtaQiy
	FROM Products
	Group BY Category
	HAVING AVG(Price) > 400;
17.Write a query that calculates the total sales for each year in the Sales table.
Select  Year(SaleDate) AS SaleYear,
			SUM(SaleAmount) AS JamiQiy
	FROM Sales
	Group BY Year(SaleDate)
	Order BY SaleYear;

18.Write a query to show the list of customers who placed at least 3 orders.
Select CustomerName, 
		COUNT(OrderID) AS UmumMiq
		FROM Orders
		Group BY CustomerName
		HAVING COUNT(OrderID) > 3
		Order BY UmumMiq ASC;

19.Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).
	Select DepartmentName, AVG(Salary) AS OrtaOylik
			FROM Employees
			Group BY DepartmentName
			HAVING AVG(Salary) > 60000;

Hard-Level Tasks (6)
20.Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.
	Select Category, AVG(Price) AS OrtaQiy
		FROM Products
		Group BY Category
		HAVING AVG(Price) > 150;

21.Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.
Select CustomerID, SUM(TotalAmount) AS UmumSavdo
		FROM Orders
		Group BY CustomerID
		HAVING SUM(TotalAmount) > 1500;

22.Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.
		
	Select DepartmentName, SUM(Salary) AS UmumQiy,
			AVG(Salary) AS OrtaQiy
			FROM Employees
			Group BY DepartmentName
			HAVING AVG(Salary) > 65000
			Order BY OrtaQiy DESC;

23.Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
WITH OrderTotals AS
(
    SELECT
        o.custid,
        o.orderid,
        o.freight,
        SUM(od.unitprice * od.qty * (1 - od.discount)) AS OrderAmount
    FROM tsql2012.Sales.Orders AS o
    JOIN tsql2012.Sales.OrderDetails AS od
        ON od.orderid = o.orderid
    GROUP BY o.custid, o.orderid, o.freight
),
PerCustomer AS
(
    SELECT
        custid,
        SUM(CASE WHEN freight > 50 THEN OrderAmount ELSE 0 END) AS TotalAmount_FreightOver50,
        MIN(OrderAmount) AS LeastPurchase
    FROM OrderTotals
    GROUP BY custid
)
SELECT
    pc.custid,
    pc.TotalAmount_FreightOver50,
    pc.LeastPurchase
--   , c.companyname  -- agar kerak bo‘lsa:
-- FROM PerCustomer pc JOIN tsql2012.Sales.Customers c ON c.custid = pc.custid
FROM PerCustomer pc
ORDER BY pc.TotalAmount_FreightOver50 DESC;
24.Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)

	SELECT
    YEAR(OrderDate)  AS SaleYear,
    MONTH(OrderDate) AS SaleMonth,
    SUM(TotalAmount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY SaleYear, SaleMonth;

SELECT
    YEAR(OrderDate)  AS SaleYear,
    MONTH(OrderDate) AS SaleMonth,
    CustomerID,
    CustomerName,
    SUM(TotalAmount) AS TotalSales,
    COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate), CustomerID, CustomerName
HAVING COUNT(DISTINCT ProductID) >= 2
ORDER BY SaleYear, SaleMonth, TotalSales DESC;

25.Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:
Select YEAR(OrderDate) AS Yillar,
		MIN(Quantity) AS MinBuyurt,
		MAX(Quantity) AS MinBuyert
		FROM Orders
		Group BY YEAR(OrderDate)
		;
