create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(200),
	email VARCHAR(100),
	phone_num VARCHAR(50)
);

create table car(   
	car_id SERIAL primary key,
	serial_num SERIAL unique,
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

create table salesperson(   
	sales_id SERIAL primary key,
	staff_first VARCHAR(50),
	staff_last VARCHAR(50)
);

create table invoice(     
	invoice_id SERIAL primary key,
	date TIMESTAMP,
	sale_amount NUMERIC(10,2),
	sales_id INTEGER,
	car_id INTEGER,
	customer_id INTEGER,
	foreign key(sales_id) references salesperson(sales_id),
	foreign key(car_id) references car(car_id),
	foreign key(customer_id) references customer(customer_id)
);

create table part(
	part_id SERIAL primary key,
	part_name VARCHAR(50),
	part_amount NUMERIC(6,2),
	upc SERIAL
);

create table mechanic(    
	mechanic_id SERIAL primary key,
	mechanic_first VARCHAR(50),
	mechanic_last VARCHAR(50)
);

create table service(   
	service_id SERIAL primary key,
	service_date DATE,
	service_type VARCHAR(150),
	service_amount numeric(6,2),
	mechanic_id INTEGER,
	serial_num INTEGER not null,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(serial_num) references car(serial_num)
	);

create table parts_order(   
	order_id SERIAL primary key,
	seller VARCHAR(100),
	date TIMESTAMP,
	order_amount numeric(6,2),
	service_id INTEGER,
	part_id INTEGER,
	mechanic_id INTEGER,
	foreign key(service_id) references service(service_id),
	foreign key(part_id) references part(part_id),
	foreign key(mechanic_id) references mechanic(mechanic_id)
	);

