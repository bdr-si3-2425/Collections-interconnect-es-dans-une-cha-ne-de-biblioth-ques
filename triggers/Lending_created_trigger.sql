--Function called by the trigger Lending_created_trigger--
--updates the quantity of books in holdings when a lending is created--
--Calls add_book function to decrease the quantity of books in holdings--
CREATE OR REPLACE FUNCTION remove_or_order_lended_books()
RETURNS TRIGGER AS $$
    DECLARE rec_is_lended RECORD;
	DECLARE rec_librairies RECORD;
    DECLARE books_to_order INTEGER;
    DECLARE id_transfert INTEGER;
	DECLARE id_order INTEGER;
BEGIN
    WITH RankedHoldings AS (
        SELECT isbn, id_library, quantity,
            ROW_NUMBER() OVER (PARTITION BY isbn ORDER BY quantity DESC, id_library ASC) AS rank
        FROM holdings
        WHERE isbn NOT IN (
            SELECT isbn FROM holdings WHERE id_library = NEW.id_library
        )
        AND isbn IN (
            SELECT isbn FROM is_lended WHERE id_lending = NEW.id_lending
        )
    )

    FOR rec_is_lended IN
    SELECT * FROM is_lended
    WHERE id_lending = NEW.id_lending
    LOOP
        IF NOT EXISTS (SELECT isbn FROM holdings)
			WHERE isbn = rec_is_lended.isbn AND id_library = NEW.id_library)
			FOR 
		THEN
			books_to_order := books_to_order + 1;
			END LOOP;
		ELSE
        	PERFORM add_book(rec_is_lended.isbn, NEW.id_library, -1);
		END IF;
    END LOOP;

	IF books_to_order > 0
	THEN
		id_order := id_orders_seq.nextval()
		INSERT INTO ORDER
		VALUES(id_order, NEW.id_lending);
		
		FOR rec_librairies IN
		SELECT DISTINCT id_library
		FROM RankedHoldings
        WHERE rank = 1
		LOOP
			id_transfert := create_transfert(id_lending, id_library);
			INSERT INTO ordered
			VALUES(id_order, id_transfert);
		END LOOP;	
	END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Lending_created_trigger
    AFTER INSERT
    ON LENDINGS FOR EACH ROW
    EXECUTE FUNCTION create_lendings_books();