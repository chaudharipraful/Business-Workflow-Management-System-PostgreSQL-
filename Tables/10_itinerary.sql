CREATE TABLE itinerary(
	itinerary_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL UNIQUE,
	status VARCHAR(20) NOT NULL,
	remarks VARCHAR(100),

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),

	CONSTRAINT check_status
		CHECK(status IN ('Pending', 'Sent'))
);

SELECT *
FROM itinerary;