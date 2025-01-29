--Function called by the trigger Lending_created_trigger--
--updates the quantity of books in holdings when a lending is created--
--Calls add_book function to decrease the quantity of books in holdings--

CREATE OR REPLACE FUNCTION create_lendings_books()
RETURNS TRIGGER AS $$
DECLARE rec RECORD;
BEGIN
    FOR rec IN
    SELECT * FROM is_lended
    WHERE id_lending = NEW.id_lending
    LOOP
        PERFORM add_book(rec.isbn, NEW.id_library, -1);
    END LOOP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;