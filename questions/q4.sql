--4. Quels abonnés ne respectent pas les délais de prêt --
--et quelle est leur fréquence d’infraction ? --

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

--On récupère tous les abonnés ayant des violations --
--et on utilise violation_frequence_calculator pour obtenir la fréquence de leur violations--

--On ajoute quelques données en plus...--
INSERT INTO SUBSCRIBERS VALUES ('Abonne.Parfait@yahooMail.com', 'Abonne', 'Parfait', '2002-01-01');
INSERT INTO SUBSCRIBERS VALUES ('Pire.Abonne@etu.univ-cotedazur.fr', 'Pire', 'Abonne', '2004-12-12');
SELECT * FROM SUBSCRIBERS;
DELETE FROM LENDINGS WHERE id_lending > 2;
INSERT INTO LENDINGS VALUES (3, 1, 'Abonne.Parfait@yahooMail.com', '2024-01-02', '2024-02-02', true, NULL, '2024-01-03');
INSERT INTO LENDINGS VALUES (4, 1, 'Pire.Abonne@etu.univ-cotedazur.fr', '2024-01-01', '2024-02-01');
INSERT INTO LENDINGS VALUES (5, 2, 'Pire.Abonne@etu.univ-cotedazur.fr', '2024-10-10', '2024-11-10');
INSERT INTO LENDINGS VALUES (6, 2, 'Pire.Abonne@etu.univ-cotedazur.fr', '2025-01-01', '2025-02-01');
INSERT INTO LENDINGS VALUES (7, 2, 'Jean.Jacques@gmail.com');
SELECT update_lending_delays();
SELECT * FROM LENDINGS ORDER BY id_lending;

--Cette requête renvoie une table contenant tous les abonnés ayant fait une violation, et donne leurs fréquences d'infraction--
SELECT S.first_name, S.last_name, violation_frequence_calculator(S.email) as "violation frequence"
FROM LENDINGS L JOIN SUBSCRIBERS S ON L.email = S.email
WHERE L.delays > 0
GROUP BY S.email
ORDER BY "violation frequence" DESC;
--L'abonné Pire Abonne a fait 2 infractions dans les 365 derniers jours--
--Et l'abonne Jean Jacque en a commit 1--
