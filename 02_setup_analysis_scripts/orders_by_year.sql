select
    extract(year from o.order_purchase_timestamp) as year,
    round(sum(oi.price + oi.freight_value)::numeric, 0) as total_revenue,
    count(distinct o.order_id) as num_orders
from orders o
join order_items oi on o.order_id = oi.order_id
group by year
order by year;
