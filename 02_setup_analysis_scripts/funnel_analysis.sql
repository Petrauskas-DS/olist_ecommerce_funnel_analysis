with funnel as (
    select 
        (select count(distinct mql_id) from qualified_leads) as leads,
        (select count(distinct mql_id) from closed_deals_clean) as deals,
        (select count(distinct order_id) from orders) as orders,
        (select count(distinct order_id) from orders where order_status = 'delivered') as delivered,
        (select count(*) from order_items) as items,
        (select count(distinct order_id) from reviews) as reviewed_orders
)
select 
    leads,
    deals,
    orders,
    delivered,
    items,
    reviewed_orders as reviews,
    round(100.0 * deals / leads, 2) as pct_lead_to_deal,
    round(100.0 * delivered / orders, 2) as pct_order_to_delivery,
    round(100.0 * reviewed_orders / items, 2) as pct_items_to_review
from funnel;
