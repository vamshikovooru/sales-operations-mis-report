-- Sales & Operations MIS Automation | PostgreSQL
-- Import CSVs from the data/ folder after creating these tables.
CREATE TABLE IF NOT EXISTS master_sales (
  order_id TEXT NOT NULL,
  order_date DATE,
  month_year TEXT,
  year INTEGER,
  month_number INTEGER,
  customer_name TEXT,
  state TEXT,
  city TEXT,
  category TEXT,
  sub_category TEXT,
  quantity INTEGER,
  sales_amount NUMERIC(14,2),
  profit NUMERIC(14,2),
  profit_margin_pct NUMERIC(12,4),
  profit_per_unit NUMERIC(12,4),
  target NUMERIC(14,2),
  target_variance NUMERIC(14,2),
  target_achievement_pct NUMERIC(12,4),
  loss_making TEXT,
  region TEXT,
  sales_executive TEXT
);
CREATE TABLE IF NOT EXISTS operations_mis (
  index INTEGER,
  order_id TEXT PRIMARY KEY,
  order_date DATE,
  customer_name TEXT,
  state TEXT,
  city TEXT,
  region TEXT,
  employee_id TEXT,
  sales_executive TEXT,
  processing_days INTEGER,
  processing_date DATE,
  delivery_sla_days INTEGER,
  expected_delivery_date DATE,
  actual_delivery_date DATE,
  order_status TEXT,
  warehouse TEXT,
  courier TEXT,
  cancellation_flag TEXT,
  return_flag TEXT,
  delivery_days INTEGER,
  delay_days INTEGER,
  on_time_flag TEXT
);
CREATE TABLE IF NOT EXISTS sales_targets (
  month_start DATE,
  category TEXT,
  target NUMERIC(14,2),
  PRIMARY KEY (month_start, category)
);
