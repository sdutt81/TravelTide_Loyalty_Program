-- Filter the session to include sessions that started after 04.01.2023

WITH session_Jan_2023 AS (
	SELECT 
  	*
  FROM sessions
  WHERE session_start > '2023-01-04'
)

, filtered_sessions AS (
	SELECT 
  	user_id
  	, COUNT(*) AS session_count
  FROM session_Jan_2023
  GROUP BY user_id
  HAVING COUNT(*) > 7
  
)  

, session_base AS (
SELECT 
	s.session_id
  , s.user_id
  , u.birthdate
  , u.gender
  , u.married
  , u.has_children
  , u.home_country
  , u.home_city
  , u.home_airport
  , u.home_airport_lat
  , u.home_airport_lon
  , u.sign_up_date 
  , s.trip_id
  , s.session_start
  , s.session_end
  , s.flight_discount
  , s.hotel_discount
  , s.flight_discount_amount
  , s.hotel_discount_amount
  , s.flight_booked
  , s.hotel_booked
  , s.page_clicks
  , s.cancellation
  , fl.origin_airport
  , fl.destination
  , fl.destination_airport
  , fl.seats
  , fl.return_flight_booked
  , fl.departure_time
  , fl.return_time
  , fl.checked_bags
  , fl.trip_airline
  , fl.destination_airport_lat
  , fl.destination_airport_lon
  , fl.base_fare_usd
  , TRIM(SPLIT_PART(h.hotel_name,'-',1)) AS hotel_name
  , TRIM(SPLIT_PART(h.hotel_name,'-',2)) AS hotel_location
  , h.nights
  , h.rooms
  , h.check_in_time
  , h.check_out_time
  , h.hotel_per_room_usd
FROM session_Jan_2023 s
	LEFT JOIN users u ON s.user_id = u.user_id
  LEFT JOIN flights fl ON s.trip_id = fl.trip_id
  LEFT JOIN hotels h	ON s.trip_id = h.trip_id
WHERE s.user_id IN (SELECT user_id FROM filtered_sessions)
)
  
SELECT 
	*
FROM session_base
;
