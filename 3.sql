--1
select customer_name,sum(total_price) total_revenue,count(orders.order_id) order_count
from customers join orders on customers.customer_id = orders.customer_id
group by customers.customer_id
having sum(total_price)>2000
--2
select customers.customer_name
from customers join orders on customers.customer_id = orders.customer_id
group by customers.customer_id
having sum(orders.total_price)>
    (select avg(orders.total_price)
    from orders
    );   --subquery

--3
select customers.city
from customers join orders on customers.customer_id = orders.customer_id
group by city
order by sum(total_price) desc
--4
select customer_name,city,sum(quantity) sum_quantity,sum(total_price) total_buy
from customers join orders on customers.customer_id = orders.customer_id
join order_items on orders.order_id = order_items.order_id
group by customer_name, city


