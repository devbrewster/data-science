## PANDAS CHEATSHEET
`.head()` returns the first few rows of a DataFrame<br />
`.info()` shows information on each of the columns, such as the data type and number of missing values<br />
`.shape()` returns the number of rows and columns of the DataFrame<br />
`.describe()` calculates a few summary statistics for each column<br />

    print(homelessness.head())
    region       state  individuals  family_members  state_pop
    0  East South Central     Alabama       2570.0           864.0    4887681
    1             Pacific      Alaska       1434.0           582.0     735139
    2            Mountain     Arizona       7259.0          2606.0    7158024
    3  West South Central    Arkansas       2280.0           432.0    3009733
    4             Pacific  California     109008.0         20964.0   39461588
