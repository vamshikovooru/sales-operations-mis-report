[README.md](https://github.com/user-attachments/files/34003760/README.md)
#Sales & Operations MIS Automation
Portfolio project | Excel + SQL + Power BI
Overview
An end-to-e# Sales & Operations MIS Automation

**Portfolio project | Excel + SQL + Power BI**

## Overview
An end-to-end MIS reporting demonstration using a historical India sales/order dataset. The project separates transaction-level sales from order-level operations and builds recurring reports for sales, profit, quantity, order volume, category performance, region performance and target attainment.

## Dataset scope
- **1,500** sales transaction lines
- **500** unique orders
- **36** month/category target records
- Source period: **01 Apr 2018–31 Mar 2019**

## Project structure
- `Sales_Operations_MIS_Automation.xlsx` — executive dashboard, daily/weekly/monthly MIS, category/region/operations summaries, data quality and dictionary.
- `data/` — clean CSVs for Excel, SQL or Power BI imports.
- `sql/01_schema.sql` — PostgreSQL table definitions.
- `sql/02_mis_reporting_queries.sql` — KPI and recurring MIS queries.
- `power_bi/DAX_Measures.dax` — starter DAX measures.
- `docs/Sales_Operations_MIS_Project_Report.docx` — detailed project report.

## How to use
1. Open the Excel workbook and start at `Executive_Dashboard`.
2. Inspect `Data_Quality` and `Data_Dictionary` for checks and definitions.
3. Import the three core CSVs into PostgreSQL using `sql/01_schema.sql`, then run the reporting queries.
4. Import `Master_Sales_1500_Transactions.csv`, `Operations_MIS_500_Orders.csv`, and `Sales_Targets_36_Month_Category.csv` into Power BI; follow the model guide and add measures from the DAX file.

## Data transparency
The data is historical and is **not live data**. The employee assignments, warehouse/courier labels and actual delivery dates were simulated for portfolio demonstration where source data was unavailable. Any on-time/delay KPIs using these fields are illustrative, not verified historical logistics outcomes. Negative-profit lines were retained.

## Resume-safe project description
Built an Excel-based Sales & Operations MIS reporting pack from 1,500 transaction rows and 500 unique orders; created daily/weekly/monthly and category/region summaries, target-attainment reporting, SQL KPI queries and a Power BI dashboard blueprint with documented data-quality checks.
nd MIS reporting demonstration using a historical India sales/order dataset. The project separates transaction-level sales from order-level operations and builds recurring reports for sales, profit, quantity, order volume, category performance, region performance and target attainment.
Dataset scope
1,500 sales transaction lines
500 unique orders
36 month/category target records
Source period: 01 Apr 2018–31 Mar 2019
Project structure
`Sales_Operations_MIS_Automation.xlsx` — executive dashboard, daily/weekly/monthly MIS, category/region/operations summaries, data quality and dictionary.
`data/` — clean CSVs for Excel, SQL or Power BI imports.
`sql/01_schema.sql` — PostgreSQL table definitions.
`sql/02_mis_reporting_queries.sql` — KPI and recurring MIS queries.
`power_bi/DAX_Measures.dax` — starter DAX measures.
`power_bi/Power_BI_Dashboard_Build_Guide.md` — model and report build instructions.
`docs/Sales_Operations_MIS_Project_Report.docx` — detailed project report.
`docs/Resume_Bullets_and_Interview_Guide.docx` — resume bullets and interview prep.
`visuals/` — sample charts.
How to use
Open the Excel workbook and start at `Executive_Dashboard`.
Inspect `Data_Quality` and `Data_Dictionary` for checks and definitions.
Import the three core CSVs into PostgreSQL using `sql/01_schema.sql`, then run the reporting queries.
Import `Master_Sales_1500_Transactions.csv`, `Operations_MIS_500_Orders.csv`, and `Sales_Targets_36_Month_Category.csv` into Power BI; follow the model guide and add measures from the DAX file.
Data transparency
The data is historical and is not live data. The employee assignments, warehouse/courier labels and actual delivery dates were simulated for portfolio demonstration where source data was unavailable. Any on-time/delay KPIs using these fields are illustrative, not verified historical logistics outcomes. Negative-profit lines were retained.
Resume-safe project description
Built an Excel-based Sales & Operations MIS reporting pack from 1,500 transaction rows and 500 unique orders; created daily/weekly/monthly and category/region summaries, target-attainment reporting, SQL KPI queries and a Power BI dashboard blueprint with documented data-quality checks.
