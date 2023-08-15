-- Analysis

-- Calculate the key statistics in the table
SELECT ROUND(AVG(PPP), 3) AS Mean, MIN(PPP) AS Min, MAX(PPP) AS Max
FROM ppp;

-- Show the top 20 Purchasing Power country and round the number
SELECT Country, ROUND(PPP, 3) AS PPP 
FROM ppp
ORDER BY PPP desc
LIMIT 20;

-- Show the average PPP in the years provided for each country and order from high to low
SELECT Country, ROUND(AVG(SumPPP), 3) AS Average_PPP
FROM (
    SELECT Country, SUM(PPP) AS SumPPP
    FROM ppp
    GROUP BY Country
) AS Subquery
GROUP BY Country
ORDER BY Average_PPP DESC;

-- Show the top 10 and bottom 10 in 1990s
SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 1990 AND 1999
ORDER BY PPP desc
LIMIT 10;

SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 1990 AND 1999
ORDER BY PPP asc
LIMIT 10;

-- Show the top 10 and bottom 10 in 2000s
SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 2000 AND 2009
ORDER BY PPP desc
LIMIT 10;

SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 2000 AND 2009
ORDER BY PPP asc
LIMIT 10;

-- Show the top 10 and bottom 10 in 2010s
SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 2010 AND 2019
ORDER BY PPP desc
LIMIT 10;

SELECT Country, Year, ROUND(PPP, 3) AS PPP
FROM ppp
WHERE Year BETWEEN 2010 AND 2019
ORDER BY PPP asc
LIMIT 10;

-- Which country has the biggest growth percentage in PPP?
SELECT p2.Country, p2.Year, ROUND((p2.PPP - p1.PPP) / p1.ppp * 100, 3) AS change_in_percentage
FROM ppp p1
INNER JOIN ppp p2
ON p1.Country = p2.Country
WHERE p2.Year > p1.Year AND p2.PPP > p1.PPP
ORDER BY change_in_percentage desc
LIMIT 5;

-- Which country has the biggest decline percentage in PPP?
SELECT p2.Country, p2.Year, ROUND((p2.PPP - p1.PPP) / p1.ppp * 100, 3) AS change_in_percentage
FROM ppp p1
INNER JOIN ppp p2
ON p1.Country = p2.Country
WHERE p2.Year > p1.Year AND p2.PPP < p1.PPP
ORDER BY change_in_percentage desc
LIMIT 5;
