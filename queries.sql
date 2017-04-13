/*
Query all of the entries in the Genre table
*/
SELECT * FROM Genre

/*
Using the INSERT statement, add one of your favorite artists to the Artist table.
*/
INSERT INTO Artist VALUES (NULL, 'John Coltrane', 1955);

/*
Using the INSERT statement, add one, or more, albums by your artist to the Album table.
*/
INSERT INTO Album VALUES (NULL, 'Giant Steps', '01/27/1960', 2223, 'Atlantic', 28, 4);

/*
Using the INSERT statement, add some songs that are on that album to the Song table.
*/
INSERT INTO Song VALUES (NULL, 'Giant Steps', '01/27/1960', 283, 4, 28, 23);
INSERT INTO Song VALUES (NULL, 'Cousin Mary', '01/27/1960', 345, 4, 28, 23);
INSERT INTO Song VALUES (NULL, 'Countdown', '01/27/1960', 141, 4, 28, 23);
INSERT INTO Song VALUES (NULL, 'Spiral', '01/27/1960', 356, 4, 28, 23);

/*
Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
*/
Select Song.Title 'Song Title', Album.Title 'Album Title', Artist.ArtistName 'Artist Name'
FROM Song 
LEFT JOIN Album 
ON Song.AlbumId = Album.AlbumId 
LEFT JOIN Artist 
ON Song.ArtistId = Artist.ArtistId
WHERE Artist.ArtistName = 'John Coltrane'

/*
Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.
*/
SELECT Album.Title 'Album Title', COUNT(Song.SongId)'Song Count'
FROM Song, Album
WHERE Song.AlbumId = Album.AlbumId
GROUP BY Album.Title

/*
Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.
*/
SELECT a.ArtistName'Artist Name', COUNT(s.SongId)'Song Count'
FROM Song s, Artist a
WHERE s.ArtistId = a.ArtistId
GROUP BY a.ArtistName

/*
Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.
*/
SELECT g.label 'Genre', COUNT(s.songId) 'Count'
FROM Genre g, Song s
WHERE g.GenreId = s.GenreId
GROUP BY s.GenreId

/*
Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.
*/
SELECT MAX(a.albumlength)'Album Length in Seconds', a.title 'Album Title'
FROM Album a

/*
Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.
*/
SELECT MAX(s.SongLength) 'Song Length in Seconds', s.title 'Song Title'
FROM Song s

/*
Modify the previous query to also display the title of the album.
*/
SELECT MAX(s.SongLength) 'Song Length in Seconds', s.title 'Song Title', a.title 'Album Title'
FROM Song s, Album a
WHERE s.AlbumId = a.AlbumId