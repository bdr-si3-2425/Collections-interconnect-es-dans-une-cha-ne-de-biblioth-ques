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
    JOIN IS_LENDED il ON l.id_lending = il.id_lending
    JOIN BOOKS b ON il.isbn = b.isbn
    JOIN LIBRARIES lib ON l.id_library = lib.id_library
    JOIN ADDRESSES addr ON lib.id_address = addr.id_address
    WHERE 
        addr.region = region_name
    GROUP BY 
        b.title
    ORDER BY 
        total_loans DESC
    LIMIT 5;
END;
$$ LANGUAGE plpgsql;