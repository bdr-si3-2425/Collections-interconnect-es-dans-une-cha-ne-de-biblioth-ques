CREATE TRIGGER Lending_returned_trigger
    AFTER UPDATE
    ON LENDINGS FOR EACH ROW
    WHEN (OLD.returned = FALSE AND NEW.returned = TRUE)
    EXECUTE FUNCTION return_lendings_books();