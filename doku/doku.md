```table-of-contents
```
# Enleitung
## Ziel Des Projekt
Das Zeil unseres Projektes ist es Krancken ackten in einem Spital zu managen. Ärzte können dort alle behandlungen erfassen und managen. Pflegekräfte können anhand der erfasten daten dann ebenfals auf die Behandlunge zugreifen und Wissen sofort welche behandlungen ein Patient Benötigt

## Tabellen und Beziehungen

In unserer Datenbank ist der Hauptträger die Behandlung. Patienten, Ärzte, Zimmer und alle anderen Tabellen werden dort zusammengebracht. Die Pflegekräfte und die Ärzte gehören zu mindestens einer Abteilung, in der sich wiederum Zimmer befinden. In diesen finden die Behandlungen von Patienten statt.
## Atribute pro tabelle
### Ärzte

# Wahl des RDMS

Wir haben uns bei der Wahl des DMS auf MariaDB geeinigt, da es Open Source, stabil und schnell ist. Ausserdem ist es ein Industriestandard, der viel eingesetzt wird.

# Datenmodelle

## Konzeptionelles Datenmodell

![[M164_KonzeptionellesDiagramm.jpg]]

## Logisches Datenmodell

![[M164_LogischesDiagramm.jpg]]
# Select Abfragen
