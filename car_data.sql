CREATE TABLE IF NOT EXISTS public.car_data
(
    "car_ID" integer,
    symboling integer,
	CarName varchar,
	fueltype varchar,
	aspiration varchar,
	doornumber varchar ,
	carbody varchar,
	drivewheel varchar,
	enginelocation varchar,
	wheelbase float,
	carlength float,
	carwidth float,
	carheight float,
	curbweight integer,
	enginetype varchar,
	cylindernumber varchar,
	enginesize integer,
	fuelsystem varchar,
	boreratio float,
	stroke float,
	compressionratio float,
	horsepower integer,
	peakrpm integer,
	citympg integer,
	highwaympg integer,
	price integer

);


SELECT *
FROM public.car_data

--Inspect the data by checking its unique values

SELECT DISTINCT (fueltype)
FROM public.car_data

SELECT 
  MIN(carlength) AS min_length,
  MAX(carlength) AS max_length
FROM public.car_data


--Fill in missing values / Null

SELECT * 
FROM public.car_data
WHERE doornumber IS null;

--I notice that I named the car_ID column "car_ID". Use the RENAME clause to name it without ""

ALTER TABLE public.car_data
RENAME "car_ID" TO car_ID;

--Continue

SELECT
  car_ID
FROM  
  public.car_data
WHERE 
  carname LIKE 'bmw%' 
  AND fueltype = 'gas'
  AND aspiration = 'std'
  AND carbody = 'sedan'
ORDER BY 1;


UPDATE 
  public.car_data
SET
  doornumber = 'four'
WHERE
  car_ID = '12'
  
 
-- Look for potential errors in the data

SELECT
  DISTINCT(cylindernumber)
FROM 
  public.car_data
  
UPDATE
  public.car_data
SET
  cylindernumber = 'four'
WHERE
  cylindernumber = 'for'
  
SELECT
  DISTINCT(cylindernumber)
FROM 
  public.car_data
  

--Inspect numbers in a range

SELECT 
  MIN(peakrpm) AS min_peakrpm, 
  MAX(peakrpm) AS max_peakrpm
FROM public.car_data

SELECT 
  peakrpm
FROM 
  public.car_data
ORDER BY 
 peakrpm ASC;
 
SELECT * 
FROM public.car_data
WHERE peakrpm = 520;

UPDATE 
  public.car_data
SET 
  peakrpm = '5200'
WHERE 
  peakrpm = '520';
  
  
--Ensure consistency in the data
--Fix leading spaces using LENGTH and TRIM

SELECT 
  DISTINCT enginelocation
FROM 
  public.car_data;
  
  
SELECT  
  LENGTH (enginelocation) AS length_enginelocation
FROM 
  public.car_data
GROUP BY 
  enginelocation;


UPDATE 
  public.car_data
SET
  enginelocation = TRIM (enginelocation)
WHERE 
  LENGTH (enginelocation) > 5;
  
  
SELECT 
  DISTINCT enginelocation
FROM 
  public.car_data;
  

--End
--Notes: Made mistake in nameing column "car_ID". Altered to remove quotation marks in column name.