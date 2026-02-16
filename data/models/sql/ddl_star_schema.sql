CREATE TABLE "fact_sales" (
  "sales_key" integer PRIMARY KEY,
  "order_id" varchar(30),
  "order_date_key" integer,
  "ship_date_key" integer,
  "location_key" integer,
  "product_key" integer,
  "customer_key" integer,
  "ship_mode_key" integer,
  "sales" decimal(10,2)
);

CREATE TABLE "dim_location" (
  "location_key" integer PRIMARY KEY,
  "country" varchar(30),
  "city" varchar(30),
  "state" varchar(30),
  "postal_code" varchar(10),
  "region" varchar(20)
);

CREATE TABLE "dim_product" (
  "product_key" integer PRIMARY KEY,
  "product_id" varchar(20),
  "category" varchar(15),
  "sub_category" varchar(15),
  "product_name" varchar(100)
);

CREATE TABLE "dim_customer" (
  "customer_key" integer PRIMARY KEY,
  "customer_id" varchar(15),
  "customer_name" varchar(50),
  "segment" varchar(15)
);

CREATE TABLE "dim_ship_mode" (
  "ship_mode_key" integer PRIMARY KEY,
  "ship_mode" varchar(20)
);

CREATE TABLE "dim_date" (
  "date_key" integer PRIMARY KEY,
  "full_date" date,
  "year" integer,
  "month" integer,
  "month_name" varchar(15),
  "quarter" varchar(10),
  "week" integer,
  "day_of_week" varchar(20)
);

ALTER TABLE "fact_sales" ADD FOREIGN KEY ("location_key") REFERENCES "dim_location" ("location_key");
ALTER TABLE "fact_sales" ADD FOREIGN KEY ("product_key") REFERENCES "dim_product" ("product_key");
ALTER TABLE "fact_sales" ADD FOREIGN KEY ("customer_key") REFERENCES "dim_customer" ("customer_key");
ALTER TABLE "fact_sales" ADD FOREIGN KEY ("ship_mode_key") REFERENCES "dim_ship_mode" ("ship_mode_key");
ALTER TABLE "fact_sales" ADD FOREIGN KEY ("order_date_key") REFERENCES "dim_date" ("date_key");
ALTER TABLE "fact_sales" ADD FOREIGN KEY ("ship_date_key") REFERENCES "dim_date" ("date_key");
