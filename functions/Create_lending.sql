-- create a lending --
CREATE OR REPLACE FUNCTION CREATE_LENDING(p_id_library INTEGER, p_email VARCHAR(42), p_isbns VARCHAR(42)[])
RETURNS VOID AS $$
DECLARE
	id_lending INTEGER;
	isbn VARCHAR(42);
BEGIN
	id_lending := nextval('lendings_id_seq');

    INSERT INTO lendings
    VALUES(id_lending, p_id_library, p_email);

	FOREACH isbn IN ARRAY p_isbns
	LOOP
		INSERT INTO is_lended
		VALUES(id_lending, isbn);
	END LOOP;
END;