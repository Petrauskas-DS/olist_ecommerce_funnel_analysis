select 
	p.product_id,
	t.product_category_name_english as product_category_name,
	ROUND(SUM(oi.price + oi.freight_value)::numeric, 0) AS total_revenue,
	count(distinct oi.order_id) as num_orders, 
	count(*) as num_items
from order_items oi
join products p on oi.product_id = p.product_id 
left join product_category_name t
	on p.product_category_name = t.product_category_name
group by p.product_id, t.product_category_name_english 
order by total_revenue desc
limit 10; 