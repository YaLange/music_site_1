-- Table: album

-- DROP TABLE IF EXISTS album;

CREATE TABLE IF NOT EXISTS album
(
    album_id serial NOT NULL ,
    name text  NOT NULL,
    creation_year integer NOT NULL,
    CONSTRAINT album_pkey PRIMARY KEY (album_id)
);
-- Table: collection

-- DROP TABLE IF EXISTS collection;

CREATE TABLE IF NOT EXISTS collection
(
    collection_id serial NOT NULL ,
    name text  NOT NULL,
    creation_year integer NOT NULL,
    CONSTRAINT collection_pkey PRIMARY KEY (collection_id)
);

-- Table: executor

-- DROP TABLE IF EXISTS executor;

CREATE TABLE IF NOT EXISTS executor
(
    executor_id serial NOT NULL ,
    name text NOT NULL,
    CONSTRAINT executor_pkey PRIMARY KEY (executor_id)
);
-- Table: genre

-- DROP TABLE IF EXISTS genre;

CREATE TABLE IF NOT EXISTS genre
(
    genre_id serial NOT NULL ,
    name text  NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (genre_id)
);


------------------------------------------------
-- Table: track

-- DROP TABLE IF EXISTS track;

CREATE TABLE IF NOT EXISTS track
(
    track_id serial NOT NULL ,
    name text  NOT NULL,
    duration time without time zone NOT NULL DEFAULT '00:00:00'::time without time zone,
    album_id integer,
    CONSTRAINT track_pkey PRIMARY KEY (track_id),
    CONSTRAINT album_fk FOREIGN KEY (album_id)
        REFERENCES album (album_id)
);
-- Table: album_executor

-- DROP TABLE IF EXISTS album_executor;

CREATE TABLE IF NOT EXISTS album_executor
(
    album_executor_id serial NOT NULL ,
    album_id integer,
    executor_id integer,
    CONSTRAINT album_executor_pkey PRIMARY KEY (album_executor_id),
    CONSTRAINT album_fk FOREIGN KEY (album_id)
        REFERENCES album (album_id) ,
    CONSTRAINT executor_fk FOREIGN KEY (executor_id)
        REFERENCES executor (executor_id) 
);

-- Table: collection_track

-- DROP TABLE IF EXISTS collection_track;

CREATE TABLE IF NOT EXISTS collection_track
(
    collection_track_id serial NOT NULL ,
    collection_id integer,
    track_id integer,
    CONSTRAINT collection_track_pkey PRIMARY KEY (collection_track_id),
    CONSTRAINT collection_fk FOREIGN KEY (collection_id)
        REFERENCES collection (collection_id),
    CONSTRAINT track_fk FOREIGN KEY (track_id)
        REFERENCES track (track_id)
);

-- Table: genre_executor

-- DROP TABLE IF EXISTS genre_executor;

CREATE TABLE IF NOT EXISTS genre_executor
(
    genre_executor_id serial NOT NULL ,
    genre_id integer,
    executor_id integer,
    CONSTRAINT genre_executor_pkey PRIMARY KEY (genre_executor_id),
    CONSTRAINT executor_fk FOREIGN KEY (executor_id)
        REFERENCES executor (executor_id),
    CONSTRAINT genre_fk FOREIGN KEY (genre_id)
        REFERENCES genre (genre_id) 
);
