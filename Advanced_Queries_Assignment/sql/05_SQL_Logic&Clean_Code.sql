--16
update orders o
set total_amount=
    (
        select sum(quantity*unit_price)
        from order_items oi
        where oi.order_id=o.order_id
        );
--17

--18
select city
from customers join orders on customers.customer_id = orders.customer_id
where orders.order_date>='2026-01-01'
group by city
order by sum(total_amount) desc limit 1; --tim max
