		Easy-Level Tasks
1.Write a query that uses an alias to rename the ProductName column as Name in the Products table.
SELECT ProductName — bu Products jadvalidagi ProductName ustunini tanlayapmiz.
AS Name — bu alias (ya’ni vaqtinchalik nom) berish.
AS — so‘rov natijasida ustun nomini o‘zgartirish kalit so‘zi.
Name — yangi vaqtinchalik nom.
FROM Products — ma’lumot manbai sifatida Products jadvali.
Alias faqat so‘rov natijasida ishlaydi, jadvalning asl nomini o‘zgartirmaydi.
select * from Products

Select ProductName AS Name,
Price, Category, StockQuantity From Products
ProductName va Category ustunlarini birlashtiramiz va yangi ustun nomini FullInfo qilamiz.
SELECT 
    ProductName + ' - ' + Category AS FullInfo,
    Price
FROM Products;
select * from Products
2.Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT * - jadvaldagi barcha ustunlarni tanlaymiz.
FROM Customers - ma’lumot manbai sifatida Customers jadvali.
AS Client - jadvalga vaqtinchalik nom (alias) berish.
Bu shuni anglatadiki, so‘rov ichida endi Customers o‘rniga Client deb murojaat qilamiz.
AS kalit so‘zi majburiy emas, yozmasak ham ishlaydi:
Alias faqat so‘rov bajarilishida amal qiladi — ma’lumotlar bazasidagi asl jadval nomi o‘zgarmaydi. Jadval nomini vaqtinchalik o’zgartirib turish bu amaliyotda agar jadval nomi juda uzun bo’lganda qisqa qilib vaqtinchalik nom beriladi qulaylik uchun. Masalan jadval nomi ‘CustomerTransactionHistoryWithDetails’ shunday uzun bo’lsa biz uni nomini vaqtinchalik CTHWD deb nom berib qo’yamiz va boshqa ishlarni qilish vaqtida tez topish uchun yoki yozish uchun bizga qulaylik yaratadi.
Select * from Customers
Select * from Customers AS Client
AS kalit so‘zi majburiy emas, yozmasak ham ishlaydi:
Select * from Customers Client

3.Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
1-kod bizda 2 ta jadval bor Products va Products_Discounted ikkala jadvaldan biz UNION yordamida ProductName ustunini birlashtirib takroriy qiymatlarni o’chirib ajratib oldik.
Select ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted
2-kod bizda 2 ta jadval bor Products va Products_Discounted ikkala jadvaldan biz UNION ALL yordamida ProductName ustunini birlashtirib takroriy qiymatlarni ham chiqarib oldik.
Select ProductName
FROM Products
UNION ALL
SELECT ProductName
FROM Products_Discounted
Asosiy xususiyat bu UNION takroriy qiymatlarni o’chiradi(unique bo’ladi).
4.Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;
Products jadvalidagi ProductName ustunini tanlaymiz.
INTERSECT – bu operator ikki so’rov natijasidagi faqat umumiy qiymatlarni chiqaradi. Natija avtomatik ravishda DISTINCT bo’ladi takrorlarni o’chirgan holda.
Amaliyotda nima uchun kerak?
Ma’lumotlar qiyoslash: Masalan, chegirmadagi mahsulotlar va asosiy katalogdagi mahsulotlar orasidagi umumiy nomlarni topish.
Ma’lumotlar sifatini tekshirish: Ikkita tizimdan kelgan ma’lumotlar bir-biriga mosligini aniqlash.
Filtrlash: Masalan, “ham asosiy katalogda, ham chegirma ro‘yxatida mavjud bo‘lgan mahsulotlarni” hisobotga qo‘shish.
Agar umumiy mahsulotlarni topib, qaysi jadvaldan kelganini ham ko‘rsatmoqchi bo‘lsak, JOIN ishlatamiz:
SELECT p.ProductName
FROM Products p
JOIN Products_Discounted pd
    ON p.ProductName = pd.ProductName;

5. Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT FirstName, Country
FROM Customers
Select * from Customers
Bu yerda DISTINCT ikki ustun FirstName va Country bo’yicha ishlaydi. Agar ikkala ustunda bir xil nomlar kelsa faqat bittasini oladi. Bu nima uchun kerak masalan bir adresga ikki marta pochta yok isms yubormaslik uchun ajratib olishga yordam beradi.

6. Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
Bizda Products jadvali bor. Unda mahsulot nomi (ProductName) va narxi (Price) mavjud.
Topshiriq: Shunday so‘rov yozish kerakki, natijada qo‘shimcha ustun chiqsin:
Agar Price > 1000 bo‘lsa — "High"
Agar Price <= 1000 bo‘lsa — "Low"
 Select ProductName, Price,
Case
When Price >1000 THEN 'HIGH'
ELSE 'LOW'
END AS PriceCategory
FROM Products;

select * from Products

