SELECT *
FROM quotations;

SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   q. final_amount AS package_amount,
	   COALESCE(SUM(p. payment_amount), 0) AS amount_received,
	   CASE
			WHEN q. final_amount = COALESCE(SUM(p. payment_amount), 0) THEN 'Fully Paid'
			WHEN COALESCE(SUM(p. payment_amount), 0) > 0 AND COALESCE(SUM(p. payment_amount), 0) < q. final_amount THEN 'Partially Paid'
			ELSE 'No Payment'
	   END AS payment_status
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
		 q. destination,
		 q. final_amount
ORDER BY booking_id ASC;


WITH payment_summary AS(
	SELECT booking_id,
		   SUM(payment_amount) AS amount_received
    FROM payments
	GROUP BY booking_id
)

SELECT b. booking_id,
	   g. first_name AS customer_name,
	   q. destination,
	   q. final_amount AS package_amount,
	   COALESCE(ps. amount_received, 0) AS amount_received,
	   CASE
	   		WHEN q. final_amount = COALESCE(ps. amount_received, 0) THEN 'Fully Paid'
			WHEN COALESCE(ps. amount_received, 0) > 0 AND COALESCE(ps. amount_received, 0) < q. final_amount THEN 'Partially Paid'
			ELSE 'No Payment'
	   END AS payment_status
	   FROM bookings AS b
	   INNER JOIN quotations AS q
	   ON b. quotation_id = q. quotation_id

	   INNER JOIN guests AS g
	   ON q. guest_id = g. guest_id

	   LEFT JOIN payment_summary AS ps
	   ON ps. booking_id = b. booking_id

	   ORDER BY b. booking_id;


SELECT *
FROM bookings;

WITH payment_summary AS(
	SELECT booking_id,
		   COALESCE(SUM(payment_amount), 0) AS amount_received
    FROM payments
	GROUP BY booking_id
)
SELECT b. booking_id,
	   g. first_name || ' ' || g. last_name AS customer_name,
	   q. destination,
	   b. current_status,
	   'EMP ID ' || e. employee_id ||' - ' || e. employee_name AS assigned_sales_executive,
	   q. final_amount AS total_amount, 
	   COALESCE(ps. amount_received, 0) AS amount_received,
	   q. final_amount - COALESCE(ps. amount_received, 0) AS pending_amount
FROM bookings AS b
INNER JOIN quotations AS q
ON b. quotation_id = q. quotation_id

INNER JOIN guests AS g
ON g. guest_id = q. guest_id

INNER JOIN employees AS e
ON q. created_by = e. employee_id

LEFT JOIN payment_summary AS ps
ON b. booking_id = ps. booking_id

WHERE b. current_status <> 'Trip Ready'

ORDER BY pending_amount DESC;


SELECT *
FROM quotations;

SELECT e. employee_id,
	   e. employee_name,
	   COUNT(q. quotation_id) AS total_approved_quotations,
	   SUM(q. final_amount) AS total_revenue,
	   ROUND (AVG(q. final_amount), 2) AS average_package_value
FROM employees AS e
LEFT JOIN quotations AS q
ON e. employee_id = q. created_by
WHERE q. status = 'Approved'
GROUP BY e. employee_id,
		 e. employee_name
ORDER BY total_revenue DESC
LIMIT 3;

