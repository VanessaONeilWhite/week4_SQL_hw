DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

DROP TABLE IF EXISTS concessions CASCADE;
CREATE TABLE concessions(
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(50),
    item_price DECIMAL(5,2),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    rating VARCHAR(100),
    "desc" text 
);

DROP TABLE IF EXISTS tickets CASCADE;
CREATE TABLE tickets(
    ticket_id SERIAL PRIMARY KEY,
    ticket_price DECIMAL(5,2),
    purchase_date DATE,
    movie_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer (first_name, last_name, email) VALUES
('Kirk', 'Gleason', 'kirksbusiness@gmail.com'), 
('Patty', 'LaCosta', 'Misspattysdance@hotmail.com'),
('Paris', 'Geller', 'crimeandpunishment@gmail.com');

INSERT INTO movie (title, rating, "desc") VALUES
('West Side Story', 'PG-13', 'two warring NYC gangs fueled by their hatred of eachother causes inability to coexist'),
('Rosemary Baby', 'R', 'suspicion leads pregnant mom to accuse elderly nabors of satanic rituals'),
('Mommie Dearest', 'PG-13', 'story follows the abusive and traumatic upbrining of a child at the hands of her mother Joan Crawford'); 

INSERT INTO concessions (item_name, item_price, customer_id) VALUES
('taylors ice cream', 6.99, 1),
('babbetts popcorn', 8.99, 2),
('lukes coffee', 1.99, 3);

UPDATE concessions
SET item_price = 5.99
WHERE item_name = 'taylors ice cream'
