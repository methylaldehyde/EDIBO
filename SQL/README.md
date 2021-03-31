#SQL

Sagatavo github repozitoriju, kurā uzturēt elektronisko kladi.

# SQLite
datubāžu veidošana ar SQLite

*SQL* ir valoda
*SQLite* ir bez-servera failu bāzes sistēma

## Command-Line interaction

Dažas no svarīgākajām SQLite komandām:

```
sqlite3
```
Lai sāktu SQLite procesu

```
.databases
```
Lai redzētu pieejamās datubāzes.

```
.database
```
Lai redzētu, ar kura datubāze ir aktuāla.

```
.schema
```
Lai redzētu datubāzes uzbūves shēmu

```
.tables
```
Lai redzētu pieejamās tabulas


# MySQL
servera bāzēta failu datubāžu menedžmenta sistēma

## Vides sagatavošana

Lejuplādē MySQL installer, instalē nepieciešamo serveri, konektorus, u.c. [te pamācība](https://www.onlinetutorialspoint.com/mysql/install-mysql-on-windows-10-step-by-step.html), konfigurē serveri darbam.
Lejuplādē [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
Lejuplādē SQLite chinook.db piemēra datubāzi, ar comandu ```schema``` aplūko tās struktūru iekš replit.com vai GIT-bash.
*(repl.it bash -> add chinook.zip -> unzip chinook.zip -> sqlite3 -> .open chinook.db -> .schema)*


*primary key* ir ierobežojams, kas ar unikālu vērtību identificē ierakstu tabulā. Katrai tabulai var būt piešķirts tikai viens primary key un tā kolonna nedrīkst būt NULL.
Tipiski primary key tiek definēts ```CREATE TABLE``` apgalvojumā.
Šis ierobežojums var tikt veikts kad primary key ir viena kolonna:
```CREATE TABLE table_name ( 
    primary_key_column datatype, 
    ... ,
    PRIMARY KEY(primary_key_column)
);
```

Primary key var pievienot arī izmantojot ```ALTER TABLE``` apgalvojumu:
```
ALTER TABLE table_name
ADD PRIMARY KEY(column_list);
```

*foreign key* ir ierobežojums, kolonna vai grupa kolonnu, kas liedz darbības, kas izjauktu saiknes starp tabulām. Tas ir lauks tabulā, kas atsaucas uz primary key citā tabulā, veidojot savstarpējās atsauces un saglabājot atsauču integritāti. Foreign key var definēt izmantojot ```CREATE TABLE``` un ```ALTER TABLE``` apgalvojumus.

*trigger* ir datubāzes objekts ar nosaukumu, kas ir asociēts ar tabulu, un tas tiek aktivēts, kad sevišķš notikums noris šajā tabulā.


*function*

*procedure*
