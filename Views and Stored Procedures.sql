## Creating Views

create view Pass_Pop_Des as
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    count(f.flight_id) as Total_Flights,
    round(SUM(fm.PASSENGERS)/c.Population,2) as Pass_Pop_Ratio  
FROM city c
JOIN airport a ON a.CITY_NAME = c.CITY_NAME
JOIN flight f ON f.Dest_AIRPORT_ID = a.AIRPORT_ID
JOIN flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY Pass_Pop_Ratio DESC;

select * from Pass_Pop_Des;

create view Pass_Pop_Ori as 
SELECT 
    c.CITY_NAME,
    c.POPULATION,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    round(SUM(fm.PASSENGERS)/c.Population,2) as Pass_Pop_Ratio  
FROM city c
JOIN airport a ON a.CITY_NAME = c.CITY_NAME
JOIN flight f ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
JOIN flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
GROUP BY c.CITY_NAME, c.POPULATION
ORDER BY Pass_Pop_ratio DESC;

select * from Pass_Pop_Ori;

## Stored Procedures

Delimiter //
Create Procedure traffic()
Begin
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM flight f
JOIN flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN airport a ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;
End //

call traffic();

Create Procedure State_level_traffic(IN State varchar(30))
Begin
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM flight f
JOIN flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN airport a ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
WHERE a.STATE_NM=State
GROUP BY a.CITY_NAME
ORDER BY Total_Flights DESC;
End //

call State_level_traffic("Alaska");

Create Procedure sp_top_routes_by_passenger(IN threshold INT)
Begin
SELECT 
    a.CITY_NAME AS ORIGIN_CITY,
    SUM(fm.PASSENGERS) AS TOTAL_PASSENGERS,
    COUNT(f.FLIGHT_ID) AS TOTAL_FLIGHTS
FROM flight f
JOIN flightmetrics fm ON f.FLIGHT_ID = fm.FLIGHT_ID
JOIN airport a ON f.ORIGIN_AIRPORT_ID = a.AIRPORT_ID
GROUP BY a.CITY_NAME
HAVING TOTAL_PASSENGERS > threshold
ORDER BY TOTAL_PASSENGERS DESC;
End //

call sp_top_routes_by_passenger(1000000);