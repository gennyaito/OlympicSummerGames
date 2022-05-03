SELECT 
 [ID]
,Name AS 'Competitor Name' --Renamed (Name) Column
,CASE WHEN SEX = 'M' THEN 'Male'ELSE 'Female' END AS Sex ---Changed M to Male and F to Female
, [Age]
,CASE WHEN [Age] < 18 THEN 'Under 18'
       WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
	   WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
	   WHEN [Age] > 30 THEN 'Over 30'
END AS [Age Grouping] --- Created Age Bin
,[Height]
,[Weight]
,[NOC] AS 'Nation Code' --Renamed (NOC) Column
,LEFT(Games,CHARINDEX(' ', Games)- 1) AS 'Year' ---Split Games column to Year
,RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1) AS 'Season'--- Split Games column to Season
,[Sport]
,[Event]
,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal ---Changed NA to Not Registered
FROM olympic_games.dbo.athletes_event_results
WHERE RIGHT(Games, CHARINDEX(' ',REVERSE(Games))-1) = 'Summer'--- To show only Summer Games 
