# Explicit indexes

`.set_index()` <-- sets a index <br />
`.reset_index()` <-- removes/resets a index <br />
`.reset_index(drop=True)` <-- drops a index <br />
`.sort_index()` <-- sort a index <br />

#### Setting a column as the index
 `dogs_ind = dogs.set_index('name')`<br />
 
#### Removing an index
`dogs_ind = dogs.reset_index()`<br /> 
 
 #### Dropping an index
`.reset_index(drop=True)`<br />

#### Indexes make subsetting simpler
`dogs[dogs["name"].isin(["Bella", "Stella"])]`<br /> 

#### Index values don't need to be unique
`dogs_ind2 = dogs.set_index('breed')`<br />

#### Subsetting on duplicated index values
`dogs_ind2.loc['Labrador']`<br />

#### Multi-level indexes a.k.a hierarchical indexes
`dogs_ind3 = dogs.set_index(['breed', 'color'])` <-- pass a list of columns into `.set_index([1, 2])`<br />

#### Subset the outer level with a list
`dogs_ind3.loc[['Labrador', 'Chihuahua']]`<br />

#### Subset inner levels with a list of tuples
`dogs_ind3.loc[[('Labrador', 'Brown'), ('Chihuahua', 'Tan')]]`<br />

#### Sorting by index values
`dogs_ind3.sort_index()`<br />

#### Controlling sort_index
`dogs_ind3.sort_index(level=['color', 'breed'], ascending=[True, False])`

## Setting and removing index
#### Look at temperatures
`print(temperatures)`

                date     city        country  avg_temp_c
    0     2000-01-01  Abidjan  Côte D'Ivoire      27.293
    1     2000-02-01  Abidjan  Côte D'Ivoire      27.685
    2     2000-03-01  Abidjan  Côte D'Ivoire      29.061
    3     2000-04-01  Abidjan  Côte D'Ivoire      28.162
    4     2000-05-01  Abidjan  Côte D'Ivoire      27.547
    ...          ...      ...            ...         ...
    16495 2013-05-01     Xian          China      18.979
    16496 2013-06-01     Xian          China      23.522
    16497 2013-07-01     Xian          China      25.251
    16498 2013-08-01     Xian          China      24.528
    16499 2013-09-01     Xian          China         NaN

    [16500 rows x 4 columns]

#### Index temperatures by city
`temperatures_ind = temperatures.set_index('city')`

#### Look at temperatures_ind
`print(temperatures_ind)`
    
                  date        country  avg_temp_c
    city                                         
    Abidjan 2000-01-01  Côte D'Ivoire      27.293
    Abidjan 2000-02-01  Côte D'Ivoire      27.685
    Abidjan 2000-03-01  Côte D'Ivoire      29.061
    Abidjan 2000-04-01  Côte D'Ivoire      28.162
    Abidjan 2000-05-01  Côte D'Ivoire      27.547
    ...            ...            ...         ...
    Xian    2013-05-01          China      18.979
    Xian    2013-06-01          China      23.522
    Xian    2013-07-01          China      25.251
    Xian    2013-08-01          China      24.528
    Xian    2013-09-01          China         NaN

    [16500 rows x 3 columns]    

#### Reset the index, keeping its contents
`print(temperatures_ind.reset_index())`

              city       date        country  avg_temp_c
    0      Abidjan 2000-01-01  Côte D'Ivoire      27.293
    1      Abidjan 2000-02-01  Côte D'Ivoire      27.685
    2      Abidjan 2000-03-01  Côte D'Ivoire      29.061
    3      Abidjan 2000-04-01  Côte D'Ivoire      28.162
    4      Abidjan 2000-05-01  Côte D'Ivoire      27.547
    ...        ...        ...            ...         ...
    16495     Xian 2013-05-01          China      18.979
    16496     Xian 2013-06-01          China      23.522
    16497     Xian 2013-07-01          China      25.251
    16498     Xian 2013-08-01          China      24.528
    16499     Xian 2013-09-01          China         NaN

    [16500 rows x 4 columns]

#### Reset the index, dropping its contents
`print(temperatures_ind.reset_index(drop=True))`
    
                date        country  avg_temp_c
    0     2000-01-01  Côte D'Ivoire      27.293
    1     2000-02-01  Côte D'Ivoire      27.685
    2     2000-03-01  Côte D'Ivoire      29.061
    3     2000-04-01  Côte D'Ivoire      28.162
    4     2000-05-01  Côte D'Ivoire      27.547
    ...          ...            ...         ...
    16495 2013-05-01          China      18.979
    16496 2013-06-01          China      23.522
    16497 2013-07-01          China      25.251
    16498 2013-08-01          China      24.528
    16499 2013-09-01          China         NaN

    [16500 rows x 3 columns]
    
    
