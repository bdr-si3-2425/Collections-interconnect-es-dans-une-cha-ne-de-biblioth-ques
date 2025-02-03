-- This function updates the delays column of all unreturned lendings --
-- If a lending has 'returned' column false and the current date is later than the end date of the lending --
-- the function should be used everyday, but postGreSQL cannot do that by default --
CREATE OR REPLACE FUNCTION UPDATE_LENDING_DELAYS()
RETURNS BOOLEAN as $$
BEGIN
	UPDATE lendings
	SET delays = CURRENT_DATE - end_date
	WHERE returned = FALSE
		AND end_date < CURRENT_DATE;
	RETURN FOUND;
END;
	$$ LANGUAGE plpgsql;
	
	