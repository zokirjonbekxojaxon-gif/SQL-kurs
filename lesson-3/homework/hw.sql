Easy-Level Tasks (10)

1.Define and explain the purpose of BULK INSERT in SQL Server.

create database BulkInsertTest;

USE BulkInsertTest

create table Products
(
ProductID INT,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2),
Quantity INT
);

Select * from Products

Bulk insert Products
FROM 'D:\Data\products.csv'
WITH (
FORMAT = 'CSV',
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
);
Select * from Products

SELECT COUNT(*) AS TotalRows
FROM Products;

SELECT TOP 10 *
FROM Products;

2. List four file formats that can be imported into SQL Server.
SQL serverga 4 asosiy formatda fayllar yuklanadi va ishlatiladi. Bular quyidagilar:
 CSV (Comma-Separated Values). Ustunlar vergul bilan ajratilgan matn fayl.
Ko‘pincha BULK INSERT yoki bcp orqali yuklanadi.
Misol: products.csv
 TXT (Plain Text). Oddiy matnli fayl, ustunlar maxsus ajratgich bilan (TAB, |, ; va h.k.) bo‘lishi mumkin.
BULK INSERT bilan import qilinadi.
 XLSX / XLS (Excel fayllari). Excel jadvallari orqali OPENROWSET yoki SSIS yordamida yuklanadi.
Misol: sales_data.xlsx
XML (Extensible Markup Language). Tuzilgan ma’lumot fayli, OPENXML yoki XML parsing orqali import qilinadi.

3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).

Create table Products
(
PRODUCTID INT PRIMARY KEY,
PRODUCTNAME VARCHAR(50),
PRICE DECIMAL(10,2)
);

SELECT * FROM Products

4. Insert three records into the Products table using INSERT INTO.
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Mouse', 1300.01);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (2, 'IPHONE', 600.08);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (3, 'LAPTOP', 450.50);


select * from Products

5. Explain the difference between NULL and NOT NULL.
NULL

insert into Products (ProductID, ProductName, Price)

values (4, 'NULL', 900.03);

select * from Products
NOT NULL
create table example (
id int NOT NULL,
Name varchar(50) NOT NULL);

select * from example
6. Add a UNIQUE constraint to the ProductName column in the Products table.
alter table PRODUCTS
ADD CONSTRAINT UQ_PRODUCTNAME UNIQUE (ProductName);

select * from Products

7. Write a comment in a SQL query explaining its purpose.
-- ushbu belgi SQL tomonidan e’tiborga olinmaydi bizga asosan eslatish uchun komentariya yozish uchun kerak bo’ladi bu faqat shu qator uchun amal qiladi.
-- Products jadvalidan barcha yozuvlarni olish
select * from Products;
select top 5 * from products; -- Eng yuqori 5 mahsulot
Agar bizga eslab qolish uchun ko’proq ma’lumot yozish kerak bo’lganda bizga quyidagi belgilar bilan ajratish kerak bo’ladi.
/* bir nechta qatordan 
keyin oxiriga 
ushbu belgi qo’yiladi
*/ shu belgigacha barcha ma’lumotlarni select * from products → yoki hohlagan papka nomi bilan yozilishi mumkin qabul qilinmaydi.
8. Add CategoryID column to the Products table.
ALTER TABLE PRODUCTS
ADD CategoryID INT;

select * from Products

UPDATE Products
SET CategoryID = 1
WHERE ProductName IN ('Mouse', 'iPhone');

UPDATE Products
SET CategoryID = 2
WHERE ProductName = 'laptop';

UPDATE Products
SET CategoryID = NULL
WHERE ProductName IS NULL;


select * from Products
9. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
create table categories (
CategoryID INT Primary Key,
CategoryName VARCHAR(50) UNIQUE);

