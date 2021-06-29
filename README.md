## *Still working on this page...* 

### Real-world situation

You are working with a local used car dealership. The dealership owner wants to know which cars customers are most likely to purchase so that they know what to keep in stock. From an external source, you obtain a data set that contains historical sales data on car prices and their related features: CarPrice_Assignment. You think these features can be used to give the dealership owner a list of the top popular cars and trims, and help determine which cars should be in the inventory.

The goal of this project is to clean the data. Analyzing bad data could cause the business owner to reach the wrong conclusions and, ultimately, lose money.

## Inspect the data

According to the data description, should contain only two unique string values: diesel and gas. For this reason, this column should be inspected by checking its unique values. 

```javascript
SELECT 
  DISTINCT (fueltype)
FROM 
  public.car_data
```

[gas diesel result img]

Since these values agree with the values in the data description, I can verify that the data in the fueltype column is already clean.

According to the data description, the length column values should range from 141.1 to 208.1. I will make the following query containing the MIN() and MAX() functions to inspect the minimum and maximum values of this column:

```javascript
SELECT 
  MIN(carlength) AS min_length,
  MAX(carlength) AS max_length
FROM public.car_data
```
[min max length img]

Again the results in this column is clean.

### Fill in missing data

Missing values in data can distort analysis results. One way to inspect a column for missing values in SQL is to use the IS NULL condition.

```javascript
SELECT * 
FROM public.car_data
WHERE doornumber IS null;
```

[null doors img]

The number of doors is only missing for one BMW and one Honda with sedan body styles. Also, the fuel type equals gas for the both BMW and the Honda

Make a query to pull up BMW with matching attributes:

```javascript
SELECT*
FROM 
  public.car_data
WHERE 
  carname LIKE 'bmw%' 
  AND fueltype = 'gas'
  AND aspiration = 'std'
  AND carbody = 'sedan'
ORDER BY 1;
```

[bmw null thumb]]

I notice that there is also another BMW 320i with similar features. However, after doing additional research I can safely conclude that the missing value here should be four. 

To make the replacement, make the following query using the UPDATE statement:

```javascript
UPDATE 
  public.car_data
SET
  doornumber = 'four'
WHERE
  "car_ID" = '12'
```
