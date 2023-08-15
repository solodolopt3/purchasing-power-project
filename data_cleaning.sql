-- Data Cleaning
CREATE DATABASE projects;

USE projects;

SELECT * FROM ppp;

ALTER TABLE ppp
CHANGE COLUMN ï»¿Country Country VARCHAR(30) NULL;

ALTER TABLE ppp
CHANGE `Country Code` CountryCode VARCHAR(30);

UPDATE ppp
SET PPP = ROUND(PPP, 3);