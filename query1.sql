# Find the title, the genre and the artist of albums that were recorded after 1990
SELECT albums.name, genre, performers.name
FROM albums JOIN performers ON albums.performer_id = performers.id
WHERE year_recorded > 1990
