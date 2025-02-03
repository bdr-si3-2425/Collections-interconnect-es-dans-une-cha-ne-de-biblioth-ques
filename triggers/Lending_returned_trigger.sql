-- This trigger triggers when the 'returned' column of a lending switches from false to true --
-- This trigger calls the return_lendings_books function that returns the books that were lended to the lending library --
CREATE TRIGGER Lending_returned_trigger
    AFTER UPDATE
    ON LENDINGS FOR EACH ROW
    WHEN (OLD.returned = FALSE AND NEW.returned = TRUE)
    EXECUTE FUNCTION return_lendings_books();