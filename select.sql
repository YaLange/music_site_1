-- Название и продолжительность самого продлительного трека.
select name, duration
from track
order by duration desc
limit 1;

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name 
FROM track 
WHERE duration >= '00:03:30';

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name 
FROM collection 
WHERE creation_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова.
SELECT name 
FROM executor 
WHERE cardinality(regexp_split_to_array(name, '\s+')) = 1 ;

--Название треков, которые содержат слово «мой» или «my».
SELECT name 
FROM track 
WHERE name ILIKE 'my %' OR name ILIKE '% my' OR name ILIKE '% my %' OR name ILIKE 'my' OR
	  name ILIKE 'мой %' OR name ILIKE '% мой' OR name ILIKE '% мой %' OR name ILIKE 'мой'	

-----------------
--Количество исполнителей в каждом жанре.
SELECT COUNT(*) as executor_cnt, g.name
FROM executor e
INNER JOIN genre_executor ge ON e.executor_id = ge.executor_id 
INNER JOIN genre g ON g.genre_id = ge.genre_id 
GROUP BY g.name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(*) as track_cnt
FROM track t
INNER JOIN album a ON t.album_id = a.album_id
WHERE a.creation_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT AVG(duration) as track_avg, a.name
FROM track t
INNER JOIN album a ON t.album_id = a.album_id
GROUP BY a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT name
FROM executor 
WHERE executor_id NOT IN
	(SELECT e.executor_id
	FROM executor e
	INNER JOIN album_executor ae ON e.executor_id = ae.executor_id
	INNER JOIN album a ON a.album_id = ae.album_id
	WHERE creation_year = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT c.name 
FROM collection c
INNER JOIN collection_track ct ON ct.collection_id = c.collection_id
INNER JOIN track t ON t.track_id  = ct.track_id
INNER JOIN album a ON t.album_id = a.album_id
INNER JOIN album_executor ae ON ae.album_id = a.album_id
INNER JOIN executor e ON e.executor_id = ae.executor_id
WHERE e.name = 'Лазарев Сергей';