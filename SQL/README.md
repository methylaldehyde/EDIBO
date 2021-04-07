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

# SQLite3 piemēra datubāzes pārnese uz MySQL


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
trigger piemērs:
```
SELECT 'CREATE TRIGGER before_insert_Artists_only_unique_values' AS '';
DELIMITER $$
CREATE TRIGGER before_insert_Artists_only_unique_values
     BEFORE INSERT ON Artists FOR EACH ROW
     BEGIN
          IF NEW.Name IN (SELECT Name FROM Artists) THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Iearakstu nevar izveidot - tāds izpildītājs jau eksistē!';
          END IF;
     END;$$
DELIMITER ;
#DROP TRIGGER before_insert_Artists_only_unique_values;
```
Parūpējas par ierakstu attiecīgajā tabulā (Artists) unikalitāti šajā piemērā. Šādā veidā var kontrolēt DELETE, INSERT, UPDATE darbības veicot ar trigger konkrētajiem nosacījumiem.


*function*
[MySQL funkciju reference](https://dev.mysql.com/doc/refman/8.0/en/sql-function-reference.html)

*procedure* MySQL procedūrai ir vārds, parametru saraksts un SQL nosacījumi.
