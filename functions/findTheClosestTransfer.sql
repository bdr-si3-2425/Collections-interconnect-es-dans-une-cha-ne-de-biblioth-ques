CREATE OR REPLACE FUNCTION findTheClosestTransfer(id_from INTEGER, id_to INTEGER)
RETURNS INTEGER AS $findTheClosestTransfer$
DECLARE
    v_nbTransfert INTEGER;
    v_idTransfert INTEGER;
    v_maxId INTEGER;
	v_idEmployee INTEGER;
	v_newDate DATE;
BEGIN
    SELECT COUNT(*), COALESCE(MIN(id_transfert), 999) 
    INTO v_nbTransfert, v_idTransfert 
    FROM Transferts 
    WHERE date_sent <= (SELECT DATE_TRUNC('week', CURRENT_DATE)::DATE + 6) and id_library_from = id_from and id_library_to = id_to ;

    IF v_nbTransfert >= 1 THEN
        RETURN v_idTransfert;
    ELSE
		-- Next id 
        SELECT COALESCE(MAX(id_transfert), 0) + 1 INTO v_maxId FROM Transferts;
		-- Find an employee
		SELECT MIN(id_employee) INTO v_idEmployee FROM employees where id_library = id_from;
		-- Find the next date
		SELECT adjust_transfer_date((SELECT DATE_TRUNC('week', CURRENT_DATE)::DATE + 6), id_from) INTO v_newDate;
        -- Insert
		INSERT INTO Transferts VALUES (v_maxId,v_newDate , v_newDate + INTERVAL '1 week', v_idEmployee, id_from, id_to);
        RETURN v_maxId;
    END IF;
END;
$findTheClosestTransfer$ LANGUAGE plpgsql; 