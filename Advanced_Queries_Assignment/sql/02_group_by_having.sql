--5
select order_id,customer_name,email,total_amount
from orders join customers on orders.customer_id = customers.customer_id
order by order_date desc
limit 10;
--6
select category_name,count(product_id)
from categories left join products on categories.category_id = products.category_id
group by category_name;
--7
select customer_name
from customers join orders on customers.customer_id = orders.customer_id
group by customers.customer_id,customer_name
having count(order_id)>=3 and sum(total_amount)>5000000;
--8
--khong dung sum(total_amount) vi 1 don hang co nhieu chi tiet don hang
--total_amount la tong ca don hang (no se lap lai nhieu lan neu coi nhu chi tiet don--> sai)
--bai nay: lay san luong*gia tri san pham
select category_name,sum(quantity*unit_price)
from categories
join products on categories.category_id = products.category_id
join order_items on products.product_id = order_items.product_id
join orders on order_items.order_id = orders.order_id
group by categories.category_id,category_name;