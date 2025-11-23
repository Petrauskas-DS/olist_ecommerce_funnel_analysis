select 
	p.product_category_name,
	p.product_id, 
	round(sum(oi.price + oi.freight_value)::numeric, 0) as total_revenue,
	rank() over(
		partition by p.product_category_name
		order by sum(oi.price + oi.freight_value) desc
	) as revenue_rank
from order_items oi
join products p on oi.product_id = p.product_id
group by p.product_category_name, p.product_id
order by p.product_category_name, revenue_rank;
