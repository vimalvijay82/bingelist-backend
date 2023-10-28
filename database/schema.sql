CREATE DATABASE bingelist;

CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    watch_lid INTEGER REFERENCES lists(list_id),
    fav_lid INTEGER REFERENCES lists(list_id)
);

CREATE TABLE user_list(
    user_id INTEGER REFERENCES users(user_id),
    list_id INTEGER REFERENCES lists(list_id)
);

CREATE TABLE lists(
    list_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    list_emoji VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER REFERENCES users(user_id)
);

CREATE TABLE movies(
    movie_id INT PRIMARY KEY,
    type BOOLEAN,
    title VARCHAR(255),
    description VARCHAR(255),
    image_url VARCHAR(255),
    duration INTEGER,
    language VARCHAR(255),
    trailer_url VARCHAR(255),
    imdb_rating DECIMAL,
    director VARCHAR(255),
    casts JSON,
    cast_img JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE list_movies(
    list_id INTEGER REFERENCES lists(list_id),
    movie_id INT,
    type BOOLEAN
);

CREATE TABLE movies_genre(
    movie_id INT,
    genre_id INTEGER REFERENCES genres(genres_id)
);

CREATE TABLE genres(
    genres_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);