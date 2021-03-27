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
