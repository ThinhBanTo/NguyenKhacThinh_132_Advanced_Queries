--1
select product_name "Tên SP",price "Đơn giá",price*1.1 "Giá VAT"
from products;
--2
select city,count(*) cus_count
from customers
group by city
order by count(*) desc;
--3
select max(price),min(price),avg(price)
from products;
--4
select status,count(*) order_count
from orders
group by status;
