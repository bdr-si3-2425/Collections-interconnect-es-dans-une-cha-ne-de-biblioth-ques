--Test for the extend_lending_period function--
--this function adds 2 weeks to a lending --
--if said lending hasn't been extended before (lending period < 38 days)--
--and the lending hasn't been returned and isn't due--

--we create a new empty lending starting today--
--the end_date should be {CURRENT_DATE + 1 MONTH}
INSERT INTO LENDINGS VALUES (3, 1, 'subscriber.nb1@gmail.com');
SELECT * FROM LENDINGS;

--we extend the lending period of this new lending--
SELECT extend_lending_period(3);

--The end_date should now be {CURRENT_DATE + 1 MONTH + 14 DAYS}--
SELECT * FROM LENDINGS;

--If we use it again, the end_date won't change (and the function returns false)--
SELECT extend_lending_period(3);
SELECT * FROM LENDINGS;

--reset data--
DELETE FROM LENDINGS WHERE id_lending = 3;

--we create 2 new lendings : one is already returned, the other is due and late--
INSERT INTO LENDINGS VALUES (3, 1, 'subscriber.nb1@gmail.com', '2024-01-01', '2024-02-01', TRUE);
INSERT INTO LENDINGS VALUES (4, 1, 'subscriber.nb1@gmail.com', '2024-10-01', '2024-11-01');
SELECT * FROM LENDINGS;

--if we try extending them : their end_date won't be extended--
SELECT extend_lending_period(3);
SELECT extend_lending_period(4);
SELECT * FROM LENDINGS;

--reset data--
DELETE FROM LENDINGS WHERE id_lending = 3;
DELETE FROM LENDINGS WHERE id_lending = 4;