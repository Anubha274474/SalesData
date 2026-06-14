# SalesData MySQL Project

This project contains MySQL scripts for creating a SalesData table with 10,000 rows of random customer purchase data, along with various analytical queries.

## Table Structure

The `SalesData` table contains the following columns:

| Column | Type | Description |
|--------|------|-------------|
| CustomerID | INT | Primary key, auto-incrementing customer identifier |
| Name | VARCHAR(100) | Customer name (first and last name) |
| Age | INT | Customer age (18-82 years) |
| City | VARCHAR(50) | City where customer is located |
| PurchaseAmount | DECIMAL(10, 2) | Purchase amount ($10-$1000) |
| PurchaseDate | DATE | Date of purchase (throughout 2024) |

## Files

### 1. `1_create_salesdata_table.sql`
- Creates the `SalesData` table
- Includes a stored procedure `InsertRandomSalesData()` to generate and insert 10,000 rows of random data
- Automatically executes the procedure upon running
- Includes verification query to check total row count

**To run:**
```sql
source 1_create_salesdata_table.sql;
```

### 2. `2_sales_per_city.sql`
Contains two analytical queries:

**Query 1: Sales per City (All Cities)**
- Shows total transactions, revenue, average purchase amount, min, and max for each city
- Ordered by total revenue in descending order

**Query 2: Top 5 Cities by Revenue**
- Displays the top 5 cities ranked by total revenue
- Shows transaction count and average transaction value

**To run:**
```sql
source 2_sales_per_city.sql;
```

### 3. `3_customers_above_average.sql`
Query to find customers with purchases above the average:
- Returns all customers whose purchase amount exceeds the dataset average
- Shows customer details and how much their purchase was above average
- Ordered from highest to lowest purchase amount
- Useful for identifying high-value customers

**To run:**
```sql
source 3_customers_above_average.sql;
```

## Data Characteristics

- **Total Records:** 10,000 customer purchases
- **Time Period:** January 1, 2024 - December 31, 2024
- **Purchase Amount Range:** $10.00 - $1,000.00
- **Customer Ages:** 18 - 82 years
- **Cities:** 10 major US cities (New York, Los Angeles, Chicago, Houston, Phoenix, Philadelphia, San Antonio, San Diego, Dallas, San Jose)
- **Names:** Random combinations of 20 first names and 10 last names

## Usage Instructions

1. **Create the table and insert data:**
   ```sql
   source 1_create_salesdata_table.sql;
   ```

2. **Analyze sales by city:**
   ```sql
   source 2_sales_per_city.sql;
   ```

3. **Find high-value customers:**
   ```sql
   source 3_customers_above_average.sql;
   ```

## Notes

- All scripts use standard MySQL syntax and are compatible with MySQL 5.7+
- The stored procedure uses `WHILE` loop for data insertion
- Adjust the INTERVAL value in the `DATE_ADD` function if you need data for a different time period
- Modify the city list or name lists to customize the random data generation
