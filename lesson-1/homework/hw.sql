EASY
1.	Define the following terms: data, database, relational database, and table.

Data – bu ma’lumotlar degan ma’noda keladi bunga misol ism, yosh, jinsi, raqam yoki rasmlar bo’lishi mumkin. Ular faqat yig’ilgan bo’ladi tahlil qilish yoki ishlov berilmagan bo’ladi.
Database – bu ma’lumotlar bazasini saqalaydigan tizim bo’lib unda ma’lumotlarni tahlil qilish, yangilash, o’chirish, qo’shish, taxrirlash uchun mo’ljallangan. Misol uchun korxonani umumiy ma’lumotlari saqlanadi nechta odam ishlaydi, ism familiyasi, yoshi, mutaxassisligi, jinsi yoki korxonani faoliyati haqida bo’lishi mumkin qancha ishlab chiqardi mahsulotni, daromad qancha, foyda qancha, soliqlar va shunga o’xshash ma’lumotlar bo’lishi mumkin.
Relational Database – bu nisbiy ma’lumotlar bazasi bo’lib bunda jadvallarni bir-biriga bog’lagan holda tashkil etilgan ma’lumotlar vazasi xisoblanadi. Misol uchun korxona ishchilarning ID raqamlari, ismi alohida jadvalda bunga biz korxona ishchilarning yoshi, mutaassisligi, oylik maoshini va shunga o’xshash ma’lumotlarni ID raqam bilan bog’lagan holda ko’rsak ushb ma’lumotlar bazasi relational database bo’ladi.
Table – bu qatorlar va ustunlardan tashkil topgan ma’lumotlar jadvali xisoblanadi. Xar bir jadvalning o’z kerakli ma’lumotlari yig’indisi bo’ladi xar bir qator va ustun faqat ma’lum bir ma’lumotni ko’rsatadi.

2.	List five key features of SQL Server.
1. Data Storage & Management. 2. Transact-SQL. 3.Security. 4.Backup and Restore. 5.Integration and Reporting.
1.Data Storage & Management- ma’lumotlarni saqlash va boshqarish ma’nosida bo’lib SQL server ma’lumotlar bazasini boshqarish tizimi database management system ya’ni katta hajmdagi ma’lumotlarni tahrirlash, saqalash, o’chirish yoki qidirish uchun kerak bo’ladi. Masalan 1 millionta ma’lumotni tezda va oson topish, saqlash uchun ishlatiladi.
2. Transact-SQL- bu SQL server o’zining T-SQL nomli tili orqali shartla, so’rovlar, funksiyalar va boshqa dasturlash elementlarini ishlatishga imkon beradi.
3. Security- bu xavfsizlik bo’lib SQL foydalanuvchilarni rollarini beldilaydi login parol bilan belgilab qo’yadi ma’lumotlar bazasini xavfsizligini ta’minlaydi o’chib ketmaslik, ma’lumot o’g’irlanmasligi va shunga o’xshash xujumlardan himoya qiladi.
4. Backup and restore – bu ma’lumotlarni zahira nusxa olish va qayta tiklash uchun foydalaniladi.
5. Integration and reporting- bu SQL serverni boshqa tizimlar bilan integratsiya qilish uchun kerak masalan ma’lumotlarni exel, power BI va shunga o’xshagan faylar bilan bog’lashga xizmat qiladi.

3.	What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
1.	Windows authentication- bu windows orqali autentifikasi qilish ishonchli va xavfsiz va qulay chunki bir marta kirgansiz u sizni avtomatik tanib oladi parolni alohida kiritish shart bo’lmaydi.
2.	SQL server authentication- bu login va parol orqali autentifikasi qilish u windowsdan mustaqil xisoblanadi. Xar kimga faqat login va parol orqali kirishga to’g’ri keladi. Xavfsizlik uchun juda yaxshi va ehtiyotkorlik uchun kerak.

Medium
4.	Create a new database in SSMS named SchoolDB.
USE SchoolDB;

SELECT * FROM Students

CREATE TABLE Students (StudentID INT PRIMARY KEY IDENTITY(1,1),
    LastName VARCHAR(50),
    Age INT,
    Class VARCHAR(10),
    Grade INT);

INSERT INTO Students (LastName, Age, Class, Grade)
VALUES 
    ('Shaxriyor', 10, '4A', 4),
    ('Bekzod',    10, '4B', 5),
    ('Zafar',     10, '4C', 5),
    ('Abor',      10, '4D', 3);

5. Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
CREATE TABLE Students (StudentID INT PRIMARY KEY,
    Name VARCHAR(50),    Age INT);
	

	select * from Students

	INSERT INTO Students (StudentID, Name, Age)
VALUES 
    (1, 'Shoxrux', 14),
    (2, 'Shoxruz', 14),
    (3, 'Behruz', 14),
    (4, 'Malika', 14);

6. Describe the differences between SQL Server, SSMS, and SQL.
SQL server - bu ma’lumotlar bazasini boshqarish tizimi bo’lib barcha ma’lumotlarni o’ida saqlaydi yuragi desak ham bo’ladi.
SSMS SQL Server Management Studio- bu barcha ma’lumotlar bilan ishlash oynasi interfeys bunda grafik qilish, serverga ulanish, ma’lumotlarni boshqarish uchun qulay vosita, kod yozish oynasi umumiy qilib aytganda foydalanuvchi oynasi.

			





					HARD
7. Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples. 
DDL – Data Definition Language-bu buyruqlar jadval, baza, ustunlar kabi strukturani yaratadi yoki o‘zgartiradi. Uning ichiga asosiy buyruqlar create - yaratish, alter - o‘zgartirish, drop -o‘chirish, truncate -barcha ma’lumotlarni o‘chirish.
Misol: CREATE TABLE Students (ID INT, Name VARCHAR(50));
ALTER TABLE Students ADD Age INT;
DROP TABLE Students;

DML- Data manipulation language – bu buyruqlar, ma’lumotlar bilan ishlaydi Buning asosiy buyruqlari Insert- kiritish, Update-o’zgartirish, Delete-o’chirishlar kiradi.
Misol: INSERT INTO Students (ID, Name) VALUES (1, 'Sanjar');
UPDATE Students SET Name = 'Bekzod' WHERE ID = 1;
DELETE FROM Students WHERE ID = 1;

DQL Data query language- bu faqat ma’lumotni so’raydi. Bunda asosiy buyruq Select-ya’ni tanlab olish kiradi.
Misol: SELECT * FROM Students;

DCL Data Control language- foydalanuvchilar huquqlarini boshqaradi ya’ni kim nima qilishini belgilaydi. Asosiy buyquqlariga Grant-ruxsat berish, Revoke-ruxsatni bekor qilish.
Misol: GRANT SELECT ON Students TO USER1
REVOKE SELECT ON Students FROM USER1

TCL Transaction control language- buyruqlar tranzaksiyalarni boshqaradi yoki bir nechta buyruqlarni. Bunda asosiy buyruqlari COMMIT-o’zgarishlarni saqlash, ROLLBACK- o’zgarishlarni bekor qilish, SAVEPOINT-oraliq nuqtani belgilaydi.
Misol: BEGIN TRANSACTION;
UPDATE Students SET Age = 15 WHERE ID = 2;
ROLLBACK; 

8. Write a query to insert three records into the Students table.
INSERT INTO TALABA (TalabaID, Name, Age)
Values
(1, ‘Sanjar’, 20), (2, ‘Javlon’, 21), (3, ’Nurbek’, 22)
