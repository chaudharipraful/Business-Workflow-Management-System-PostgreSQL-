SELECT *
FROM quotations;

INSERT INTO quotations
(
    guest_id,
    destination,
    travel_start_date,
    travel_end_date,
	total_pax,
    adults,
    children,
    final_amount,
    status,
    created_by
)
VALUES
(3, 'Bali',      '2026-09-10', '2026-09-15', 2, 2, 0,  95000,  'Approved', 3),
(4, 'Singapore', '2026-10-05', '2026-10-10', 1, 1, 0,  85000,  'Approved', 3),
(5, 'Thailand',  '2026-11-12', '2026-11-18', 4, 2, 2, 140000,  'Approved', 4),
(6, 'Malaysia',  '2026-09-20', '2026-09-25', 3, 2, 1, 110000,  'Draft',    2),
(7, 'Dubai',     '2026-12-01', '2026-12-06', 4, 4, 0, 180000,  'Approved', 2),
(8, 'Bali',      '2027-01-10', '2027-01-15', 1, 1, 0,  78000,  'Rejected', 3),
(9, 'Singapore', '2027-02-08', '2027-02-13', 3, 2, 1, 125000,  'Expired',  4),
(10,'Dubai',     '2027-03-05', '2027-03-10', 2, 2, 0, 130000,  'Approved', 4);

SELECT *
FROM employees;

UPDATE employees
SET department = 'Sales'
WHERE employee_id = 4;


INSERT INTO employees(
	employee_name,
	department,
	status
)
VALUES(
	'Saurabh Kadlak', 'Operations', 'Active'
),
('Mitesh Kumar', 'Finance', 'Active');


SELECT *
FROM bookings;


INSERT INTO bookings
(
    quotation_id,
    current_status
)
VALUES
(4, 'Trip Ready'),
(5, 'Documents'),
(6, 'Payment'),
(8, 'Hotel'),
(11, 'Visa');

SELECT *
FROM payments;

INSERT INTO payments
(
    booking_id,
    payment_amount,
    payment_date,
    payment_type
)
VALUES

-- Booking 12
(12, 95000, '2026-08-20', 'Full'),

-- Booking 13
(13, 25500, '2026-09-10', 'Advance'),

-- Booking 14
-- No payment yet (Payment Pending)

-- Booking 15
(15, 54000, '2026-10-25', 'Advance'),

-- Booking 16
(16, 65000, '2027-02-01', 'Advance');


SELECT *
FROM hotels;

INSERT INTO hotels
(
    booking_id,
    hotel_name,
    confirmation_number,
    guest_status
)
VALUES
(1,  'Rove Downtown Dubai',        'RVD250701', 'Confirmed'),
(2,  'Atlantis The Palm',          'ATP251115', 'Confirmed'),
(12, 'The Westin Resort Bali',     'WRB260910', 'Confirmed'),
(13, 'Marina Bay Sands',           NULL,         'Pending'),
(14, 'Centara Grand Beach Resort', NULL,         'Pending'),
(15, 'JW Marriott Marquis Dubai',  NULL, 'Change Requested'),
(16, 'Address Downtown Dubai',     'ADD270305', 'Confirmed');


SELECT *
FROM documents;

INSERT INTO documents
(
    booking_id,
    document_status,
    remarks
)
VALUES
(12, 'Complete',   NULL),
(13, 'Incomplete', 'Passport copy pending'),
(14, 'Complete',   NULL),
(15, 'Complete',   NULL),
(16, 'Complete',   NULL);


SELECT *
FROM visas;


INSERT INTO visas
(
    booking_id,
    visa_status,
    remarks
)
VALUES
(12, 'Approved', NULL),
(13, 'Processing', 'Waiting for complete documents'),
(14, 'Processing', 'Visa process'),
(15, 'Approved', NULL),
(16, 'Processing', 'Application submitted');


SELECT *
FROM service_bookings;


INSERT INTO service_bookings
(
    booking_id,
    service_status,
    remarks
)
VALUES
(12, 'Booked', 'All services confirmed'),
(13, 'Pending', 'Waiting for visa approval'),
(14, 'Pending', 'Payment pending'),
(15, 'Pending', 'Waiting for hotel confirmation'),
(16, 'Pending', 'Visa under process');


SELECT *
FROM itinerary;


INSERT INTO itinerary
(
    booking_id,
    status,
    remarks
)
VALUES
(12, 'Sent',    'Shared via WhatsApp'),
(13, 'Pending', 'Documents pending'),
(14, 'Pending', 'Payment pending'),
(15, 'Pending', 'Hotel change in progress'),
(16, 'Pending', 'Visa under process');


SELECT *
FROM refunds;

UPDATE visas
SET visa_status = 'Rejected',
    remarks = 'Visa rejected by embassy'
WHERE booking_id = 16;


INSERT INTO refunds
(
    booking_id,
    refund_amount,
    refund_status,
    refund_date
)
VALUES
(
    16,
    57000,
    'Completed',
    '2027-02-20'
);

SELECT *
FROM refunds;

SELECT *
FROM booking_timeline;

INSERT INTO booking_timeline
(booking_id, stage, status, remarks, changed_by)
VALUES
(12, 'Booking', 'Created', NULL, 3),
(12, 'Payment', 'Full Payment Received', NULL, 6),
(12, 'Hotel', 'Confirmed', NULL, 5),
(12, 'Documents', 'Completed', NULL, 5),
(12, 'Visa', 'Approved', NULL, 5),
(12, 'Services', 'Booked', NULL, 5),
(12, 'Itinerary', 'Sent', NULL, 5);


INSERT INTO booking_timeline
(booking_id, stage, status, remarks, changed_by)
VALUES
(13, 'Booking', 'Created', NULL, 4),
(13, 'Payment', 'Advance Payment Received', NULL, 6),
(13, 'Hotel', 'Pending', NULL, 5),
(13, 'Documents', 'Incomplete', 'Passport copy pending', 5);


INSERT INTO booking_timeline
(booking_id, stage, status, remarks, changed_by)
VALUES
(14, 'Booking', 'Created', NULL, 2),
(14, 'Payment', 'Pending', NULL, 6);


INSERT INTO booking_timeline
(booking_id, stage, status, remarks, changed_by)
VALUES
(15, 'Booking', 'Created', NULL, 1),
(15, 'Payment', 'Advance Payment Received', NULL, 6),
(15, 'Hotel', 'Change Requested', NULL, 5);


INSERT INTO booking_timeline
(booking_id, stage, status, remarks, changed_by)
VALUES
(16, 'Booking', 'Created', NULL, 3),
(16, 'Payment', 'Advance Payment Received', NULL, 6),
(16, 'Hotel', 'Confirmed', NULL, 5),
(16, 'Documents', 'Completed', NULL, 5),
(16, 'Visa', 'Rejected', 'Rejected by Embassy', 5),
(16, 'Refund', 'Completed', 'Refund Processed', 6);

SELECT *
FROM booking_timeline;

