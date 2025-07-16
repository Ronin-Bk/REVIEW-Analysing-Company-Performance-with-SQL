Analysing Company Performance with SQL
The Brief: 
The Northwind database contains the sales data for a fictitious company called Northwind Traders, which imports and exports specialty foods from around the world.

You are tasked to perform an analysis of the performance of this company using SQL.

Description:

In this individual assignment, you will have to load the provided dataset into a Postgres database and create SQL queries to answer some business questions.

You can download the dataset here: link

The dataset is composed of 13 tables:

Table

Rows

Categories

8

Customers

91

Employees

9

EmployeeTerritories

49

Order Details

2155

Orders

830

Region

4

Products

77

Shippers

6

Suppliers

29

Territories

53

Usstates

51

Here is the entity relationship diagram (ERD) for this dataset

northwind_erd.png

Business Questions:
Question 1
For their annual review of the company pricing strategy, the Product Team wants to look at the products that are currently being offered for a specific price range ($20 to $50). In order to help them they asked you to provide them with a list of products with the following information:

their name
their unit price
Filtered on the following conditions:

their unit price is between 20 and 50 (greater or equal to 20 but less or equal than 50)
they are not discontinued
Finally order the results by unit price in a descending order (highest first).

Question 2
The Logistics Team wants to do a retrospection of their performances for the year 1998, in order to identify for which countries they didn’t perform well. They asked you to provide them a list of countries with the following information:

their average days between the order date and the shipping date (formatted to have only 2 decimals)
their total number of unique orders (based on the order id) 
Filtered on the following conditions:

the year of order date is 1998
their average days between the order date and the shipping date is greater or equal 5 days
their total number of orders is greater than 10 orders
Finally order the results by country name in an ascending order (following alphabetical order).



Question 3
The HR Team wants to know for each employee what was their age on the date they joined the company and who they currently report to. Provide them with a list of every employees with the following information:

their full name (first name and last name combined in a single field)
their job title
their age at the time they were hired
their manager full name (first name and last name combined in a single field)
their manager job title
Finally order the results by employee age and employee full name in an ascending order (lowest first).

Question 4
The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in order to identify for which month they perform well. They asked you to provide them a list with:

their year/month as single field in a date format (e.g. “1990-01-01” for January 1990)
their total number of orders
their total freight (formatted to have no decimals)
Filtered on the following conditions:

the order date is between 1997 and 1998
their total number of orders is greater than 35 orders
Finally order the results by total freight (descending order).

Question 5
The Pricing Team wants to know which products had an unit price increase and the percentage increase was not between 20% and 30%. In order to help them they asked you to provide them a list of products with:

their product name
their current unit price (formatted to have only 2 decimals)
their initial unit price (formatted to have only 2 decimals)
their percentage increase with the result formatted to an integer (e.g 50 for 50%)  using the following calculation: 
(Current Unit Price - Initial Unit Price) ÷ Initial Unit Price * 100

Filtered on the following conditions:

their percentage increase is not between 20% and 30%  (lower than 20 or greater than 30)
Finally order the results by percentage increase (ascending order).

Question 6
The Pricing Team wants to know how each category performs according to their price range. In order to help them they asked you to provide them a list of categories with:

their category name
their price range as: 
“1. Below $20”
“2. $20 - $50”
“3. Over $50”
their total amount (formatted to be integer) taking into account the offered discount (i.e. subtracting the discounted amount)
their volume of orders (number of orders in which the category was present)
Finally order the results by category name then price range (both ascending order).

Question 7
The Logistics Team wants to know what is the current state of our regional suppliers' stocks for each category of product. In order to help them they asked you to provide them a list of categories with:

their supplier region” as: 
“America”
“Europe”
“Asia-Pacific”
their category name
their total units in stock
their total units on order
their total reorder level
Finally order the results by category name, then supplier region and reorder level (each in ascending order).

Question 8
The Pricing Team wants to know for each currently offered product how their unit price compares against their categories average and median unit price. In order to help them they asked you to provide them a list of products with:

their category name
their product name
their unit price
their category average unit price (formatted to have only 2 decimals)
their category median unit price (formatted to have only 2 decimals)
their position against the category average unit price as:
“Below Average”
“Equal Average”
“Over Average”
their position against the category median unit price as:
“Below Median”
“Equal Median”
“Over Median”
Filtered on the following conditions:

They are not discontinued 
Finally order the results by category name then product name (both ascending).

Question 9
The Sales Team wants to build a list of KPIs to measure employees' performances. In order to help them they asked you to provide them a list of employees with:

their full name (first name and last name combined in a single field)
their job title
their total sales amount excluding discount (formatted to have only 2 decimals)
their total number of unique orders
their total number of orders
their average product amount excluding discount (formatted to have only 2 decimals). This corresponds to the average amount of product sold (without taking into account any discount applied to it).
their average order amount excluding discount (formatted to have only 2 decimals). This corresponds to the ratio between the total amount of product sold (without taking into account any discount applied to it) against to the total number of unique orders.
their total discount amount (formatted to have only 2 decimals)
their total sales amount including discount (formatted to have only 2 decimals)
Their total discount percentage (formatted to have only 2 decimals)
Finally order the results by total sales amount including discount (descending).

Question 10
The Sales Team wants to build another list of KPIs to measure employees' performances across each category. In order to help them they asked you to provide them a list of categories and employees with:

their categories name
their full name (first name and last name combined in a single field)
their total sales amount including discount (formatted to have only 2 decimals)
their percentage of total sales amount including discount against his/her total sales amount across all categories (formatted to have only 5 decimals and maximum value up to 1)
their percentage of total sales amount including discount against the total sales amount across all employees (formatted to have only 5 decimals and maximum value up to 1)
Finally order the results by category name (ascending) then total sales amount (descending).
