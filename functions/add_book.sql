-- increases the quantity of a book a library holds --
CREATE OR REPLACE FUNCTION add_book(p_isbn VARCHAR(42), p_id_library INTEGER)
RETURNS VOID as $$
BEGIN
    UPDATE holdings
    SET quantity = quantity + 1
    WHERE id_library = p_id_library
    AND isbn = p_isbn;
    
END;
    $$ LANGUAGE plpgsql;