CREATE OR REPLACE FUNCTION RETURN_LENDING(lending_id INTEGER)
RETURNS BOOLEAN as $$
BEGIN
    UPDATE lendings
    SET returned = TRUE,
    return_date = CURRENT_DATE
    WHERE id_lending = lending_id
    AND returned = FALSE;
    
    RETURN FOUND;
END;
    $$ LANGUAGE plpgsql;