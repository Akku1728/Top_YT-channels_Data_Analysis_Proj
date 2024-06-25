/*

Data Quality Checks
1. The data needs to be 100 records of Youtube Channels (row count checks)
2. The data needs 4 fields (column count test)
3. The channel name column must be string format, and the other data need to be numerical data type (data type check)
4. Each record must be unique in the dataset (duplicate count check)

check 1: Row Count - 100 (passed)
check 2: Column count - 4 (passed)

DATA TYPES
check 3: Channel name = VARCHAR (passed)
         total subscribers, views, videos = INTEGER

check 4: Duplicate Count = 0 (passed)

*/


-- ROW COUNT CHECK
SELECT 
    COUNT(*) as no_of_rows
FROM 
    view_uk_youtubers_2024
-- this will give 100


-- COLUMN COUNT CHECK
SELECT
    COUNT(*) as column_count    
FROM
    INFORMATION_SCHEMA.COLUMNS
    -- this basically knows all information about the database, columns rows etc etc, and the .column will check the column specific
 WHERE
    Table_name = 'view_uk_youtubers_2024'
-- this will give 4


-- DATA TYPE CHECK
SELECT
    COLUMN_NAME,  -- this names we got when ww ran the prev function with only: * in place of: COUNT(*) as column_count 
    DATA_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'view_uk_youtubers_2024'
-- this will view the data types


-- DUPLICATE CHECK
SELECT
    channel_name, 
    COUNT(*) as duplicate_count
FROM 
    view_uk_youtubers_2024
GROUP BY 
    channel_name
HAVING 
    COUNT(*) > 1 -- having pairing more than 1
-- this returns nothing which means no duplicate



