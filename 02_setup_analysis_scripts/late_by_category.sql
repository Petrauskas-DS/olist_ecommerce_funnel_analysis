select 
	t.product_category_name_english as product_category_name,
	round(100 * sum(case when o.order_delivered_customer_date > o.order_estimated_delivery_date then 1 
	else 0 end)
		/ count(*), 2) as percent_late
from orders o
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id 
left join product_category_name t
	on p.product_category_name = t.product_category_name 
where o.order_delivered_customer_date is not null 
	and p.product_category_name is not null
group by t.product_category_name_english
order by percent_late desc
	