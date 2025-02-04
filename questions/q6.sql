--6. Quels ouvrages ou collections sont les plus populaires selon les abonnés d’une région
--spécifique ?

-- On utilise la fonction popular_books_by_region qui permet de retourner les 5 premiers livres les plus empruntés;
-- BEGIN
-- RETURN QUERY
-- SELECT 
--     b.title,
--     COUNT(*)::INTEGER AS total_loans
-- FROM 
--     LENDINGS l
-- JOIN IS_LENDED il ON l.id_lending = il.id_lending
-- JOIN BOOKS b ON il.isbn = b.isbn
-- JOIN LIBRARIES lib ON l.id_library = lib.id_library
-- JOIN ADDRESSES addr ON lib.id_address = addr.id_address
-- WHERE 
--     addr.region = region_name
-- GROUP BY 
--     b.title
-- ORDER BY 
--     total_loans DESC
-- LIMIT 5;
-- END;


SELECT popular_books_by_region('PACA');