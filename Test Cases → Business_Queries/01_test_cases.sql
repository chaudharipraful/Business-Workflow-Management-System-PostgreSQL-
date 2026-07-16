SELECT * 
FROM guests;

SELECT *
FROM quotations;

SELECT q.quotation_id, 
		g.first_name || ' ' || g.last_name AS customer_name,
		q.destination, 
		q.travel_start_date, 
		q.travel_end_date, 
		q.final_amount
FROM guests AS g
INNER JOIN quotations AS q
ON g.guest_id = q.guest_id
WHERE q.status = 'Approved';

SELECT b. booking_id,
		g. first_name || ' ' || g.last_name AS customer_name,
		q. destination,
		b. current_status,
		h. hotel_name,
		v. visa_status,
		q. final_amount
FROM guests AS g
INNER JOIN quotations AS q
ON g. guest_id = q. guest_id

INNER JOIN bookings AS b
ON q. quotation_id = b. quotation_id

INNER JOIN hotels AS h
ON b. booking_id = h. booking_id

INNER JOIN visas AS v
ON b. booking_id = v. booking_id

WHERE b. booking_id = 1;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   q. final_amount AS total_package_amount,
	   COALESCE(SUM(p. payment_amount), 0) AS payment_received,
	   (q. final_amount - COALESCE(SUM(p. payment_amount), 0)) AS remaining_amount
	   
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id

LEFT JOIN payments AS p
ON b. booking_id = p. booking_id
GROUP BY b. booking_id, g. first_name, g. last_name, q. destination, q. final_amount
ORDER BY b. booking_id;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. final_amount AS package_amount,
	   COALESCE(SUM(p. payment_amount), 0) AS received_amount,
	   q. final_amount - COALESCE(SUM(p. payment_amount), 0) AS remaining_amount
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id

LEFT JOIN payments AS p
ON b. booking_id = p. booking_id
GROUP BY b. booking_id, g. first_name, g. last_name, q. final_amount
HAVING q. final_amount - COALESCE(SUM(p. payment_amount), 0) < q. final_amount;