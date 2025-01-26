-- Question 3
select  
case 
		when trip_distance <= 1 then '0-1 mile'
		when (trip_distance > 1 and trip_distance <= 3) then '1-3 mile'
		when (trip_distance > 3 and trip_distance <= 7) then '3-7 mile'
		when (trip_distance > 7 and trip_distance <= 10) then '7-10 mile'
		when trip_distance > 10 then '10+ mile'
	end as distance_group,
count(*)
from yellow_taxi_trips_2019
where cast(lpep_dropoff_datetime as date) between '2019-10-01' and '2019-10-31'
group by 1


-- Question 4
select  
cast(lpep_dropoff_datetime as date) as lpep_dropoff_datetime
, max(trip_distance) as longest_trip_distance
from yellow_taxi_trips_2019
group by 1
order by 2 desc


-- Question 5
select  
tzl."Zone" as pickup_location
, count(*) as number_of_trip
from yellow_taxi_trips_2019 ytl
left join taxi_zone_lookup tzl
	on ytl."PULocationID" = tzl."LocationID"
where cast(lpep_pickup_datetime as date) = '2019-10-18'
group by 1
having sum(total_amount) > 13000


-- Question 6
select  
tzlb."Zone" as dropoff_location
, sum(tip_amount) as total_tip_amount
from yellow_taxi_trips_2019 ytl
left join taxi_zone_lookup tzla
	on ytl."PULocationID" = tzla."LocationID"
left join taxi_zone_lookup tzlb
	on ytl."DOLocationID" = tzlb."LocationID"
where EXTRACT(MONTH FROM CAST(lpep_pickup_datetime AS DATE)) = 10
and EXTRACT(YEAR FROM CAST(lpep_pickup_datetime AS DATE)) = 2019
and tzla."Zone" = 'East Harlem North'
group by 1
order by 2 desc