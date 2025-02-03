-- Tests for the popular_books_by_region function
SELECT * FROM popular_books_by_region('PACA');

select * from lendings;
INSERT INTO LENDINGS(id_lending, id_library, email) VALUES (2,1,'subscriber.nb2@gmail.com');
delete from lendings where id_lending = 2;

insert into is_lended values (2,'5');
delete from is_lended where id_lending = 2;

select * from libraries;
select * from is_lended;
select * from subscribers;
select * from books;
select * from addresses;