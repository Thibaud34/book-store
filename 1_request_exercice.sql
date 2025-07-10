-- 1. Afficher prénom et nom de tous les auteurs
SELECT first_name, last_name
FROM author;

-- 2. Afficher auteurs nés entre 1950 et 1980
SELECT first_name, last_name, birth_year
FROM author
WHERE birth_year BETWEEN 1950 AND 1980;

-- 3. Afficher 3 clients les plus récents (par date d’inscription)
SELECT email, join_date
FROM customer
ORDER BY join_date DESC
LIMIT 3;

-- 4. Liste commandes avec id et montant total renommé "Montant"
SELECT order_id, total_amount AS "Montant"
FROM customer_order;

-- 5. Livres avec stock < 20
SELECT title, stock
FROM book
WHERE stock < 20;

-- 6. Avis avec note >= 4, afficher note et commentaire
SELECT rating, comment
FROM review
WHERE rating >= 4;

-- 7. Titres des livres avec année de publication, tri décroissant par année
SELECT title, publication_year
FROM book
ORDER BY publication_year DESC;

-- 8. Commandes au mois de mars 2024
SELECT order_id, order_date
FROM customer_order
WHERE order_date >= '2024-03-01' AND order_date < '2024-04-01';


-- 9. Livres dont le titre contient "secret"
SELECT title
FROM book
WHERE title LIKE '%secret%';




-- Tests 
SELECT title
FROM book
WHERE title LIKE 'H%'
    OR title LIKE '%a';
