INSERT INTO Filiale (filiale_id, name, adresse) VALUES
(1,'Mitte','Hauptstr. 1'),
(2,'West','Nebenstr. 5');

INSERT INTO Mitarbeiter (mitarbeiter_id, vorname, nachname, telefon, rolle) VALUES
(1,'Hans','Müller','030-111','Service'),
(2,'Peter','Schmidt','030-222','Koch'),
(3,'Anna','Fischer','089-333','Kassa');

INSERT INTO arbeitet (mitarbeiter_id, filiale_id, seit) VALUES
(1,1,'2023-04-01'),
(2,1,'2022-09-15'),
(3,2,'2024-01-10');

INSERT INTO Schicht (schicht_id, filiale_id, datum, beginn, ende) VALUES
(1,1,'2025-08-12','09:00','17:00'),
(2,1,'2025-08-12','17:00','23:00'),
(3,2,'2025-08-12','10:00','18:00');

INSERT INTO eingeteilt (mitarbeiter_id, schicht_id, funktion) VALUES
(1,1,'Service'),
(2,2,'Koch'),
(3,3,'Kassa');

INSERT INTO Gericht (gericht_id, name, kategorie, preis) VALUES
(10,'Margherita','Pizza',8.90),
(11,'Spaghetti Bolognese','Pasta',11.50),
(12,'Cola 0.33','Getränk',2.80);

INSERT INTO Bestellung (bestellung_id, filiale_id, mitarbeiter_id, zeitstempel, tisch_nr, status) VALUES
(100,1,1,'2025-08-12 12:15',5,'bezahlt'),
(101,1,2,'2025-08-12 19:40',8,'offen'),
(102,2,3,'2025-08-12 13:05',NULL,'offen');

INSERT INTO Bestellungsposition (position_id, bestellung_id, gericht_id, menge, einzelpreis) VALUES
(1000,100,10,1,8.90),
(1001,100,12,2,2.80),
(1002,101,11,1,11.50),
(1003,101,12,1,2.80),
(1004,102,10,2,8.90);

