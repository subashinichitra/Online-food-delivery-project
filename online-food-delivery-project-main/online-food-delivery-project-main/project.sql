create database food_app_project;

use food_app_project;

--1.create table customers where columns are- customer_id,name,city,signup date,gender
create table customers(
    customer_id int primary key,
    name varchar(50) ,
    city varchar(50) ,
    signup_date date not null,
    gender varchar(10) 
);
-- 2.Create the restaurants table
create table restaurants(
    restaurant_id int primary key,
    restaurant_name varchar(100),
    city varchar(50),
    cuisine varchar(50),
    rating float check (rating >= 0 and rating <= 5)
);

-- 3.Create the orders table
create table orders(
    order_id int primary key,
    customer_id int,
    restaurant_id int,
    order_date date not null,
    order_amount decimal(10, 2),
    discount decimal(10, 2),
    payment_method varchar(50),
    delivery_time int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (restaurant_id) references restaurants(restaurant_id)
);
-- 4.Create the order_item table
create table order_item(
    order_item_id int primary key,
    order_id int,
    item_name varchar(100),
    quantity int check (quantity > 0),
    price decimal(10, 2) check (price >= 0),
    foreign key (order_id) references orders(order_id)
);

-- 5.Create the delivery_agents table
create table delivery_agents(
    agent_id int primary key,
    agent_name varchar(50),
    city varchar(50),
    joining_date date not null,
    rating float check (rating >= 0 and rating <= 5)
);

