CREATE TABLE quotations(
	quotation_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	guest_id INT NOT NULL,
	destination VARCHAR(50) NOT NULL,
	travel_start_date DATE NOT NULL,
	travel_end_date DATE NOT NULL,
	total_pax INT NOT NULL,
	adults INT NOT NULL,
	children INT NOT NULL,
	final_amount DECIMAL(10,2) NOT NULL,
	status VARCHAR(20) NOT NULL,
	created_by INT NOT NULL,
	created_date DATE DEFAULT CURRENT_DATE,

	CONSTRAINT fk_guest
		FOREIGN KEY (guest_id)
		REFERENCES guests(guest_id),

	CONSTRAINT fk_employee
		FOREIGN KEY (created_by)
		REFERENCES employees(employee_id),

	CONSTRAINT check_quotation_status
		CHECK (status IN ('Draft', 'Sent', 'Approved', 'Rejected', 'Expired'))
);

SELECT *
FROM quotations;