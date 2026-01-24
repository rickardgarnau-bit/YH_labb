# Databasdesign för YrkesCo

**Kurs:** Databasdesign och Modellering  
**Student:** Rickard Garnau
**Datum:** 2026-01-24

---

## Om Uppgiften
Målet med denna uppgift var att designa och implementera en ny databasstruktur för utbildningsföretaget **YrkesCo**. Projektet syftade till att ersätta manuell datahantering i Excel med en centraliserad, skalbar och säker relationsdatabas (PostgreSQL).

Lösningen hanterar skolor, klasser, utbildare (både anställda och konsulter), studenter samt LIA-placeringar enligt **3NF** (Tredje Normalformen).

## Videopresentation
Min redovisning och demo av databasen finns uppladdad (olistad) på YouTube:
🔗 **https://youtu.be/DFx1197EG2k**

> **Notering:** I videon fokuserar jag på affärsnyttan och logiken. För detaljerade specifikationer kring relationer, se avsnittet "Affärsregler" i den bifogade PDF:en.

---

## Användning av AI (AI-deklaration)
I arbetet med denna inlämningsuppgift har jag använt AI-verktyg (främst Gemini) som stöd i utvecklingsprocessen. Jag har använt AI på följande sätt:

1.  **Generering av testdata:** För att befolka databasen med realistisk data (mock data) har jag använt AI för att generera listor på namn, adresser, telefonnummer och e-postadresser.
2.  **Bollplank för struktur:** Jag har använt AI för att diskutera hur man bäst presenterar den konceptuella modellen och för att strukturera manuset till videopresentationen.
3.  **Syntax-stöd:** Hjälp med specifika PostgreSQL-kommandon, t.ex. regex-validering (`CONSTRAINT` med `~`) och funktioner som `COALESCE`.

*All övrig kod, logik, databasmodellering (ER-diagram) och designval är mina egna.*

---

## Samarbete och Metod
För att säkerställa en robust design har jag diskuterat kravspecifikationen och databasens omfattning med kurskamrater.

* **Kravanalys:** Vi har gemensamt diskuterat tolkningar av uppgiften och brainstormat kring vilken extra funktionalitet (utöver grundkraven) som skulle ge mest affärsnytta, till exempel hanteringen av LIA-praktiken.
* **Egna val:** Utifrån dessa diskussioner har jag sedan självständigt utformat min unika lösning, mina modeller och min kod.

---

## Källor
Följande resurser har använts för att lösa uppgiften och säkerställa korrekt syntax och design:

* **Dokumentation:** PostgreSQL Official Documentation (https://www.postgresql.org/docs/) - för syntax kring `SERIAL`, `Date` och `Constraints`.

---

## Teknisk Lösning & Designval

### Nyckelfunktioner
* **Skalbarhet:** Adresser är utbrutna till tabellen `postal_address` (3NF) för att undvika redundans.
* **Säkerhet (GDPR):** Känsliga uppgifter som personnummer och lön ligger i separata tabeller (`student_info`, `employee_info`) för att möjliggöra striktare åtkomstkontroll.
* **Flexibilitet:** Modellen använder en struktur som liknar "arv" för att hantera att en utbildare kan vara antingen fast anställd eller konsult.
* **Datakvalitet:** `CHECK`-constraints säkerställer att e-post och telefonnummer följer korrekt format.

### Filstruktur
* `01_create_tables.sql`: DDL-skript som skapar alla tabeller och relationer.
* `02_insert_data.sql`: DML-skript som fyller databasen med testdata.
* `03_queries.sql`: SQL-frågor för analys (t.ex. lönekostnader, LIA-placeringar, betygssnitt).

## Instruktioner för att köra koden
För att testa databasen, kör filerna i din SQL-klient (t.ex. pgAdmin eller VS Code) i följande ordning:

1.  Kör **Create Tables** för att bygga strukturen.
2.  Kör **Insert Data** för att lägga in informationen (Viktigt att göra detta steg 2 p.g.a. Foreign Keys).
3.  Kör **Queries** för att se resultatet av vyerna och analyserna.