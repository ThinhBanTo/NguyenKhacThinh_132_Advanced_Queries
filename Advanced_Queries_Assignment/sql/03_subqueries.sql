--9
select product_id,product_name,category_id,price,stock_quantity
from products
where price>
      (select avg(price)
          from products
          );

/*10: not exist:
  ....
  where not exist(
    select 1   --select kh quan trong vi kq chi tra ve true(co lien ket) false (kh co lien ket)
    from table t2
    where t1.id=t2.id)
 */
select customer_name
from customers
where not exists(
    select 1
    from orders
    where customers.customer_id=orders.customer_id
);
--11
--duyet tung sp roi check no voi avg tung danh muc (so sanh p1,p2)
select product_name,price,stock_quantity
from products p1
where price>(
    select avg(price)
    from products p2
    where p1.category_id=p2.category_id --cung danh muc
    );
--12
select customer_name
from customers join orders on customers.customer_id = orders.customer_id
where total_amount=
      (
        select max(total_amount)
        from orders
    );