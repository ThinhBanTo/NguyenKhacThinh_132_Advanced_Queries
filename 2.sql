--1
select products.product_name, orders.total_price total_revenue
from products join orders on products.product_id = orders.product_id
order by total_price desc
limit 1;
--2
select products.category,sum(orders.total_price) total_sales
from products join orders on products.product_id = orders.product_id
group by category;
                                                                    (105,1,1,1100);