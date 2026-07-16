CREATE TABLE payments(
	payment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL,
	payment_amount DECIMAL(10,02) NOT NULL,
	payment_date DATE NOT NULL,
	payment_type VARCHAR(20) NOT NULL,

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),

	CONSTRAINT check_payment_type
	CHECK(payment_type IN ('Advance', 'Final', 'Full'))
);

SELECT *
FROM payments;