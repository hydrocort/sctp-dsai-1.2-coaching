SHOW TABLES;

SHOW ALL TABLES;

DESCRIBE vgsales;

SUMMARIZE vgsales;

SELECT DISTINCT Platform FROM vgsales;

SELECT DISTINCT Genre FROM vgsales;

SELECT DISTINCT "Year" FROM vgsales ORDER BY "Year";
SELECT COUNT(*) AS Null_Year_Count FROM vgsales WHERE "Year" IS NULL;
SELECT COUNT(*) AS NA_Year_Count FROM vgsales WHERE "Year" = 'N/A';


-- Sales Performance by Genre
SELECT 
    Genre,
    COUNT(*) as Total_Games,
    AVG(Global_Sales) as Avg_Global_Sales,
    SUM(Global_Sales) as Total_Global_Sales,
    MAX(Global_Sales) as Max_Global_Sales,
    ROUND(AVG(Global_Sales), 2) as Avg_Sales_Rounded
FROM vgsales 
WHERE Global_Sales > 0
GROUP BY Genre 
ORDER BY Total_Global_Sales DESC;

-- Sales Performance by Platform
SELECT 
    Platform,
    COUNT(*) as Total_Games,
    AVG(Global_Sales) as Avg_Global_Sales,
    SUM(Global_Sales) as Total_Global_Sales,
    MAX(Global_Sales) as Max_Global_Sales
FROM vgsales 
WHERE Global_Sales > 0
GROUP BY Platform 
ORDER BY Total_Global_Sales DESC;

--Genre and Platform Combination Analysis
SELECT 
    Genre,
    Platform,
    COUNT(*) as Total_Games,
    AVG(Global_Sales) as Avg_Global_Sales,
    SUM(Global_Sales) as Total_Global_Sales
FROM vgsales 
WHERE Global_Sales > 0
GROUP BY Genre, Platform 
HAVING COUNT(*) >= 5  -- Only combinations with at least 5 games
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

--market trends over time
SELECT 
    Year,
    Genre,
    Platform,
    COUNT(*) as Games_Released,
    AVG(Global_Sales) as Avg_Sales
FROM vgsales 
WHERE Year IS NOT NULL AND Global_Sales > 0
GROUP BY Year, Genre, Platform
ORDER BY Year DESC, Avg_Sales DESC;

--regional performance analysis
SELECT 
    Genre,
    Platform,
    AVG(NA_Sales) as Avg_NA_Sales,
    AVG(EU_Sales) as Avg_EU_Sales,
    AVG(JP_Sales) as Avg_JP_Sales,
    AVG(Other_Sales) as Avg_Other_Sales,
    AVG(Global_Sales) as Avg_Global_Sales
FROM vgsales 
WHERE Global_Sales > 0
GROUP BY Genre, Platform
ORDER BY Avg_Global_Sales DESC;