## Subsetting with .loc[]

#### Create a list called `cities` that contains `"Moscow"` and `"Saint Petersburg"`.
#### Make a list of cities to subset on
`cities = ["Moscow", "Saint Petersburg"]`

#### Use `[]` subsetting to filter `temperatures` for rows where the `city` column takes a value in the `cities` list.
#### Subset temperatures using square brackets
`print(temperatures[temperatures['city'].isin(cities)])`

                date              city country  avg_temp_c
    10725 2000-01-01            Moscow  Russia      -7.313
    10726 2000-02-01            Moscow  Russia      -3.551
    10727 2000-03-01            Moscow  Russia      -1.661
    10728 2000-04-01            Moscow  Russia      10.096
    10729 2000-05-01            Moscow  Russia      10.357
    ...          ...               ...     ...         ...
    13360 2013-05-01  Saint Petersburg  Russia      12.355
    13361 2013-06-01  Saint Petersburg  Russia      17.185
    13362 2013-07-01  Saint Petersburg  Russia      17.234
    13363 2013-08-01  Saint Petersburg  Russia      17.153
    13364 2013-09-01  Saint Petersburg  Russia         NaN
    
    [330 rows x 4 columns]

#### Use `.loc[]` subsetting to filter `temperatures_ind` for rows where the city is in the `cities` list.
#### Subset temperatures_ind using .loc[]
`print(temperatures_ind.loc[cities])`

                           date country  avg_temp_c
    city                                           
    Moscow           2000-01-01  Russia      -7.313
    Moscow           2000-02-01  Russia      -3.551
    Moscow           2000-03-01  Russia      -1.661
    Moscow           2000-04-01  Russia      10.096
    Moscow           2000-05-01  Russia      10.357
    ...                     ...     ...         ...
    Saint Petersburg 2013-05-01  Russia      12.355
    Saint Petersburg 2013-06-01  Russia      17.185
    Saint Petersburg 2013-07-01  Russia      17.234
    Saint Petersburg 2013-08-01  Russia      17.153
    Saint Petersburg 2013-09-01  Russia         NaN
    
    [330 rows x 3 columns]

## Setting multi-level indexes
#### Index temperatures by country & city
`temperatures_ind = temperatures.set_index(['country', 'city'])`

#### List of tuples: Brazil, Rio De Janeiro & Pakistan, Lahore
`rows_to_keep = [('Brazil', 'Rio De Janeiro'), ('Pakistan', 'Lahore')]`

#### Subset for rows to keep
`print(temperatures_ind.loc[rows_to_keep])`

                                  date  avg_temp_c
    country  city                                 
    Brazil   Rio De Janeiro 2000-01-01      25.974
             Rio De Janeiro 2000-02-01      26.699
             Rio De Janeiro 2000-03-01      26.270
             Rio De Janeiro 2000-04-01      25.750
             Rio De Janeiro 2000-05-01      24.356
    ...                            ...         ...
    Pakistan Lahore         2013-05-01      33.457
             Lahore         2013-06-01      34.456
             Lahore         2013-07-01      33.279
             Lahore         2013-08-01      31.511
             Lahore         2013-09-01         NaN

    [330 rows x 2 columns]
    
## Sorting by index values
#### Sort temperatures_ind by index values
`print(temperatures_ind.sort_index())`

                             date  avg_temp_c
    country     city                         
    Afghanistan Kabul  2000-01-01       3.326
                Kabul  2000-02-01       3.454
                Kabul  2000-03-01       9.612
                Kabul  2000-04-01      17.925
                Kabul  2000-05-01      24.658
    ...                       ...         ...
    Zimbabwe    Harare 2013-05-01      18.298
                Harare 2013-06-01      17.020
                Harare 2013-07-01      16.299
                Harare 2013-08-01      19.232
                Harare 2013-09-01         NaN

    [16500 rows x 2 columns]

#### Sort temperatures_ind by index values at the city level
`print(temperatures_ind.sort_index(level='city'))`

                                date  avg_temp_c
    country       city                          
    Côte D'Ivoire Abidjan 2000-01-01      27.293
                  Abidjan 2000-02-01      27.685
                  Abidjan 2000-03-01      29.061
                  Abidjan 2000-04-01      28.162
                  Abidjan 2000-05-01      27.547
    ...                          ...         ...
    China         Xian    2013-05-01      18.979
                  Xian    2013-06-01      23.522
                  Xian    2013-07-01      25.251
                  Xian    2013-08-01      24.528
                  Xian    2013-09-01         NaN

    [16500 rows x 2 columns]

