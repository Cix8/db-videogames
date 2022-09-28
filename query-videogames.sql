-- ++++++QUERY CON JOIN++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ****** BONUS **********

-- 13- Selezionare le categorie dei videogame i quali hanno una media recensioni inferiore a 1.5 (10)
SELECT DISTINCT categories.id, categories.name
FROM reviews
INNER JOIN videogames
ON videogames.id = reviews.videogame_id
INNER JOIN category_videogame
ON category_videogame.videogame_id = videogames.id
INNER JOIN categories
ON categories.id = category_videogame.category_id
GROUP BY videogames.id, categories.id, categories.name
HAVING AVG(reviews.rating) < 1.5;

-- 12- Selezionare la software house che ha vinto più premi tra il 2015 e il 2016 (software house id : 1)
SELECT TOP 1 COUNT(award_videogame.id) AS award_counter, software_houses.id AS software_house_id, software_houses.name AS software_house_name
FROM award_videogame
INNER JOIN videogames
ON videogames.id = award_videogame.videogame_id
INNER JOIN software_houses
ON software_houses.id = videogames.software_house_id
WHERE award_videogame.year >= 2015
AND award_videogame.year <= 2016
GROUP BY software_houses.id, software_houses.name
ORDER BY award_counter DESC;

-- 11- Selezionare i dati del videogame (id, name, release_date, totale recensioni) con più recensioni (videogame id : 398)
SELECT TOP 1 COUNT(reviews.id) AS reviews_counter, videogames.id
FROM reviews
INNER JOIN videogames
ON videogames.id = reviews.videogame_id
GROUP BY videogames.id
ORDER BY reviews_counter DESC;

-- 10- Selezionare i dati della prima software house che ha rilasciato un gioco, assieme ai dati del gioco stesso (software house id : 5)
SELECT TOP 1 software_houses.id, software_houses.name
FROM software_houses
INNER JOIN videogames
ON videogames.software_house_id = software_houses.id
ORDER BY videogames.release_date ASC;

-- ****** BONUS **********

-- 9- Selezionare i giocatori che hanno giocato al gioco più atteso del 2018 in un torneo del 2019 (3306)
SELECT players.id, players.nickname
FROM players
INNER JOIN player_tournament
ON player_tournament.player_id = players.id
INNER JOIN tournaments
ON tournaments.id = player_tournament.tournament_id
INNER JOIN tournament_videogame
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE (awards.name LIKE '%atteso%' AND award_videogame.year = 2018)
AND tournaments.year = 2019;

-- 8- Selezionare le città in cui è stato giocato il gioco dell'anno del 2018 (36)
SELECT tournaments.city
FROM tournaments
INNER JOIN tournament_videogame
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN award_videogame
ON award_videogame.videogame_id = videogames.id
INNER JOIN awards
ON awards.id = award_videogame.award_id
WHERE awards.name LIKE '%anno%'
AND award_videogame.year = 2018;

-- 7- Selezionare quali giochi erano presenti nei tornei nei quali hanno partecipato i giocatori il cui nome inizia per 'S' (474)
SELECT DISTINCT videogames.id, videogames.name
FROM players
INNER JOIN player_tournament
ON player_tournament.player_id = players.id
INNER JOIN tournaments
ON tournaments.id = player_tournament.tournament_id
INNER JOIN tournament_videogame
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
WHERE players.name LIKE 's%';

-- 6- Selezionare categorie e classificazioni PEGI dei videogiochi che hanno ricevuto recensioni da 4 e 5 stelle, mostrandole una sola volta (3363)
SELECT DISTINCT categories.name, pegi_labels.name, videogames.name
FROM reviews
INNER JOIN videogames
ON videogames.id = reviews.videogame_id
INNER JOIN category_videogame
ON category_videogame.videogame_id = videogames.id
INNER JOIN categories
ON categories.id = category_videogame.category_id
INNER JOIN pegi_label_videogame
ON pegi_label_videogame.videogame_id = videogames.id
INNER JOIN pegi_labels
ON pegi_labels.id = pegi_label_videogame.pegi_label_id
WHERE reviews.rating >= 4;

-- 5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
SELECT awards.name AS awards_name, videogames.name AS videogame_name, software_houses.name AS software_house_name
FROM awards
INNER JOIN award_videogame
ON award_videogame.award_id = awards.id
INNER JOIN videogames
ON videogames.id = award_videogame.videogame_id
INNER JOIN software_houses
ON software_houses.id = videogames.software_house_id;

-- 4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
SELECT DISTINCT software_houses.id, software_houses.name
FROM videogames
INNER JOIN software_houses
ON software_houses.id = videogames.software_house_id
WHERE YEAR(videogames.release_date) > 2020;

-- 3- Mostrare le categorie di ogni videogioco (1718)
SELECT videogames.name AS videogame_name, categories.name AS category_name
FROM videogames
INNER JOIN category_videogame
ON category_videogame.videogame_id = videogames.id
INNER JOIN categories
ON categories.id = category_videogame.category_id;

-- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)
SELECT DISTINCT tournament_videogame.videogame_id, videogames.name
FROM tournaments
INNER JOIN tournament_videogame
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN videogames
ON videogames.id = tournament_videogame.videogame_id
WHERE tournaments.year = 2016;

-- 1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
SELECT DISTINCT reviews.player_id, players.nickname
FROM reviews
INNER JOIN players
ON players.id = reviews.player_id;

-- ++++++QUERY CON JOIN++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ++++++QUERY CON GROUP BY++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- 6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
SELECT AVG(rating) AS avg_rating, videogame_id
FROM reviews
GROUP BY videogame_id;

-- 5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
SELECT COUNT(videogame_id) AS videogame_counter, device_id
FROM device_videogame
GROUP BY device_id;

-- 4- Mostrare il numero di videogiochi rilasciati ogni anno (11)
SELECT COUNT(id) AS videogame_counter, YEAR(release_date) AS release_year
FROM videogames
GROUP BY YEAR(release_date);

-- 3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
SELECT COUNT(videogame_id) AS videogame_counter, pegi_label_id 
FROM pegi_label_videogame
GROUP BY pegi_label_id;

-- 2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
SELECT COUNT(id) AS reviews_counter, videogame_id
FROM reviews
GROUP BY videogame_id;

-- 1- Contare quante software house ci sono per ogni paese (3)
SELECT COUNT(id) AS software_house_counter, country
FROM software_houses
GROUP BY country;

-- ++++++QUERY CON GROUP BY++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ++++++QUERY SU SINGOLA TABELLA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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

-- ++++++QUERY SU SINGOLA TABELLA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++