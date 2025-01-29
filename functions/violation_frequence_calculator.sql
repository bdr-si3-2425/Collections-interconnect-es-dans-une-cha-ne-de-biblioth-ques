--Returns the number of violation done by a subscriber in the last year--
CREATE OR REPLACE FUNCTION violation_frequence_calculator(p_email VARCHAR(42))
RETURNS INTEGER AS $$
DECLARE frenquency INTEGER;
BEGIN
    SELECT COUNT(delays) INTO frenquency
    FROM lendings
    WHERE email = p_email
    AND delays > 0
    AND CURRENT_DATE - end_date <= 365;
    RETURN frenquency;
END;
$$ LANGUAGE plpgsql;