use project;

select * from customers;
select * from Exchange_Rates;
select * from products;
select * from sales;
select * from stores;

-- Data Cleaning

--Customers Table
select * from customers;

alter table customers
add age_group varchar(20);

select birthday, GETDATE(), 
case when DATEDIFF(YEAR, birthday, GETDATE()) > 18 and DATEDIFF(YEAR, birthday, GETDATE()) <=30 then '18 - 30'
else '30+' end from customers;

update customers 
set age_group = case
when DATEDIFF(YEAR, birthday, GETDATE()) > 18 and DATEDIFF(YEAR, birthday, GETDATE()) <=30 then '18 - 30'
when DATEDIFF(YEAR, birthday, GETDATE()) > 30 and DATEDIFF(YEAR, birthday, GETDATE()) <=40 then '30 - 40'
when DATEDIFF(YEAR, birthday, GETDATE()) > 40 and DATEDIFF(YEAR, birthday, GETDATE()) <=50 then '40 - 50'
when DATEDIFF(YEAR, birthday, GETDATE()) > 50 and DATEDIFF(YEAR, birthday, GETDATE()) <=65 then '50 - 65'
when DATEDIFF(YEAR, birthday, GETDATE()) > 65 then '65+'
else null
end;


-- Products
select * from products;
select * from products where Unit_Cost_USD is null;

-- Sales
select * from sales;
select * from stores;

select distinct country from customers;

select * from products;

-- stores

select * from Stores;

alter table stores
add Mode_of_Sales varchar(30);

update stores
set mode_of_sales = case
when state = 'Online' then 'Online Sales'
else 'Offline Sales'
end;