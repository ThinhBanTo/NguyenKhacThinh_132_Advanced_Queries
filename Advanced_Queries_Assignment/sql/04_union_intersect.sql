--Tao bang suppliers va insert du lieu
create table suppliers(
    supplier_id serial primary key ,
    supplier_name varchar(100),
    email varchar(100)
);

INSERT INTO suppliers (supplier_name, email) VALUES
                                                 ('Apple Inc', 'contact@apple.com'),
                                                 ('NXB Trẻ', 'info@nxbtre.com.vn');

--13
select customers.email from customers
union all
select suppliers.email from suppliers;
--14
select customer_id
from orders
        join order_items on orders.order_id = order_items.order_id
        join products on order_items.product_id = products.product_id
        join categories on products.category_id = categories.category_id
where category_name='Electronics'
intersect
select customer_id
from orders
         join order_items on orders.order_id = order_items.order_id
         join products on order_items.product_id = products.product_id
         join categories on products.category_id = categories.category_id
where category_name='Books';

--15
/* except: (A\B)
   select ... from taphopA
   except
   select... from taphopB
 */
select product_name
from products
where product_id in (
    select product_id from products
    except
    select product_id from order_items
    );