CREATE TABLE refunds(
	refund_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL UNIQUE,
	refund_amount DECIMAL(10,2) NOT NULL,
	refund_status VARCHAR(20) NOT NULL,
	refund_date DATE,

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),

	CONSTRAINT check_refund_status
		CHECK(refund_status IN ('Pending', 'Completed'))
);

SELECT *
FROM refunds;