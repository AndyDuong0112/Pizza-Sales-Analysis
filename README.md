# Pizza Sales Analysis Project - SQL & POWER BI

## Overview Project
This project will provide insights into the sales performance of a pizza store from 01/01/2015 to 12/31/2015.<br>This data will answer a few questions which will help them make important decisions to increase sales and improve their business.
<hr>

## Data Source
You can download the data from https://www.kaggle.com/datasets/mysarahmadbhat/pizza-place-sales <br>
or <b>Datasets</b> folder which contains 4 CSV Files.
<hr>

## Tools
1) <b>SQL</b> - Data analysis <br>
   ( Import CSV File, Create Database, Basic Queries, Aggregate Functions, JOINS, CTE's)

2) <b>PowerBI</b> - Creating reports <br>
   ( Import CSV File and Transform Data, measure, DAX, Visualize Data)
<hr>

## Business Questions To Answer
### KPI's Requirements
<ol>
  <li>Total Revenue</li>
  <li>Average Order Value</li>
  <li>Total Pizzas Sold</li>
  <li>Total Orders</li>
  <li>Average Pizzas per Order</li>
</ol>

### Chart's Requirements
<ol>
  <li>Daily Trend for Total Orders</li>
  <li>Monthly Trend for Orders</li>
  <li>Percentage of Sales by Pizza Category</li>
  <li>Percentage of Sales by Pizza Size</li>
  <li>Total Pizzas Sold by Pizza Category</li>
  <li>Top 5 Pizzas by Revenue</li>
  <li>Bottom 5 Pizzas by Revenue</li>
  <li>Top 5 Pizzas by Quantity</li>
  <li>Bottom 5 Pizzas by Quantity</li>
  <li>Top 5 Pizzas by Total Order</li>
  <li>Bottom 5 Pizzas by Total Order</li>
</ol>
<hr>

## A. Data Analysis (SQL)
#### 1. Create database
```sql
CREATE DATABASE Pizza_Sale_Data;
```

#### 2. Overview data
```sql
SELECT * 
FROM [dbo].[order_details];

SELECT * 
FROM [dbo].[orders];

SELECT * 
FROM [dbo].[pizza_types];

SELECT * 
FROM [dbo].[pizzas];
```
=> Data was cleaned so we will skip Cleaning Data Step
#### 3. Answer Questions (KPI's Requirements and Chart's Requirements)
Click here to see all queries used [SQLQuery_Exploration.sql](https://github.com/AndyDuong0112/Pizza-Sales-Analysis/blob/main/SQLQuery_Exploration.sql)


## B. Data Visualization
![Final Dashboard-1](https://github.com/AndyDuong0112/Pizza-Sales-Analysis/assets/125394873/cee55478-b280-4021-af45-6d048ab4145e)
### KPI's requirements
<ol>
   <li>Total Revenue: $817.86K </li>
   <li>Average Order Value: $38.31K </li>
   <li>Total Pizzas Sold: 49.57K </li>
   <li>Total Orders: 21.35K  </li>
   <li>Average Pizzas per Order: 2.32 </li>
</ol>

![Final Dashboard-2](https://github.com/AndyDuong0112/Pizza-Sales-Analysis/assets/125394873/e186c125-e39a-4f9a-9e0c-fc30c682fd5f)
### CHART's requirements
<ol>
   <li>The busiest days are Thursday (3239 orders), Friday (3538 orders) and Saturday (3158 orders). Most sales are recorded on Friday.</li>
   <li>The busiest months are July (1935 orders), May (1853 orders) and January (1845 orders).</li>
   <li>Classic pizza has the highest percentage sales (26.91%), followed by Supreme (25.46%), Chicken (23.96%) and Veggie (23.68%) pizzas.</li>
   <li>Large size pizzas record the highest sales (45.89%) followed by medium (30.49%), then small (21.77%). XL and XXL only account for 1.72% and 0.12%. </li>
   <li>Classic Pizza accounts for the highest sales (14,888 pizzas) and Chicken for the lowest sales (11,050 pizzas).</li>
   <li>Top 5 Best Revenue are The Thai Chicken Pizza ($43434.25), The Barbecue Chicken Pizza ($42768), The California Chicken Pizza ($41409.5), The Classic Deluxe Pizza ($38180.5) and The Spicy Italian Pizza ($34831.25).</li>
   <li>Bottom 5 Worst Revenue are The Brie Carre Pizza ($11588.49), The Green Garden Pizza ($13955.75), The Spinach Supreme Pizza ($15277.75), The Mediterranean Pizza ($15360.5) and The Spinach Pesto Pizza ($15596).</li>
   <li>Top 5 Best Quantity are the Classic Deluxe (2453 pizzas), Barbecue Chicken (2432 pizzas), Hawaiian (2422), Peperoni (2418 pizzas) and Thai Chicken (2371 pizzas).</li>
   <li>Bottom 5 Worst Quantity are Brie Carre (490 pizzas), Mediterranean (934 pizzas), Calabrese (937 pizzas), Spinach Supreme (950 pizzas) and Soppressata (961 pizzas).</li>
   <li>Top 5 Best Orders are Classic Deluxe Pizza (2329 orders), Hawaiian Pizza (2280 orders), Pepperoni Pizza (2278 orders), Barbecue Chicken Pizza (2273 orders), Thai Chicken Pizza (2225 orders). </li>
   <li>Bottom 5 Worst Orders are Brie Carre (480 orders), Mediterranean (912 orders), Spinach Supreme (918 orders), Calabrese (918 orders), Chicken Pesto (938 orders).  </li>
</ol>

<hr>

## CONCLUSION
After researching and analysing data, I recommend we should:
<ul>
   <li>Remove XL and XXL size to simplify menu.</li>
   <li>Make promotions during low order days to attract customers.</li>
   <li>Cut down on importing ingredients for low-output pizzas to reduce costs.</li>
</ul>
