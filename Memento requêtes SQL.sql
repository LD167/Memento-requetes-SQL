-- SE CONNECTER A UNE BASE DE DONNEES PSQL (via le Terminal dans Linux)

--- Etape 1 : se connecter à PSQL

sudo -u postgres psql

--- Etape 2 : créer une base de données vide

CREATE DATABASE prenoms;

--- Etape 3 : basculer sur la base de données créée

\c prenoms


-- AFFICHER UNE TABLE CRÉÉE

--- Etape 1 : créer une table vide

CREATE TABLE dataset (prenom VARCHAR, annee_de_naissance INT);

-- Etape 2 : insérer des valeurs dans la table vide

INSERT INTO dataset VALUES ('Eden', 2011), ('Naïm', 2013), ('Rayan', 2014), ('Eva', 2018);

-- Etape 3 : afficher la table

SELECT * FROM dataset;


-- AFFICHER UNE TABLE INCRÉÉE

--- Méthode 1 : UNION

SELECT 'Eden' AS prenom, 2011 AS annee_de_naissance 
UNION
SELECT 'Naïm' AS prenom, 2013 AS annee_de_naissance
UNION
SELECT 'Rayan' AS prenom, 2014 AS annee_de_naissance
UNION
SELECT 'Eva' AS prenom, 2018 AS annee_de_naissance;

--- Méthode 2 : ARRAY + UNNEST

WITH dataset AS (SELECT ARRAY['Eden', 'Naïm', 'Rayan', 'Eva'] AS liste1, ARRAY[2011, 2013, 2014, 2018] AS liste2)
SELECT UNNEST(liste1) AS prenom, UNNEST(liste2) AS annee_de_naissance FROM dataset;

--- Méthode 2 : variante dans le cas d'une colonne à valeur unique

WITH dataset AS (SELECT 'Djazouli' AS nom, ARRAY['Eden', 'Naïm', 'Rayan', 'Eva'] AS liste)
SELECT nom, UNNEST(liste) AS prenom FROM dataset;

