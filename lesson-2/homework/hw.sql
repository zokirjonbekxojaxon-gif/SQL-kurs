Basic-Level Tasks (10)

1. Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
	
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
    (1, 'Gani', 4500.00),
    (2, 'Malika', 5200.50),
    (3, 'Behruz', 6100.75);

	Select * from Employees
2. Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

SELECT name FROM sys.tables;

Insert into Employees (EmpID, Name, Salary)
Values (4, 'Davron', 5200.01);

Insert into Employees (EmpID, Name, Salary)
Values (5, 'John', 5400.02),
		(6, 'Bred', 5600.02);

		SELECT * FROM Employees;

3. Update the Salary of an employee to 7000 where EmpID = 1.
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1

SELECT * FROM Employees;
4. Delete a record from the Employees table where EmpID = 2.
delete from Employees
where EmpID = 5;

SELECT * FROM Employees;
5. Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
Bu SQLdagi 3 xil o’chirish buyruqlari bo’lib , ular turli maqsadlarda ishlatiladi.
Masalan:
Delete- bu jadvaldagi bitta yoki bir nechta ma’lumotlarni o’chiradi lekin jadvalning strukturasi saqlanib qoladi. Where sharti bilan ishlaydi va o’chirishdan oldin ma’lumotni nazorat qilish mumkin bo’ladi. Bundan tashqari tranzaksiya rollback mumkin bo’ladi.
Truncate- bu jadvaldagi barcha yozuvlarni birdaniga o’chiradi Where bilan ishlamaydi juda tez ish qiladi uni lekin bekor qilib bo’lmaydi. Odatda loglar yozilmaydi.
Drop- bu jadvalning o’zini butunlay o’chiradi hattoki strukturasi ham yo’qoladi. Drop ishlatilganda jadval keyin mavjud bo’lmaydi bu eng keskin buyruq xisoblanadi. Barcha ma’lumotlarlar, indeks, buyruqlar, ruxsatlar  hmmasi yo’q bo’ladi.
	6.  Modify the Name column in the Employees table to Varchar(100)
Alter table employees
Alter column Name Varchar(100)
Select * From Employees

7. Add a new column Department (Varchar(50)) to the Employees table.
Alter table Employees
ADD Department VARCHAR(50);

Select * from Employees
	8. Change the data type of the Salary column to FLOAT.
Alter table employees
Alter column Salary Float

Select * from Employees
	9. Create another table Departments with columns DepartmentID (INT, Primary key) and DepartmentName (VARCHAR (50))
Create table Departments
(Department INT primary KEY, DepartmentID Varchar(50));

Select * From Departments
	10. Remove all records from the Employees table without deleting its structure.
Truncate from Employees 
Mana shu kod bizga to’g’ri keladi sababi jadval ichidagi ma’lumot faqat o’chiramiz jadvalga esa boshqa ma’lumotlarni joylash mumkin.
	
		Inermediate -Level Tasks (6)
	11. Insert five records  into the Departments table using  Insert into Select  method (you can write anything you want as data).
Insert into Departments (DepartmentID, DepartmentName)
Values

(1, 'Kadrlar bolimi'),
(2, 'Moliya bolimi'),
(3, 'IT'),
(4, 'Kotibiyat'),
(5, 'Logistika');

Select * from Departments;

	12. Update the Department of all employees where Salary >500 to ‘Management’.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
Select * from Employees

	13. Write a query that removes all employees but keeps the structure intact.
Truncate from Employees 
Mana shu kod bizga to’g’ri keladi sababi ma’lumotlar o’chib jadval saqlanib qoladi.

	14. Drop the Department column from the Employees table.
Alter table employees
Drop column Department;
Select * from Employees
	15. Rename the employees table to StaffMembers using SQL commands.

EXEC sp_rename 'Employees', 'StaffMembers';

Select * from StaffMembers

	16. Write a query to completely remove the Departments table from the database.

Drop table Departments bu kod bazadan departments butunlay o’chib ketadi. 

			Advanced-Level Tasks (9)
17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL).
Create table Products (ProductID INT PRIMARY KEY,
productName Varchar(10),
category  Varchar(50),
Price DECIMAL(10,2),
Stockquantity INT);

Select * from Products
18. Add a CHECK constraint to ensure Price is always greater than 0.
Alter table products
ADD Constraint chk_price_positive check (Price > 0);

Select * from Products


19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
ALTER TABLE Products
ADD CONSTRAINT df_stock_qty DEFAULT 50 FOR StockQuantity;
Select * from Products

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (2, 'Mouse', 'Electronics', 19.99);

Select * from Products
20. Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

SELECT * FROM Products;
21. Insert 5 records into the Products table using standard INSERT INTO queries.

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES (1, 'Laptop', 'Electronics', 1200.00, 10);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES (2, 'Mouse', 'Electronics', 25.50, 50);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES (3, 'Notebook', 'Stationery', 2.99, 200);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES (4, 'Water Bottle', 'Accessories', 8.75, 75);

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, StockQuantity)
VALUES (5, 'Desk Lamp', 'Home', 18.00, 30);

SELECT * FROM Products;

22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
SELECT *
INTO Products_Backup
FROM Products;
SELECT * FROM Products_Backup;
	23. Rename the Products table to Inventory.
EXEC sp_rename 'Products', 'Inventory';

SELECT * FROM Inventory;
24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
ALTER TABLE Inventory
DROP CONSTRAINT chk_price_positive;
Select * from Inventory

ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

Select * from Inventory
ALTER TABLE Inventory
ADD CONSTRAINT chk_price_positive CHECK (Price > 0);

Select * from Inventory
25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.
EXEC sp_rename 'Inventory', 'Inventory_Old';
Select * from Inventory_Old

CREATE TABLE Inventory (
    ProductCode INT IDENTITY(1000, 5) PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    StockQuantity INT
);

Select * from Inventory
INSERT INTO Inventory (ProductID, ProductName, ProductCategory, Price, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, StockQuantity
FROM Inventory_Old;

Select * from Inventory