#### Sort temperatures_ind by country then descending city
`print(temperatures_ind.sort_index(level=['country', 'city'], ascending=[True, False]))`

                             date  avg_temp_c
    country     city                         
    Afghanistan Kabul  2000-01-01       3.326
                Kabul  2000-02-01       3.454
                Kabul  2000-03-01       9.612
                Kabul  2000-04-01      17.925
                Kabul  2000-05-01      24.658
    ...                       ...         ...
    Zimbabwe    Harare 2013-05-01      18.298
                Harare 2013-06-01      17.020
                Harare 2013-07-01      16.299
                Harare 2013-08-01      19.232
                Harare 2013-09-01         NaN

    [16500 rows x 2 columns]
    
## Slicing and subsetting with .loc and .iloc    

#### Sort the index of temperatures_ind
`temperatures_srt = temperatures_ind.sort_index()`

#### Subset rows from Pakistan to Russia
`print(temperatures_srt.loc['Pakistan':'Russia'])`

                                    date  avg_temp_c
    country  city                                   
    Pakistan Faisalabad       2000-01-01      12.792
             Faisalabad       2000-02-01      14.339
             Faisalabad       2000-03-01      20.309
             Faisalabad       2000-04-01      29.072
             Faisalabad       2000-05-01      34.845
    ...                              ...         ...
    Russia   Saint Petersburg 2013-05-01      12.355
             Saint Petersburg 2013-06-01      17.185
             Saint Petersburg 2013-07-01      17.234
             Saint Petersburg 2013-08-01      17.153
             Saint Petersburg 2013-09-01         NaN

    [1155 rows x 2 columns]

#### Try to subset rows from Lahore to Moscow
`print(temperatures_srt.loc['Lahore':'Moscow'])`

                             date  avg_temp_c
    country city                             
    Mexico  Mexico     2000-01-01      12.694
            Mexico     2000-02-01      14.677
            Mexico     2000-03-01      17.376
            Mexico     2000-04-01      18.294
            Mexico     2000-05-01      18.562
    ...                       ...         ...
    Morocco Casablanca 2013-05-01      19.217
            Casablanca 2013-06-01      23.649
            Casablanca 2013-07-01      27.488
            Casablanca 2013-08-01      27.952
            Casablanca 2013-09-01         NaN

    [330 rows x 2 columns]

#### Subset rows from Pakistan, Lahore to Russia, Moscow
`print(temperatures_srt.loc[('Pakistan','Lahore'):('Russia','Moscow')])`

                          date  avg_temp_c
    country  city                         
    Pakistan Lahore 2000-01-01      12.792
             Lahore 2000-02-01      14.339
             Lahore 2000-03-01      20.309
             Lahore 2000-04-01      29.072
             Lahore 2000-05-01      34.845
    ...                    ...         ...
    Russia   Moscow 2013-05-01      16.152
             Moscow 2013-06-01      18.718
             Moscow 2013-07-01      18.136
             Moscow 2013-08-01      17.485
             Moscow 2013-09-01         NaN

    [660 rows x 2 columns]

## Slicing in both directions

#### Use `.loc[]` slicing to subset rows from India, Hyderabad to Iraq, Baghdad.
#### Subset rows from India, Hyderadad to Irag, Baghdad
`print(temperatures_srt.loc[('India','Hyderabad'):('Iraq','Baghdad')])`

                            date  avg_temp_c
    country city                            
    India   Hyderabad 2000-01-01      23.779
            Hyderabad 2000-02-01      25.826
            Hyderabad 2000-03-01      28.821
            Hyderabad 2000-04-01      32.698
            Hyderabad 2000-05-01      32.438
    ...                      ...         ...
    Iraq    Baghdad   2013-05-01      28.673
            Baghdad   2013-06-01      33.803
            Baghdad   2013-07-01      36.392
            Baghdad   2013-08-01      35.463
            Baghdad   2013-09-01         NaN
    
    [2145 rows x 2 columns]

#### Use `.loc[]` slicing to subset columns from `date` to `avg_temp_c`.
#### Subset columns from date to avg_temp_c
`print(temperatures_srt.loc[:, 'date':'avg_temp_c'])`

                             date  avg_temp_c
    country     city                         
    Afghanistan Kabul  2000-01-01       3.326
                Kabul  2000-02-01       3.454
                Kabul  2000-03-01       9.612
                Kabul  2000-04-01      17.925
                Kabul  2000-05-01      24.658
    ...                       ...         ...
    Zimbabwe    Harare 2013-05-01      18.298
                Harare 2013-06-01      17.020
                Harare 2013-07-01      16.299
                Harare 2013-08-01      19.232
                Harare 2013-09-01         NaN
    
    [16500 rows x 2 columns]