SELECT * FROM categories
PRIMARY KEY → har bir qatorda noyob bo‘lishi va NULL bo‘lmasligi kerak.
UNIQUE → ustundagi qiymatlar takrorlanmasligi kerak, lekin NULL bo‘lishi mumkin (agar ruxsat berilgan bo‘lsa).
VARCHAR(50) → matn uzunligi 50 belgigacha.
10. Explain the purpose of the IDENTITY column in SQL Server.
create table TableName (
ColumnName INT IDENTITY(1, 1) Primary Key,
TableName Varchar(50),
Price Decimal (10,3)
);
Select * from TableName
INSERT INTO TableName (ProductName, Price)
VALUES ('Laptop', 1200.00),
       ('Mouse', 25.50);

SELECT * FROM TableName;

Medium-Level Tasks (10)
11. Use BULK INSERT to import from a text file into the Products table.
Create table Products3
(
PRODUCTID INT PRIMARY KEY,
PRODUCTNAME VARCHAR(50),
PRICE DECIMAL(10,2)
);
Select * from Products3

BULK INSERT Products3
FROM 'D:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);
Select * from Products3
12. Create a FOREIGN KEY in the Products table that references the Categories table.
CREATE DATABASE BulkInsertTest2;

USE BulkInsertTest2;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
 Select * from Categories

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    CategoryID INT
);

Select * from Products

INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Home');

Select * from Categories

INSERT INTO Products (ProductID, ProductName, Price, CategoryID)
VALUES
(1, 'Laptop', 1200.00, 1),
(2, 'Mouse', 25.50, 1),
(3, 'Keyboard', 45.99, 2),
(4, 'Desk Lamp', 18.00, 3);

Select * from Products

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

Select * from Products

Select * from Categories
13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50)
);
select * from Employees

CREATE TABLE Employees1 (
    EmpID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);

select * from Employees1

14. Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);

select * from Products

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (10, 'Tablet', 500.00);

select * from Products

Xato kiritmaslik kerak
--INSERT INTO Products (ProductID, ProductName, Price)
--VALUES (11, 'Fake Product', 0.00);
--Price 0.00 bo'lib qolmaslik shart
15. Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;

select * from Products
Agar Products jadvalida avvaldan yozuvlar mavjud bo‘lsa, va siz NOT NULL ustun qo‘shsangiz, bu ustunga default qiymat berilmasa xato bo‘ladi.

16. Use the ISNULL function to replace NULL values in Price column with a 0.
INSERT INTO Products (ProductID, ProductName, Price, Stock)
VALUES (100, 'TestProduct', NULL, 10);

select * from Products

SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price,
    Stock
FROM Products;

17. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

--FK_Products_Categories ni o’chirib ushbu topshiriqni bajarish uchun DROP CONSTRAINT FK_Products_Categories; dan foydalandik


ALTER TABLE Products
DROP CONSTRAINT FK_Products_Categories;

select * from Categories

Select * from Products

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

select * from Categories

Select * from Products

SELECT 
    f.name AS ForeignKeyName,
    OBJECT_NAME(f.parent_object_id) AS TableName,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS ColumnName,
    OBJECT_NAME(f.referenced_object_id) AS ReferencedTable,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS ReferencedColumn
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc 
    ON f.object_id = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'Products';

--Xato kiritib aniqlik kiritamiz

INSERT INTO Products (ProductID, ProductName, Price, CategoryID)
VALUES (999, 'TestProduct', 99.99, 999); 

18.	 Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Age INT,
    Email NVARCHAR(100),
    CHECK (Age >= 18)
);
select * from Customers

INSERT INTO Customers (CustomerID, FullName, Age, Email)
VALUES (2, 'Sanjar Raximov', 23, 'sanjik@gamil.com'),
		(3, 'Valijon Shamsiyev', 28, 'valijon@gmail.com'),
		(4, 'Bekzod Toshev', 21, 'bek@mail.ru');

select * from Customers
19. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
CREATE TABLE PremiumCustomers (
    CustomerID INT IDENTITY(100,10) PRIMARY KEY,
    FullName NVARCHAR(100),
    Age INT CHECK (Age >= 18),
    Email NVARCHAR(100)
);

select * from PremiumCustomers

