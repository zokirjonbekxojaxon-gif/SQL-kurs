Easy-Level Tasks
1.Using Products table, find the total number of products available in each category.
Select   Category, 
		  COUNT(Category) AS ToifaSoni
	FROM Products
	Group BY Category;
-- Yoki
Select  Category, 
		 COUNT(*) AS ToifaSoni
	FROM Products
	Group BY Category;
2.Using Products table, get the average price of products in the 'Electronics' category.
Select Category, AVG(Price) AS OrtaNarx
			FROM Products
			WHERE Category = 'Electronics'
			
			Group BY Category;
3.Using Customers table, list all customers from cities that start with 'L'.
	Select CustomerID, City
		FROM Customers
		WHERE City LIKE 'L%';
4.Using Products table, get all product names that end with 'er'.
Select ProductName, Price
			FROM Products
			WHERE ProductName LIKE '%er';
5.Using Customers table, list all customers from countries ending in 'A'.
Select CustomerID, FirstName, LastName, Country
			FROM Customers
			WHERE Country LIKE '%a';
6.Using Products table, show the highest price among all products.
	Select TOP 1 ProductName, Price
			FROM Products;
Select ProductName, Price
			FROM Products
			WHERE Price = (Select MAX(Price) FROM Products);
7.Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
Select  ProductName, Price, InStock,
			CASE
				WHEN InStock < 30 THEN 'kam zaxira'
				ELSE 'etarli'
				END	AS PriceCateg
				FROM Products;
8.Using Customers table, find the total number of customers in each country.
	Select Country, COUNT(*) AS CustomerCount
			FROM Customers
			Group BY Country;
9.Using Orders table, find the minimum and maximum quantity ordered.
		Select	
MIN(TotalAmount) AS MinMiqd, 
			MAX(TotalAmount) AS MaxMiqd
			FROM Orders;
Medium-Level Tasks

10.Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
	Select DISTINCT o.CustomerID
		FROM Orders o
		LEFT JOIN Invoices i
		ON o.OrderDate >= '2023.01.01'
		AND i.InvoiceDate < '2023.02.01'
		AND i.InvoiceID IS NULL;
11.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
	Select ProductName
			FROM Products
			UNION ALL
	Select ProductName
			FROM Products_Discounted;
12.Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
	Select ProductName
		FROM Products
		UNION 
	Select ProductName
		FROM Products_Discounted;
13.Using Orders table, find the average order amount by year.
	Select	YEAR(OrderDAte) AS Yillar, 
			AVG(TotalAmount) AS OrtaBuyurt 
			FROM Orders
			Group BY YEAR(OrderDAte);
14.Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
	Select  Category, 
			CASE
				WHEN Price < 100 THEN 'Past'
				WHEN Price BETWEEN 100 AND 500 THEN 'O`rta'
				ELSE 'yuqori'
				END AS ProdPrice
				FROM Products;
15.Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
		Select district_id, district_name, [2012], [2013]
			INTO Population_Each_Year
			FROM city_population
			PIVOT (
			SUM(population) FOR YEAR IN ([2012], [2013])
			) AS PivotTable
			Order BY district_id, district_name;
16.Using Sales table, find total sales per product Id.
Select ProductID, 
			SUM(SaleAmount) AS TotalAmount
			FROM Sales
			Group BY ProductID;
17.Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
Select  ProductName
	FROM Products
	WHERE ProductName LIKE '%oo%';
18.Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
	Select year, [Bektemir],	
			[Chilonzor], 
			[Yakkasaroy]
		INTO Population_Each_City
		FROM (Select YEAR, district_name, population
		 FROM city_population)
		AS src PIVOT (
		SUM(population) FOR district_name IN ([Bektemir],	
			[Chilonzor], 
			[Yakkasaroy])
			) AS City;
			Select * FROM Population_Each_City;
Hard-Level Tasks

19.Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
Select TOP 3 CustomerID, 
			SUM(TotalAmount) AS Totalspent
	FROM Invoices
	Group BY CustomerID
	Order BY SUM(TotalAmount) DESC;
20.Transform Population_Each_Year table to its original format (City_Population).
SELECT district_id, district_name, year, population
FROM 
(
   SELECT district_id, Year, [2012], [2013]
   FROM Population_Each_Year2
) AS city_populatio
UNPIVOT
(
   population FOR year IN ([2012], [2013])
) AS unpvt;

21.Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
SELECT 
    p.ProductName, 
    SUM(s.Quantity) AS UnitsSold 
FROM Products p
JOIN Sales s 
    ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY UnitsSold DESC;
22.Transform Population_Each_City table to its original format (City_Population).

SELECT Year, 
       City, 
       Population
INTO City_Population1
FROM Population_Each_City
UNPIVOT
(
    Population FOR City IN ([Bektemir], [Chilonzor], [Yakkasaroy])
) AS Unpvt;
