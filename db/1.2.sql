SHOW TABLES;

SHOW ALL TABLES;

DESCRIBE vgsales;

SUMMARIZE vgsales;

SELECT * FROM vgsales;

-- observe platform details
SELECT Platform, COUNT(*) AS Platform_Count
FROM vgsales
GROUP BY Platform;

-- observe genre details
SELECT Genre, COUNT(*) AS Genre_Count 
FROM vgsales 
GROUP BY Genre;

-- observe year details
SELECT "Year", COUNT(*) AS Year_Count 
FROM vgsales 
GROUP BY "Year"
ORDER BY Year_Count DESC;
-- check if N/A values for year is null or string
SELECT COUNT(*) AS Null_Year_Count FROM vgsales WHERE "Year" IS NULL;
SELECT COUNT(*) AS NA_Year_Count FROM vgsales WHERE "Year" = 'N/A';

-- Platform with most games in Rank <=10
SELECT 
    Platform,
    COUNT(*) as Top_10_Games_Count
FROM vgsales 
WHERE Rank <= 10
GROUP BY Platform
ORDER BY Top_10_Games_Count DESC;

-- Platform and genres with most games in Rank <=10
SELECT 
    Platform,
    Genre,
    COUNT(*) as Top_10_Games_Count
FROM vgsales 
WHERE Rank <= 10
GROUP BY Platform, Genre
ORDER BY Top_10_Games_Count DESC, Platform, Genre;

-- Sales Performance by Genre
SELECT 
    Genre,
    COUNT(*) as Total_Games,
    ROUND(AVG(Global_Sales), 2) as Avg_Global_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Global_Sales,
    ROUND(MAX(Global_Sales), 2) as Max_Global_Sales,
FROM vgsales 
GROUP BY Genre 
ORDER BY Total_Global_Sales DESC;

-- Sales Performance by Platform
SELECT 
    Platform,
    COUNT(*) as Total_Games,
    ROUND(AVG(Global_Sales), 2) as Avg_Global_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Global_Sales,
    ROUND(MAX(Global_Sales), 2) as Max_Global_Sales
FROM vgsales 
GROUP BY Platform 
ORDER BY Total_Global_Sales DESC;

--Genre and Platform Combination Analysis
SELECT 
    Genre,
    Platform,
    COUNT(*) as Total_Games,
    ROUND(AVG(Global_Sales), 2) as Avg_Global_Sales,
    ROUND(SUM(Global_Sales), 2) as Total_Global_Sales,
    ROUND(MAX(Global_Sales), 2) as Max_Global_Sales
FROM vgsales 
GROUP BY Genre, Platform 
-- HAVING COUNT(*) >= 1  -- Only combinations with at least 5 games
ORDER BY Avg_Global_Sales DESC;

--Top performing games by "Genre"
SELECT 
    Name,
    Genre,
    Platform,
    Global_Sales,
    Year
FROM vgsales 
WHERE Global_Sales > 0
ORDER BY Global_Sales DESC
LIMIT 20;

--Performance by Year
SELECT 
    "Year",
    Genre,
    Platform,
    COUNT(*) as Games_Released,
    ROUND(AVG(Global_Sales), 2) as Avg_Sales
FROM vgsales 
GROUP BY "Year", Genre, Platform
ORDER BY "Year" DESC, Avg_Sales;

--regional performance analysis
SELECT 
    Genre,
    Platform,
    ROUND(SUM(Global_Sales), 2) as Total_Global_Sales,
    ROUND(SUM(NA_Sales), 2) as Total_NA_Sales,
    ROUND(SUM(NA_Sales)/SUM(Global_Sales), 2) as NA_Sales_Percentage,
    ROUND(SUM(EU_Sales), 2) as Total_EU_Sales,
    ROUND(SUM(EU_Sales)/SUM(Global_Sales), 2) as EU_Sales_Percentage,
    ROUND(SUM(JP_Sales), 2) as Total_JP_Sales,
    ROUND(SUM(JP_Sales)/SUM(Global_Sales), 2) as JP_Sales_Percentage,
    ROUND(SUM(Other_Sales), 2) as Total_Other_Sales,
    ROUND(SUM(Other_Sales)/SUM(Global_Sales), 2) as Other_Sales_Percentage
FROM vgsales 
GROUP BY Genre, Platform
ORDER BY Total_Global_Sales DESC;

SELECT 
    Genre,
    Platform,
    ROUND(AVG(NA_Sales), 2) as Avg_NA_Sales,
    ROUND(AVG(EU_Sales), 2) as Avg_EU_Sales,
    ROUND(AVG(JP_Sales), 2) as Avg_JP_Sales,
    ROUND(AVG(Other_Sales), 2) as Avg_Other_Sales,
    ROUND(AVG(Global_Sales), 2) as Avg_Global_Sales
FROM vgsales 
GROUP BY Genre, Platform
ORDER BY Avg_Global_Sales DESC;

