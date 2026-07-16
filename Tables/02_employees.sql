CREATE TABLE employees(
	employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	employee_name VARCHAR(100) NOT NULL,
	department VARCHAR(50) NOT NULL,
	status VARCHAR(50) NOT NULL
);

DROP TABLE employees;

SELECT *
FROM employees;