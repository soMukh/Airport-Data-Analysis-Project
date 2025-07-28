# 🛫 Airport Data Analysis Project

This project performs in-depth SQL-based analysis on airport traffic data using city-wise passenger information, airport metadata, and population data. It includes custom SQL views, stored procedures, and data ingestion scripts — for drawing insights into air traffic trends across cities and time.

---

## 📊 Project Overview

The aim is to explore flight and airport data to answer critical business and operational questions like:
- What are the busiest airports and routes?
- How does city population relate to air traffic?
- What are the peak travel periods?
- Which city pairs have the highest passenger movement?

---

## 🗃️ Dataset Description

### Primary Data:
- `Airport_Project_Data.csv`: Contains origin/destination cities, flight IDs, and metrics like passengers, freight, and mail.

### Supplementary:
- `all_city_pop.csv`: Population values for cities derived from the above dataset.

---

## 🛠️ SQL Components

### ✅ Table & Data Scripts:
- `Table Creation.sql`: Creates `airport`, `flight`, `flightmetrics`, and other relevant tables.
- `Data_Insertion.sql`: Populates those tables with data from the main dataset.
- `City_Pop_Insert.sql`: Inserts city-level population into the database.

> ⚠️ **Important Pre-step**  
> Before running `Data_Insertion.sql`, create a table named `meta_data` from a cleaned/selected portion of `Airport_Project_Data.csv` with columns such as `AIRLINE_ID`, `ORIGIN_AIRPORT_ID`, `DEST_AIRPORT_ID`, `YEAR`, `MONTH`, `QUARTER`, `DISTANCE`, `PASSENGERS`, `FREIGHT`, `MAIL`.

> Similarly, before running `City_Pop_Insert.sql`, create the table `all_city_pop` by extracting distinct city names and assigning population values.

### 🔍 Analytical SQL:
- `SQL_Analysis.sql`: Includes top routes, city-level averages, and time-series analysis.
- `Busiest Airport.sql`: Identifies airports with the most traffic.
- `Pop Vs Traffic.sql`: Compares population against total passengers to find correlations.

### 🧩 Views & Procedures:
- `Views and Stored Procedures.sql`: Contains stored procedures like `sp_top_routes_by_passenger(threshold)` and reusable views for recurring queries.

---

## 🧪 How to Use

### Step 1: Database Setup
1. Run `Table Creation.sql` in your MySQL environment.
2. **Create `meta_data` table** from `Airport_Project_Data.csv`.
3. Run `Data_Insertion.sql` to insert core data.
4. **Create `all_city_pop` table** from cleaned city list and add mock or real population values.
5. Run `City_Pop_Insert.sql` to insert city-level population.

### Step 2: Run Analyses
Execute any of the `.sql` files like:
### Step 2: Run Analyses

Execute any of the `.sql` files like:

```sql
CALL sp_top_routes_by_passenger(1000000);
📁 Repository Structure
pgsql
Copy
Edit
Airport Data Analysis Project/
│
├── Airport_Project_Data.csv         # Main dataset
├── all_city_pop.csv                 # Population-mapped cities
├── Table Creation.sql               # SQL table definitions
├── Data_Insertion.sql               # Insert queries
├── City_Pop_Insert.sql              # Populate population data
├── SQL_Analysis.sql                 # Core analysis queries
├── Busiest Airport.sql              # Busiest airport insights
├── Pop Vs Traffic.sql               # Population vs traffic correlation
└── Views and Stored Procedures.sql  # Reusable SQL components
🔧 Tech Stack
MySQL

SQL: Joins, aggregations, views, stored procedures

Excel/CSV: Data import/export

yaml
Copy
Edit
