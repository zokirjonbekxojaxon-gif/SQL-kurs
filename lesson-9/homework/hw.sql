
Easy-Level Tasks (10)
1.Using Products, Suppliers table List all combinations of product names and supplier names.
Select s.SupplierName, p.ProductName, p.Category, p.Price, p.StockQuantity
		FROM Products p
		INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
2.Using Departments, Employees table Get all combinations of departments and employees.
Select e.EmployeeName, e.Position, d.DepartmentName, d.Location
		FROM Employees e
		INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
3.Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
Select s.SupplierName, p.ProductName 
		FROM Products p
		INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
4.Using Orders, Customers table List customer names and their orders ID.
	Select CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.OrderID
		FROM Orders o
		INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
5.Using Courses, Students table Get all combinations of students and courses.
Select 
		c.CourseName,
		c.Instructor,
		s.Name,
		s.Major,
		s.Age
		FROM Students s
		CROSS JOIN Courses c;
Select c.CourseName, 
		c.Instructor,
		s.Name,
		s.Major,
		s.Age
		FROM Enrollments e 
		JOIN Students s ON s.StudentID = e.CourseID
		JOIN Courses c ON c.CourseID = e.StudentID;
6.Using Products, Orders table Get product names and orders where product IDs match.
		Select  p.ProductName, 
				o.OrderID,
				p.Category,
				o.OrderDate,
				o.TotalAmount
			FROM Products p
			INNER JOIN Orders o ON p.ProductID = o.ProductID;


7.Using Departments, Employees table List employees whose DepartmentID matches the department.
	Select  d.DepartmentName,
		 e.EmployeeName,
		 e.Position
		FROM Departments d
		JOIN Employees e ON d.DepartmentID = e.DepartmentID;
8.Using Students, Enrollments table List student names and their enrolled course IDs.
Select  s.Name,
			e.CourseID
			FROM Students s
			INNER JOIN Enrollments e ON s.StudentID = e.StudentID;

9.Using Payments, Orders table List all orders that have matching payments.
Select p.PaymentID,
			p.PaymentDate,
			p.PaymentMethod,
			p.Amount,
			o.CustomerID,
			o.Quantity
		FROM Payments p
		JOIN Orders o ON p.OrderID = o.OrderID;
10.Using Orders, Products table Show orders where product price is more than 100.
	Select  o.OrderID,
			p.ProductName,
			p.Price
		FROM Orders o
		JOIN Products p ON o.ProductID = p.ProductID
		WHERE p.Price > 100;

Medium (10 puzzles)

11.Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
		Select  d.DepartmentName,
			 e.EmployeeName
			FROM Employees e
			CROSS JOIN Departments d 
			WHERE d.DepartmentID <> e.DepartmentID;
12.Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
	Select  o.CustomerID,
			p.ProductName,
			o.Quantity,
			p.StockQuantity
			FROM Orders o
			JOIN Products p ON o.ProductID = p.ProductID
			WHERE o.Quantity > p.StockQuantity; 
13.Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
	Select  CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
			s.SaleAmount
			FROM Customers c
			JOIN Sales s ON c.CustomerID = s.CustomerID
			WHERE s.SaleAmount >= 500
			Order BY s.SaleAmount;
			
14.Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
	Select  s.Name,
			s.Major,
			c.CourseName,
			c.Instructor
		FROM Students s
		JOIN Enrollments e 
			ON s.StudentID = e.StudentID
		JOIN Courses c 
			ON c.CourseID = e.CourseID;
15.Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
	Select  p.Category,
			p.ProductName,
			s.SupplierName
		FROM Products p
		JOIN Suppliers s 
			ON p.SupplierID = s.SupplierID
		WHERE s.SupplierName LIKE '%Tech%';
16.Using Orders, Payments table Show orders where payment amount is less than total amount.
	Select  o.ProductID,
			o.TotalAmount,
			p.Amount
		FROM Orders o
		JOIN Payments p 
			ON o.OrderID = p.OrderID
		WHERE o.TotalAmount > p.Amount;
17.Using Employees and Departments tables, get the Department Name for each employee.
Select  e.EmployeeName,
			e.Position,
			d.DepartmentName
			FROM Employees e
			JOIN Departments d ON
			e.DepartmentID = d.DepartmentID;
18.Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
SELECT 
    p.ProductName,
    p.Price,
    c.CategoryName
FROM Products p
JOIN Categories c 
    ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');
19.Using Sales, Customers table Show all sales from customers who are from 'USA'.
Select  CONCAT(FirstName, ' ', LastName) AS CustomerName,
			c.Country,
			c.City,
			s.SaleAmount
			FROM Customers c
		JOIN Sales s ON c.CustomerID = s.CustomerID
			WHERE c.Country = 'USA';
20.Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
	Select  CONCAT(FirstName, ' ', LastName) AS CustomerName,
				c.Country,
				c.City,
				o.OrderID,
				o.Quantity,
				o.TotalAmount
			FROM Customers c
			JOIN Orders o ON c.CustomerID = o.CustomerID
			WHERE o.TotalAmount > 100 AND Country = 'Germany';
🔴 		Hard (5 puzzles)(Do some research for the tasks below)

21.Using Employees table List all pairs of employees from different departments.
SELECT
  e1.EmployeeName AS Employee1,
  d1.DepartmentName AS Dept1,
  e2.EmployeeName AS Employee2,
  d2.DepartmentName AS Dept2
FROM Employees e1
JOIN Employees e2
  ON e1.EmployeeID < e2.EmployeeID
 AND e1.DepartmentID <> e2.DepartmentID
JOIN Departments d1 ON d1.DepartmentID = e1.DepartmentID
JOIN Departments d2 ON d2.DepartmentID = e2.DepartmentID;
22.Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
	SELECT  
    o.OrderID,
    p.ProductName,
    p.Price,
    o.Quantity,
    (o.Quantity * p.Price) AS ExpectedAmount,
    p1.Amount AS PaidAmount
FROM Orders o
JOIN Products p 
    ON o.ProductID = p.ProductID
JOIN Payments p1 
    ON p1.OrderID = o.OrderID
WHERE p1.Amount <> (o.Quantity * p.Price);
23.Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
SELECT  
    s.Name,
    s.Major,
    e.EnrollmentID,
    c.CourseName,
    c.Instructor
FROM Students s
LEFT JOIN Enrollments e 
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c 
    ON c.CourseID = e.CourseID
WHERE e.EnrollmentID IS NULL;
24.Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
	SELECT
  m.EmployeeID   AS ManagerID,
  m.Name         AS ManagerName,
  m.Salary       AS ManagerSalary,
  r.EmployeeID   AS ReportID,
  r.Name         AS ReportName,
  r.Salary       AS ReportSalary
FROM Employees AS r      -- r = report (bo‘ysunuvchi)
JOIN Employees AS m      -- m = manager (boshliq)
  ON r.ManagerID = m.EmployeeID
WHERE m.Salary <= r.Salary
ORDER BY m.Name, r.Name;
25.Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
SELECT DISTINCT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderID,
    o.TotalAmount
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p 
    ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
