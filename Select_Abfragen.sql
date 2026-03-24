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