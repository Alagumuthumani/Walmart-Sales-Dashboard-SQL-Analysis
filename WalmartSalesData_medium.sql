create database  if not exists  SalesDataWalmart;

Create table if not exists WMsales (
 invoice_id  varchar(30) Not null primary Key,
 branch  varchar (5) not null,
    city varchar (30) not null,
    customer_type varchar (30) not null,
    gender  varchar(10) not null,
    product_line varchar (100) not null,
    unit_price  decimal(10,2) not null,
    quantity int not null,
    VAT  float(6,4) not null,
    total decimal (12,4) not null,
    date datetime not null,
    time TIME not null,
    payment_method varchar (15)  not null, 
    cogs  decimal (10, 2) not null,
    gross_margin_pct float (11,9),
    gross_income decimal(12, 4) not null,
    rating float (2, 1)
);


select * from salesdatawalmart.wmsales;


-- Data Cleaning Process

select sum(case when invoice_id is null then 1 else 0 end) as id_null,
	sum(case when branch is null then 1 else 0 end) as branch_null,
    sum(case when city is null then 1 else 0 end) as city_null,
    sum(case when customer_type is null then 1 else 0 end) as customer_type_null,
    sum(case when gender is null then 1 else 0 end) as gender_null,
    sum(case when product_line is null then 1 else 0 end) as product_line_null,
    sum(case when unit_price is null then 1 else 0 end) as unit_price_null,
    sum(case when quantity is null then 1 else 0 end) as quantity_null,
    sum(case when VAT is null then 1 else 0 end) as VAT_null,
    sum(case when total is null then 1 else 0 end) as total_null,
    sum(case when date is null then 1 else 0 end) as date_null,
    sum(case when time is null then 1 else 0 end) as time_null,
    sum(case when payment_method is null then 1 else 0 end) as payment_method_null,
    sum(case when cogs is null then 1 else 0 end) as cogs_null,
    sum(case when gross_margin_pct is null then 1 else 0 end) as gross_margin_pct_null,
    sum(case when gross_income is null then 1 else 0 end) as gross_income_null,
    sum(case when rating is null then 1 else 0 end) as rating_null
from salesdatawalmart.wmsales;
    

-- 2. Checking for Duplicates

select invoice_id from salesdatawalmart.wmsales
group by invoice_id 
having count(invoice_id) > 1;


-- 3. Validating Data Types

select distinct(branch) as uniq_branch from salesdatawalmart.wmsales;

select distinct(city) as uniq_city from salesdatawalmart.wmsales;

select distinct(customer_type) as uniq_cust_type from salesdatawalmart.wmsales;

select distinct(gender) as uniq_gender from salesdatawalmart.wmsales;

select distinct(product_line) as uniq_product_line from salesdatawalmart.wmsales;

select distinct(quantity) as uniq_qty from salesdatawalmart.wmsales;

select distinct(payment_method) as uniq_payment	 from salesdatawalmart.wmsales;

-- 4.Extracting Year and Month from Date

alter table salesdatawalmart.wmsales
add column Year int,
add column month int;

SET SQL_SAFE_UPDATES = 0;

update salesdatawalmart.wmsales
set 
	year = year(date),
    month = month(date);
    
select * from salesdatawalmart.wmsales;

-- Data Analysis Process
-- 1. Top-Selling Products Analysis by Branch and Overall
-- 1. Store Managers’ Insights

select *