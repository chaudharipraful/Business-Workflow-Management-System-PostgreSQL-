CREATE TABLE bookings(
	booking_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	quotation_id INT NOT NULL UNIQUE,
	current_status VARCHAR(20) NOT NULL,

	CONSTRAINT fk_quotation
		FOREIGN KEY (quotation_id)
		REFERENCES quotations(quotation_id),

	CONSTRAINT check_current_status
		CHECK(current_status IN('Payment', 'Hotel', 'Documents', 'Visa', 'Services', 'Itinerary', 'Trip Ready', 'Closed'))
);

DROP TABLE bookings;

SELECT *
FROM bookings;