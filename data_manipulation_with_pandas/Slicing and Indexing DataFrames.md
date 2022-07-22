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
