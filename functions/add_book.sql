-- increases the quantity of a book a library holds --
CREATE OR REPLACE FUNCTION add_book(p_isbn TEXT, p_id_library INTEGER)
RETURNS BOOLEAN as $$
BEGIN
    UPDATE holdings
    SET quantity = quantty + 1
    WHERE id_library = p_id_library
    AND isbn = p_isbn;
    
    RETURN FOUND;
END;
    $$ LANGUAGE plpgsql;