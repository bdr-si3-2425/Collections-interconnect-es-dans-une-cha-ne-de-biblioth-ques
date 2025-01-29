-- updates the return date of a lending and sets the returned flag to true --
-- if the lending is not already returned, returns false if no lending is found --
CREATE OR REPLACE FUNCTION RETURN_LENDING(p_id_lending INTEGER)
RETURNS BOOLEAN as $$
BEGIN
    UPDATE lendings
    SET returned = TRUE,
    return_date = CURRENT_DATE
    WHERE id_lending = p_id_lending
    AND returned = FALSE;
    
    RETURN FOUND;
END;
    $$ LANGUAGE plpgsql;