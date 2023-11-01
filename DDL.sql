SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS spotify
CHARACTER SET utf8;

USE spotify;

CREATE TABLE IF NOT EXISTS spotify (
  IDSpotify INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL
);



CREATE TABLE IF NOT EXISTS free_user (
  IDfree_user INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  Nombre VARCHAR(100) NOT NULL,
  email VARCHAR(30) NOT NULL,
  id VARCHAR(30) NOT NULL,
  birthday VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL,
  passwords VARCHAR(30) NOT NULL,
  Postal_code VARCHAR(30) NOT NULL,
  sex VARCHAR(30) NOT NULL,
  
  FOREIGN KEY (IDSpotify) REFERENCES categorias (IDSpotify) 
);

CREATE TABLE IF NOT EXISTS Premium_user (
  IDPremium_user INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  Nombre VARCHAR(100) NOT NULL,
  email VARCHAR(30) NOT NULL,
  id VARCHAR(30) NOT NULL,
  birthday VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL,
  passwords VARCHAR(30) NOT NULL,
  Postal_code VARCHAR(30) NOT NULL,
  sex VARCHAR(30) NOT NULL,
  
  FOREIGN KEY (IDSpotify) REFERENCES categorias (IDSpotify) 
);
CREATE TABLE IF NOT EXISTS suscripciones (
  IDsuscripciones INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Fecha_inicio VARCHAR(100) NOT NULL,
  Fecha_renovacion VARCHAR(255) NOT NULL,
  
  FOREIGN KEY (IDPremium_user) REFERENCES categorias (IDPremium_user) 
);

CREATE TABLE IF NOT EXISTS paypal (
  IDpaypal INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (IDsuscripciones) REFERENCES categorias (IDsuscripciones) 
);

CREATE TABLE IF NOT EXISTS credit_card (
  IDcredit_card INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  YYYY_MM VARCHAR(100) NOT NULL,
  Code_card VARCHAR(100) NOT NULL,
  card_number VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (IDsuscripciones) REFERENCES categorias (IDsuscripciones) 
);

CREATE TABLE IF NOT EXISTS playlist_active (
  IDplaylist_active INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  playlist_id VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  song_number VARCHAR(100) NOT NULL,
  fecha_de_creacion VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (IDPremium_user) REFERENCES categorias (IDPremium_user), 
  FOREIGN KEY (IDfree_user) REFERENCES categorias (IDfree_user) 
);

CREATE TABLE IF NOT EXISTS playlist_bin (
  IDplaylist_bin INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  modified_date VARCHAR(100) NOT NULL,
  
  FOREIGN KEY (IDplaylist_active) REFERENCES categorias (IDplaylist_active)
);

CREATE TABLE IF NOT EXISTS artist (
  IDartist INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  artist_id VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  image VARCHAR(100) NOT NULL,

  FOREIGN KEY (IDplaylist_active) REFERENCES categorias (IDplaylist_active)
);

CREATE TABLE IF NOT EXISTS album (
  IDalbum INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  album_id VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  image VARCHAR(100) NOT NULL,
  fecha_lanzamiento VARCHAR(100) NOT NULL,

  FOREIGN KEY (IDartist) REFERENCES categorias (IDartist)
);

CREATE TABLE IF NOT EXISTS song (
  IDsong INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  song_id VARCHAR(100) NOT NULL,
  title VARCHAR(100) NOT NULL,
  num_reproducciones VARCHAR(100) NOT NULL,

  FOREIGN KEY (IDalbum) REFERENCES categorias (IDalbum)
);

CREATE TABLE IF NOT EXISTS favorites (
  IDfavorites INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

  FOREIGN KEY (IDsong) REFERENCES categorias (IDsong),
  FOREIGN KEY (IDalbum) REFERENCES categorias (IDalbum)
);