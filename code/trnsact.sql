-- SQL Code to generate df_final_sku_store_quarter_v3.csv
select 
	t."SKU" , 
	t."STORE",
	case 
		when SUBSTR(t."SALEDATE", 6,2)::INT in (1,2,3) then 'Q1'
		when SUBSTR(t."SALEDATE", 6,2)::INT in (4,5,6) then 'Q2'
		when SUBSTR(t."SALEDATE", 6,2)::INT in (7,8,9) then 'Q3'
		when SUBSTR(t."SALEDATE", 6,2)::INT in (10,11,12) then 'Q4'
	end as Quarter,
	SUM(t."QUANTITY") as TotalUnitsSold,
	AVG(t."ORGPRICE") as AverageOriginalPrice,
	AVG(t."SPRICE") as AverageSellingPrice,
	SUM(case when t."STYPE" = 'P' then 1 else 0 end) as purchase_count,
	SUM(case when t."STYPE" = 'R' then 1 else 0 end) as return_count,
	1.0 * SUM(case when t."STYPE" = 'P' then 1 else 0 end) / COUNT(*) as purchase_prob
from 
trnsact t 
group by t."SKU" , t."STORE" , Quarter
having  SUM(case when t."STYPE" = 'P' then 1 else 0 end) > 1 or 
		SUM(case when t."STYPE" = 'R' then 1 else 0 end) > 1;