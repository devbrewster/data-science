## Data Manipulation with pandas

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

`.values`: A two-dimensional NumPy array of values.

    # Print the values of homelessness
    print(homelessness.values)

    [['East South Central' 'Alabama' 2570.0 864.0 4887681]
     ['Pacific' 'Alaska' 1434.0 582.0 735139]
     ['Mountain' 'Arizona' 7259.0 2606.0 7158024]
     ['West South Central' 'Arkansas' 2280.0 432.0 3009733]
     ['Pacific' 'California' 109008.0 20964.0 39461588]
     ['Mountain' 'Colorado' 7607.0 3250.0 5691287]
     ['New England' 'Connecticut' 2280.0 1696.0 3571520]
     ['South Atlantic' 'Delaware' 708.0 374.0 965479]
     ['South Atlantic' 'District of Columbia' 3770.0 3134.0 701547]
     ['South Atlantic' 'Florida' 21443.0 9587.0 21244317]
     ['South Atlantic' 'Georgia' 6943.0 2556.0 10511131]
     ['Pacific' 'Hawaii' 4131.0 2399.0 1420593]
     ['Mountain' 'Idaho' 1297.0 715.0 1750536]
     ['East North Central' 'Illinois' 6752.0 3891.0 12723071]
     ['East North Central' 'Indiana' 3776.0 1482.0 6695497]
     ['West North Central' 'Iowa' 1711.0 1038.0 3148618]
     ['West North Central' 'Kansas' 1443.0 773.0 2911359]
     ['East South Central' 'Kentucky' 2735.0 953.0 4461153]
     ['West South Central' 'Louisiana' 2540.0 519.0 4659690]
     ['New England' 'Maine' 1450.0 1066.0 1339057]
     ['South Atlantic' 'Maryland' 4914.0 2230.0 6035802]
     ['New England' 'Massachusetts' 6811.0 13257.0 6882635]
     ['East North Central' 'Michigan' 5209.0 3142.0 9984072]
     ['West North Central' 'Minnesota' 3993.0 3250.0 5606249]
     ['East South Central' 'Mississippi' 1024.0 328.0 2981020]
     ['West North Central' 'Missouri' 3776.0 2107.0 6121623]
     ['Mountain' 'Montana' 983.0 422.0 1060665]
     ['West North Central' 'Nebraska' 1745.0 676.0 1925614]
     ['Mountain' 'Nevada' 7058.0 486.0 3027341]
     ['New England' 'New Hampshire' 835.0 615.0 1353465]
     ['Mid-Atlantic' 'New Jersey' 6048.0 3350.0 8886025]
     ['Mountain' 'New Mexico' 1949.0 602.0 2092741]
     ['Mid-Atlantic' 'New York' 39827.0 52070.0 19530351]
     ['South Atlantic' 'North Carolina' 6451.0 2817.0 10381615]
     ['West North Central' 'North Dakota' 467.0 75.0 758080]
     ['East North Central' 'Ohio' 6929.0 3320.0 11676341]
     ['West South Central' 'Oklahoma' 2823.0 1048.0 3940235]
     ['Pacific' 'Oregon' 11139.0 3337.0 4181886]
     ['Mid-Atlantic' 'Pennsylvania' 8163.0 5349.0 12800922]
     ['New England' 'Rhode Island' 747.0 354.0 1058287]
     ['South Atlantic' 'South Carolina' 3082.0 851.0 5084156]
     ['West North Central' 'South Dakota' 836.0 323.0 878698]
     ['East South Central' 'Tennessee' 6139.0 1744.0 6771631]
     ['West South Central' 'Texas' 19199.0 6111.0 28628666]
     ['Mountain' 'Utah' 1904.0 972.0 3153550]
     ['New England' 'Vermont' 780.0 511.0 624358]
     ['South Atlantic' 'Virginia' 3928.0 2047.0 8501286]
     ['Pacific' 'Washington' 16424.0 5880.0 7523869]
     ['South Atlantic' 'West Virginia' 1021.0 222.0 1804291]
     ['East North Central' 'Wisconsin' 2740.0 2167.0 5807406]
     ['Mountain' 'Wyoming' 434.0 205.0 577601]]
     
`.columns`: An index of columns: the column names.
    
    # Print the column index of homelessness
    Index(['region', 'state', 'individuals', 'family_members', 'state_pop'], dtype='object')

