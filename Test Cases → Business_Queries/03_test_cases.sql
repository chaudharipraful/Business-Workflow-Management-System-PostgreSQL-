SELECT *
FROM quotations;

SELECT q. quotation_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   q. final_amount
FROM quotations AS q
INNER JOIN guests AS g
ON q. guest_id = g. guest_id
WHERE q. final_amount > 100000 AND q. status = 'Approved';

SELECT *
FROM payments;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. final_amount,
	   COALESCE(SUM(p. payment_amount), 0) AS Amount_received,
	   q. final_amount - COALESCE(SUM(p. payment_amount), 0) AS remaining_amount
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id

LEFT JOIN payments AS p
ON b. booking_id = p. booking_id

GROUP BY b. booking_id,
		 g. first_name,
		 g. last_name,
		 q. final_amount
HAVING q. final_amount <> SUM(p. payment_amount);

SELECT *
FROM visas;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   v. visa_status
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id

LEFT JOIN visas AS v
ON b. booking_id = v. booking_id

WHERE visa_status = 'Processing';


SELECT destination, AVG(final_amount) AS average_package_value
FROM quotations
GROUP BY destination;