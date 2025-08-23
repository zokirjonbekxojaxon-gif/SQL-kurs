Easy-Level Tasks (10)

1.Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
 Expected Columns: EmployeeName, Salary, DepartmentName
Select  
e.Name AS EmployeeName,
			d.DepartmentName,
			e.Salary
		FROM Employees e
		JOIN Departments d ON 
e.DepartmentID = d.DepartmentID
		WHERE e.Salary > 50000;
2.Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
 Expected Columns: FirstName, LastName, OrderDate
Select   
c.FirstName,
		  	c.LastName,
		  	o.OrderDate
		FROM Customers c
		JOIN Orders o ON 
c.CustomerID = o.CustomerID
3.		WHERE YEAR(o.OrderDate) = '2023';Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
 Expected Columns: EmployeeName, DepartmentName
Select  e.Name AS EmployeeName,
	 	 d.DepartmentName
		FROM Employees e
	LEFT JOIN Departments d ON
e.DepartmentID = d.DepartmentID;
4.Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
 Expected Columns: SupplierName, ProductName
Select  s.SupplierName,
		 p.ProductName
		FROM Suppliers s
		LEFT JOIN Products p ON 
		s.SupplierID = p.SupplierID;
5.Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
Select  o.OrderID,
		 o.OrderDate,
		 p.PaymentDate,
		 p.Amount
		FROM Orders o
		FULL OUTER JOIN Payments p 
		ON o.OrderID = p.OrderID;
6.Using the Employees table, write a query to show each employee's name along with the name of their manager.
 Expected Columns: EmployeeName, ManagerName
	Select  e.Name AS EmployeeName,
		 m.Name AS ManagerName
		FROM Employees e
		LEFT JOIN Employees m ON
		e.ManagerID = m.EmployeeID;
7.Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
 Expected Columns: StudentName, CourseName
Select
			s.Name AS StudentName,
			c.CourseName
		FROM Students s
		JOIN Enrollments e ON s.StudentID = e.StudentID
		JOIN Courses c ON e.CourseID = c.CourseID
		WHERE c.CourseName = 'Math 101';

8.Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
 Expected Columns: FirstName, LastName, Quantity
		Select TOP 3 
			c.FirstName,
			c.LastName,
			SUM(o.Quantity) AS Quantity
		FROM Customers c
		JOIN Orders o ON 
		c.CustomerID = o.CustomerID
		Group BY c.FirstName, c.LastName
		HAVING SUM(o.Quantity) > 3;
9.Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
 Expected Columns: EmployeeName, DepartmentName
Select
			e.Name AS EmployeeName,
			d.DepartmentName
		FROM Employees e
		JOIN Departments d 
		ON e.DepartmentID = d.DepartmentID
		WHERE d.DepartmentName IN ('HR', 'Human Resources');
🟠 Medium-Level Tasks (9)

10.Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
 Expected Columns: DepartmentName, EmployeeCount
		Select
			d.DepartmentName,
			COUNT(e.DepartmentID) AS EmployeeCount
		FROM Employees e
		JOIN Departments d 
		ON e.DepartmentID = d.DepartmentID
		Group BY d.DepartmentName
HAVING COUNT(e.DepartmentID) > 5;

11.Using the Products and Sales tables, write a query to find products that have never been sold.
 Expected Columns: ProductID, ProductName
Select
			p.ProductID,
			p.ProductName
		FROM Products p
		LEFT JOIN Sales s 
ON p.ProductID = s.ProductID
WHERE p.ProductID IS NULL;
12.Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
 Expected Columns: FirstName, LastName, TotalOrders
		Select 
			c.FirstName,
			c.LastName,
			COUNT(o.OrderID) AS TotalOrders
		FROM Customers c
		JOIN Orders o ON c.CustomerID = o.CustomerID
		Group BY c.FirstName, c.LastName
		Order BY TotalOrders DESC;
13.Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
 Expected Columns: EmployeeName, DepartmentName
			Select
				e.Name AS EmployeeName,
				d.DepartmentName
			FROM Employees e
			INNER JOIN Departments d ON
			e.DepartmentID = d.DepartmentID;
14.Using the Employees table, write a query to find pairs of employees who report to the same manager.
 Expected Columns: Employee1, Employee2, ManagerID
			Select
				e1.Name AS Employee1,
				e2.Name AS Employee2,
				e1.ManagerID
			FROM Employees e1
			JOIN Employees e2 ON
			e1.ManagerID = e2.ManagerID
			AND e1.EmployeeID < e2.EmployeeID;
