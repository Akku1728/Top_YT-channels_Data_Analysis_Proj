/*

Steps to perfrom analysis
1. Define the variables
2. Create a CTE that rounds the avg views per video
3. Select column appropriate for our analysis
4. Filter the result by YT channels with the highest subscriber basis
5. Order by net_profit (high to low)

*/



-- 1.
declare @conversionRate float = 0.02;		-- conversion rate at 2%
declare @productCost float = 5.0;			-- product cost is $5
declare @campaignCost float = 50000.0;		--campaign cost at $50000



-- 2.
with ChannelData as (
	select 
		channel_name,
		total_views,
		total_videos,

		Round ((cast (total_views as float) / total_videos), -4) as rounded_avg_views_per_video,
		-- when we cast we needed to declare the value as float for calculation else it get stored as a string
		-- and we rouned it to the nearest ten thousand
		(total_views / total_videos) as original_avg_views_per_video
		-- these datas will be not rounded
	from 
		youtube_db.dbo.view_uk_youtubers_2024
)

-- select * from ChannelData
-- this will views all filtered data 



-- 3.

select 
	channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) as potential_units_sold_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) as Potential_revenue_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost as net_profit
from 
	ChannelData
	-- 4.
	-- filter by youtube channel names
where 
	channel_name in ('NoCopyrightSounds' , 'DanTDM' , 'Dan Rhodes')
	-- 5.
order by
	net_profit desc