Insert Into PremiumCustomers (FullName, Age, Email)
Values
	('Malika Sodiqova', 27, 'malika@mail.ru'),
	('Bahrom Berdiyev', 26, 'bahrom@gamil.com'),
	('Burhon Saidov', 21, 'burhon@xample.com');

select * from PremiumCustomers
20.Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ProductID)
);

select * from OrderDetails

-- 1-chi buyurtma, 2-chi mahsulot
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 2, 3, 19.99);

-- 1-chi buyurtma, 3-chi mahsulot
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 3, 2, 9.50);

-- ❌ Takroriy (OrderID = 1, ProductID = 2) — xatoga olib keladi
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 2, 5, 18.00);

--Endi mahsulot nomlari bilan kiritamiz bunda bizga ProductName ustunini qo'shishimiz kerak bo'ladi ya'ni:

alter table OrderDetails
ADD ProductName NVarchar(50)

Select * from OrderDetails

UPDATE OrderDetails SET ProductName = 'Laptop' WHERE ProductID = 2;
UPDATE OrderDetails SET ProductName = 'Mouse' WHERE ProductID = 3;


Select * from OrderDetails

21. Explain the use of COALESCE and ISNULL functions for handling NULL values.
ISNULL funksiyasi- Agar ustun NULL bo‘lsa — uni boshqa qiymat bilan almashtirish.
SELECT ISNULL(ProductName, 'Noma’lum') AS DisplayName
FROM OrderDetails;
COALESCE funksiyasi- Bir nechta qiymatdan birinchi NULL bo‘lmaganini qaytaradi.
SELECT COALESCE(ProductName, 'DefaultName', 'Backup') AS FinalName
FROM OrderDetails;
Yangi jadval hosil qilib sinab ko’ramiz.
CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20)
);
Select * from Customers1

INSERT INTO Customers1 (CustomerID, FullName, Phone)
VALUES 
    (1, 'Malika Sodiqova', '+998901234567'),
    (2, 'Bahrom Berdiyev', NULL),
    (3, 'Nilufar Karimova', NULL);

	Select * from Customers1

	SELECT FullName, ISNULL(Phone, 'Telefon mavjud emas') AS ContactPhone
FROM Customers1;

Select * from Customers1

SELECT FullName, COALESCE(Phone, 'Telefon yo‘q', 'Zaxira') AS ContactPhone
FROM Customers1;

Select * from Customers1

22. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Position NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE
);

select * from Employees

INSERT INTO Employees (EmpID, FullName, Position, Email)
VALUES 
    (1, 'Malika Sodiqova', 'Manager', 'malika@example.com'),
    (2, 'Bahrom Berdiyev', 'Analyst', 'bahrom@example.com'),
    (3, 'Nilufar Karimova', 'Developer', 'nilufar@example.com');

	select * from Employees

-- Unique buyrug'i qo'yilgan ustunda ma'lumot qaytarilishini oldi olinadi u masalan email adres bitta odamda bitta bo'ladi 
-- shuning uchun ushbu filtrni qo'ygan afzal.

23. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
CREATE TABLE Departments1 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);
select * from Departments1

CREATE TABLE Employees1 (
    EmpID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments1(DepartmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

select * from Employees1

--Ushbu ma'lumotlarni endi tekshirib ko'ramiz

-- Department qo‘shamiz
INSERT INTO Departments1 VALUES (1, 'IT'), (2, 'HR');

select *from Departments1

-- Xodimlar qo‘shamiz
INSERT INTO Employees1 VALUES 
    (1010, 'Ali Karimov', 1),
    (1020, 'Lola Tursunova', 2);

	select * from Employees1

-- DepartmentID = 2 o‘chirilsa, Lola ham o‘chadi
DELETE FROM Departments1 WHERE DepartmentID = 2;

select *from Departments1
-- DepartmentID = 1 ni 11 ga o‘zgartiramiz
UPDATE Departments1 SET DepartmentID = 11 WHERE DepartmentID = 1;
select *from Departments1
-- Natija: Ali endi DepartmentID = 11 da bo‘ladi
SELECT * FROM Employees1;




