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