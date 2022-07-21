## Summary statistics

## Mean and median

### Print the head of the sales DataFrame
  `print(sales.head())`
    
       store type  department       date  weekly_sales  is_holiday  temperature_c  fuel_price_usd_per_l  unemployment
    0      1    A           1 2010-02-05      24924.50       False          5.728                 0.679         8.106
    1      1    A           1 2010-03-05      21827.90       False          8.056                 0.693         8.106
    2      1    A           1 2010-04-02      57258.43       False         16.817                 0.718         7.808
    3      1    A           1 2010-05-07      17413.94       False         22.528                 0.749         7.808
    4      1    A           1 2010-06-04      17558.09       False         27.050                 0.715         7.808
    
### Print the info about the sales DataFrame
  `print(sales.info())`
    
    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 10774 entries, 0 to 10773
    Data columns (total 9 columns):
     #   Column                Non-Null Count  Dtype         
    ---  ------                --------------  -----         
     0   store                 10774 non-null  int64         
     1   type                  10774 non-null  object        
     2   department            10774 non-null  int32         
     3   date                  10774 non-null  datetime64[ns]
     4   weekly_sales          10774 non-null  float64       
     5   is_holiday            10774 non-null  bool          
     6   temperature_c         10774 non-null  float64       
     7   fuel_price_usd_per_l  10774 non-null  float64       
     8   unemployment          10774 non-null  float64       
    dtypes: bool(1), datetime64[ns](1), float64(4), int32(1), int64(1), object(1)
    memory usage: 641.9+ KB
    None
    
### Print the mean of weekly_sales
  `print(sales['weekly_sales'].mean())`
        
    23843.95014850566
    
### Print the median of weekly_sales
 `print(sales['weekly_sales'].median())`

    12049.064999999999
    
    
## Summarizing dates
### Print the maximum of the date column
  `print(sales['date'].max())`
    
    2012-10-26 00:00:00

### Print the minimum of the date column
  `print(sales['date'].min())`

    2010-02-05 00:00:00
    
## Efficient summaries
### Use the custom `iqr` function defined for you along with `.agg()` to print the IQR of the `temperature_c` column of `sales`.

### A custom IQR function
`def iqr(column):
     return column.quantile(0.75) - column.quantile(0.25)`
### Print IQR of the temperature_c column
 `print(sales['temperature_c'].agg(iqr))`
    
    16.583333333333336
    
### Update the column selection to use the custom `iqr` function with `.agg()` to print the IQR of the `temperature_c` column of `sales`.
  
### Update to print IQR and median of temperature_c, fuel_price_usd_per_l, & unemployment
`print(sales[["temperature_c", "fuel_price_usd_per_l", "unemployment"]].agg([iqr, np.median]))`
   
            temperature_c  fuel_price_usd_per_l  unemployment
    iqr            16.583                 0.073         0.565
    median         16.967                 0.743         8.099
    
## Cumulative statistics

### Sort sales_1_1 by date
`sales_1_1 = sales_1_1.sort_values('date')`

### Get the cumulative sum of weekly_sales, add as cum_weekly_sales col
`sales_1_1['cum_weekly_sales'] = sales_1_1['weekly_sales'].cumsum()`

### Get the cumulative max of weekly_sales, add as cum_max_sales col
`sales_1_1['cum_max_sales'] = sales_1_1['weekly_sales'].cummax()`

### See the columns you calculated
`print(sales_1_1[["date", "weekly_sales", "cum_weekly_sales", "cum_max_sales"]])`
    
             date  weekly_sales  cum_weekly_sales  cum_max_sales
    0  2010-02-05      24924.50          24924.50       24924.50
    1  2010-03-05      21827.90          46752.40       24924.50
    2  2010-04-02      57258.43         104010.83       57258.43
    3  2010-05-07      17413.94         121424.77       57258.43
    4  2010-06-04      17558.09         138982.86       57258.43
    5  2010-07-02      16333.14         155316.00       57258.43
    6  2010-08-06      17508.41         172824.41       57258.43
    7  2010-09-03      16241.78         189066.19       57258.43
    8  2010-10-01      20094.19         209160.38       57258.43
    9  2010-11-05      34238.88         243399.26       57258.43
    10 2010-12-03      22517.56         265916.82       57258.43
    11 2011-01-07      15984.24         281901.06       57258.43

