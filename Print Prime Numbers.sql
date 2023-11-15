DECLARE @Output AS VARCHAR(MAX) = '';
WITH digit(d)
AS
(
SELECT 0 AS d
UNION ALL
SELECT d+1 AS d FROM digit WHERE d < 9
)
SELECT 
    @Output += CAST(a.Number AS VARCHAR(3)) + '&'    
 FROM (
SELECT a.d * 100 + b.d*10 + c.d + 1 AS Number FROM digit a
CROSS JOIN digit b 
CROSS JOIN digit c 
) a
LEFT JOIN (
SELECT a.d * 100 + b.d*10 + c.d + 1 AS Number FROM digit a
CROSS JOIN digit b 
CROSS JOIN digit c 
) b ON SQRT(a.Number) >= b.Number AND b.Number > 1
WHERE  a.Number > 1
GROUP BY a.Number
HAVING ISNULL(SUM(CASE WHEN a.Number % b.Number = 0 THEN 1 ELSE 0 END),0) = 0
ORDER BY a.Number
PRINT SUBSTRING(@Output,1,LEN(@Output)-1)
;
