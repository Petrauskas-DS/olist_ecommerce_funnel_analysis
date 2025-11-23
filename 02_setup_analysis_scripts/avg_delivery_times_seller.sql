select
	oi.seller_id,
	avg(o.order_delivered_customer_date - o.order_purchase_timestamp) as avg_delivery_days
from orders o 
join order_items oi on o.order_id = oi.order_id 
group by oi.seller_id 
order by avg_delivery_days;