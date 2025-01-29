-- increases the quantity of a book a library holds --
-- number can be negative ---
CREATE OR REPLACE FUNCTION add_book(p_isbn VARCHAR(42), p_id_library INTEGER, p_number INTEGER)
RETURNS VOID as $$
BEGIN
    UPDATE holdings
    SET quantity = quantity + p_number
    WHERE id_library = p_id_library
    AND isbn = p_isbn;
    
END;
    $$ LANGUAGE plpgsql;