# YrkesCo Databasdesign

## Projektbeskrivning
Detta projekt innehåller databasdesignen för YrkesCo, en fiktiv yrkeshögskola som vill ersätta sina Excel-filer med en centraliserad databas.

## Konceptuell modell

![Konceptuell modell](./images/KonceptuellModel.png)

### Färgkodning
- 🟦 **Blå**: Personer och roller (Student, Utbildare, Utbildningsledare, Konsult, FastAnställd)
- 🟨 **Gul**: Organisatoriska enheter (Anläggning, Klass, KonsultBolag)
- 🟩 **Grön**: Utbildningsrelaterade entiteter (Program, Kurs, Kurstillfälle)

# Relationship Statements

### Postadress
- En postadress **används av** många skolor och många personer (via `student_info`).
- En postadress **identifieras av** `postal_code` (Postnummer).
- **Syfte:** Uppfyller 3NF för att undvika redundans av ortnamn.

### Skola
- En skola **har** många klasser.
- En skola **anställer** många lärare och utbildningsledare.
- En skola **ligger på** en adress (kopplad via `postal_code`).
- En skola **identifieras av** `school_id`.

### Program
- Ett program **har** många klasser (3 omgångar enligt krav).
- Ett program **består av** många kurser (M:N relation via `program_content`).
- Ett program **identifieras av** `program_id`.

### Klass
- En klass **tillhör** en skola.
- En klass **tillhör** ett program.
- En klass **leds av** en utbildningsledare som ansvarar för den.
- En klass **innehåller** många studenter.
- En klass **erbjuder** många kurstillfällen (`course_instance`).
- En klass **identifieras av** `class_id`.

### Utbildningsledare
- En utbildningsledare **ansvarar för** flera klasser.
- En utbildningsledare **tillhör** en skola.
- En utbildningsledare **har** detaljerad anställningsinfo i `employee_info`.
- En utbildningsledare **identifieras av** `leader_id`.

### Lärare
- En lärare **tillhör** en skola.
- En lärare **undervisar** vid många kurstillfällen (M:N relation via `teacher_course_rel`).
- En lärare **kan vara** en konsult (koppling till `consultant`).
- En lärare **har** kontaktuppgifter och lön i `employee_info` (om ej konsult).
- En lärare **identifieras av** `teacher_id`.

### Student & Student Info
- En student **tillhör** en klass.
- En student **har** känsliga personuppgifter lagrade separat i `student_info` (1:1 relation).
- En student **får** betyg i kurser (`course_grade`).
- En student **har** närvaro registrerad i `attendance`.
- En student **identifieras av** `student_id`.

### Kurs
- En kurs **ingår i** många program.
- En kurs **ges som** många kurstillfällen.
- En kurs **identifieras av** `course_code`.

### Kurstillfälle
- Ett kurstillfälle **är en instans av** en specifik kurs.
- Ett kurstillfälle **tillhör** en klass.
- Ett kurstillfälle **undervisas av** en eller flera lärare.
- Ett kurstillfälle **identifieras av** `instance_id`.

### Konsult & Konsultbolag
- Ett konsultbolag **hyr ut** konsulter.
- En konsult **är kopplad till** en lärare (`teacher_id`).
- En konsult **identifieras av** `teacher_id` (Foreign Key som också är Primary Key).

### Anställd Info
- Tabellen **samlar** lön, email och anställningsstatus.
- Den **tillhör** antingen en utbildningsledare eller en lärare.
- Den **identifieras av** `info_id`.

