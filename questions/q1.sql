-- Quels ouvrages sont disponibles dans le réseau et peuvent être transférés à une bibliothèque
-- donnée pour un abonné spécifique ?

-- Si on insere un nouveau livre mais sans exemplaire (Holdings) il ne sera pas disponible
insert into books values (15, 'Lords of rings', '1954-01-26', 1,1);

-- Le livre est bien present dans la table books
select * from books;
-- Mais pas dans holdings
select * from holdings;

-- Mais pas disponnible a être transféré
SELECT DISTINCT b.*
FROM holdings h 
JOIN books b ON b.isbn = h.isbn
WHERE h.quantity > 0;

--Pour qu'il soit disponnible il faut le mettre un exemplaire dans une bibliothèque du réseau
insert into holdings values (15, 1, 1, 'A', 'Fantasy', 1);

-- Il est maintenant disponnible dans tout le réseau;
SELECT DISTINCT b.*
FROM holdings h 
JOIN books b ON b.isbn = h.isbn
WHERE h.quantity > 0;

