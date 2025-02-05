-- Purpose: Create a trigger that updates the date of the transferts when an event is added or updated.
-- The trigger will update the date_sent and date_received of the transferts that have the same date as the event and the same library as the event.
-- The trigger will call the adjust_transfer_date function to find a date that does not conflict with any other event in the same library.
-- The trigger will update the date_sent of the transferts to the new date and the date_received to the new date + 1 week.
-- The trigger will be called after an insert or update on the Events table.
-- The trigger will be called for each row.
CREATE OR REPLACE FUNCTION check_transfert_event()
RETURNS TRIGGER AS $$
DECLARE
    id_bibli INTEGER := NEW.id_library; 
    event_date DATE := NEW.event_date;
    new_date DATE;
    id_t INTEGER; 
BEGIN
    SELECT adjust_transfer_date(event_date, id_bibli) INTO new_date;

    FOR id_t IN 
        SELECT id_transfert 
        FROM Transferts 
        WHERE date_sent = event_date AND id_library_from = id_bibli 
    LOOP
        UPDATE Transferts 
        SET date_sent = new_date, 
            date_received = new_date + INTERVAL '1 week'
        WHERE id_transfert = id_t; 
    END LOOP;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_transfert_expo
AFTER INSERT OR UPDATE ON EXPOSITIONS
FOR EACH ROW
EXECUTE FUNCTION check_transfert_event();

CREATE TRIGGER trigger_check_transfert_conf
AFTER INSERT OR UPDATE ON CONFERENCES
FOR EACH ROW
EXECUTE FUNCTION check_transfert_event();

