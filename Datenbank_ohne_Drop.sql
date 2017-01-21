--
-- File generated with SQLiteStudio v3.1.1 on Sa Jan 7 16:43:59 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Ausstattung
CREATE TABLE Ausstattung (
    Ausstattungs_ID INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name            VARCHAR (30) NOT NULL
);

INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (1, 'WLAN');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (2, 'Schwimmbad');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (3, 'Sauna');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (4, 'TV');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (5, 'Sky/Entertainment');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (6, 'Minibar');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (7, 'Bar/Lobby');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (8, 'Parkplatz');
INSERT INTO Ausstattung (Ausstattungs_ID, Name) VALUES (9, 'Haustiere');

-- Table: Hotel
CREATE TABLE Hotel (
    Hotel__id             INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name                  VARCHAR (70) NOT NULL,
    Sterne                INT (6),
    Zimmer_Anzahl         INT          NOT NULL,
    Hotel_Ausstattungs_ID INTEGER      NOT NULL
                                       REFERENCES Hotel_Ausstattung (Hotel_Ausstattung_ID) ON UPDATE CASCADE
);

INSERT INTO Hotel (Hotel__id, Name, Sterne, Zimmer_Anzahl, Hotel_Ausstattungs_ID) VALUES (1, 'Asgard Hotel', 3, 63, 1);

-- Table: Hotel_Ausstattung
CREATE TABLE Hotel_Ausstattung (
    Hotel_id             INTEGER REFERENCES Hotel (Hotel__id),
    Ausstattung_ID       INTEGER REFERENCES Ausstattung (Ausstattungs_ID),
    Hotel_Ausstattung_ID INTEGER NOT NULL
);

INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 1, 1);
INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 8, 1);
INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 9, 1);
INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 6, 1);
INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 3, 1);
INSERT INTO Hotel_Ausstattung (Hotel_id, Ausstattung_ID, Hotel_Ausstattung_ID) VALUES (1, 4, 1);

-- Table: Kategorie
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
CREATE TABLE Kunde (
    KundenNr INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name     VARCHAR (30) NOT NULL,
    Email    VARCHAR (40) NOT NULL,
    Passwort VARCHAR (16) NOT NULL
);


-- Table: zimmer
CREATE TABLE zimmer (
    Zimmer_ID     INTEGER   PRIMARY KEY AUTOINCREMENT,
    Zimmer_Nummer INT (200) NOT NULL ON CONFLICT FAIL,
    BettenZahl    INT (5),
    Kategorie_ID  INTEGER   REFERENCES Kategorie (Kategorie_Id) 
);

INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (1, 1, 2, 1);
INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (2, 2, 2, 2);
INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (3, 3, 1, 3);
INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (4, 4, 0, 6);
INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (5, 5, 2, 4);
INSERT INTO zimmer (Zimmer_ID, Zimmer_Nummer, BettenZahl, Kategorie_ID) VALUES (6, 6, 2, 5);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
