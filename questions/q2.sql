-- Comment gérer l’intégration d’une nouvelle bibliothèque au réseau et l’attribution de ses
-- ressources ?

-- Pour ajouter une nouvelle bibliothèque 

SELECT * FROM libraries;
SELECT * FROM addresses;
SELECT * FROM holdings;
SELECT * FROM books;
SELECT * from employees;

-- Insere de l'addresse 
INSERT INTO addresses VALUES (4, 'PACA', ' Rte des Colles', 930, 'Biot', 06410);

-- Insere d'une nouvelle bibliothèque
INSERT INTO libraries VALUES (4, 'PNS Library', 4)

-- Insere d'un nouveau employee
INSERT INTO employees VALUES (3, 'Matthieu', 'Griffonnet', 'Yes?', 4);

-- Insere de nouveau exemplaire pour la bibliothèque
INSERT INTO holdings VALUES (1, 4, 1, 1, 'Fantasy', 01);
INSERT INTO holdings VALUES (2, 4, 5, 1, 'Fantasy', 01);
INSERT INTO holdings VALUES (3, 4, 2, 1, 'Fantasy', 01);
INSERT INTO holdings VALUES (4, 4, 3, 1, 'Fantasy', 01);

-- Voici les livres présent dans la nouvelle bibliothèque
SELECT * FROM holdings where id_library = 4;



