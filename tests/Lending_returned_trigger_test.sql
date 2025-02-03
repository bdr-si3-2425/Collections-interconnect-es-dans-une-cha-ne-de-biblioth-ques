--test for the lending_returned_trigger trigger--
--this trigger calls Return_lendings_books function when triggered--
--and returns the lended books to the library of the lending--

--we create a new lending and add books to it--
INSERT INTO LENDINGS VALUES (3, 1, 'subscriber.nb1@gmail.com');
INSERT INTO IS_LENDED VALUES (3, '2');
INSERT INTO IS_LENDED VALUES (3, '3');

SELECT * FROM LENDINGS;

SELECT * FROM IS_LENDED;

--There currently is 4 copies of the book with isbn 2 and 3 with isbn 3--
SELECT * FROM HOLDINGS WHERE id_library = 1 ORDER BY isbn;

--We return the lending--
UPDATE LENDINGS SET returned = TRUE WHERE id_lending = 3;

--The trigger should have update the holdings table--
--now there should be 5 copies of isbn 2 and 4 of isbn 3--
SELECT * FROM HOLDINGS WHERE id_library = 1 ORDER BY isbn;

--reset data--
UPDATE HOLDINGS SET quantity = 4 WHERE id_library = 1 and isbn = '2';
UPDATE HOLDINGS SET quantity = 3 WHERE id_library = 1 and isbn = '3';
DELETE FROM IS_LENDED WHERE id_lending = 3;
DELETE FROM LENDINGS WHERE id_lending = 3;
