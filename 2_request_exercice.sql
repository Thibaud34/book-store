-- 1. Affichez la somme totale des stocks de livres.
SELECT SUM(stock) AS total_stock
FROM book;

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS number_of_books
FROM author a
LEFT JOIN book b 
    ON a.author_id = b.author_id
GROUP BY a.author_id, a.first_name, a.last_name;

-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT 
    b.title, 
    CONCAT(a.first_name, ' ', a.last_name) AS author_full_name, 
    t.theme_name
FROM book b
JOIN author a ON b.author_id = a.author_id
JOIN theme t ON b.theme_id = t.theme_id;

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT customer.email, book.title, customer_order.order_date
FROM customer_order
JOIN book ON customer_order.book_id = book.book_id
JOIN customer ON customer_order.customer_id = customer.customer_id
WHERE customer_order.customer_id = 1;

-- Option 2 du 4 
SELECT co.order_id, b.title, co.order_date
FROM customer_order co
JOIN book b ON b.book_id = co.book_id
JOIN customer c ON c.customer_id = co.customer_id
WHERE c.customer_id = 4;

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT b.title, AVG(r.rating) AS average_rating
FROM review r
JOIN book b ON b.book_id = r.book_id
GROUP BY b.title
HAVING COUNT(r.review_id) >=3;

-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT 
    customer.email,
    COUNT(customer_order.order_id) AS nb_orders
FROM customer
LEFT JOIN customer_order ON customer.customer_id = customer_order.customer_id
GROUP BY customer.customer_id;


-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT book.title
FROM book
LEFT JOIN customer_order ON book.book_id = customer_order.book_id
WHERE customer_order.book_id IS NULL;

-- Option 2 du 7 qui ajoute une colonne total qui montre 0
SELECT b.title, COUNT(co.order_id) AS total_order
FROM book b
LEFT JOIN customer_order co ON b.book_id = co.book_id
GROUP BY b.book_id
HAVING COUNT(co.order_id) = 0;

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT 
    author.first_name, 
    author.last_name, 
    SUM(book.price) AS Chiffre_affaire
FROM customer_order
JOIN book ON customer_order.book_id = author.author_id
JOIN author ON book.author_id = author.author_id
GROUP BY author.author_id;








