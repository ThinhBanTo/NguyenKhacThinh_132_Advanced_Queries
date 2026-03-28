
create table customers(
    customer_id serial primary key ,
    customer_name varchar(100),
    city varchar(50)
);

create table orders(
    order_id serial primary key ,
    customer_id int references customers(customer_id),
    order_date date,
    total_amount numeric(10,2)
);

create table order_items(
    item_id serial primary key ,
    order_id int references orders(order_id),
    product_name varchar(100),
    quantity int,
    price numeric(10,2)
);

--insert du lieu:
INSERT INTO customers (customer_name, city) VALUES
    ('Nguyễn Khắc Thịnh', 'Hà Nội'),
    ('John Doe', 'Hà Nội'),
    ('Jane Smith', 'Đà Nẵng'),
    ('Khách Hàng Ẩn Danh', NULL),
    ('Công Ty TNHH Một Thành Viên A', 'Hồ Chí Minh'),
    ('Người Không Mua Hàng', 'Cần Thơ');

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
                                                               (1, '2026-03-20', 1500000.00),
                                                               (2, '2026-03-21', 500000.00),
                                                               (1, '2026-03-22', 2000000.00),
                                                               (3, '2026-03-22', 0.00),
                                                               (5, '2026-03-23', 999999.99),
                                                               (NULL, '2026-03-24', 100000.00);
INSERT INTO order_items (order_id, product_name, quantity, price) VALUES
                                                                      (1, 'Laptop Gaming', 1, 1500000.00),
                                                                      (2, 'Chuột Không Dây', 2, 250000.00),
                                                                      (3, 'Màn Hình 4K', 1, 2000000.00),
                                                                      (4, 'Sản phẩm tặng kèm', 1, 0.00),
                                                                      (5, 'Bàn phím cơ', 1, 999999.99),
                                                                      (1, 'Tấm lót chuột', 1, 0.00),
                                                                      (1, 'Cáp HDMI', 2, 0.00),
                                                                      (6, 'Pin dự phòng', 1, 100000.00);

--1
select c.customer_name "Tên khách",o.order_date "Ngày đặt hàng",o.total_amount "Tổng tiền"
from customers c join orders o on c.customer_id = o.customer_id;

--2
select sum(orders.total_amount), avg(orders.total_amount),max(orders.total_amount),min(orders.total_amount),count(orders.order_id)
from orders;
--3
select c.city,sum(o.total_amount)
from orders o join customers c on o.customer_id = c.customer_id
group by c.city
having sum(o.total_amount)>10000;
--4
select product_name,customer_name,orders.order_date,quantity,price
from customers join orders on customers.customer_id = orders.customer_id
join order_items on orders.order_id = order_items.order_id;
--5
select customer_name
from customers join orders on customers.customer_id = orders.customer_id
group by customer_name
having sum(total_amount) =
    (select sum(orders.total_amount) total_buy
    from orders
    group by customer_id
    order by total_buy desc limit 1);
