CREATE TABLE documents(
	document_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	booking_id INT NOT NULL UNIQUE,
	document_status VARCHAR(20) NOT NULL,
	remarks VARCHAR(100),

	CONSTRAINT fk_booking_id
		FOREIGN KEY (booking_id)
		REFERENCES bookings(booking_id),

	CONSTRAINT check_document_status
		CHECK(document_status IN ('Pending', 'Complete', 'Incomplete'))
);

DROP TABLE documents;

SELECT *
FROM documents;