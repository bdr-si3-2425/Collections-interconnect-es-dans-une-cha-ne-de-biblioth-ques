-- This function is used to find the closest transfer between two libraries
-- If there is a transfer between the two libraries in the same week, it will return the id of the transfer
-- If there is no transfer between the two libraries in the same week, it will create a new transfer and return the id of the new transfer
-- The function takes two parameters: the id of the library from which the transfer is sent and the id of the library to which the transfer is sent
-- The function returns the id of the transfer
CREATE OR REPLACE FUNCTION findTheClosestTransfer(id_from INTEGER, id_to INTEGER)
RETURNS INTEGER AS $findTheClosestTransfer$
DECLARE
    v_nbTransfert INTEGER;
    v_idTransfert INTEGER;
    v_maxId INTEGER;
	v_idEmployee INTEGER;
	v_newDate DATE;
BEGIN
    -- Check if there is a transfer between the two libraries in the same week 
    SELECT COUNT(*), COALESCE(MIN(id_transfert), 999) 
    INTO v_nbTransfert, v_idTransfert 
    FROM Transferts 
    WHERE date_sent <= (SELECT DATE_TRUNC('week', CURRENT_DATE)::DATE + 6) and id_library_from = id_from and id_library_to = id_to ;

    -- If there is a transfer between the two libraries in the same week, return the id of the transfer
    IF v_nbTransfert >= 1 THEN
        RETURN v_idTransfert;
    ELSE
		-- Find the next id
        SELECT COALESCE(MAX(id_transfert), 0) + 1 INTO v_maxId FROM Transferts;
		-- Find an employee
		SELECT MIN(id_employee) INTO v_idEmployee FROM employees where id_library = id_from;
		-- Find the next date
		SELECT adjust_transfer_date((SELECT DATE_TRUNC('week', CURRENT_DATE)::DATE + 6), id_from) INTO v_newDate;
        -- Insert the new transfer
		INSERT INTO Transferts VALUES (v_maxId,v_newDate , v_newDate + INTERVAL '1 week', v_idEmployee, id_from, id_to);
        -- Return the id of the new transfer
        RETURN v_maxId;
    END IF;
END;
$findTheClosestTransfer$ LANGUAGE plpgsql; 