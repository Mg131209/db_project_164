load  data local infile 'C:\\Daten\\CSV\\abteilung.csv'
    into table abteilung
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,name);

load  data local infile 'C:\\Daten\\CSV\\zimmer.csv'
    into table zimmer
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,zimmernr,anz_bett,abteilung_id);

load  data local infile 'C:\\Daten\\CSV\\arzt.csv'
    into table arzt
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,vorname, nachname, abteilung_id);

load  data local infile 'C:\\Daten\\CSV\\pflegekraft.csv'
    into table pflegekraft
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,vorname, nachname, abteilung_id);

load  data local infile 'C:\\Daten\\CSV\\medikament.csv'
    into table meidkament
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,name,lagerbestand);

load  data local infile 'C:\\Daten\\CSV\\patient.csv'
    into table patient
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id,vorname, nachname, patienten_nr);

load  data local infile 'C:\\Daten\\CSV\\behandlung.csv'
    into table behandlung
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (id, eintrit_datum, austrits_datum, artzt_id, patient_id, zimmer_id);

load  data local infile 'C:\\Daten\\CSV\\behandlung_medikament.csv'
    into table behandlung_medikament
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (behandlung_id,medikament_id);

load  data local infile 'C:\\Daten\\CSV\\pflegekraft_behandlungen.csv'
    into table pflegekraft_behandlung
    fields terminated  by ','
    enclosed by '"'
    lines  terminated by '\n'
    ignore 1 lines
    (pflegekraft_id,behandlung_id);
