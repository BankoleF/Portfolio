--Users (USER_ID, FirstName, LastName, Registration_Date)
--Artists (ARTIST_ID, StageName, Genre, Age, Gender)
--Followers (#User_ID, #Artist_ID, Follow_Date)
--Playlists (PLAYLIST_ID, Playlist_Name, Likes, #User_ID)
--Albums (ALBUM_ID, Album_Name, Number_Of_Songs, #Artist_ID)
--Tracks (TRACK_ID, Track_Genre, Runtime, #Album_ID, #Artist_ID)
 
CREATE TABLE USERS(
	User_ID VARCHAR(50) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Registration_Date DATE NOT NULL

);

CREATE TABLE ARTISTS(
	Artist_ID VARCHAR(25) PRIMARY KEY,
	Stage_Name VARCHAR(30) NOT NULL,
	Genre VARCHAR(20) NOT NULL,
	Age INT, 
	Gender VARCHAR(7) NOT NULL 

);

CREATE TABLE FOLLOWERS(
	Follow_Date DATE,
	User_ID VARCHAR(50),
	Artist_ID VARCHAR(25),
	FOREIGN KEY (User_ID) REFERENCES USERS(User_ID),
	FOREIGN KEY (Artist_ID) REFERENCES ARTISTS(Artist_ID)

);

CREATE TABLE PLAYLISTS(
	Playlist_ID INT PRIMARY KEY,
	Playlist_Name VARCHAR(30),
	Likes INT,
	User_ID VARCHAR(50),
	FOREIGN KEY (User_ID) REFERENCES USERS(User_ID)
	
);

CREATE TABLE ALBUMS(
	Album_ID VARCHAR(15) PRIMARY KEY,
	Album_Name VARCHAR(20) NOT NULL,
	Number_Of_Songs INT CHECK(Number_of_songs >5),
	Artist_ID VARCHAR(25),
	FOREIGN KEY (Artist_ID) REFERENCES ARTISTS(Artist_ID)
	
);

CREATE TABLE TRACKS(
	Track_ID INT PRIMARY KEY,
	Track_Genre VARCHAR(20) NOT NULL,
	Runtime INT NOT NULL,
	Album_ID VARCHAR(15),
	Artist_ID VARCHAR(25),
	FOREIGN KEY (Album_ID) REFERENCES ALBUMS(Album_ID),
	FOREIGN KEY (Artist_ID) REFERENCES ARTISTS(Artist_ID)

);


--Populate
INSERT INTO USERS (User_ID, FirstName, LastName, Registration_Date)
VALUES
	('AA01', 'David', 'Adeyemi', '2023-01-04'),
	('AA02', 'John', 'Gbenga', '2023-01-04'),
	('AA03', 'Bode', 'Dayo', '2023-01-05'),
	('AA04', 'Daniel', 'Ola', '2023-01-05'),
	('AA05', 'Bayo', 'Kehnide', '2023-01-13'),
	('AA06', 'Deji', 'Dayo', '2023-01-15'),
	('AA07', 'Devi', 'Tola', '2023-01-22'),
	('AA08', 'Matthew', 'James', '2023-02-10'),
	('AA09', 'Ayo', 'Femi', '2023-02-12'),
	('AA10', 'Tunde', 'James', '2023-03-18');
	
INSERT INTO ARTISTS (Artist_ID, Stage_Name, Genre, Age, Gender)
VALUES
	('AS01', 'David O', 'Hip-Hop', 22, 'Male'),
	('AS02', 'Wizkid', 'Rap', 24, 'Female'),
	('AS03', 'Burna Boy', 'Afro Beats', 25, 'Male'),
	('AS04', 'Simi', 'Classics', 20, 'Female'),
	('AS05', 'Jentry', 'Hip-Hop', 29, 'Female'),
	('AS06', 'Bayo', 'Classics', 36, 'Male'),
	('AS07', 'Divine', 'Rap', 40, 'Male'),
	('AS08', 'Leke', 'Classics', 32, 'Female'),
	('AS09', 'Kevin', 'Pop', 29, 'Female'),
	('AS10', 'Gbemi', 'Reggie', 26, 'Male');
	
INSERT INTO Followers (User_ID, Artist_ID, Follow_Date)
VALUES
	('AA01', 'AS01', '2023-03-03'),
	('AA06', 'AS02', '2023-02-04'),
	('AA05', 'AS02', '2023-05-10'),
	('AA09', 'AS03', '2023-08-06'),
	('AA03', 'AS10', '2023-12-11'),
	('AA08', 'AS09', '2023-03-03'),
	('AA04', 'AS07', '2023-02-04'),
	('AA01', 'AS03', '2023-04-19'),
	('AA10', 'AS08', '2023-11-26'),
	('AA06', 'AS03', '2023-10-21');
	
INSERT INTO PLAYLISTS (Playlist_ID, Playlist_Name, Likes, User_ID)
VALUES
	(23, 'Gaming', 12034, 'AA03'),
	(50, 'Sad', 322000, 'AA01'),
	(3167, 'Top 2023', 5000, 'AA02'),
	(4289, '2022 Hits', 1323000, 'AA01'),
	(7891, 'Gaming', 890745, 'AA10'),
	(2349, 'Party', 321456, 'AA09'),
	(4007, 'Afro 2023', 1997352, 'AA05'),
	(1947, 'Nigerian Hits', 4562781, 'AA03'),
	(4207, 'Afro 2023', 647382, 'AA06'),
	(32, 'Gaming', 4627281, 'AA08');
	
INSERT INTO ALBUMS (Album_ID, Album_Name, Number_Of_Songs, Artist_ID)
VALUES
	('AL125', 'Higher', 9, 'AS05'),
	('AL032', 'Low', 7, 'AS06'),
	('AL001', 'Africa', 10, 'AS02'),
	('AL056', 'Sweeter', 13, 'AS01'),
	('AL345', 'Two Way', 9, 'AS02'),
	('AL532', 'Real', 8, 'AS01'),
	('AL231', 'Fast', 12, 'AS10'),
	('AL676', 'Harrow', 19, 'AS04'),
	('AL238', 'Fast', 20, 'AS03'),
	('AL68', 'Harrow', 17, 'AS07');
	

INSERT INTO TRACKS (Track_ID, Track_Genre, Runtime, Album_ID, Artist_ID)
VALUES
	(10043, 'Hip-Hop', 120, 'AL125', 'AS03'),
	(12045, 'Rap', 89, NULL, 'AS02'),
	(176, 'Classics', 115, 'AL056', 'AS01'),
	(34, 'Afro', 126, NULL, 'AS04'),
	(12543, 'Reggie', 60, 'AL125', 'AS07'),
	(16825, 'Rap', 127, 'AL231', 'AS09'),
	(146, 'Classics', 132, 'AL056', 'AS10'),
	(35, 'Gospel', 180, NULL, 'AS07'),
	(5678, 'Funk', 145, 'AL056', 'AS04'),
	(3, 'Afro', 126, 'AL676', 'AS07');
	
--Retrive data from database
SELECT * FROM TRACKS

SELECT * FROM ARTISTS
WHERE Genre = 'Classics'


SELECT * FROM ARTISTS
ORDER BY Age DESC;

SELECT Playlist_Name, USERS.User_ID, Likes
FROM USERS
INNER JOIN PLAYLISTS ON USERS.User_ID = PLAYLISTS.User_ID;