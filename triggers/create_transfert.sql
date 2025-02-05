CREATE OR REPLACE FUNCTION create_transfert(p_id_lending INTEGER, p_id_library INTEGER)
RETURNS INTEGER AS $id_transfert$
    DECLARE rec_isbn RECORD;
	DECLARE rec_librairies RECORD;
    DECLARE books_to_order INTEGER;
    DECLARE id_transfert INTEGER;
BEGIN
    WITH RankedHoldings AS (
        SELECT isbn, id_library, quantity,
            ROW_NUMBER() OVER (PARTITION BY isbn ORDER BY quantity DESC, id_library ASC) AS rank
        FROM holdings
        WHERE isbn NOT IN (
            SELECT isbn FROM holdings WHERE id_library = p_id_library
        )
        AND isbn IN (
            SELECT isbn FROM is_lended WHERE id_lending = NEW.id_lending
        )
    )
    
    id_transfert := id_transfert_sec.nextval();


    FOR rec_isbn IN
    SELECT isbn, id_library
    FROM RankedHoldings
    WHERE rank = 1;
    LOOP
        
		ELSE
        	PERFORM add_book(rec_is_lended.isbn, NEW.id_library, -1);
		END IF;
    END LOOP;
    RETURN id_transfert;
END;
$$ LANGUAGE plpgsql;