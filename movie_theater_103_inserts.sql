INSERT INTO concessions(
	order_id,
	item_name, 
	item_cost,
	item_quantity
)VALUES(
	3,
	'popcorn',
	13.50,
	2
);


INSERT INTO theater(
	theater_id,
	theater_name,
	location,
	theater_hall
)VALUES(
	409,
	'Roosevelt Collections',
	'1011 S Delano Court',
	4
);


INSERT INTO customers(
	customer_id,
	frist_name,
	last_name,
	email,
	billing_info
)VALUES(
	8,
	'Dennis',
	'DaMenace',
	'D-Man95@nomorepranks.com',
	'1334 5178 9171 1213 01/24'
);


INSERT INTO movies(
	movie_id,
	title,
	rating,
	genre,
	"language"	
)VALUES(
	543,
	'Mr. Wilson Gets Revenge',
	'PG-75',
	'Horror',
	'English'	
);


INSERT INTO tickets(
	ticket_id,
	"time"
)VALUES(
	660,
	2	
);


INSERT INTO invoice(
	invoice_id,
	invoice_date,
	payment_method,
	sub_total,
	taxes,
	tip,
	total
)VALUES(
	87,
	'2022-11-09',
	'VISA',
	27.00,
	01.50,
	02.00,
	30.50
);