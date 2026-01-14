select* from`debit and credit banking_data`;

select* from`debit and credit banking_data`
where Balance>5000; 

select Branch  From `debit and credit banking_data`
where Balance<3000; 
ALTER TABLE `debit and credit banking_data`
RENAME COLUMN `Customer name` TO `customer_name`;

select * from `debit and credit banking_data`
where balance between '3000' AND '10000';

select * from `debit and credit banking_data`;

select Bank Name from `debit and credit banking_data`
where Amount < '5000';

-- Find the total spending of each customer
SELECT customer_name,sum(Amount) AS Total_Spending
FROM `debit and credit banking_data`
GROUP BY customer_name
ORDER BY Total_Spending DESC;

--Find the highest single transaction
SELECT *
FROM `debit and credit banking_data`
ORDER BY Amount DESC
LIMIT 1; 