`.index`: An index for the rows: either row numbers or row names.

    # Print the row index of homelessness
    print(homelessness.index)
    
    Index(['region', 'state', 'individuals', 'family_members', 'state_pop'], dtype='object')
    Int64Index([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48,
                49, 50],
               dtype='int64')
               
 
## Sorting and subsetting
## Sorting rows

| Sort on …      | Syntax |
| ----------- | ----------- |
| one column      | `df.sort_values("breed")` |
| multiple columns   | `df.sort_values(["breed", "weight_kg"])`        |

Sort `homelessness` by the number of homeless individuals, from smallest to largest, and save this as `homelessness_ind`.

    # Sort homelessness by individuals
    homelessness_ind = homelessness.sort_values('individuals')

    # Print the top few rows
    print(homelessness_ind.head())
    
                    region         state  individuals  family_members  state_pop
    50            Mountain       Wyoming        434.0           205.0     577601
    34  West North Central  North Dakota        467.0            75.0     758080
    7       South Atlantic      Delaware        708.0           374.0     965479
    39         New England  Rhode Island        747.0           354.0    1058287
    45         New England       Vermont        780.0           511.0     624358

Sort `homelessness` by the number of homeless `family_members` in descending order, and save this as `homelessness_fam`.

    # Sort homelessness by descending family members
    homelessness_fam = homelessness.sort_values('family_members', ascending=False)

    # Print the top few rows
    print(homelessness_fam.head())
    
                    region          state  individuals  family_members  state_pop
    32        Mid-Atlantic       New York      39827.0         52070.0   19530351
    4              Pacific     California     109008.0         20964.0   39461588
    21         New England  Massachusetts       6811.0         13257.0    6882635
    9       South Atlantic        Florida      21443.0          9587.0   21244317
    43  West South Central          Texas      19199.0          6111.0   28628666

Sort `homelessness` first by region (ascending), and then by number of family members (descending). Save this as `homelessness_reg_fam`.

    # Sort homelessness by region, then descending family members
    homelessness_reg_fam = homelessness.sort_values(['region', 'family_members'], ascending=[True, False])

    # Print the top few rows
    print(homelessness_reg_fam.head())
    
                    region      state  individuals  family_members  state_pop
    13  East North Central   Illinois       6752.0          3891.0   12723071
    35  East North Central       Ohio       6929.0          3320.0   11676341
    22  East North Central   Michigan       5209.0          3142.0    9984072
    49  East North Central  Wisconsin       2740.0          2167.0    5807406
    14  East North Central    Indiana       3776.0          1482.0    6695497

## Subsetting columns

Create a DataFrame called `individuals` that contains only the `individuals` column of `homelessness`.

    # Select the individuals column
    individuals = homelessness['individuals']

    # Print the head of the result
    print(individuals.head())
    0      2570.0
    1      1434.0
    2      7259.0
    3      2280.0
    4    109008.0
    Name: individuals, dtype: float64

Create a DataFrame called `state_fam` that contains only the `state` and `family_members` columns of `homelessness`, in that order.

    # Select the state and family_members columns
    state_fam = homelessness[['state', 'family_members']]

    # Print the head of the result
    print(state_fam.head())
    
            state  family_members
    0     Alabama           864.0
    1      Alaska           582.0
    2     Arizona          2606.0
    3    Arkansas           432.0
    4  California         20964.0


Create a DataFrame called `ind_state` that contains the `individuals` and `state` columns of `homelessness`, in that order

    # Select only the individuals and state columns, in that order
    ind_state = homelessness[['individuals', 'state']]

    # Print the head of the result
    print(ind_state.head())
       individuals       state
    0       2570.0     Alabama
    1       1434.0      Alaska
    2       7259.0     Arizona
    3       2280.0    Arkansas
    4     109008.0  California
    
## Subsetting rows

    dogs[dogs["height_cm"] > 60]
    dogs[dogs["color"] == "tan"]
    
You can filter for multiple conditions at once by using the "bitwise and" operator, `&`.   

    dogs[(dogs["height_cm"] > 60) & (dogs["color"] == "tan")]

Filter `homelessness` for cases where the number of individuals is greater than ten thousand, assigning to `ind_gt_10k`.

    # Filter for rows where individuals is greater than 10000
    ind_gt_10k = homelessness[homelessness['individuals'] > 10000]

    # See the result
    print(ind_gt_10k)
    
                    region       state  individuals  family_members  state_pop
    4              Pacific  California     109008.0         20964.0   39461588
    9       South Atlantic     Florida      21443.0          9587.0   21244317
    32        Mid-Atlantic    New York      39827.0         52070.0   19530351
    37             Pacific      Oregon      11139.0          3337.0    4181886
    43  West South Central       Texas      19199.0          6111.0   28628666
    47             Pacific  Washington      16424.0          5880.0    7523869

