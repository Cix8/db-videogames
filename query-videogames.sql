-- ++++++QUERY SU SINGOLA TABELLA++++++


-- ***BONUS***

-- 12- Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13)
SELECT COUNT(id) AS videogame_counter_2018
FROM videogames
WHERE software_house_id = 1
AND release_date LIKE '%2018%';

-- 11- Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3)
SELECT COUNT(videogame_id) AS review_number, AVG(rating) AS avg_rating
FROM reviews
WHERE videogame_id = 412;

-- ***BONUS***

-- 10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)
SELECT DISTINCT videogame_id
FROM reviews
WHERE rating = 5;

-- 9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
SELECT *
FROM videogames
WHERE release_date LIKE '%2020%';

-- 8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
SELECT *
FROM reviews
WHERE rating >= 2
AND rating <= 4;

-- 7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
SELECT DISTINCT videogame_id
FROM category_videogame
WHERE category_id = 2
OR category_id = 6;

-- 6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
SELECT *
FROM awards
WHERE description LIKE '%facere%';

-- 5- Contare quanti tornei ci sono stati nell'anno 2015 (9)
SELECT *
FROM tournaments
WHERE year = 2015;

-- 4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
SELECT *
FROM reviews
WHERE player_id = 800;

-- 3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
SELECT *
FROM players
WHERE name LIKE '%a';

-- 2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
SELECT *
FROM players
WHERE city = 'Rogahnland';

-- 1- Selezionare tutte le software house americane (3)
SELECT * 
FROM software_houses 
WHERE country = 'united states';


-- ++++++QUERY SU SINGOLA TABELLA++++++