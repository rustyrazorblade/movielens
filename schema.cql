

CREATE TABLE movies (
    id uuid PRIMARY KEY,
    avg_rating float,
    genres set<text>,
    name text,
    release_date date,
    url text,
    video_release_date date
) ;

CREATE TABLE users (
    id uuid PRIMARY KEY,
    address text,
    age int,
    city text,
    gender text,
    name text,
    occupation text,
    zip text
) ;

CREATE TABLE ratings_by_user (
    user_id uuid,
    movie_id uuid,
    name text,
    rating int,
    ts int,
    PRIMARY KEY (user_id, movie_id)
) WITH CLUSTERING ORDER BY (movie_id ASC);

CREATE TABLE original_movie_map (
    original_movie_id int PRIMARY KEY,
    movie_id uuid
) WITH bloom_filter_fp_chance = 0.01
    ;

CREATE TABLE ratings_by_movie (
    movie_id uuid,
    user_id uuid,
    rating int,
    ts int,
    PRIMARY KEY (movie_id, user_id)
) WITH CLUSTERING ORDER BY (user_id ASC)
  ;
