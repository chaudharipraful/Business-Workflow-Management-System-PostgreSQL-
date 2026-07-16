CREATE TABLE hotels(
	hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL,
	hotel_name VARCHAR(100) NOT NULL,
	confirmation_number VARCHAR(100),
	guest_status VARCHAR(20) NOT NULL,

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),
	
	CONSTRAINT check_guest_status
		CHECK(guest_status IN ('Pending', 'Confirmed', 'Change Requested'))
);

SELECT *
FROM hotels;