15.Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
 Expected Columns: OrderID, OrderDate, FirstName, LastName
Select
			o.OrderID,
			o.OrderDate,
			c.FirstName,
			c.LastName
		FROM Orders o
		JOIN Customers c ON 
		o.CustomerID = c.CustomerID
		WHERE YEAR(o.OrderDate) = 2022;
	
16.Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
 Expected Columns: EmployeeName, Salary, DepartmentName
			Select 
				e.Name AS EmployeeName,
				e.Salary,
				d.DepartmentName
			FROM Employees e
			JOIN Departments d 
ON e.DepartmentID = d.DepartmentID
			WHERE d.DepartmentName = 'Sales' AND e.Salary > 60000;
17.Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
Select 
				o.OrderID,
				o.OrderDate,
				p.PaymentDate,
				p.Amount
			FROM Orders o
			JOIN Payments p ON
				o.OrderID = p.OrderID;
18.Using the Products and Orders tables, write a query to find products that were never ordered.
 Expected Columns: ProductID, ProductName
Select
				p.ProductID,
				p.ProductName
			FROM Products p
			LEFT JOIN Orders o ON
				p.ProductID = o.ProductID
			WHERE o.ProductID IS NULL;
🔴 Hard-Level Tasks (9)

19.Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
 Expected Columns: EmployeeName, Salary
			Select
				Name AS EmployeeName,
				e.Salary 
			FROM Employees e
			WHERE e.Salary > (
				Select AVG(e2.Salary)
				FROM Employees e2
				WHERE e2.DepartmentID = e.DepartmentID);
20.Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
 Expected Columns: OrderID, OrderDate
Select 
				o.OrderID,
				o.OrderDate
			FROM Orders o
			LEFT JOIN Payments p ON
				o.OrderID = p.OrderID
			WHERE p.OrderID IS NULL 
		AND o.OrderDate < '01.01.2020';

21.Using the Products and Categories tables, write a query to return products that do not have a matching category.
 Expected Columns: ProductID, ProductName
Select  p.ProductID,
				 p.ProductName
			FROM Products p
			LEFT JOIN Categories c ON
			p.Category = c.CategoryID
			WHERE p.Category IS NULL;
22.Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
 Expected Columns: Employee1, Employee2, ManagerID, Salary
SELECT 
    		e1.Name AS Employee1,
    		e2.Name AS Employee2,
    		e1.ManagerID,
    		e1.Salary AS Employee1Salary,
    		e2.Salary AS Employee2Salary
FROM Employees e1
JOIN Employees e2
    		ON e1.ManagerID = e2.ManagerID      -- bir menejerga qarashli
   	AND e1.EmployeeID < e2.EmployeeID    -- juftlikni takrorlamaslik uchun
WHERE e1.Salary > 60000
AND e2.Salary > 60000;
23.Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
 Expected Columns: EmployeeName, DepartmentName
Select 
			e.Name AS EmployeeName,
			d.DepartmentName
		FROM Employees e
		JOIN Departments d ON 
		e.DepartmentID = d.DepartmentID
		WHERE d.DepartmentName LIKE 'M%';
24.Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
 Expected Columns: SaleID, ProductName, SaleAmount
Select 
				s.SaleID,
				p.ProductName,
				s.SaleAmount
			FROM Products p
			JOIN Sales s ON
			p.ProductID = s.ProductID
			WHERE s.SaleAmount > 500;
25.Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
 Expected Columns: StudentID, StudentName
SELECT 
    s.StudentID,
    s.Name AS StudentName
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE e.StudentID = s.StudentID
      AND c.CourseName = 'Math 101';
26.Using the Orders and Payments tables, write a query to return orders that are missing payment details.
 Expected Columns: OrderID, OrderDate, PaymentID
SELECT 
    		o.OrderID,
    		o.OrderDate,
    		p.PaymentID
FROM Orders o
LEFT JOIN Payments p 
    	ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
27.Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
 Expected Columns: ProductID, ProductName, CategoryName
	SELECT 
    		p.ProductID,
    		p.ProductName,
    		c.CategoryName
FROM Products p
JOIN Categories c 
   	 ON p.Category = c.CategoryID 
WHERE c.CategoryName IN ('Electronics', 'Furniture');
