--6. Quels ouvrages ou collections sont les plus 
--populaires selon les abonnés d’une région spécifique ?

-- Function: popular_books_by_region(region_name VARCHAR)
-- This function returns the most popular books in a given region. It takes a region name as an argument 
-- returns a table with the 5 most popular books and the total number of loans. 
CREATE OR REPLACE FUNCTION popular_books_by_region(region_name VARCHAR)
RETURNS TABLE(
    title VARCHAR,
    total_loans INTEGER
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        b.title,
        COUNT(*)::INTEGER AS total_loans
    FROM 
        LENDINGS l
	-- Jointure entre les differentes tables
    JOIN IS_LENDED il ON l.id_lending = il.id_lending
    JOIN BOOKS b ON il.isbn = b.isbn
    JOIN LIBRARIES lib ON l.id_library = lib.id_library
    JOIN ADDRESSES addr ON lib.id_address = addr.id_address
    WHERE 
		-- Conditions sur la region
        addr.region = region_name
    GROUP BY 
        b.title
    ORDER BY 
        total_loans DESC
    LIMIT 5;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM LENDINGS;
SELECT * FROM is_lended;
SELECT * FROM BOOKS;

-- Creation de deux nouveau emprunt 
insert into lendings values (4, 1, 'subscriber.nb1@gmail.com', '2025-04-01', '2025-04-08', false, null, null);
insert into lendings values (5, 1, 'subscriber.nb1@gmail.com', '2025-04-02', '2025-04-09', false, null, null);
-- Rajout des livres associé a l'emprunt
insert into is_lended (id_lending, isbn) values (4,1);
insert into is_lended (id_lending, isbn) values (4,2);
insert into is_lended (id_lending, isbn) values (4,3);
insert into is_lended (id_lending, isbn) values (5,1);


SELECT popular_books_by_region('PACA');
-- Le livre 1 apparait 2 fois donc il est premier et le livre 2 et 3 apparaissent 1 fois donc 2 et 3ème.