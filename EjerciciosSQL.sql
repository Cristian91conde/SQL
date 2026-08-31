#############################################################################
#                               Ejercicios SQL                              #
#############################################################################


-- 1. Recuperar los Vuelos (flights) y su identificador con status 'On Time'

SELECT flight_id, route_no, status 
FROM flights 
WHERE status = 'On Time';

-- 2. Reservas con un total mayor a 100.000 rublos 

SELECT * 
FROM bookings 
WHERE total_amount > 100000;

-- 3. Modelos de aviones disponibles

SELECT * 
FROM airplanes_data;

-- 4. Vuelos con Boeing 737 (Código 7M7)

SELECT 
    f.flight_id, 
    f.route_no, 
    r.airplane_code
FROM flights f
JOIN routes r ON f.route_no = r.route_no
WHERE r.airplane_code = '7M7';

-- 5. Tickets comprados por 'Irina'

SELECT * 
FROM tickets 
WHERE passenger_name LIKE 'Irina%';

-- 6. Mostrar las ciudades con más de un aeropuerto.

SELECT city, COUNT(*) AS total_aeropuertos
FROM airports
GROUP BY city
HAVING COUNT(*) > 1;

-- 7. Mostrar el número de vuelos por modelo de avión.

SELECT a.model, COUNT(f.flight_id) AS total_vuelos
FROM flights f
JOIN routes r ON f.route_no = r.route_no
JOIN airplanes a ON r.airplane_code = a.airplane_code
GROUP BY a.model;

-- 8. Reservas con más de un billete (varios pasajeros).

SELECT book_ref, COUNT(ticket_no) AS total_billetes
FROM tickets
GROUP BY book_ref
HAVING COUNT(ticket_no) > 1;

-- 9. Vuelos con retraso de salida superior a una hora.

SELECT flight_id, route_no, scheduled_departure, actual_departure,
       (actual_departure - scheduled_departure) AS tiempo_retraso
FROM flights
WHERE actual_departure - scheduled_departure > INTERVAL '1 hour';
