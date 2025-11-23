with delivery_delays as (
  select
    o.order_id,
    t.product_category_name_english as category,
    (o.order_delivered_customer_date::date - o.order_estimated_delivery_date::date) as delay_days  
  from orders o
  join order_items oi on oi.order_id = o.order_id
  join products p     on p.product_id = oi.product_id
  left join product_category_name t
         on t.product_category_name = p.product_category_name
  where o.order_delivered_customer_date is not null
    and o.order_estimated_delivery_date is not null
)
select
  category as product_category_name_english,
  round(avg(delay_days) filter (where delay_days > 0), 2) as avg_days_late,
  count(*) filter (where delay_days > 0)                 as late_orders
from delivery_delays
group by category
order by avg_days_late desc nulls last
limit 10;
