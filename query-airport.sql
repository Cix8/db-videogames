﻿-- ++++++ QUERY CON JOIN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- 6- Selezionare tutti gli id dei voli che hanno almeno un passeggero il cui cognome inizia con 'L' (966)
SELECT DISTINCT flights.id
FROM flights
INNER JOIN flight_passenger
ON flight_passenger.flight_id = flights.id
INNER JOIN passengers
ON passengers.id = flight_passenger.passenger_id
WHERE EXISTS(SELECT * FROM passengers WHERE passengers.lastname LIKE 'L%');

-- 5- Selezionare tutti i voli che partono da 'Charleneland' e arrivano a 'Mauricestad' (3)
SELECT flights.id, flights.number, departure.city AS departure_city, arrival.city AS arrival_city
FROM flights
INNER JOIN airports AS departure
ON departure.id = flights.departure_airport_id
INNER JOIN airports AS arrival
ON arrival.id = flights.arrival_airport_id
WHERE departure.city = 'Charleneland'
AND arrival.city = 'Mauricestad';

-- 4- Selezionare tutti i voli con i relativi passeggeri (65296)
SELECT flights.id, flights.number, passengers.id, passengers.name, passengers.lastname
FROM flights
INNER JOIN flight_passenger
ON flight_passenger.flight_id = flights.id
INNER JOIN passengers
ON passengers.id = flight_passenger.passenger_id;

-- 3- Selezionare tutti i passeggeri che hanno usato come documento 'Passport'(775)
SELECT DISTINCT passengers.id, passengers.name, passengers.lastname
FROM passengers
INNER JOIN document_type_passenger
ON document_type_passenger.passenger_id = passengers.id
INNER JOIN document_types
ON document_types.id = document_type_passenger.document_type_id
WHERE document_types.name = 'Passport';

-- 2- Selezionare i voli presi da 'Shirley Stokes' (61)
SELECT flights.id, flights.number
FROM flights
INNER JOIN flight_passenger
ON flight_passenger.flight_id = flights.id
INNER JOIN passengers
ON passengers.id = flight_passenger.passenger_id
WHERE passengers.name = 'Shirley'
AND passengers.lastname = 'Stokes';

-- 1- Selezionare tutti i passeggeri del volo 70021493-2 (85)
SELECT passengers.id, passengers.name, passengers.lastname
FROM flights
INNER JOIN flight_passenger
ON flight_passenger.flight_id = flights.id
INNER JOIN passengers
ON passengers.id = flight_passenger.passenger_id
WHERE flights.number = '70021493-2';

-- ++++++ QUERY CON JOIN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ++++++ QUERY CON GROUP BY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ****** BONUS **********************

-- 9- Selezionare gli impiegati che non hanno mai cambiato compagnia aerea per cui lavorano (1061)
SELECT COUNT(airline_employee.id) AS airlines_counter, airline_employee.employee_id AS employee_id
FROM airline_employee
GROUP BY airline_employee.employee_id
HAVING COUNT(airline_employee.id) = 1;

-- 8- Contare quante manutenzioni ha ricevuto ciascun aereo nel 2021 (dell'aereo vogliamo solo l'ID) (36)
SELECT COUNT(maintenance_works.id) AS works_counter, maintenance_works.airplane_id AS airplane
FROM maintenance_works
WHERE YEAR(maintenance_works.datetime) = 2021
GROUP BY maintenance_works.airplane_id;

-- 7- Per ogni manufacturer, trovare l'aereo con maggior numero di posti a sedere (8)
SELECT MAX(airplanes.seating_capacity) AS capacity, airplanes.manufacturer
FROM airplanes
GROUP BY airplanes.manufacturer
ORDER BY capacity DESC;

-- ****** BONUS **********************

-- 6- Contare quanti voli ci sono stati ogni anno (tenendo conto della data di partenza) (11)
SELECT COUNT(flights.id) AS flights_counter, YEAR(flights.departure_datetime) AS year
FROM flights
GROUP BY YEAR(flights.departure_datetime);