Select ProductName, Price,
Case
WHEN Price >1000 THEN 'HIGH'
WHEN Price >=500 THEN 'MEDIUM'
ELSE 'Low'
END AS PriceCategory
FROM Products;
select * from Products
Hisobotlarda guruhlash — masalan, mahsulotlarni “Qimmat” va “Arzon” guruhlariga ajratish.
Filtrlash — narxga qarab marketing strategiyasini tuzish (masalan, High segment mijozlarga alohida taklif yuborish).
Vizualizatsiya — Power BI yoki Excel’da ma’lumotlarni ranglar bilan ajratishda.

7. Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
select * from Products_Discounted

select 
ProductName,
StockQuantity,
IIF(StockQuantity >100, 'Yes', 'No') AS InStock

from Products_Discounted
IIF(shart, true_qiymat, false_qiymat)
Bu SQL Server’ning tezkor if-else funksiyasi.
Birinchi argument — shart (StockQuantity > 100).
Ikkinchi argument — agar shart to‘g‘ri bo‘lsa ('Yes').
Uchinchi argument — agar shart noto‘g‘ri bo‘lsa ('No').
AS InStock — ustunga vaqtinchalik nom berish.
ProductName va StockQuantity ustunlarini ham chiqaramiz, foydalanuvchi shartga mos kelganini ko‘ra oladi.
Tezkor if-else holatlari — CASE ga qaraganda qisqa yoziladi.
Hisobotlarda filtr — masalan, katta zaxiradagi mahsulotlarga alohida e’tibor qaratish.
Marketing — “Yes” bo‘lganlarni ko‘proq reklama qilish, “No” bo‘lganlarga zaxira to‘ldirish.

Medium-Level Tasks

8. Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
1-kod bizda 2 ta jadval bor Products va Products_Discounted ikkala jadvaldan biz UNION yordamida ProductName ustunini birlashtirib takroriy qiymatlarni o’chirib ajratib oldik.
Select ProductName
FROM Products
UNION
SELECT ProductName
FROM Products_Discounted
2-kod bizda 2 ta jadval bor Products va Products_Discounted ikkala jadvaldan biz UNION ALL yordamida ProductName ustunini birlashtirib takroriy qiymatlarni ham chiqarib oldik.
Select ProductName
FROM Products
UNION ALL
SELECT ProductName
FROM Products_Discounted
Asosiy xususiyat bu UNION takroriy qiymatlarni o’chiradi(unique bo’ladi).
9. Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
1-kod Products jadvalida bor lekin Products_Discounted jadvalida yo’q qiymatlarni chiqaradi bir xil bo’lganlarni ya’ni ikkalasida ham borini chiqarib yuboradi.
Select ProductName 
FROM Products
EXCEPT
Select ProductName 
FROM Products_Discounted;

2-kod Products_Discounted jadvalida bor lekin Products jadvalida yo’q qiymatlarni chiqaradi bir xil bo’lganlarni ya’ni ikkalasida ham borini chiqarib yuboradi.

Select ProductName 
FROM Products_Discounted
EXCEPT
Select ProductName 
FROM Products;
10.Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
SELECT 
    ProductID,
    ProductName,
    Category,
    Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;
IIF(shart, agar_true, agar_false)
shart → tekshiriladigan ifoda (masalan, Price > 1000)
agar_true → shart true bo‘lsa qaytadigan qiymat
agar_false → shart false bo‘lsa qaytadigan qiymat 
Birinchi argument: tekshiriladigan shart (Price > 1000).
Ikkinchi argument: agar shart to‘g‘ri bo‘lsa ('Expensive').
Uchinchi argument: agar shart noto‘g‘ri bo‘lsa ('Affordable').
AS PriceCategory — yangi hosil bo‘lgan ustunga nom berish.
ProductName va Price ustunlarini ham chiqarish — foydalanuvchi kategoriyani ko‘rishi uchun qulay.

11.Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
SELECT *
FROM Employees
WHERE Age < 25
   OR Salary > 60000
   Order BY AGE ASC;
