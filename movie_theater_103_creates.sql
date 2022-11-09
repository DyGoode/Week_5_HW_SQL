CREATE TABLE "concessions" (
  "order_id" SERIAL PRIMARY KEY,
  "item_name" VARCHAR(50),
  "item_cost" NUMERIC(4,2),
  "item_quantity" INTEGER
);

CREATE TABLE "theater" (
  "theater_id" SERIAL PRIMARY KEY,
  "theater_name" VARCHAR(100),
  "location" VARCHAR(100),
  "theater_hall" INTEGER
);

CREATE TABLE "customers" (
  "customer_id" SERIAL PRIMARY KEY,
  "frist_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email" VARCHAR(100),
  "billing_info" VARCHAR(25)
);

CREATE TABLE "movies" (
  "movie_id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100),
  "rating" VARCHAR(25),
  "genre" VARCHAR(25),
  "language" VARCHAR(25)
);

CREATE TABLE "tickets" (
  "ticket_id" SERIAL PRIMARY KEY,
  "time" INTEGER,
  "theater_id" INTEGER,
  "movie_id" INTEGER,
	FOREIGN KEY ("theater_id")
    REFERENCES "theater"("theater_id"),
	FOREIGN KEY ("movie_id")
	REFERENCES "movies"("movie_id")
);

CREATE TABLE "invoice" (
  "invoice_id" SERIAL PRIMARY KEY,
  "invoice_date" DATE,
  "payment_method" VARCHAR(25),
  "sub_total" NUMERIC(8,2),
  "taxes" NUMERIC(8,2),
  "tip" NUMERIC(8,2),
  "total" NUMERIC(8,2),
  "ticket_id" INTEGER,
  "order_id" INTEGER,
  "customer_id" INTEGER,
	FOREIGN KEY ("ticket_id")
	REFERENCES "tickets"("ticket_id"),
	FOREIGN KEY ("order_id")
	REFERENCES "concessions"("order_id"),
	FOREIGN KEY ("customer_id")
	REFERENCES "customers"("customer_id")
);