-- En partant du jeu de donnée de base
-- Les deux premiers livre empruntés sont les livres 4 et 5
-- On a donc comme livre les plus populaires les livres 4 et 5
SELECT * FROM popular_books_by_region('PACA');

-- On crée un nouvel emprunt
INSERT into lendings values (3,1,'subscriber.nb1@gmail.com', '2025-02-02', '2025-02-09',false, null, null);
-- Liasont entre le lending et le livre 4
INSERT into is_lended values (3,4);

-- Le livre 4 est maintenant premier avec 2 emprunts et le livre 5 est deuxième avec 1 emprunt
SELECT * FROM popular_books_by_region('PACA');
