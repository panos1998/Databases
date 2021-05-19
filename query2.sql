# Find the number of albums that were recorded after 1990
SELECT COUNT(id) FROM albums
WHERE year_recorded > 1990
