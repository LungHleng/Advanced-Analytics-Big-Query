SELECT * FROM `practical-493418.Retail_sale.Data` LIMIT 1000;

-- Question 1 WHERE Clause
SELECT *
FROM `practical-493418.Retail_sale.Data`
WHERE Date BETWEEN '2023-01-31' AND '2023-12-31';

-- Question 2 Fltering + Conditions 
SELECT *
FROM `practical-493418.Retail_sale.Data`
WHERE `Total Amount` > (SELECT AVG (`Total Amount`) 
FROM practical-493418.Retail_sale.Data);

-- Question 3 Aggregate Functions - Calculating the total revenue (sum of Total Amount)
SELECT 
SUM(`Total Amount`) AS total_revenue
FROM `practical-493418.Retail_sale.Data`;


-- Question 4 DISTINCT
SELECT DISTINCT('Product Category')
FROM practical-493418.Retail_sale.Data;

-- Question 5 GROUP BY
SELECT
   `Product Category`, 
   SUM(`Quantity`) AS `total_quantity_sold`
   FROM `practical-493418.Retail_sale.Data`
   GROUP BY `Product Category`
   ORDER BY total_quantity_sold
   DESC;

 --- Question 6 CASE Statement
  SELECT
      `Customer ID`, Age,
    CASE
       WHEN Age < 30 THEN 'Youth'
       WHEN Age BETWEEN 30 and 59 THEN 'Adult'
       WHEN Age >= 60 THEN 'Senior'
       END AS Age_Group
       FROM `practical-493418.Retail_sale.Data`;


  --Question 7 Conditional Aggregation
  SELECT Gender,
      COUNT(`Transaction ID`) AS TOTAL_QUANTITY
      FROM `practical-493418.Retail_sale.Data`
      WHERE `Total Amount` > 500
      GROUP BY Gender;


-- Question 8 HAVING
SELECT `Product Category`,
    SUM(`Total Amount`) AS Total_Revenue
FROM `practical-493418.Retail_sale.Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;


-- Question 9 Calculated Fields
SELECT
    `Transaction ID`, `Price per unit`,
    CASE
      WHEN `Price per Unit` < 50 THEN 'Cheap'
      WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
      WHEN `pRICE PER uNIT` > 200 THEN 'Expensive'
END AS `Unit Cost Category`
FROM `practical-493418.Retail_sale.Data`;


--- Question 10 Combining WHERE + CASE
SELECT
  `Customer ID`, Age,
   `Total Amount`,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
ELSE 'Low'
END AS Spending_Level
FROM `practical-493418.Retail_sale.Data`
WHERE Age >= 40;



