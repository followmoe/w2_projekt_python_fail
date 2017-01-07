--
-- File generated with SQLiteStudio v3.1.1 on Sa Jan 7 15:05:34 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Ausstattung
DROP TABLE IF EXISTS Ausstattung;

CREATE TABLE Ausstattung (
    Ausstattungs_ID INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name            VARCHAR (30) NOT NULL
);

INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (1, 'WLAN');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (2, 'Schwimmbad/Sauna');

-- Table: Hotel
DROP TABLE IF EXISTS Hotel;

CREATE TABLE Hotel (
    Hotel__id     INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name          VARCHAR (70) NOT NULL,
    Sterne        INT (6),
    Zimmer_Anzahl INT          NOT NULL,
    Zimmer_ID     INTEGER      NOT NULL
                               REFERENCES zimmer (Zimmer_ID) 
);


-- Table: Hotel_Ausstattung
DROP TABLE IF EXISTS Hotel_Ausstattung;

CREATE TABLE Hotel_Ausstattung (
    Hotel_id       INTEGER REFERENCES Hotel (Hotel__id),
    Ausstattung_ID INTEGER REFERENCES Ausstattung (Ausstattungs_ID) 
);


-- Table: Kategorie
DROP TABLE IF EXISTS Kategorie;

CREATE TABLE Kategorie (
    Kategorie_Id INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name         VARCHAR (30) NOT NULL
);

INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (1, 'Suite');
INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (2, 'Doppel Zimmer');
INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (3, 'Einzel Zimmer');
INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (4, 'Junior Suite');
INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (5, 'Honey Moon');
INSERT INTO Kategorie (Kategorie_Id, Name) VALUES (6, 'Tagungsraum');

-- Table: Kunde
DROP TABLE IF EXISTS Kunde;

CREATE TABLE Kunde (
    KundenNr INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name     VARCHAR (30) NOT NULL,
    Email    VARCHAR (40) NOT NULL,
    Passwort VARCHAR (16) NOT NULL
);


-- Table: zimmer
DROP TABLE IF EXISTS zimmer;

CREATE TABLE zimmer (
    Zimmer_ID     INTEGER   PRIMARY KEY AUTOINCREMENT,
    Zimmer_Nummer INT (200) NOT NULL,
    BettenZahl    INT (5),
    Kategorie_ID  INTEGER   REFERENCES Kategorie (Kategorie_Id) 
);

INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (1, 1, 2, 1);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