## Counting

### Dropping duplicate names
`vet_visits.drop_duplicates(subset="name")` <-- removes duplicate names in the "name" column
### Dropping duplicate pairs
`vet_visits.drop_duplicates(subset=["name", "breed"])` <-- removes duplicate names in the "name" column and breeds from the "breed" column.

### Easy as 1, 2, 3
`unique_days["breed"].value_counts()`<br />
`unique_days["breed"].value_counts(sort=True)`<br />

### Proportions
`unique_days["breed"].value_counts(normalize=True)`

### Dropping duplicates
### Remove rows of `sales` with duplicate pairs of `store` and `type` and save as `store_types` and print the head.
### Drop duplicate store/type combinations
`store_types = sales.drop_duplicates(['store', 'type'])`<br />
`print(store_types.head())`<br />
    
          store type  department       date  weekly_sales  is_holiday  temperature_c  fuel_price_usd_per_l  unemployment
    0         1    A           1 2010-02-05      24924.50       False          5.728                 0.679         8.106
    901       2    A           1 2010-02-05      35034.06       False          4.550                 0.679         8.324
    1798      4    A           1 2010-02-05      38724.42       False          6.533                 0.686         8.623
    2699      6    A           1 2010-02-05      25619.00       False          4.683                 0.679         7.259
    3593     10    B           1 2010-02-05      40212.84       False         12.411                 0.782         9.765

### Remove rows of `sales` with duplicate pairs of `store` and `department` and save as `store_depts` and print the head.
### Drop duplicate store/department combinations
`store_depts = sales.drop_duplicates(['store', 'department'])`<br />
`print(store_depts.head())`<br />

        store type  department       date  weekly_sales  is_holiday  temperature_c  fuel_price_usd_per_l  unemployment
    0       1    A           1 2010-02-05      24924.50       False          5.728                 0.679         8.106
    12      1    A           2 2010-02-05      50605.27       False          5.728                 0.679         8.106
    24      1    A           3 2010-02-05      13740.12       False          5.728                 0.679         8.106
    36      1    A           4 2010-02-05      39954.04       False          5.728                 0.679         8.106
    48      1    A           5 2010-02-05      32229.38       False          5.728                 0.679         8.106

### Subset the rows that are holiday weeks using the `is_holiday` column, and drop the duplicate `date`s, saving as `holiday_dates`.
### Subset the rows where is_holiday is True and drop duplicate dates
`holiday_dates = sales[sales['is_holiday']].drop_duplicates('date')`<br />
`print(holiday_dates)`<br />
    
          store type  department       date  weekly_sales  is_holiday  temperature_c  fuel_price_usd_per_l  unemployment
    498       1    A          45 2010-09-10         11.47        True         25.939                 0.678         7.787
    691       1    A          77 2011-11-25       1431.00        True         15.633                 0.855         7.866
    2315      4    A          47 2010-02-12        498.00        True         -1.756                 0.680         8.623
    6735     19    A          39 2012-09-07         13.41        True         22.333                 1.077         8.193
    6810     19    A          47 2010-12-31       -449.00        True         -1.861                 0.881         8.067
    6815     19    A          47 2012-02-10         15.00        True          0.339                 1.011         7.943
    6820     19    A          48 2011-09-09        197.00        True         20.156                 1.038         7.806

### Print date col of holiday_dates
`print(holiday_dates['date'])`<br />    

    498    2010-09-10
    691    2011-11-25
    2315   2010-02-12
    6735   2012-09-07
    6810   2010-12-31
    6815   2012-02-10
    6820   2011-09-09
    Name: date, dtype: datetime64[ns]

### Counting categorical variables

### Count the number of stores of each type
`store_counts = store_types['type'].value_counts()`<br />
`print(store_counts)`<br />

    A    11
    B     1
    Name: type, dtype: int64


### Get the proportion of stores of each type
`store_props = store_types['type'].value_counts(normalize=True)`<br />
`print(store_props)`<br />

    A    0.917
    B    0.083
    Name: type, dtype: float64


