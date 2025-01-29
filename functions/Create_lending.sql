-- create a lending --
CREATE OR REPLACE FUNCTION CREATE_LENDING(p_id_library INTEGER, p_email VARCHAR(42))
RETURNS VOID AS $$
BEGIN
    INSERT INTO lendings
    VALUES(nextval('lendings_id_seq'), p_id_library, p_email); 
END;
    $$ LANGUAGE plpgsql;