insert into customer(customer_id,first_name,last_name,address,email,phone_num)
values (1,'Harry','Styles','2019 Watermelon St., Sugar, CA 02399','hstyles@gmail.com','232-451-5554'),
	   (2,'John','Legend','2008 Greenlight Ave., Springfield, OH 45501','jlegend@aol.com','690-343-9099');
insert into car(car_id,serial_num,car_make,car_model,customer_id)
values(1,'121','Tesla','Model S',1),
	  (2,'212','Rolls-Royce','Phantom',2);
insert into salesperson(sales_id,staff_first,staff_last)
values  (1,'Jessica','Smith'),
		(2,'Parker', 'Cruz');
create function add_salesperson(_sales_id INTEGER, _staff_first VARCHAR, _staff_last VARCHAR)
returns void
as $MAIN$
begin 
	insert into salesperson(sales_id, staff_first, staff_last)
	values(_sales_id,_staff_first,_staff_last);
end;
$MAIN$
language plpgsql;

select add_salesperson(3,'Derrick','McDonald');
select add_salesperson(4,'Fernando','Nunez');

insert into invoice(invoice_id,date,sale_amount,sales_id,car_id,customer_id)
values(1,current_timestamp,'88500.00',1,1,1),
	(2,current_timestamp,'420000.00',2,2,2);

insert into part(part_id,part_name,part_amount,upc)
values(1,'brake pad','600.00',323),
	(2,'belt tensioner','158.00',232);

insert into mechanic(mechanic_id,mechanic_first,mechanic_last)
values(1,'George','Lopez'),
	(2,'Steve','Harvey');
insert into service(service_id, service_date,service_type,service_amount,mechanic_id,serial_num)
values(1,'2023-05-23','replace brake pads',849.00,1,121),
	(2,'2023-05-25','replace belt tensioner',350.00,2,212);
insert into parts_order(order_id,seller,date,order_amount,service_id,part_id,mechanic_id) 
values(1,'NRS Brakes','2023-05-02', 671.99,1,1,1),
	(2,'Advanced Auto Parts','2023-05-05',523.99,2,2,2);
select * from customer;
select * from car;
select * from salesperson;
select * from invoice;
select * from mechanic;
select * from part;
select * from parts_order;
select * from service;