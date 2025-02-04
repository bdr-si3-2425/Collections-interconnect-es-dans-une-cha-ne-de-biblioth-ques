-- 3. Quels ouvrages sont fréquemment transférés entre bibliothèques et quels délais sont associés
SELECT * FROM transferts;
SELECT * FROM orders;
SELECT * FROM lendings;
SELECT * FROM is_lended;

-- La requête compte combien de fois chaque ISBN apparaît dans les commandes
-- Ensuite, elle calcule le pourcentage de présence de chaque ISBN en divisant ce nombre par le total des commandes

SELECT 
    i.isbn,
    COUNT(o.id_order) AS total_orders,
    ROUND((COUNT(o.id_order) * 100.0 / (SELECT COUNT(*) FROM orders)), 2) AS percentage_presence
FROM 
    orders o
JOIN 
    is_lended i ON i.id_lending = o.id_lending
JOIN 
    transferts t ON t.id_transfert = o.id_transfert
GROUP BY 
    i.isbn
ORDER BY 
    percentage_presence DESC;

-- On rajoute un lending avec le livre 4
INSERT into lendings values (3,1,'subscriber.nb1@gmail.com', '2025-02-02', '2025-02-09',false, null, null);
INSERT into is_lended values (3,4);
INSERT into orders values (2,3,1,2,1);
-- Maintenant le livre 4 est pris a 100% des fois et le livre 5 50% car present dans 1/2 lendings