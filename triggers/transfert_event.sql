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

CREATE TRIGGER trigger_check_transfert_event
AFTER INSERT OR UPDATE ON Events
FOR EACH ROW
EXECUTE FUNCTION check_transfert_event();
