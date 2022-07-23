# **Manipulation**

| Keywords | Description |
| -------- | -------- |
| `CREATE TABLE` | creates a new table. |
| `INSERT INTO` | adds new row to a table. |
| `SELECT` | queries data from a table. |
| `ALTER TABLE` | changes an existing table. |
| `UPDATE` | edits a row in a table. |
| `DELETE FROM` | deletes rows from a table. |

#### Common data types in `SQL`
    Integers - Whole numbers.<br />
    Text - Text strings.<br />
    Date - a date.<br />
    Real - a decimal number.<br />

## **Statements**
A statement is text that the database recognizes as a valid command. Statements always end in a semicolon `;`.<br />

## **Create**
`CREATE` statements allow us to create a new table in the database. <br />
    
    CREATE TABLE celebs (
      id INTEGER,
      name TEXT,
      age INTEGER
    );
    
    SELECT * FROM celebs;
   ![image](https://user-images.githubusercontent.com/40252813/180617695-c0dfecad-64ac-4ac3-a507-3e8b77913d9e.png)

## **Insert**
`INSERT` inserts a new row into a table <br />
`VALUES` indicates the data being inserted<br />

    INSERT INTO celebs (id, name, age) 
    VALUES (1, 'Justin Bieber', 22);    
   ![image](https://user-images.githubusercontent.com/40252813/180617652-b3371f8e-6405-4cab-b2de-3fdb02376e59.png)

## **Select**
`SELECT` used to fetch data from a database.<br />
  `*` is a wildcard selecting every column in a table<br />
  
    SELECT * FROM celebs;
   ![image](https://user-images.githubusercontent.com/40252813/180617598-46562a1f-9244-4327-af36-b18a8a33544f.png)
  
## **Alter**
`ALTER` adds a new column to a table.<br />
  `ALTER TABLE` lets you make the specified changes.<br />
  `ADD COLUMN` lets you add a new column to a table:<br />  
 
    ALTER TABLE celebs 
    ADD COLUMN twitter_handle TEXT; 

    SELECT * FROM celebs;
   ![image](https://user-images.githubusercontent.com/40252813/180617582-82ee4bd7-8d4b-4993-b17f-de113fc3732f.png)

## **Update**
`UPDATE` edits row in a table.<br />
  `SET` indicates the column to edit
  `WHERE` indicates which row(s) to update with the new column value.

    UPDATE celebs 
    SET twitter_handle = '@taylorswift13' 
    WHERE id = 4; 

    SELECT * FROM celebs;
   ![image](https://user-images.githubusercontent.com/40252813/180617527-0dbd44af-fd26-4601-8765-b8abde331ffa.png)

## **Delete**
`DELETE` deletes one or more rows froma table<br />
  `IS NULL` is a condition in SQL that returns true when the value is `NULL`<br />

    DELETE FROM celebs 
    WHERE twitter_handle IS NULL;

    SELECT * FROM celebs; 
  ![image](https://user-images.githubusercontent.com/40252813/180617837-72d52a19-21fc-4b0f-b729-d3ce87f613ab.png)

## **Constraints**
`Constraints` add information about how a column can be used are invoked after specifying the data type for a column. Can be used to tell the database to reject inserted data that does not adhere to a certain restriction.<br />
  `PRIMARY KEY` columns can be used to uniquely identify the row.<br />
  `UNIQUE` columns have a different value for every row.<br />
  `NOT NULL` columns must have a value. Attempts to insert a row without a value for a `NOT NULL` columns will result in a constraint violation and the new row will not be inserted.<br />
  `DEFAULT` columns take an additional argument that will be the assumed value for an inserted row if the new row does not specify a value for that column. <br />
  
     CREATE TABLE awards (
      id INTEGER PRIMARY KEY,
      recipient TEXT NOT NULL,
      award_name TEXT DEFAULT 'Grammy'
    );

CHEATSHEET:
[Manipulation](https://www.codecademy.com/learn/learn-sql/modules/learn-sql-manipulation/cheatsheet)


 
 
 
 
 
 
 
 
 
