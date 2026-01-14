
select * from bank_data_loan;

select `Account ID`,`Client Name`,City,`State Name` from bank_data_loan
where `State Name`= "Rajasthan";

-- List of all bank_data_loan from Caste "obc" whose loan amout >= 10000

select `Account ID`,`Client Name`,City,`State Name`,`Funded Amount`,Caste from bank_data_loan
where Caste = "sc" and `Funded Amount` >=10000;

select `Account ID`,`Client Name`,City,`State Name`,`Funded Amount` from bank_data_loan
where `Funded Amount` >=10000 and `Funded Amount`<=20000;

select `Account ID`,`Client Name`,City,`State Name`,`Funded Amount` from bank_data_loan
where `Funded Amount`between 10000 and 20000;

select * from bank_data_loan limit 10;
SELECT `Client Name`,`Loan Amount` FROM bank_data_loan;

-- Select unique states

SELECT DISTINCT `State Name` FROM bank_data_loan;

-- WHERE  Clients with loan > 1,00,000

SELECT`Client Name`,`Loan Amount` FROM bank_data_loan
WHERE `Loan Amount` > 10000;

-- Loans with status Active

SELECT `Client Name`, `Loan Status`FROM bank_data_loan
WHERE `Loan Status` = "Active loan";

-- Clients older than 40 years

SELECT `Client Name` Age FROM bank_data_loan
WHERE Age > 40;

-- ORDER BY  Highest loan amount first

SELECT `Client Name`, `Loan Amount` FROM bank_data_loan
ORDER BY`Loan Amount` DESC;

-- Lowest interest rate first

SELECT `Client Name`, `Int Rate` FROM bank_data_loan
ORDER BY `Int Rate` ASC;

-- Order by State, then LoanAmount

SELECT `Client Name`,`State Name`, `Loan Amount`FROM bank_data_loan
ORDER BY `State Name` ASC, `Loan Amount` DESC limit 100 ;

-- GROUP BY (with Aggregates)  Count clients in each state

SELECT `State Name`, COUNT(*) AS TotalClients 
FROM bank_data_loan
GROUP BY`State Name` ;

-- Average loan per bank


SELECT `Bank Name`, AVG(`Loan Amount`) AS AvgLoan 
FROM bank_data_loan
GROUP BY`Bank Name` ;

-- Maximum loan per city

SELECT City, MAX(`Loan Amount`) AS MaxLoan 
FROM bank_data_loan
GROUP BY City;

-- CASE Categorize loan amount

       SELECT `Client Name`, `Loan Amount`,
       CASE 
           WHEN `Loan Amount` > 20000 THEN 'High'
           WHEN `Loan Amount` BETWEEN 5000 AND 10000 THEN 'Medium'
           ELSE 'Low'
       END AS LoanCategory
FROM bank_data_loan; 

-- Label clients by age

SELECT `Client Name`, Age,
       CASE 
           WHEN Age < 30 THEN 'Young'
           WHEN Age BETWEEN 30 AND 50 THEN 'Middle Aged'
           ELSE 'Senior'
       END AS AgeGroup
FROM bank_data_loan limit 500;

 -- IF   Mark delinquent loans
 
SELECT `Client Name`,Caste, `Account ID`, IF(`Is Delinquent Loan` = 'Y', 'Delinquent', 'Good') AS Status
FROM bank_data_loan;

-- Mark defaulted loans

SELECT `Client Name`, IF(`Is Default Loan` = 'Y', 'Defaulted', 'On Time') AS LoanFlag
FROM bank_data_loan;

-- COALESCE Replace null religion

SELECT `Client Name`, City,`Dateof Birth`,COALESCE(Religion, 'Not Provided') AS Religion
FROM bank_data_loan;

-- Replace null ownership with 'Unknown'

SELECT `Client Name`, COALESCE(`Home Ownership`, 'Unknown') AS Ownership
FROM bank_data_loan;


--  Get all unique cities

SELECT DISTINCT City
FROM bank_data_loan;

--  Find clients older than 40

SELECT `Client Name`, Age
FROM bank_data_loan
WHERE Age > 40;

--  Aggregate Functions

-- Average age of clients

SELECT AVG(Age) AS avg_age
FROM bank_data_loan;

--  Total loans per bank

SELECT`Branch Name`,Count(*)As total_Bank_loans
FROM bank_data_loan
GROUP BY `Branch Name`;

--  Minimum and Maximum age

SELECT MIN(Age) AS youngest, MAX(Age) AS oldest
FROM bank_data_loan;

--  Loan count by state

SELECT`State Abbr`, COUNT(*) AS total
FROM bank_data_loan
GROUP BY `State Abbr`
ORDER BY total DESC;

-- Logical Functions

--  Categorize clients by age group

SELECT `Client Name`, Age,
       CASE 
         WHEN Age < 25 THEN 'Young'
         WHEN Age BETWEEN 25 AND 50 THEN 'Middle-aged'
         ELSE 'Senior'
       END AS age_category
FROM bank_data_loan;

-- Replace NULL values in caste


SELECT COALESCE(Caste, 'Not Provided') AS caste_status
FROM bank_data_loan;

--  Loan risk based on grade

SELECT Grade,
       CASE 
         WHEN Grade IN ('A','B') THEN 'Low Risk'
         WHEN Grade IN ('C','D') THEN 'Medium Risk'
         ELSE 'High Risk'
       END AS Risk_Level,
       COUNT(*) AS total
FROM bank_data_loan
GROUP BY Grade;


-- Date Functions


-- Clients born after 1990

SELECT `Client Name`, `Dateof Birth`
FROM bank_data_loan
WHERE YEAR (`Dateof Birth`) > 2000;

-- Loans disbursed in 2018

SELECT COUNT(*) AS total_2018
FROM bank_data_loan
WHERE YEAR(`Disbursement Date (Years)`) = 2017;










