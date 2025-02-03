--Authors (id, first_name, last name)--
INSERT INTO AUTHORS VALUES (0, 'UNKNON', 'UNKNOW');
INSERT INTO AUTHORS VALUES (1, 'Joanne', 'Rowling');
INSERT INTO AUTHORS VALUES (2, 'John', 'Tolkien');

--Publishers (id, name)--
INSERT INTO PUBLISHERS VALUES (0, 'Self published');
INSERT INTO PUBLISHERS VALUES (1, 'Bloomsbury Publishing');
INSERT INTO PUBLISHERS VALUES (2, 'Allen & Unwin');

--Addresses (id, region, name, number, city, postal)--
INSERT INTO ADDRESSES VALUES (0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO ADDRESSES VALUES (1, 'PACA', 'av JB Suiram', 25, 'Nice', 06000);
INSERT INTO ADDRESSES VALUES (2, 'Iles-de-France', 'av De Neuilly', 69, 'Paris', 75000);
INSERT INTO ADDRESSES VALUES (3, 'PACA', 'av de baptiste', 555, 'Antibes', 06600);

--Libraries (id, name, id_address)--
INSERT INTO LIBRARIES VALUES (0, 'Default Library', 0);
INSERT INTO LIBRARIES VALUES (1, 'Bibliotheque de Nice', 1);
INSERT INTO LIBRARIES VALUES (2, 'Paris Library', 2);
INSERT INTO LIBRARIES VALUES (3, 'Library 3', 3);

--Collections (id, name)--
INSERT INTO COLLECTIONS VALUES (0, 'No Collection');
INSERT INTO COLLECTIONS VALUES (1, 'Harry Potter');
INSERT INTO COLLECTIONS VALUES (2, 'The Lord of the Rings');

--Books (isbn, title, published_date (YYYY-MM-DD), author_id, publisher_id)--
INSERT INTO BOOKS VALUES ('1', 'The philosophers stone', '1997-01-01', 1, 1);
INSERT INTO BOOKS VALUES ('2', 'The chamber of secrets', '1998-01-01', 1, 1);
INSERT INTO BOOKS VALUES ('3', 'The Prisoner of Azkaban', '1999-01-01', 1, 1);
INSERT INTO BOOKS VALUES ('4', 'The Fellowship of the Ring', '1954-01-01', 2, 2);
INSERT INTO BOOKS VALUES ('5', 'The Two Towers', '1954-01-01', 2, 2);

--Collectionary (isbn, id_collection)--
INSERT INTO COLLECTIONARY VALUES ('1', 1);
INSERT INTO COLLECTIONARY VALUES ('2', 1);
INSERT INTO COLLECTIONARY VALUES ('3', 1);
INSERT INTO COLLECTIONARY VALUES ('4', 2);
INSERT INTO COLLECTIONARY VALUES ('5', 2);

--Employees (id, first_name, last_name, id_library)--
INSERT INTO EMPLOYEES VALUES (1, 'Marius', 'Barbaud', 1);
INSERT INTO EMPLOYEES VALUES (2, 'Lou', 'Amelie', 2);

--Subscribers (email, first_name, last_name, date_of_birth)--
INSERT INTO SUBSCRIBERS VALUES ('default@mail.com', null, null, null);
INSERT INTO SUBSCRIBERS VALUES ('subscriber.nb1@gmail.com', 'Jean', 'Poquelin', '2000-06-10');
INSERT INTO SUBSCRIBERS VALUES ('subscriber.nb2@gmail.com', 'Jean', 'Pas-Poquelin', '1995-08-27');
INSERT INTO SUBSCRIBERS VALUES ('Jean.Jacques@gmail.com', 'Jean', 'Jacques', '2003-12-19');

--Lendings (id, library_id, subscriber_email, begin, end, returned?, delays, return_date)--
INSERT INTO LENDINGS VALUES (0, 0, 'default@mail.com', NULL, NULL, NULL, NULL, NULL); --Library lendings
INSERT INTO LENDINGS VALUES (1, 1, 'subscriber.nb1@gmail.com', '2025-01-19', '2025-02-19', FALSE, NULL, NULL);
INSERT INTO LENDINGS VALUES (2, 2, 'subscriber.nb2@gmail.com', '2024-11-05', '2025-12-19', FALSE, NULL, NULL);

--Is_lended (lending_id, isbn)--
INSERT INTO IS_LENDED VALUES (1, '4');
INSERT INTO IS_LENDED VALUES (1, '5');

--Transfert (id, date_sent, date_received, id_employee, id_library_from , id_library_to)--
INSERT INTO TRANSFERTS VALUES (1, NULL, NULL, 1, 1, 2);

--Orders (id, lending_id, transfert_id, library_from_id, library_to_id)--
INSERT INTO ORDERS VALUES (1, 1, 1, 2, 1);

--Ordered (id, isbn, quantity)--
INSERT INTO ORDERED VALUES (1, '4', 2);
INSERT INTO ORDERED VALUES (1, '5', 2);

--Holdings (isbn, id_library, quantity, room, shelf, position)--
--Library 1-- Has all of Harry Potter
INSERT INTO HOLDINGS VALUES ('1', 1, 5, 'A', 'Fantasy', '05');
INSERT INTO HOLDINGS VALUES ('2', 1, 4, 'A', 'Fantasy', '06');
INSERT INTO HOLDINGS VALUES ('3', 1, 3, 'A', 'Fantasy', '07');
INSERT INTO HOLDINGS VALUES ('4', 1, 3, 'A', 'Fantasy', '08');
INSERT INTO HOLDINGS VALUES ('5', 1, 2, 'A', 'Fantasy', '09');
--Library 2-- Has HP 1 and the lord of the rings series
INSERT INTO HOLDINGS VALUES ('1', 2, 1, 'B', 'Fantasy', '10');
INSERT INTO HOLDINGS VALUES ('4', 2, 5, 'B', 'Fantasy', '15');
INSERT INTO HOLDINGS VALUES ('5', 2, 5, 'B', 'Fantasy', '16');

--Conferences (id, event_type, date, id_library, id_author)--
INSERT INTO CONFERENCES VALUES (1, 'Conference', '2025-01-22', 2, 2);

--Expositions (id, event_type, date, id_library, id_collection)--
INSERT INTO EXPOSITIONS VALUES (2, 'Exposition', '2025-01-18', 1, 1);
