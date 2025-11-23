update products 
set product_category_name = null
where product_category_name = '';

select distinct p.product_category_name
from products p
left join product_category_name c
	on p.product_category_name = c.product_category_name 
where c.product_category_name is null 
	and p.product_category_name is not null;

insert into product_category_name (product_category_name)
values ('pc_gamer'),
	('portateis_cozinha_e_preparadores_de_alimentos')
	
UPDATE product_category_name
SET product_category_name_english = 'PC Gamer'
WHERE product_category_name = 'pc_gamer';

UPDATE product_category_name
SET product_category_name_english = 'Portable Kitchen & Food Preparers'
WHERE product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos';


create table location_clean as 
select 
	geolocation_zip_code_prefix as zip_code_prefix, 
	avg(geolocation_lat) as lat, 
	avg(geolocation_lng) as lng,
	mode() within group (order by geolocation_city) as city,
	mode() within group (order by geolocation_state) as state
from location
group by geolocation_zip_code_prefix;