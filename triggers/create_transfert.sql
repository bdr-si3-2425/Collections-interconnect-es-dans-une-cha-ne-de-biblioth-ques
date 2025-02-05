CREATE OR REPLACE FUNCTION create_transfert(p_id_lending INTEGER, p_id_library INTEGER)
RETURNS INTEGER AS $id_transfert$
DECLARE 
	rec_isbn RECORD;
	rec_librairies RECORD;
    books_to_order INTEGER;
    id_transfert INTEGER;
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
    
    id_transfert := nextval("transferts_id_seq");
	
	INSERT INTO ORDER
	VALUES(id_order, NEW.id_lending);
	
	FOR rec_librairies IN
	SELECT isbn, quantity
	FROM RankedHoldings
	WHERE rank = 1
	LOOP
		INSERT INTO transfered
		VALUES(id_transfert, isbn, quantity);
	END LOOP;	
	
    RETURN id_transfert;
END;
$id_transfert$ LANGUAGE plpgsql;