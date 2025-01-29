CREATE OR REPLACE FUNCTION adjust_transfer_date(date_sent DATE, id_library_from INTEGER)
RETURNS DATE AS $adjust_transfer_date$
DECLARE
    v_new_date DATE := date_sent;
    v_p_id_library INTEGER := id_library_from;
    v_conflict_count INTEGER;
BEGIN
	LOOP
		SELECT COUNT(*)
		INTO v_conflict_count
		FROM Events
		WHERE event_date = v_new_date AND id_library = v_p_id_library;
	
		IF v_conflict_count = 0 THEN
			return v_new_date;
		END IF;

        v_new_date := v_new_date + INTERVAL '1 day';
    END LOOP;
END;
$adjust_transfer_date$ LANGUAGE plpgsql;