#### Slice in both directions at once from Hyderabad to Baghdad, and `date` to  `avg_temp_c`.
#### Subset in both directions at once
`print(temperatures_srt.loc[('India','Hyderabad'):('Iraq','Baghdad'), 'date':'avg_temp_c'])`

                            date  avg_temp_c
    country city                            
    India   Hyderabad 2000-01-01      23.779
            Hyderabad 2000-02-01      25.826
            Hyderabad 2000-03-01      28.821
            Hyderabad 2000-04-01      32.698
            Hyderabad 2000-05-01      32.438
    ...                      ...         ...
    Iraq    Baghdad   2013-05-01      28.673
            Baghdad   2013-06-01      33.803
            Baghdad   2013-07-01      36.392
            Baghdad   2013-08-01      35.463
            Baghdad   2013-09-01         NaN
    
    [2145 rows x 2 columns]

## Slicing time series

#### Use Boolean conditions, not `.isin()` or `.loc[]`, and the full date `"yyyy-mm-dd"`, to subset `temperatures` for rows in 2010 and 2011 and print the results.
#### Use Boolean conditions to subset temperatures for rows in 2010 and 2011
`temperatures_bool = temperatures[(temperatures['date'] >= '2010-01-01') & (temperatures['date'] <= '2011-12-31')]`
`print(temperatures_bool)`

                date     city        country  avg_temp_c
    120   2010-01-01  Abidjan  Côte D'Ivoire      28.270
    121   2010-02-01  Abidjan  Côte D'Ivoire      29.262
    122   2010-03-01  Abidjan  Côte D'Ivoire      29.596
    123   2010-04-01  Abidjan  Côte D'Ivoire      29.068
    124   2010-05-01  Abidjan  Côte D'Ivoire      28.258
    ...          ...      ...            ...         ...
    16474 2011-08-01     Xian          China      23.069
    16475 2011-09-01     Xian          China      16.775
    16476 2011-10-01     Xian          China      12.587
    16477 2011-11-01     Xian          China       7.543
    16478 2011-12-01     Xian          China      -0.490
    
    [2400 rows x 4 columns]

#### Set the index of `temperatures` to the `date` column and sort it.
#### Set date as the index and sort the index
`temperatures_ind = temperatures.set_index('date').sort_index()`

#### Use `.loc[]` to subset `temperatures_ind` for rows in 2010 and 2011.
#### Use .loc[] to subset temperatures_ind for rows in 2010 and 2011
`print(temperatures_ind.loc['2010':'2011'])`

                      city    country  avg_temp_c
    date                                         
    2010-01-01  Faisalabad   Pakistan      11.810
    2010-01-01   Melbourne  Australia      20.016
    2010-01-01   Chongqing      China       7.921
    2010-01-01   São Paulo     Brazil      23.738
    2010-01-01   Guangzhou      China      14.136
    ...                ...        ...         ...
    2011-12-01      Nagoya      Japan       6.476
    2011-12-01   Hyderabad      India      23.613
    2011-12-01        Cali   Colombia      21.559
    2011-12-01        Lima       Peru      18.293
    2011-12-01     Bangkok   Thailand      25.021

#### Use `.loc[]` to subset `temperatures_ind` for rows from Aug 2010 to Feb 2011
#### Use .loc[] to subset temperatures_ind for rows from Aug 2010 to Feb 2011
`print(temperatures_ind.loc['2010-08':'2011-02'])`

                    city        country  avg_temp_c
    date                                           
    2010-08-01  Calcutta          India      30.226
    2010-08-01      Pune          India      24.941
    2010-08-01     Izmir         Turkey      28.352
    2010-08-01   Tianjin          China      25.543
    2010-08-01    Manila    Philippines      27.101
    ...              ...            ...         ...
    2011-02-01     Kabul    Afghanistan       3.914
    2011-02-01   Chicago  United States       0.276
    2011-02-01    Aleppo          Syria       8.246
    2011-02-01     Delhi          India      18.136
    2011-02-01   Rangoon          Burma      26.631
    
    [700 rows x 3 columns]

## Subsetting by row/column number

#### Get 23rd row, 2nd column (index 22, 1)
`print(temperatures.iloc[22,2])`

    Abidjan


