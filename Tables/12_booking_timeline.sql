CREATE TABLE booking_timeline(
	timeline_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL UNIQUE,
	stage VARCHAR(50) NOT NULL,
	status VARCHAR(100) NOT NULL,
	remarks VARCHAR(100),
	changed_by INT NOT NULL,
	changed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),

	CONSTRAINT fk_changed_by
		FOREIGN KEY (changed_by)
		REFERENCES employees(employee_id),

	CONSTRAINT check_stage
		CHECK(stage IN ('Booking', 'Payment', 'Hotel', 'Documents', 'Visa', 'Services', 'Itinerary', 'Refund'))
);

SELECT *
FROM booking_timeline;

