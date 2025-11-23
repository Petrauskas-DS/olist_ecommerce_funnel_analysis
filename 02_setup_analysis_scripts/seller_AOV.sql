select
	s.seller_id,
	sum(oi.price + oi.freight_value) / count(distinct oi.order_id) as avg_order_value,
	count(distinct oi.order_id) as num_orders, 
	round(sum(oi.price + oi.freight_value), 2) as total_revenue
from order_items oi
join sellers s on oi.seller_id = s.seller_id 
group by s.seller_id 
order by avg_order_value desc 
limit 10;