#### Use slicing to get the first 5 rows
`print(temperatures.iloc[:5])`

            date     city        country  avg_temp_c
    0 2000-01-01  Abidjan  Côte D'Ivoire      27.293
    1 2000-02-01  Abidjan  Côte D'Ivoire      27.685
    2 2000-03-01  Abidjan  Côte D'Ivoire      29.061
    3 2000-04-01  Abidjan  Côte D'Ivoire      28.162
    4 2000-05-01  Abidjan  Côte D'Ivoire      27.547


    [16500 rows x 2 columns]


#### Use slicing to get columns 3 to 4
`print(temperatures.iloc[:,2:4])`

                 country  avg_temp_c
    0      Côte D'Ivoire      27.293
    1      Côte D'Ivoire      27.685
    2      Côte D'Ivoire      29.061
    3      Côte D'Ivoire      28.162
    4      Côte D'Ivoire      27.547
    ...              ...         ...
    16495          China      18.979
    16496          China      23.522
    16497          China      25.251
    16498          China      24.528
    16499          China         NaN

#### Use slicing in both directions at once
`print(temperatures.iloc[0:5, 2:4])`

             country  avg_temp_c
    0  Côte D'Ivoire      27.293
    1  Côte D'Ivoire      27.685
    2  Côte D'Ivoire      29.061
    3  Côte D'Ivoire      28.162
    4  Côte D'Ivoire      27.547

## Working with pivot tables

## Pivot temperature by city and year
#### You can access the components of a date (year, month and day) using code of the form `dataframe["column"].dt.component`. For example, the month component is `dataframe["column"].dt.month`, and the year component is `dataframe["column"].dt.year`.

#### Add a `year` column to `temperatures`, from the `year` component of the `date` column.
#### Add a year column to temperatures
`temperatures['year'] = temperatures['date'].dt.year`

#### Make a pivot table of the `avg_temp_c` column, with `country` and `city` as rows, and `year` as columns. Assign to `temp_by_country_city_vs_year`, and look at the result.
#### Pivot avg_temp_c by country and city vs year
`temp_by_country_city_vs_year = temperatures.pivot_table('avg_temp_c', index=['country', 'city'], columns='year')`

#### See the result
`print(temp_by_country_city_vs_year)`

    year                              2000    2001    2002    2003    2004  ...    2009    2010    2011    2012    2013
    country       city                                                      ...                                        
    Afghanistan   Kabul             15.823  15.848  15.715  15.133  16.128  ...  15.093  15.676  15.812  14.510  16.206
    Angola        Luanda            24.410  24.427  24.791  24.867  24.216  ...  24.325  24.440  24.151  24.240  24.554
    Australia     Melbourne         14.320  14.180  14.076  13.986  13.742  ...  14.647  14.232  14.191  14.269  14.742
                  Sydney            17.567  17.854  17.734  17.592  17.870  ...  18.176  17.999  17.713  17.474  18.090
    Bangladesh    Dhaka             25.905  25.931  26.095  25.927  26.136  ...  26.536  26.648  25.803  26.284  26.587
    ...                                ...     ...     ...     ...     ...  ...     ...     ...     ...     ...     ...
    United States Chicago           11.090  11.703  11.532  10.482  10.943  ...  10.298  11.816  11.214  12.821  11.587
                  Los Angeles       16.643  16.466  16.430  16.945  16.553  ...  16.677  15.887  15.875  17.090  18.121
                  New York           9.969  10.931  11.252   9.836  10.389  ...  10.142  11.358  11.272  11.971  12.164
    Vietnam       Ho Chi Minh City  27.589  27.832  28.065  27.828  27.687  ...  27.853  28.282  27.675  28.249  28.455
    Zimbabwe      Harare            20.284  20.861  21.079  20.889  20.308  ...  20.524  21.166  20.782  20.523  19.756

    [100 rows x 14 columns]

## Subsetting pivot tables

    # Subset for Egypt to India
    temp_by_country_city_vs_year = temp_by_country_city_vs_year.loc['Egypt':'India']

    # Subset for Egypt, Cairo to India, Delhi
    temp_by_country_city_vs_year = temp_by_country_city_vs_year.loc[('Egypt', 'Cairo'):('India', 'Delhi')]

    # Subset for Egypt, Cairo to India, Delhi, and 2005 to 2010
    temp_by_country_city_vs_year = temp_by_country_city_vs_year.loc[('Egypt', 'Cairo'):('India', 'Delhi'), '2005':'2010']

## Calculating on a pivot table


