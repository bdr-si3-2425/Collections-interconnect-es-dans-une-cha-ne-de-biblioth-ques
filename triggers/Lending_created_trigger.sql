CREATE TRIGGER Lending_created_trigger
    AFTER INSERT
    ON LENDINGS FOR EACH ROW
    EXECUTE FUNCTION create_lendings_books();