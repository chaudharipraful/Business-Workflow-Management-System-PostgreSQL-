SELECT *
FROM employees;

INSERT INTO employees(
	employee_name,
	department,
	status
)
VALUES(
	'Priya Mehta',
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
	'Mr', 'John', 'Smith', 'john@gmail.com', '0987654321', '0987654321', 'UK', 'Indian', '1-Jan-2026'),
('Mrs.', 'Sarah', 'Johnson', 'sarah@email.com', '9876543212', '9876543212', 'Australia', 'Australian', '2-Feb-2026'),

('Mr.', 'Ahmed', 'Khan', 'ahmed@email.com', '9876543213', '9876543213', 'UAE', 'Emirati', '11-march-2026'),

('Ms.', 'Emily', 'Brown', 'emily@email.com', '9876543214', '9876543214', 'Canada', 'Canadian', '13-April-2026'),

('Mr.', 'David', 'Wilson', 'david@email.com', '9876543215', '9876543215', 'USA', 'American', '22-May-2026'),

('Mrs.', 'Maria', 'Garcia', 'maria@email.com', '9876543216', '9876543216', 'Spain', 'Spanish', '23-MAY-2026'),

('Mr.', 'Lee', 'Minho', 'lee@email.com', '9876543217', '9876543217', 'South Korea', 'South Korean', '8-June-2026'),

('Mrs.', 'Anna', 'Muller', 'anna@email.com', '9876543218', '9876543218', 'Germany', 'German', '12-June-2026'),

('Mr.', 'Hiroshi', 'Tanaka', 'hiroshi@email.com', '9876543219', '9876543219', 'Japan', 'Japanese', '13-June-2026');


INSERT INTO employees(
	employee_name,
	department,
	status
)
VALUES
('Amit Verma', 'Operations', 'Active'),
('Sneha Patel', 'Finance', 'Active');


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
	2,
	'Dubai',
	'15-nov-2026',
	'20-nov-2026',
	3,
	2,
	1,
	120000,
	'Approved',
	2,
	'13-July-2026'
);


SELECT *
FROM bookings;

INSERT INTO bookings(
	quotation_id,
	current_status
)
VALUES(
	2,
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
	2,
	36000,
	'14-june-2026',
	'Advance'
);


INSERT INTO payments(
	booking_id,
	payment_amount,
	payment_date,
	payment_type
)
VALUES(
	2,
	84000,
	'16-june-2026',
	'Final'
);


SELECT *
FROM hotels;

INSERT INTO hotels(
	booking_id,
	hotel_name,
	confirmation_number,
	guest_status
)
VALUES(
	2,
	'Atlantis The Palm',
	'ATTD458792',
	'Confirmed'
);


SELECT *
FROM documents;

INSERT INTO documents(
	booking_id,
	document_status,
	remarks
)
VALUES(
	2,
	'Complete',
	NULL
);


SELECT *
FROM visas;

INSERT INTO visas(
	booking_id,
	visa_status,
	remarks
)
VALUES(
	2,
	'Approved',
	NULL
);

SELECT *
FROM service_bookings;

INSERT INTO service_bookings(
	booking_id,
	service_status,
	remarks 
)
VALUES(
	2,
	'Booked',
	NULL
);


SELECT *
FROM itinerary;

INSERT INTO itinerary(
	booking_id,
	status,
	remarks
)
VALUES(
	2,
	'Sent',
	'Share Via Mail'
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
VALUES
	(2, 'Booking', 'Created', NULL, 2),
	(2, 'Payment', 'Advance Payment Received', NULL, 2),
	(2, 'Hotel', 'Confirmed', NULL, 2),
	(2, 'Documents', 'Completed', NULL, 3),
	(2, 'Payment', 'Final Payment Received',NULL,  2),
	(2, 'Visa', 'Approved', NULL, 2),
	(2, 'Services', 'Booked', NULL, 3),
	(2, 'Itinerary', 'Sent', NULL, 3);