Filter `homelessness` for cases where the USA Census region is `"Mountain"`, assigning to `mountain_reg`.

    # Filter for rows where region is Mountain
    mountain_reg = homelessness[homelessness['region'] == 'Mountain']

    # See the result
    print(mountain_reg)
          region       state  individuals  family_members  state_pop
    2   Mountain     Arizona       7259.0          2606.0    7158024
    5   Mountain    Colorado       7607.0          3250.0    5691287
    12  Mountain       Idaho       1297.0           715.0    1750536
    26  Mountain     Montana        983.0           422.0    1060665
    28  Mountain      Nevada       7058.0           486.0    3027341
    31  Mountain  New Mexico       1949.0           602.0    2092741
    44  Mountain        Utah       1904.0           972.0    3153550
    50  Mountain     Wyoming        434.0           205.0     577601
    
Filter `homelessness` for cases where the number of `family_members` is less than one thousand and the `region` is `"Pacific"`, assigning to `fam_lt_1k_pac`.

    # Filter for rows where family_members is less than 1000 
    # and region is Pacific
    fam_lt_1k_pac = homelessness[(homelessness['family_members'] < 1000) & (homelessness['region'] == 'Pacific')]

    # See the result
    print(fam_lt_1k_pac)

        region   state  individuals  family_members  state_pop
    1  Pacific  Alaska       1434.0           582.0     735139
    
## Subsetting rows by categorical variables

    colors = ["brown", "black", "tan"]
    condition = dogs["color"].isin(colors)
    dogs[condition]
    
Filter `homelessness` for cases where the USA census region is "South Atlantic" or it is "Mid-Atlantic", assigning to `south_mid_atlantic`.

    # Subset for rows in South Atlantic or Mid-Atlantic regions
    south_mid_atlantic = homelessness[(homelessness['region'] == 'South Atlantic') | (homelessness['region'] == 'Mid-Atlantic')]

    # See the result
    print(south_mid_atlantic)

                region                 state  individuals  family_members  state_pop
    7   South Atlantic              Delaware        708.0           374.0     965479
    8   South Atlantic  District of Columbia       3770.0          3134.0     701547
    9   South Atlantic               Florida      21443.0          9587.0   21244317
    10  South Atlantic               Georgia       6943.0          2556.0   10511131
    20  South Atlantic              Maryland       4914.0          2230.0    6035802
    30    Mid-Atlantic            New Jersey       6048.0          3350.0    8886025
    32    Mid-Atlantic              New York      39827.0         52070.0   19530351
    33  South Atlantic        North Carolina       6451.0          2817.0   10381615
    38    Mid-Atlantic          Pennsylvania       8163.0          5349.0   12800922
    40  South Atlantic        South Carolina       3082.0           851.0    5084156
    46  South Atlantic              Virginia       3928.0          2047.0    8501286
    48  South Atlantic         West Virginia       1021.0           222.0    1804291
    
Filter `homelessness` for cases where the USA census `state` is in the list of Mojave states, `canu`, assigning to `mojave_homelessness`.

    # The Mojave Desert states
    canu = ["California", "Arizona", "Nevada", "Utah"]

    # Filter for rows in the Mojave Desert states
    mojave_homelessness = homelessness[homelessness["state"].isin(canu)]

    # See the result
    print(mojave_homelessness)
          region       state  individuals  family_members  state_pop
    2   Mountain     Arizona       7259.0          2606.0    7158024
    4    Pacific  California     109008.0         20964.0   39461588
    28  Mountain      Nevada       7058.0           486.0    3027341
    44  Mountain        Utah       1904.0           972.0    3153550
    
## New columns    

