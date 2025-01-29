-- You enter the function with the id of the lending you want to extend the period of. --
-- The function will update the end_date of the lending by adding 14 days to it --
-- if the lending is not returned, the end_date is greater than the current date, --
-- and the difference between the end_date and begin_date is <= 31 days (aka the lending hasn't been extended) --
CREATE OR REPLACE FUNCTION EXTEND_LENDING_PERIOD(p_id_lending INTEGER)
RETURNS BOOLEAN as $$
BEGIN
    UPDATE lendings
    SET end_date = end_date + INTERVAL '14 days'
    WHERE returned = FALSE
        AND end_date > CURRENT_DATE
        AND end_date-begin_date <= 38
        AND id_lending = p_id_lending;

    RETURN FOUND;
END;
	$$ LANGUAGE plpgsql;