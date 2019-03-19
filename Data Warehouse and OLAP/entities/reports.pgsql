
SELECT 
	EXTRACT(year from supplies.ship_date) as ship_year,
--	EXTRACT(month from supplies.ship_date) as ship_month,
--	EXTRACT(day from supplies.ship_date) as ship_day,
	providers.city as provider_city,
	providers.name as provider_name,
	sum(supplies.quantity * supplies.price) as total_price
FROM 
	(SELECT 
		*
	 FROM supplies
	 LIMIT 5) as supplies, 
	providers
WHERE 
	supplies.provider_id = providers.id
GROUP BY 
	CUBE (ship_year,
		  provider_city, 
		  provider_name)
HAVING
	EXTRACT(year from supplies.ship_date) = 2015;