Age < 25 — yosh xodimlarni tanlaydi.
OR Salary > 60000 — yuqori maoshli xodimlarni tanlaydi.
OR ishlatilganligi sababli:  
Yosh bo‘lishi shart emas, agar maoshi katta bo‘lsa ham chiqadi.
Maoshi katta bo‘lishi shart emas, agar yoshi kichik bo‘lsa ham chiqadi.
Amaliyot bilan bog‘lash
HR bo‘limida bu qidiruvdan yangi kadrlar yoki yuqori maosh oluvchilar ro‘yxatini olish uchun foydalaniladi.
Kadrlar almashinuvi tahlili — yosh bo‘lsa, o‘qishga ketishi yoki tez-tez ish o‘zgartirishi mumkin, yuqori maoshli bo‘lsa, byudjet rejalashtirishda alohida hisobga olinadi.
Ish haqi siyosatini tahlil qilish — yuqori maosh oluvchilarni aniqlab, boshqa xodimlar bilan solishtirish.
12.Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
SQL Server’da bu ishni UPDATE operatori bilan amalga oshiramiz. 10% oshirish uchun Salary * 1.10 formulasi ishlatiladi.
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = 'HR' OR EmployeeID = 5;
UPDATE — jadvaldagi ma’lumotlarni yangilash uchun ishlatiladi.
SET — qaysi ustun va qanday qiymat bilan yangilanishini ko‘rsatadi.
WHERE — faqat kerakli shartga mos keladigan qatorlarni yangilash uchun ishlatiladi.
OR — shartlardan hech bo‘lmasa biri to‘g‘ri bo‘lsa, amal bajariladi.
Amaliyotda nima uchun kerak bular misol uchun: Kadrlar bo‘limida (HR) bo‘lgan xodimlarga yil yakunida bonus berish. Ma’lum bir xodimga (ID orqali aniqlanadigan) individual ravishda ish haqini oshirish. Ko‘p shart bilan yangilash (masalan, bo‘lim va xodim ID birgalikda) kompaniyada keng qo‘llanadi.

13.Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)

Select SaleID, SaleAmount,
CASE
WHEN SaleAmount > 500 THEN 'Top Tier'
WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
ELSE 'Low Tier'
END AS SaleCategory
FROM Sales;
WHEN — shart qo‘yadi.
THEN — shart to‘g‘ri bo‘lsa chiqariladigan qiymat.
ELSE — boshqa holatlarda chiqariladigan qiymat.
Natijada yangi SaleCategory ustuni hosil bo‘ladi va har bir sotuv mos keladigan guruhga kiritiladi.
Amaliyot bilan bog‘lash
Savdo tahlilida darajalarga bo‘lish orqali tezkor qaror qabul qilish mumkin:
Top Tier — katta bitimlar, mijozlarga VIP xizmat ko‘rsatish kerak bo‘lishi mumkin.
Mid Tier — standart bitimlar.
Low Tier — kichik bitimlar, marketing strategiyasini kuchaytirish kerak bo‘lishi mumkin.
Hisobotlarda CASE orqali darajalar ko‘rsatilsa, Excel yoki Power BI vizualizatsiyalarida ham guruhlash osonlashadi.
Bonus tizimi — menejerlarga bonus hisoblashda shu guruhlar bo‘yicha foiz belgilash mumkin.

14.Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Sales table.
SELECT CustomerID
FROM Orders
EXCEPT
SELECT CustomerID
FROM Sales;
SELECT CustomerID FROM Orders — buyurtma bergan barcha mijozlar ro‘yxati.
EXCEPT — chap tomondagi ro‘yxatdan o‘ng tomondagilarni olib tashlaydi (faqat birinchisida bor, ikkinchisida yo‘q bo‘lsa qoldiradi).
SELECT CustomerID FROM Sales — haqiqiy sotuvlar jadvalidagi mijozlar.
Natijada: Orders jadvalida bor, lekin Sales jadvalida yo‘q bo‘lgan mijozlar chiqadi.
Amaliyot bilan bog‘lash
Sotuv jarayonini nazorat qilish: ba’zi mijozlar buyurtma bergan bo‘lsa-da, sotuv amalga oshmagan yoki tizimga kiritilmagan bo‘lishi mumkin.
Xatoliklarni aniqlash: ERP yoki CRM tizimida ma’lumotlar sinxronlashmagan bo‘lishi mumkin.
Marketing strategiyasi: buyurtma bergan, lekin xarid qilmagan mijozlarga maxsus taklif yuborish.
Hisobotlar: EXCEPT orqali tezda mos kelmaydigan yozuvlarni topish va tozalash.
15.Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
Select CustomerID, Quantity,
CASE
WHEN Quantity = 1 THEN 3
WHEN Quantity BETWEEN 1 AND 3 THEN 5
ELSE 7
END AS DiscountPercentage
FROM Orders;
CASE — SQL’dagi shartli tanlov operatori, turli shartlarga qarab qiymat qaytaradi.
WHEN ... THEN ... — shart bajarilsa, shu qiymat qaytariladi.
BETWEEN 1 AND 3 — Quantity qiymati 1 dan 3 gacha bo‘lsa (shu sonlar ham kiradi).
ELSE — boshqa barcha holatlar uchun.
  Amaliyot bilan bog‘lash
Marketing: miqdorga qarab chegirma berish — xaridorni ko‘proq xarid qilishga undash uchun ishlatiladi.
Tizim avtomatlashtirish: kassir yoki onlayn buyurtma tizimi avtomatik ravishda chegirma foizini hisoblaydi.
Hisobotlar: chegirma berilgan xaridorlar va sotuvlarni tahlil qilishda foydali.
Buxgalteriya va soliq: chegirma bo‘yicha hujjat tayyorlashda kerak bo‘lishi mumkin.
