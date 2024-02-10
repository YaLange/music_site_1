INSERT INTO executor(
	name)
	VALUES ('Лазарев Сергей'), ('Shaman'), ('Кипелов Валерий'), ('Jay-Z');

INSERT INTO genre(
	 name)
	VALUES ('pop'), ('rock'), ('hiphop');

INSERT INTO album(
	name, creation_year)
	VALUES ('Best', 2020), ('Love', 2022), ('Cool', 2024);

INSERT INTO track(
	name, duration, album_id)
	VALUES ('Это все она', '00:07:05', 1),
	('В самое сердце мой', '00:04:25', 1),
	('Я свободен', '00:08:26', 2),
	('Непокоренный', '00:10:35', 2),
	('Yong forever', '00:06:40', 3),
	('Song cry my', '00:05:23', 3),
    ('Я русский', '00:06:40', 2);

	INSERT INTO track(
	name, duration, album_id)
	VALUES 
	('my own', '00:04:25', 1),
	('own my', '00:08:26', 2),
	('my', '00:10:35', 2),
	('oh my god', '00:06:40', 3),
	('myself', '00:05:23', 3),
    ('by myself', '00:06:40', 2),
	('bemy self', '00:06:40', 3),
	('myself by', '00:06:40', 3),
	('by myself by', '00:05:23', 3),
    ('beemy', '00:06:40', 2),
	('premyne', '00:06:40', 2);

INSERT INTO collection(
	name, creation_year)
	VALUES ('Лучшие песни', 2022),
	('Свободен', 2020),
	('Hiphop', 2018),
	('Разное', 2008);


INSERT INTO genre_executor(
	genre_id, executor_id)
	VALUES (1, 1),
	(1, 2),
	(2, 3),
	(3, 4);

INSERT INTO album_executor(
	album_id, executor_id)
	VALUES (1, 1),
	(1, 2),
	(2, 3),
	(3, 4);

INSERT INTO collection_track(
	track_id, collection_id)
	VALUES (1, 1),
	(2, 2),
	(3, 3),
	(4, 2),
	(5, 1),
	(6, 3);