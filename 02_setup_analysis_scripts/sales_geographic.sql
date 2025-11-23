select
	c.customer_state, 
	c.customer_city,
	sum(oi.price + oi.freight_value) as total_sales,
	count(distinct o.order_id) as num_orders
from orders o
join order_items oi on o.order_id = oi.order_id 
join customers c on o.customer_id = c.customer_id 
group by c.customer_state, c.customer_city 
order by total_sales desc
limit 20;