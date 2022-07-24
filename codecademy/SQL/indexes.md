`Indexes` are a powerful tool used in the background of a database to speed up querying. Indexes power queries by providing a method to quickly lookup the requested data.

    CREATE INDEX <index_name>
    ON <table_name> (column1, column2, ...)
    
    CREATE INDEX customers_by_phone
    ON customers (phone_number)
