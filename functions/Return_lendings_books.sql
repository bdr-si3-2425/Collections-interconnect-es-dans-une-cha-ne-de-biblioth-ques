--Function called by the trigger Lending_returned_trigger--
--updates the quantity of books in holdings when a lending is returned--
--Calls add_book function to increase the quantity of books in holdings--

CREATE OR REPLACE FUNCTION return_lendings_books()
RETURNS TRIGGER AS $$
DECLARE rec RECORD;
BEGIN
    IF OLD.returned = FALSE AND NEW.returned = TRUE THEN
        FOR rec IN
        SELECT * FROM is_lended
        WHERE id_lending = NEW.id_lending
    LOOP
        PERFORM add_book(rec.isbn, NEW.id_library);
    END LOOP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;