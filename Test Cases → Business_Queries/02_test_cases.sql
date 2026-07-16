SELECT *
FROM quotations;

SELECT destination, SUM(final_amount) AS revenue
FROM quotations
WHERE status = 'Approved'
GROUP BY destination
ORDER BY revenue DESC
LIMIT 5;

SELECT destination, SUM(final_amount) AS revenue, COUNT(*) AS total_quotations
FROM quotations
WHERE status = 'Approved'
GROUP BY destination
ORDER BY revenue DESC
LIMIT 5;

SELECT *
FROM employees;

SELECT *
FROM quotations;


SELECT e. employee_id, e. employee_name, COUNT(q. quotation_id) AS quotations, SUM(q. final_amount) AS total_revenue
FROM employees As e
INNER JOIN quotations AS q
ON e. employee_id = q. created_by
WHERE q. status = 'Approved'
GROUP BY e. employee_id, e. employee_name
ORDER BY total_revenue DESC;


SELECT e.employee_id, e. employee_name, SUM(q. final_amount) AS total_revenue
FROM employees AS e
INNER JOIN quotations AS q
ON e. employee_id = q. created_by
WHERE q. status = 'Approved'
GROUP BY e. employee_id, e. employee_name
HAVING SUM(q. final_amount) > 200000
ORDER BY total_revenue DESC;

SELECT *
FROM quotations;

SELECT *
FROM payments;

SELECT *
FROM bookings;

SELECT b. booking_id, q. destination, SUM(p. payment_amount) AS total_amount
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN payments AS p
ON p. booking_id = b. booking_id

WHERE b. current_status = 'Trip Ready'
GROUP BY b. booking_id, q. destination, q. final_amount
HAVING q. final_amount = SUM(p. payment_amount)
ORDER BY b. booking_id;

SELECT *
FROM itinerary;


SELECT  DISTINCT b. booking_id, 
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. status AS quotation_status,
	   b. current_status AS booking_status,
	   h. guest_status AS hotel_status,
	   d. document_status AS docs_status,
	   v. visa_status AS visa_status,
	   s. service_status AS services,
	   i. status AS itinerary_status
	   
	   
	   FROM bookings AS b
	   INNER JOIN quotations AS q
	   ON b. quotation_id = q. quotation_id

	   INNER JOIN guests AS g
	   ON g. guest_id = q. guest_id

	   INNER JOIN hotels AS h
	   ON h. booking_id = b. booking_id

	   INNER JOIN documents AS d
	   ON d. booking_id = b. booking_id

	   INNER JOIN visas AS v
	   ON v. booking_id = b. booking_id

	   INNER JOIN service_bookings AS s
	   ON s. booking_id = b. booking_id

	   INNER  JOIN itinerary AS i
	   ON i. booking_id = b. booking_id

	   WHERE b. current_status = 'Trip Ready';


SELECT *
FROM bookings;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   q. travel_start_date,
	   q. travel_end_date,
	   b. current_status
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id;
	   