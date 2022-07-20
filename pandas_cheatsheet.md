## PANDAS CHEATSHEET
`.head()` returns the first few rows of a DataFrame<br />
    
    print(homelessness.head())
    region       state  individuals  family_members  state_pop
    0  East South Central     Alabama       2570.0           864.0    4887681
    1             Pacific      Alaska       1434.0           582.0     735139
    2            Mountain     Arizona       7259.0          2606.0    7158024
    3  West South Central    Arkansas       2280.0           432.0    3009733
    4             Pacific  California     109008.0         20964.0   39461588

`.info()` shows information on each of the columns, such as the data type and number of missing values<br />

    # Print the head of the homelessness data
    print(homelessness.info())
    <class 'pandas.core.frame.DataFrame'>
    Int64Index: 51 entries, 0 to 50
    Data columns (total 5 columns):
     #   Column          Non-Null Count  Dtype  
    ---  ------          --------------  -----  
     0   region          51 non-null     object 
     1   state           51 non-null     object 
     2   individuals     51 non-null     float64
     3   family_members  51 non-null     float64
     4   state_pop       51 non-null     int64  
    dtypes: float64(2), int64(1), object(2)
    memory usage: 2.4+ KB
    None

`.shape()` returns the number of rows and columns of the DataFrame<br />

    # Print the head of the homelessness data
    print(homelessness.shape)
    (51, 5)


`.describe()` calculates a few summary statistics for each column<br />

    # Print the head of the homelessness data
    print(homelessness.describe())
           individuals  family_members  state_pop
    count       51.000          51.000  5.100e+01
    mean      7225.784        3504.882  6.406e+06
    std      15991.025        7805.412  7.327e+06
    min        434.000          75.000  5.776e+05
    25%       1446.500         592.000  1.777e+06
    50%       3082.000        1482.000  4.461e+06
    75%       6781.500        3196.000  7.341e+06
    max     109008.000       52070.000  3.946e+07

