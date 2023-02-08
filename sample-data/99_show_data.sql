connect test/test@XEPDB1;

select table_name, num_rows from user_tables;


/*********************************************/
/*************** Verification ****************/
/*********************************************/

SELECT 'Verification:' AS "Verification" FROM regions WHERE region_id = 'EU';

SELECT 'regions' AS "Table", 7 AS "provided", COUNT(1) AS "actual" FROM regions
UNION ALL
SELECT 'countries' AS "Table", 196 AS "provided", COUNT(1) AS "actual" FROM countries
UNION ALL
SELECT 'cities' AS "Table", 204 AS "provided", COUNT(1) AS "actual" FROM cities
UNION ALL
SELECT 'currencies' AS "Table", 146 AS "provided", COUNT(1) AS "actual" FROM currencies
UNION ALL
SELECT 'currencies_countries' AS "Table", 203 AS "provided", COUNT(1) AS "actual" FROM currencies_countries;

SELECT 'The installation is finished, please check the verification output above!' AS "Thank you!"
   FROM regions WHERE region_id = 'EU'
UNION ALL
SELECT 'If the ''provided'' and ''actual'' row counts match, the installation was successful.' AS "Thank you!"
   FROM regions WHERE region_id = 'EU'
UNION ALL
SELECT 'If the row counts do not match, please check the above output for error messages.' AS "Thank you!"
