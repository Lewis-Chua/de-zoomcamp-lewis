-- Question 3 
SELECT count(*)
FROM public.yellow_tripdata
WHERE filename LIKE 'yellow_tripdata_2020%';

-- Question 4
SELECT count(*) 
FROM public.green_tripdata
WHERE filename LIKE 'green_tripdata_2020%';

-- Question 5 
SELECT count(*)
FROM public.yellow_tripdata
WHERE filename = 'yellow_tripdata_2021-03.csv';