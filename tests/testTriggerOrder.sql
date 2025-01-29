SELECT * FROM transferts;
SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM events ORDER BY event_date;

SELECT findtheclosesttransfer(2,3);

delete from transferts where id_transfert = 2;

INSERT INTO events values (7,'Conference', '2025-02-02', 2);
delete from events where id_event = 7;
INSERT INTO events values (8,'Conference', '2025-02-03', 2);
delete from events where id_event = 8;