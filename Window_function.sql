create database window_function;
use window_function;
create table data (
new_id int,
new_cat varchar(30)
);
insert into data(new_id,new_cat) values(100,"agni"),(200,"agni"),(500,"dharti"),(700,"dharti"),(200,"vayu"),(300,"vayu"),(500,"vayu");

select new_id,new_cat,
sum(new_id)over(partition by new_cat order by new_id) as "total",
avg(new_id)over(partition by new_cat order by new_id) as "average"
from data;

select new_id,new_cat,
sum(new_id)over(partition by new_cat) as "total",
avg(new_id)over(partition by new_cat) as "average"
from data;

select new_id,new_cat,
sum(new_id)over(partition by new_cat order by new_id) as "total",
avg(new_id)over(partition by new_cat order by new_id) as "average",
count(new_id)over(partition by new_cat order by new_id) as "count",
min(new_id)over(partition by new_cat order by new_id) as "min",
max(new_id)over(partition by new_cat order by new_id) as "max"
from data;

select new_id,new_cat,
sum(new_id)over(partition by new_cat) as "total",
avg(new_id)over(partition by new_cat) as "average",
count(new_id)over(partition by new_cat) as "count",
min(new_id)over(partition by new_cat) as "min",
max(new_id)over(partition by new_cat) as "max"
from data;

select new_id,
row_number() over(order by new_id) as "row_number",
rank() over(order by new_id) as "rank",
dense_rank() over(order by new_id) as "dense_rank",
percent_rank() over(order by new_id) as "percent_rank"
from data;

select new_id,new_cat,
first_value(new_id) over(partition by new_cat order by new_id) as "first_value",
last_value(new_id) over(partition by new_cat order by new_id) as "last_value",
lead(new_id) over(partition by new_cat order by new_id) as "lead",
lag(new_id) over(partition by new_cat order by new_id) as "lag"
from data;

select new_id,new_cat,
first_value(new_id) over(order by new_id) as "first_value",
last_value(new_id) over(order by new_id) as "last_value",
lead(new_id) over(order by new_id) as "lead",
lag(new_id) over(order by new_id) as "lag"
from data;

CREATE TABLE Sales (
    SaleID INT,
    SaleDate DATE,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales (SaleID, SaleDate, CustomerID, ProductID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);

select new_id,new_cat,
sum(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "total",
avg(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "average",
count(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "count",
min(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "minimum",
max(new_id)over(order by new_id rows between unbounded preceding and unbounded following) as "maximum"
from data;


select new_id,new_cat,
sum(new_id)over(order by new_id rows between 1 preceding and 1 following) as "total",
avg(new_id)over(order by new_id rows between 1 preceding and 1 following) as "avg",
count(new_id)over(order by new_id rows between 1 preceding and 1 following) as "count",
min(new_id)over(order by new_id rows between 1 preceding and 1 following) as "min",
max(new_id)over(order by new_id rows between 1 preceding and 1 following) as "max"
from data;