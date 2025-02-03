--Test for the violation_frequence_calculator function--
--This function takes a subscriber's email in parameter--
--and returns the number of violations he's had in the last 365 days--

--we create a new subscriber and give him some lendings--
INSERT INTO SUBSCRIBERS VALUES ('Violation.Subscriber@gmail.com', 'Test', 'Name', '2000-01-01');
INSERT INTO LENDINGS VALUES (3, 2, 'Violation.Subscriber@gmail.com', '2024-12-01', '2025-01-15');
INSERT INTO LENDINGS VALUES (4, 2, 'Violation.Subscriber@gmail.com');
SELECT update_lending_delays();

--The subscriber now has 1 violation--
SELECT violation_frequence_calculator('Violation.Subscriber@gmail.com');

--we add 2 more violations, but one is dated of more than 1 year--
INSERT INTO LENDINGS VALUES (5, 2, 'Violation.Subscriber@gmail.com', '2020-01-01', '2020-02-01');
INSERT INTO LENDINGS VALUES (6, 2, 'Violation.Subscriber@gmail.com', '2025-01-01', '2025-02-01');
SELECT update_lending_delays();

--therefore only 2 violations are counted for this subscriber for the last 365 days--
SELECT violation_frequence_calculator('Violation.Subscriber@gmail.com');

--reset data--
DELETE FROM LENDINGS WHERE id_lending > 2;
DELETE FROM SUBSCRIBERS WHERE email = 'Violation.Subscriber@gmail.com';