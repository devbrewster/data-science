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

##Setting multi-level indexes
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
