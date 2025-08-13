PRAGMA foreign_keys = ON;

CREATE TABLE Filiale (
  filiale_id   INTEGER PRIMARY KEY,
  name         TEXT NOT NULL,
  adresse      TEXT,
  stadt        TEXT
);

CREATE TABLE Mitarbeiter (
  mitarbeiter_id INTEGER PRIMARY KEY,
  vorname        TEXT NOT NULL,
  nachname       TEXT NOT NULL,
  telefon        TEXT,
  rolle          TEXT
);

CREATE TABLE arbeitet (
  mitarbeiter_id INTEGER NOT NULL,
  filiale_id     INTEGER NOT NULL,
  seit           DATE,
  PRIMARY KEY (mitarbeiter_id, filiale_id),
  FOREIGN KEY (mitarbeiter_id) REFERENCES Mitarbeiter(mitarbeiter_id) ON DELETE CASCADE,
  FOREIGN KEY (filiale_id)     REFERENCES Filiale(filiale_id)        ON DELETE CASCADE
);

CREATE TABLE Schicht (
  schicht_id  INTEGER PRIMARY KEY,
  filiale_id  INTEGER NOT NULL,
  datum       DATE NOT NULL,
  beginn      TIME NOT NULL,
  ende        TIME NOT NULL,
  FOREIGN KEY (filiale_id) REFERENCES Filiale(filiale_id) ON DELETE CASCADE
);

CREATE TABLE eingeteilt (
  mitarbeiter_id INTEGER NOT NULL,
  schicht_id     INTEGER NOT NULL,
  funktion       TEXT,
  PRIMARY KEY (mitarbeiter_id, schicht_id),
  FOREIGN KEY (mitarbeiter_id) REFERENCES Mitarbeiter(mitarbeiter_id) ON DELETE CASCADE,
  FOREIGN KEY (schicht_id)     REFERENCES Schicht(schicht_id)         ON DELETE CASCADE
);

CREATE TABLE Gericht (
  gericht_id  INTEGER PRIMARY KEY,
  name        TEXT NOT NULL,
  kategorie   TEXT,
  preis       REAL NOT NULL CHECK (preis >= 0)
);

CREATE TABLE Bestellung (
  bestellung_id   INTEGER PRIMARY KEY,
  filiale_id      INTEGER NOT NULL,
  mitarbeiter_id  INTEGER,
  zeitstempel     DATETIME NOT NULL,
  tisch_nr        INTEGER,
  status          TEXT DEFAULT 'offen',
  FOREIGN KEY (filiale_id)     REFERENCES Filiale(filiale_id),
  FOREIGN KEY (mitarbeiter_id) REFERENCES Mitarbeiter(mitarbeiter_id)
);

CREATE TABLE Bestellungsposition (
  position_id    INTEGER PRIMARY KEY,
  bestellung_id  INTEGER NOT NULL,
  gericht_id     INTEGER NOT NULL,
  menge          INTEGER NOT NULL CHECK (menge > 0),
  einzelpreis    REAL NOT NULL CHECK (einzelpreis >= 0),
  FOREIGN KEY (bestellung_id) REFERENCES Bestellung(bestellung_id) ON DELETE CASCADE,
  FOREIGN KEY (gericht_id)     REFERENCES Gericht(gericht_id)
);


