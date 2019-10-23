SELECT *
FROM invoice AS i
JOIN invoice_line AS il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

SELECT i.invoice_date, c.first_name, c.last_name, i.total 
FROM invoice AS i
JOIN customer AS c ON c.customer_id = i.customer_id;

SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer AS c 
JOIN employee AS e ON e.employee_id = c.support_rep_id;

SELECT al.title, ar.name 
FROM album AS al 
JOIN artist AS ar ON al.artist_id = ar.artist_id;

SELECT plt.track_id 
FROM playlist_track AS plt
JOIN playlist AS pl ON plt.playlist_id = pl.playlist_id
WHERE pl.name = 'Music';

SELECT t.name 
FROM track AS t 
JOIN playlist_track AS p ON t.track_id = p.track_id
WHERE p.playlist_id = 5;

SELECT t.name, p.name
FROM track AS t 
JOIN playlist_track AS pt ON t.track_id = pt.track_id 
JOIN playlist AS p ON p.playlist_id = pt.playlist_id;

SELECT t.name, a.title
FROM track AS t
JOIN album AS a ON t.album_id = a.album_id
JOIN genre AS g ON t.genre_id = g.genre_id
WHERE g.name IN ('Alternative', 'Punk');

SELECT * FROM invoice 
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > .99);

SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');

SELECT name FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);

SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

SELECT * FROM track 
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (
    SELECT artist_id FROM artist WHERE name = 'Queen'
));

UPDATE customer 
SET fax = null
WHERE fax IS NOT NULL;

UPDATE customer 
SET company = 'Self'
WHERE company IS null;

UPDATE customer 
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';

UPDATE customer 
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';

UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS null;

SELECT COUNT(*), g.name
FROM track AS t 
JOIN genre AS g ON t.genre_id = g.genre_id
GROUP BY g.name;

SELECT COUNT(*), g.name 
FROM track AS t 
JOIN genre AS g ON t.genre_id = g.genre_id
WHERE g.name IN ('Pop', 'Rock')
GROUP BY g.name;

SELECT ar.name, COUNT(*)
FROM album AS al
JOIN artist AS ar ON ar.artist_id = al.artist_id
GROUP BY ar.name;

SELECT DISTINCT composer 
FROM track;

SELECT DISTINCT billing_postal_code 
FROM invoice; 

SELECT DISTINCT company 
FROM customer;

DELETE FROM practice_delete
WHERE type = 'bronze';

DELETE FROM practice_delete 
WHERE type = 'silver';

DELETE FROM practice_delete 
WHERE value = 150;

CREATE TABLE users (user_id SERIAL PRIMARY KEY, name VARCHAR(100), email VARCHAR(100));

CREATE TABLE product (product_id SERIAL PRIMARY KEY, name VARCHAR(100), price INTEGER);

CREATE TABLE orders (order_id SERIAL PRIMARY KEY, product_id INTEGER);

SELECT * FROM product WHERE product_id IN (SELECT product_id FROM orders WHERE order_id = 1);

SELECT * FROM orders;

SELECT SUM(p.price) 
FROM product AS p
JOIN orders AS o ON p.product_id = o.product_id;

SELECT * 
FROM orders AS o 
JOIN users AS u ON o.order_id = u.order_id;

SELECT COUNT(*) 
FROM orders AS o 
JOIN users AS u ON o.order_id = u.order_id;



