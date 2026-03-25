select p.category,sum(orders.total_price) as total_sales,sum(orders.quantity) as total_quantity
from products p join orders on p.product_id=orders.product_id
group by p.category
having sum(orders.total_price)>2000
order by total_sales desc;
