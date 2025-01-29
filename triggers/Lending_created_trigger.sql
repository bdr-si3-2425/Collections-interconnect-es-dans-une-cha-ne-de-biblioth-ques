CREATE TRIGGER Lending_created_trigger
    AFTER INSERT
    ON LENDINGS FOR EACH ROW
    EXECUTE FUNCTION return_lendings_books();