-- 5- Contare quanti passeggeri sono nati nello stesso anno (61)
SELECT COUNT(passengers.id) AS passengers_counter, YEAR(passengers.date_of_birth) AS year
FROM passengers
GROUP BY YEAR(passengers.date_of_birth);

-- 4- Ordinare gli aerei per numero di manutenzioni ricevute (da quello che ne ha di piu'; dell'aereo vogliamo solo l'ID) (100)
SELECT COUNT(maintenance_works.id) AS works_counter, maintenance_works.airplane_id
FROM maintenance_works
GROUP BY maintenance_works.airplane_id
ORDER BY works_counter DESC;

-- 3- Contare per ogni volo il numero di passeggeri (del volo vogliamo solo l'ID) (1000)
SELECT COUNT(flight_passenger.id) AS passengers_counter, flight_passenger.flight_id
FROM flight_passenger
GROUP BY flight_passenger.flight_id;

-- 2- Contare quante volte ogni impiegato ha lasciato una compagnia aerea (non mostrare quelli che non hanno mai lasciato; dell'impiegato vogliamo solo l'ID) (8939)
SELECT COUNT(airline_employee.layoff_date), airline_employee.employee_id
FROM airline_employee
WHERE airline_employee.layoff_date IS NOT NULL
GROUP BY airline_employee.employee_id;

-- 1- Contare quanti lavori di manutenzione ha eseguito ogni impiegato (dell'impiegato vogliamo solo l'ID) (1136)
SELECT COUNT(employee_maintenance_work.id) AS maintenance_work_counter, employee_maintenance_work.employee_id AS employee_id 
FROM employee_maintenance_work
GROUP BY employee_maintenance_work.employee_id;

-- ++++++ QUERY CON GROUP BY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ++++++ QUERY SU SINGOLA TABELLA ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- *** BONUS ***********

-- 12- Contare quanti voli sono partiti il 4 luglio 2019 (3)
SELECT *
FROM flights
WHERE CONVERT(DATE, flights.departure_datetime) = '4/7/2019';

-- 11- contare tutti gli aeroporti la cui città inizia per 'East' (7)
SELECT *
FROM airports
WHERE airports.city LIKE 'East%';

-- *** BONUS ***********

-- 10- Selezionare tutti i passeggeri nati nel 1960 (11)
SELECT *
FROM passengers
WHERE YEAR(passengers.date_of_birth) = 1960;

-- 9- Selezionare tutti i passeggeri il cui nome inizia con 'Al' (26)
SELECT *
FROM passengers
WHERE passengers.name LIKE 'Al%';

-- 8- Selezionare tutti gli ID dei dipendenti che hanno lasciato almeno una compagnia aerea prima del 2006 (493)
SELECT airline_employee.employee_id
FROM airline_employee
WHERE YEAR(airline_employee.layoff_date) < 2006;

-- 7- Selezionare tutti gli ID dei dipendenti che hanno lasciato almeno una compagnia aerea (31077)
SELECT airline_employee.employee_id
FROM airline_employee
WHERE airline_employee.layoff_date IS NOT NULL;

-- 6- Selezionare tutti gli aerei che hanno un numero di posti compreso tra 350 e 700 (30)
SELECT *
FROM airplanes
WHERE airplanes.seating_capacity >= 350
AND airplanes.seating_capacity <= 700;

-- 5- Selezionare tutti gli aerei che hanno piu' di 200 posti (84)
SELECT *
FROM airplanes
WHERE airplanes.seating_capacity > 200;

-- 4- Selezionare tutti i passeggeri minorenni (considerando solo l'anno di nascita) (115 - nel 2022)
SELECT *
FROM passengers
WHERE YEAR(passengers.date_of_birth) > 2004;

-- 3- Selezionare tutti i passeggeri che hanno come cognome 'Bartell' (2)
SELECT *
FROM passengers
WHERE passengers.lastname = 'Bartell';

-- 2- Selezionare tutti i nomi degli aeroporti, ordinati per nome (100)
SELECT name
FROM airports
ORDER BY name;

-- 1- Selezionare tutti i passeggeri (1000)
SELECT *
FROM passengers;

-- ++++++ QUERY SU SINGOLA TABELLA ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++