Add a new column to `homelessness`, named `total`, containing the sum of the `individuals` and `family_members` columns

    # Add total col as sum of individuals and family_members
    homelessness['total'] = homelessness['individuals'] + homelessness['family_members']

    # Add p_individuals col as proportion of total that are individuals
    homelessness['p_individuals'] = homelessness['individuals'] / homelessness['total']

    # See the result
    print(homelessness)
                    region                 state  individuals  family_members  state_pop     total  p_individuals
    0   East South Central               Alabama       2570.0           864.0    4887681    3434.0          0.748
    1              Pacific                Alaska       1434.0           582.0     735139    2016.0          0.711
    2             Mountain               Arizona       7259.0          2606.0    7158024    9865.0          0.736
    3   West South Central              Arkansas       2280.0           432.0    3009733    2712.0          0.841
    4              Pacific            California     109008.0         20964.0   39461588  129972.0          0.839
    5             Mountain              Colorado       7607.0          3250.0    5691287   10857.0          0.701
    6          New England           Connecticut       2280.0          1696.0    3571520    3976.0          0.573
    7       South Atlantic              Delaware        708.0           374.0     965479    1082.0          0.654
    8       South Atlantic  District of Columbia       3770.0          3134.0     701547    6904.0          0.546
    9       South Atlantic               Florida      21443.0          9587.0   21244317   31030.0          0.691
    10      South Atlantic               Georgia       6943.0          2556.0   10511131    9499.0          0.731
    11             Pacific                Hawaii       4131.0          2399.0    1420593    6530.0          0.633
    12            Mountain                 Idaho       1297.0           715.0    1750536    2012.0          0.645
    13  East North Central              Illinois       6752.0          3891.0   12723071   10643.0          0.634
    14  East North Central               Indiana       3776.0          1482.0    6695497    5258.0          0.718
    15  West North Central                  Iowa       1711.0          1038.0    3148618    2749.0          0.622
    16  West North Central                Kansas       1443.0           773.0    2911359    2216.0          0.651
    17  East South Central              Kentucky       2735.0           953.0    4461153    3688.0          0.742
    18  West South Central             Louisiana       2540.0           519.0    4659690    3059.0          0.830
    19         New England                 Maine       1450.0          1066.0    1339057    2516.0          0.576
    20      South Atlantic              Maryland       4914.0          2230.0    6035802    7144.0          0.688
    21         New England         Massachusetts       6811.0         13257.0    6882635   20068.0          0.339
    22  East North Central              Michigan       5209.0          3142.0    9984072    8351.0          0.624
    23  West North Central             Minnesota       3993.0          3250.0    5606249    7243.0          0.551
    24  East South Central           Mississippi       1024.0           328.0    2981020    1352.0          0.757
    25  West North Central              Missouri       3776.0          2107.0    6121623    5883.0          0.642
    26            Mountain               Montana        983.0           422.0    1060665    1405.0          0.700
    27  West North Central              Nebraska       1745.0           676.0    1925614    2421.0          0.721
    28            Mountain                Nevada       7058.0           486.0    3027341    7544.0          0.936
    29         New England         New Hampshire        835.0           615.0    1353465    1450.0          0.576
    30        Mid-Atlantic            New Jersey       6048.0          3350.0    8886025    9398.0          0.644
    31            Mountain            New Mexico       1949.0           602.0    2092741    2551.0          0.764
    32        Mid-Atlantic              New York      39827.0         52070.0   19530351   91897.0          0.433
    33      South Atlantic        North Carolina       6451.0          2817.0   10381615    9268.0          0.696
    34  West North Central          North Dakota        467.0            75.0     758080     542.0          0.862
    35  East North Central                  Ohio       6929.0          3320.0   11676341   10249.0          0.676
    36  West South Central              Oklahoma       2823.0          1048.0    3940235    3871.0          0.729
    37             Pacific                Oregon      11139.0          3337.0    4181886   14476.0          0.769
    38        Mid-Atlantic          Pennsylvania       8163.0          5349.0   12800922   13512.0          0.604
    39         New England          Rhode Island        747.0           354.0    1058287    1101.0          0.678
    40      South Atlantic        South Carolina       3082.0           851.0    5084156    3933.0          0.784
    41  West North Central          South Dakota        836.0           323.0     878698    1159.0          0.721
    42  East South Central             Tennessee       6139.0          1744.0    6771631    7883.0          0.779
    43  West South Central                 Texas      19199.0          6111.0   28628666   25310.0          0.759
    44            Mountain                  Utah       1904.0           972.0    3153550    2876.0          0.662
    45         New England               Vermont        780.0           511.0     624358    1291.0          0.604
    46      South Atlantic              Virginia       3928.0          2047.0    8501286    5975.0          0.657
    47             Pacific            Washington      16424.0          5880.0    7523869   22304.0          0.736
    48      South Atlantic         West Virginia       1021.0           222.0    1804291    1243.0          0.821
    49  East North Central             Wisconsin       2740.0          2167.0    5807406    4907.0          0.558
    50            Mountain               Wyoming        434.0           205.0     577601     639.0          0.679



















