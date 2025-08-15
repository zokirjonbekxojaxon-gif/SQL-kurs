1.Question: Explain at least two ways to find distinct values based on two columns.

SELECT DISTINCT 
       LEAST(col1, col2) AS col1,
       GREATEST(col1, col2) AS col2
FROM InputTbl;

SELECT DISTINCT
       CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
       CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;

SELECT
  CASE WHEN col1 <= col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 <= col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl
GROUP BY
  CASE WHEN col1 <= col2 THEN col1 ELSE col2 END,
  CASE WHEN col1 <= col2 THEN col2 ELSE col1 END;

WITH Canon AS (
  SELECT
    CASE WHEN col1 <= col2 THEN col1 ELSE col2 END AS a,
    CASE WHEN col1 <= col2 THEN col2 ELSE col1 END AS b
  FROM InputTbl
)
SELECT a AS col1, b AS col2, COUNT(*) AS repeat_count
FROM Canon
GROUP BY a, b;

2.Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.

	SELECT *
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);

SELECT *
FROM TestMultipleZero
WHERE (A + B + C + D) <> 0;

3.Find those with odd ids

   SELECT *
FROM section1
WHERE id % 2 <> 0;

4.Person with the smallest id (use the table in puzzle 3)

SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

SELECT *
FROM section1
WHERE id = (SELECT MIN(id) FROM section1);
5.Person with the highest id (use the table in puzzle 3)

SELECT TOP 1 *
FROM section1
ORDER BY id DESC;
SELECT *
FROM section1
WHERE id = (SELECT MAX(id) FROM section1);

6.People whose name starts with b (use the table in puzzle 3)

SELECT *
FROM section1
WHERE name LIKE 'B%';

7.Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).
Select * from ProductCodes

SELECT *
FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

% — ixtiyoriy uzunlikdagi har qanday belgilar
\_ — haqiqiy underscore belgisini bildiradi
ESCAPE '\' — \ belgisi maxsus belgini oddiy qilib ko‘rsatish uchun ishlatilishini bildiradi
 