### Count the number of each department number and sort
`dept_counts_sorted = store_depts['department'].value_counts(sort=True)`<br />
`print(dept_counts_sorted)`<br />

    1     12
    55    12
    72    12
    71    12
    67    12
          ..
    37    10
    48     8
    50     6
    39     4
    43     2
    Name: department, Length: 80, dtype: int64


### Get the proportion of departments of each number and sort
`dept_props_sorted = store_depts['department'].value_counts(sort=True, normalize=True)`<br />
`print(dept_props_sorted)`<br />

    1     0.013
    55    0.013
    72    0.013
    71    0.013
    67    0.013
          ...  
    37    0.011
    48    0.009
    50    0.006
    39    0.004
    43    0.002
    Name: department, Length: 80, dtype: float64

## Grouped summary statistcs
###What percent of sales occurred at each store type?
### Calc total weekly sales
`sales_all = sales["weekly_sales"].sum()`<br />
`print(sales_all)`<br />

    256894718.89999998

### Subset for type A stores, calc total weekly sales
`sales_A = sales[sales["type"] == "A"]["weekly_sales"].sum()`<br />
`print(sales_A)`<br />

    233716315.01

### Subset for type B stores, calc total weekly sales
`sales_B = sales[sales["type"] == "B"]["weekly_sales"].sum()`<br />
`print(sales_B)`<br />

    23178403.89

### Subset for type C stores, calc total weekly sales
`sales_C = sales[sales["type"] == "C"]["weekly_sales"].sum()`<br />
`print(sales_C)`<br />

    0.0

### Get proportion for each type
`sales_propn_by_type = [sales_A, sales_B, sales_C] / sales_all`<br />
`print(sales_propn_by_type)`<br />
    
    
    [0.9097747 0.0902253 0.       ]
    
### Calculations with .groupby()
### Group by type; calc total weekly sales
`sales_by_type = sales.groupby("type")["weekly_sales"].sum()`<br />
`print(sales_by_type)`<br />
    
    type
    A    2.337e+08
    B    2.318e+07
    Name: weekly_sales, dtype: float64
### Get proportion for each type


### Group by type; calc total weekly sales
`sales_by_type = sales.groupby("type")["weekly_sales"].sum()`

### Get proportion for each type
`sales_propn_by_type = sales_by_type / sum(sales.weekly_sales)`
`print(sales_propn_by_type)`
    
    type
    A    0.91
    B    0.09
    Name: weekly_sales, dtype: float64
    
    
### From previous step
`sales_by_type = sales.groupby("type")["weekly_sales"].sum()`

### Group by type and is_holiday; calc total weekly sales
`sales_by_type_is_holiday = sales.groupby.sum(['type', 'is_holiday']['weekly_sales'].sum())`
`print(sales_by_type_is_holiday)`

    type  is_holiday
    A     False         2.337e+08
          True          2.360e+04
    B     False         2.318e+07
          True          1.621e+03
    Name: weekly_sales, dtype: float64
    
### Multiple grouped summaries
    
### Import numpy with the alias np
`import numpy as np`

### For each store type, aggregate weekly_sales: get min, max, mean, and median
`sales_stats = sales.groupby('type')['weekly_sales'].agg([min, max, np.mean, np.median])`

### Print sales_stats
`print(sales_stats)`

                min        max       mean    median
    type                                        
       A    -1098.0  293966.05  23674.667  11943.92
       B     -798.0  232558.51  25696.678  13336.08

### For each store type, aggregate unemployment and fuel_price_usd_per_l: get min, max, mean, and median
`unemp_fuel_stats = sales.groupby('type')[['unemployment','fuel_price_usd_per_l']].agg([min, max, np.mean, np.median])`

### Print unemp_fuel_stats
`print(unemp_fuel_stats)`

                            unemployment                      fuel_price_usd_per_l                     
                  min    max   mean median                  min    max   mean median
    type                                                                            
    A           3.879  8.992  7.973  8.067                0.664  1.107  0.745  0.735
    B           7.170  9.765  9.279  9.199                0.760  1.108  0.806  0.803

