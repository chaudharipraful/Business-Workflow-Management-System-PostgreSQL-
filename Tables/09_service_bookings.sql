CREATE TABLE service_bookings(
	service_booking_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	
	booking_id INT NOT NULL UNIQUE,
		CONSTRAINT fk_booking_id
			FOREIGN KEY (booking_id)
			REFERENCES bookings(booking_id),
			
	service_status VARCHAR(20) NOT NULL
		CONSTRAINT check_service_status
			CHECK(service_status IN ('Pending', 'Booked')),
			
	Remarks VARCHAR(100)
);

SELECT *
FROM service_bookings;