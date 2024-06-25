/*
a Data cleaning steps

1. Remove unnecessary columns by only selecting the ones we need
2. Extract the Youtube Channel names from the first columns
3. Rename the column names

*/

/* step 1 */

/*
SELECT 
    NOMBRE,
    total_subscribers,
    total_videos,
    total_views
FROM 
    top_uk_youtubers_2024
*/
-- this will display only the mentioned columns

/* step 2 */

-- Charindex function
-- contains 2 arg, first the targetted char, 2nd the whole string
-- SELECT CHARINDEX('nice','i went to a nice beach') as pos_of_n_in_nice 
-- this will show 13 as n is in the 13th position
-- we need to find the @ in all the names then we can extract whats on the left side to get the names

-- SELECT CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtubers_data_2024
-- this will show the position of the @ from the names in NOMBRE column

-- Substring
-- this takes 3 arg, first the column from where data will be taken, 2nd the starting point, 3rd the ending point
-- SELECT SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) FROM top_uk_youtubers_data_2024
-- here the -1 will elimnate the @ symbol coming, bt this is not enuf we need to cast this into string type in sql server and for that
/*
CREATE VIEW view_uk_youtubers_2024 AS
-- this creates a SQL view that will only view the data that power BI will use
-- this will be availabe under the views section under the database folders
SELECT 
    CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) as varchar(100)) as channel_name, 
    total_subscribers,
    total_videos,
    total_views

FROM top_uk_youtubers_2024
*/

-- the hundred implies that the string limit is 100 in the channel names, we cant go over that and we named the column and selected the other columns as well

