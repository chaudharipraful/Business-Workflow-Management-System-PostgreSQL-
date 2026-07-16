SELECT *
FROM employees;

INSERT INTO employees(
	employee_name,
	department,
	status
)
VALUES(
	'Rahul Sharma',
	'Sales',
	'Active'
);


SELECT *
FROM guests;

INSERT INTO guests(
	title,
	first_name,
	last_name,
	email,
	mobile,
	whatsapp,
	country,
	nationality,
	created_date
)
VALUES(
	'Mr.',
	'Praful',
	'Chaudhari',
	'praful@gmail.com',
	'1234567890',
	'1234567890',
	'India',
	'Indian',
	'2026/07/13'
);


SELECT *
FROM quotations;

INSERT INTO quotations(
	guest_id,
	destination,
	travel_start_date,
	travel_end_date,
	total_pax,
	adults,
	children,
	final_amount,
	status,
	created_by,
	created_date
)
VALUES(
	1,
	'Dubai',
	'10-Aug-2026',
	'15-Aug-2026',
	2,
	2,
	0,
	75000,
	'Approved',
	1,
	'13-Jul-2026'
);

SELECT *
FROM bookings;

INSERT INTO bookings(
	quotation_id,
	current_status
)
VALUES(
	1,
	'Trip Ready'
);


SELECT *
FROM payments;

INSERT INTO payments(
	booking_id,
	payment_amount,
	payment_date,
	payment_type
)
VALUES(
	1,
	75000,
	'13-July-2026',
	'Full'
)


SELECT *
FROM hotels;

INSERT INTO hotels(
	booking_id,
	hotel_name,
	confirmation_number,
	guest_status
)
VALUES(
	1,
	'Rove Downtown Dubai',
	'RVD458792',
	'Confirmed'
);


SELECT *
FROM documents;

INSERT INTO documents(
	booking_id,
	document_status
)
VALUES(
	1,
	'Complete'
);


SELECT *
FROM visas;

INSERT INTO visas(
	booking_id,
	visa_status
)
VALUES(
	1,
	'Approved'
);


SELECT *
FROM service_bookings;

INSERT INTO service_bookings(
	booking_id,
	service_status,
	remarks
)
VALUES(
	1,
	'Booked',
	'All services are booked'
);


SELECT *
FROM itinerary;

INSERT INTO itinerary(
	booking_id,
	status,
	remarks
)
VALUES(
	1,
	'Sent',
	'Share Via WhatsApp'
);

SELECT *
FROM booking_timeline;

INSERT INTO booking_timeline(
	booking_id,
	stage,
	status,
	remarks,
	changed_by
)
VALUES(
	1,
	'Booking',
	'Created',
	NULL,
	1
);


INSERT INTO booking_timeline(
	booking_id,
	stage,
	status,
	remarks,
	changed_by
)
VALUES(
	1,
	'Payment',
	'Full payment received',
	NULL,
	1
),
(
	1,
	'Hotel',
	'Confirmed',
	NULL,
	1
),
(
	1,
	'Documents',
	'Completed',
	NULL,
	1
),
(
	1,
	'Visa',
	'Approved',
	NULL,
	1
),
(
	1,
	'Services',
	'Booked',
	NULL,
	1
),
(
	1,
	'Itinerary',
	'Sent',
	NULL,
	1
);