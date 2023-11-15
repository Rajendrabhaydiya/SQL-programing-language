SELECT concat(NAME,concat("(",concat(substr(OCCUPATION,1,1),")"))) FROM OCCUPATIONS ORDER BY NAME ASC;
SELECT "There are a total of ", count(OCCUPATION), concat(lower(occupation),"s.") FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY count(OCCUPATION), OCCUPATION ASC
