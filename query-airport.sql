-- ++++++ QUERY CON GROUP BY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

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