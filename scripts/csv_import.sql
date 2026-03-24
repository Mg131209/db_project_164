USE krankenhaus;

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\abteilung.csv'
INTO TABLE abteilung
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, name);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\zimmer.csv'
INTO TABLE zimmer
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, zimmer_nr, anz_bett, abteilung_id);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\arzt.csv'
INTO TABLE arzt
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, vorname, nachname, abteilung_id);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\pflegekraft.csv'
INTO TABLE pflegekraft
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, vorname, nachname, abteilung_id);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\medikament.csv'
INTO TABLE medikament
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, name, lagerbestand);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\patient.csv'
INTO TABLE patient
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, vorname, nachname, patienten_nr);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\behandlung.csv'
INTO TABLE behandlung
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id,eintritt_datum,austritts_datum,notizen,arzt_id,patient_id,zimmer_id);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\behandlung_medikament.csv'
INTO TABLE behandlung_medikament
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(behandlung_id, medikament_id);

LOAD DATA LOCAL INFILE 'C:\\Daten\\CSV\\pflegekraft_behandlungen.csv'
INTO TABLE pflegekraft_behandlung
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(pflegekraft_id, behandlung_id);