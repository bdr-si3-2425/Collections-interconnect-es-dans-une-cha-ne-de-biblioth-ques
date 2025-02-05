
-- En partant du principe que le transfert entre la bibliotèque le 2 et 3 du 11-fevrier est dans la base
insert into transferts(3,'2025-02-11','2025-02-18',2,2,3); 

SELECT * FROM TRANSFERTS;
SELECT * FROM EVENTS;

-- Insertion d'un nouvel exposition
insert into EXPOSITIONS values (9, 'Exposition', '2025-02-11', 3, 1);
DELETE FROM EXPOSITIONS WHERE id_event = 9; 

-- La nouvelle date est le 2025-02-12
SELECT * FROM transferts where id_transfert = 3;
