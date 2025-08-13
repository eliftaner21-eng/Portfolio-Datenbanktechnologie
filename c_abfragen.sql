
c. Code für die Abfragen inkl. Screenshots der Ergebnisse

1. Projektion

SELECT name, adresse 
FROM Filiale;



SELECT vorname, nachname 
FROM Mitarbeiter;



2.Selektion

SELECT * 
FROM Gericht
WHERE kategorie = 'Pizza';



SELECT * 
FROM Gericht
WHERE preis > 10;



3.Joins

SELECT m.vorname, m.nachname, f.name AS filiale
FROM Mitarbeiter m
JOIN arbeitet a ON m.mitarbeiter_id = a.mitarbeiter_id
JOIN Filiale f ON a.filiale_id = f.filiale_id;




SELECT b.bestellung_id, g.name AS gericht, bp.menge
FROM Bestellung b
JOIN Bestellungsposition bp ON b.bestellung_id = bp.bestellung_id
JOIN Gericht g ON bp.gericht_id = g.gericht_id;















