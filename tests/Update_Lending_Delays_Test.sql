--Test for the update_lending_delays function--
--this function changes the number of days since a book is due --
--if the lending isn't returned on time--

--we create a new lending that is already due--
INSERT INTO LENDINGS VALUES (3, 2, 'subscriber.nb2@gmail.com', '2024-12-01', '2025-01-01');
--and a new lending that began today (by default begin date = CURRENT_DATE)
INSERT INTO LENDINGS VALUES (4, 1, 'subscriber.nb1@gmail.com');
--we use the function--
SELECT update_lending_delays();

--now the 'delays' column has been updated --
--and the number of days since end_date is written--
--on the lending number 3--
SELECT * FROM LENDINGS;

--If we use it again, nothing changes--
SELECT update_lending_delays();
SELECT * FROM LENDINGS;

--reset data--
DELETE FROM LENDINGS WHERE id_lending = 3;
DELETE FROM LENDINGS WHERE id_lending = 4;
