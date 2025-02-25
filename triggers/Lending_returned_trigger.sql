--Function called by the trigger Lending_returned_trigger--
--updates the quantity of books in holdings when a lending is returned--
--Calls add_book function to increase the quantity of books in holdings--

CREATE OR REPLACE FUNCTION return_lendings_books()
RETURNS TRIGGER AS $$
DECLARE rec RECORD;
BEGIN
    IF OLD.returned = FALSE AND NEW.returned = TRUE THEN
    -- We record the lines from is_lended table that correspinds to the lending that is returned
        FOR rec IN
        SELECT * FROM is_lended
        WHERE id_lending = NEW.id_lending
    LOOP
        --we add a book to the holdings of the library for every lended book
        PERFORM add_book(rec.isbn, NEW.id_library, 1);
    END LOOP;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- This trigger triggers when the 'returned' column of a lending switches from false to true --
-- This trigger calls the return_lendings_books function --
-- that function returns the books that were lended to the lending library --
CREATE TRIGGER Lending_returned_trigger
    AFTER UPDATE
    ON LENDINGS FOR EACH ROW
    WHEN (OLD.returned = FALSE AND NEW.returned = TRUE)
    EXECUTE FUNCTION return_lendings_books();

