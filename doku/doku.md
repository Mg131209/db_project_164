

 [[#Einleitung|Einleitung]]
	- [[#Ziel des Projekts|Ziel des Projekts]]
- [[#Tabellen und Beziehungen|Tabellen und Beziehungen]]
- [[#Attribute pro Tabelle|Attribute pro Tabelle]]
	- [[#abteilung|abteilung]]
	- [[#arzt|arzt]]
	- [[#medikament|medikament]]
	- [[#behandlung_medikament|behandlung_medikament]]
	- [[#patient|patient]]
	- [[#pflegekraft|pflegekraft]]
	- [[#zimmer|zimmer]]
	- [[#behandlung|behandlung]]
	- [[#pflegekraft_behandlung|pflegekraft_behandlung]]
- [[#Wahl des RDBMS|Wahl des RDBMS]]
- [[#Datenmodelle|Datenmodelle]]
	- [[#Konzeptionelles Datenmodell|Konzeptionelles Datenmodell]]
- [[#Logisches Datenmodell|Logisches Datenmodell]]
- [[#Select Abfragen]]

## Einleitung

### Ziel des Projekts

Das Ziel unseres Projektes ist es, Krankenakten in einem Spital zu managen. Ärzte können dort alle Behandlungen erfassen und verwalten. Pflegekräfte können anhand der erfassten Daten ebenfalls auf die Behandlungen zugreifen und wissen sofort, welche Behandlungen ein Patient benötigt.

## Tabellen und Beziehungen

In unserer Datenbank ist der Hauptträger die Behandlung. Patienten, Ärzte, Zimmer und alle anderen Tabellen werden dort zusammengebracht. Die Pflegekräfte und die Ärzte gehören zu mindestens einer Abteilung, in der sich wiederum Zimmer befinden. In diesen finden die Behandlungen von Patienten statt. Patienten können pro Behandlung Medikamente bekommen, die das Krankenhaus auf Lager hat.

## Attribute pro Tabelle
### abteilung

- **id**: INT, auto_increment, PRIMARY KEY
- **name**: VARCHAR(50), NOT NULL

### arzt

- **id**: INT, auto_increment, PRIMARY KEY
- **vorname**: VARCHAR(50), NOT NULL
- **nachname**: VARCHAR(50), NOT NULL
- **abteilung_id**: INT, NOT NULL, FOREIGN KEY references abteilung(id)

### medikament

- **id**: INT, auto_increment, PRIMARY KEY
- **name**: VARCHAR(50), NOT NULL

- **preis**: Decimal(10, 2)
- **lagerbestand**: INT, NOT NULL

### behandlung_medikament

- **behandlung_id**: INT, NOT NULL, FOREIGN KEY references behandlung(id)
- **medikament_id**: INT, NOT NULL, FOREIGN KEY references medikament(id)
- **Constraints**: Composite key (behandlung_id, medikament_id) implied by structure

### patient

- **id**: INT, auto_increment, PRIMARY KEY
- **vorname**: VARCHAR(50), NOT NULL
- **nachname**: VARCHAR(50), NOT NULL
- **patienten_nr**: INT, NOT NULL

### pflegekraft

- **id**: INT, auto_increment, PRIMARY KEY
- **vorname**: VARCHAR(50), NOT NULL
- **nachname**: VARCHAR(50), NOT NULL
- **abteilung_id**: INT, NOT NULL, FOREIGN KEY references abteilung(id)

### zimmer

- **id**: INT, auto_increment, PRIMARY KEY
- **zimmer_nr**: INT, NOT NULL
- **anz_bett**: INT, NOT NULL
- **abteilung_id**: INT, NOT NULL, FOREIGN KEY references abteilung(id)

### behandlung

- **id**: INT, auto_increment, PRIMARY KEY
- **eintritt_datum**: DATE, NOT NULL
- **austritts_datum**: DATE, NOT NULL
- **notizen**: VARCHAR(500), NULL allowed
- **artzt_id**: INT, NOT NULL, FOREIGN KEY references arzt(id)
- **patient_id**: INT, NOT NULL, FOREIGN KEY references patient(id)
- **zimmer_id**: INT, NOT NULL, FOREIGN KEY references zimmer(id)

### pflegekraft_behandlung

- **pflegekraft_id**: INT, NOT NULL, FOREIGN KEY references pflegekraft(id)
- **behandlung_id**: INT, NOT NULL, FOREIGN KEY references behandlung(id)
- **Constraints**: Composite key (pflegekraft_id, behandlung_id) implied by structure

## Wahl des RDBMS

Wir haben uns bei der Wahl des Datenbanksystems auf MariaDB geeinigt, da es Open Source, stabil und schnell ist. Außerdem ist es ein Industriestandard, der viel eingesetzt wird.

## Datenmodelle

### Konzeptionelles Datenmodell

![[M164_KonzeptionellesDiagramm.jpg]]

## Logisches Datenmodell

![[M164_LogischesDiagramm.jpg]]

# Select Abfragen

```sql
-- 1
-- Gibt alle Patienten mit Vor- und Nachnamen aus
SELECT vorname, nachname
FROM patient;


-- 2
-- Zeigt alle Ärzte inklusive ihrer jeweiligen Abteilung an
SELECT a.vorname, a.nachname, ab.name AS Abteilung
FROM arzt a
JOIN abteilung ab ON a.abteilung_id = ab.id;


-- 3
-- Listet alle Zimmer mit ihrer Bettenanzahl auf
SELECT zimmer_nr, anz_bett
FROM zimmer
ORDER BY anz_bett DESC;


-- 4
-- Zeigt alle Patienten und (falls vorhanden) deren Behandlungen mit Eintrittsdatum
SELECT p.vorname, p.nachname, b.eintrit_datum
FROM patient p
LEFT JOIN behandlung b ON p.id = b.patient_id;


-- 5
-- Gibt alle Medikamente aus, deren Lagerbestand unter 100 liegt
SELECT m.name, m.lagerbestand
FROM medikament m
WHERE lagerbestand < 100;


-- 6
-- Zählt die Anzahl der Behandlungen pro Patient
SELECT p.vorname, p.nachname, COUNT(b.id) AS Anzahl_Behandlungen
FROM patient p
LEFT JOIN behandlung b ON p.id = b.patient_id
GROUP BY p.id;


-- 7
-- Zeigt alle Behandlungen mit Eintrittsdatum sowie zugehörigem Arzt und Patient
SELECT b.eintrit_datum, a.nachname AS Arzt, p.nachname AS Patient
FROM behandlung b
JOIN arzt a ON b.artzt_id = a.id
JOIN patient p ON b.patient_id = p.id;


-- 8
-- Gibt alle Abteilungen aus, in denen mindestens ein Arzt arbeitet
SELECT DISTINCT ab.name
FROM abteilung ab
JOIN arzt a ON ab.id = a.abteilung_id;


-- 9
-- Zeigt alle Pflegekräfte und die Behandlungen, an denen sie beteiligt sind
SELECT pk.vorname, pk.nachname, b.id AS Behandlung_ID
FROM pflegekraft pk
LEFT JOIN pflegekraft_behandlung pb ON pk.id = pb.pflegekraft_id
LEFT JOIN behandlung b ON pb.behandlung_id = b.id;


-- 10
-- Zählt, wie oft jedes Zimmer belegt wurde (Anzahl der Behandlungen pro Zimmer)
SELECT z.zimmer_nr, COUNT(b.id) AS Belegungen
FROM zimmer z
LEFT JOIN behandlung b ON z.id = b.zimmer_id
GROUP BY z.id;
```

