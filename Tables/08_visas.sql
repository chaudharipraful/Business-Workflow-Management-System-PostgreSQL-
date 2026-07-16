CREATE TABLE visas(
	visa_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL UNIQUE,
		CONSTRAINT fk_booking_id
			FOREIGN KEY (booking_id)
			REFERENCES bookings(booking_id),

	visa_status VARCHAR(20) NOT NULL,
	remarks VARCHAR(100),

		CONSTRAINT check_visa_status
			CHECK(visa_status IN ('Processing', 'Approved', 'Rejected'))
	
);

SELECT * 
FROM visas;

