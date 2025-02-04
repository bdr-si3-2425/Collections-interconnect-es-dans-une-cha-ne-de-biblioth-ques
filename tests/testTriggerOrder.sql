-- Date du test 3 fev 2025
select * from lendings;

--Creation d'un nouveau lending pour le subscriber 3
insert into lendings values (99, 3, 'subscriber.nb1@gmail.com', '2025-02-03', '2025-02-10', false ,null ,null);
delete from lendings where id_lending = 99;

-- On ajoute un évènement le prochain dimanche et lundi  
INSERT INTO events values (7,'Conference', '2025-02-09', 2);
INSERT INTO events values (8,'Conference', '2025-02-10', 2);
--delete from events where id_event = 7;
--delete from events where id_event = 8;
SELECT * FROM events ORDER BY event_date DESC;

-- La prochaine date disponnible sera le 2025-02-11
-- le select nous retourne creer un evenement ce jour la et nous retourne l'id du transfert
-- entre la bibliotèque 3 et 2 avec la date la plus proche apres le prochain dimanche
SELECT findtheclosesttransfer(2,3);
SELECT * FROM transferts where id_transfert  = 3;

-- Transferts(id_transfert, date_sent, date_received, id_employee, id_library_from, id_library_to) 
-- Obtient bien le transferts 3,"2025-02-11","2025-02-18",2,2,3
-- Qui commence bien le 11 apres les deux evenements;

insert into orders values (3, 99, 3, 2, 3);
SELECT * FROM orders;