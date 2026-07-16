SELECT *
FROM payments;

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

INNER JOIN payments AS p
ON b. booking_id = p. booking_id

GROUP BY b. booking_id,
		 g. first_name,
		 g. last_name,
		 q. final_amount
HAVING q. final_amount - COALESCE(SUM(p. payment_amount), 0) > 50000;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. final_amount AS package_amount,
	   SUM(p. payment_amount) AS amount_received,
	   (SUM(p. payment_amount) / q. final_amount) * 100 AS payment_percentage
	   
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON q. guest_id = g. guest_id

INNER JOIN payments AS p
ON b. booking_id = p. booking_id

GROUP BY b. booking_id, g. first_name, g. last_name, q. final_amount
HAVING (SUM(p. payment_amount) / q. final_amount) * 100 < 50;