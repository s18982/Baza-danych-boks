-- Create new table TRENER.
-- TRENER : Table of Trener
-- 	ID_TRENERA : Id_trenera partly identifies Trener
-- 	"NAZWISKO TRENERA" : Nazwisko trenera identifies Trener  
create table TRENER (
	ID_TRENERA NUMBER(38,0) not null,
	"NAZWISKO TRENERA" CHAR(20) not null, constraint TRENER_PK primary key (ID_TRENERA) ); 

-- Create new table PROMOTOR.
-- PROMOTOR : Table of Promotor
-- 	ID_PROMOTORA : Id_promotora identifies Promotor
-- 	"NAZWISKO PROMOTORA" : Nazwisko promotora partly identifies Promotor  
create table PROMOTOR (
	ID_PROMOTORA NUMBER(38,0) not null,
	"NAZWISKO PROMOTORA" CHAR(20) not null, constraint PROMOTOR_PK primary key (ID_PROMOTORA) ); 

-- Create new table RANKING.
-- RANKING : Table of Ranking
-- 	ID_FEDERACJI : Id_federacji partly identifies Ranking
-- 	ID_BOKSERA : Id_boksera partly identifies Ranking
-- 	NUMER_MIEJSCA : Numer_miejsca is of Ranking  
create table RANKING (
	ID_FEDERACJI NUMBER(38,0) not null,
	ID_BOKSERA NUMBER(38,0) not null,
	NUMER_MIEJSCA NUMBER(38,0) not null, constraint RANKING_PK primary key (ID_FEDERACJI, ID_BOKSERA) ); 

-- Create new table "FEDERACJA BOKSERSKA".
-- "FEDERACJA BOKSERSKA" : Table of Federacja Bokserska
-- 	ID_FEDERACJI : Id_federacji partly identifies Federacja Bokserska
-- 	"NAZWA FEDERACJI" : Nazwa federacji identifies Federacja Bokserska
-- 	OBSZAR : Obszar is of Federacja Bokserska  
create table "FEDERACJA BOKSERSKA" (
	ID_FEDERACJI NUMBER(38,0) not null,
	"NAZWA FEDERACJI" CHAR(3) not null,
	OBSZAR CHAR(15) not null, constraint "FEDERACJA BOKSERSKA_PK" primary key (ID_FEDERACJI) ); 

-- Create new table "KATEGORIA WAGOWA".
-- "KATEGORIA WAGOWA" : Table of Kategoria wagowa
-- 	ID_KATEGOTII : Id_kategotii identifies Kategoria wagowa
-- 	"NAZWA KATEGORII" : Nazwa kategorii partly identifies Kategoria wagowa
-- 	"WAGA MAX" : Waga Max is of Kategoria wagowa
-- 	"WAGA MIN" : Waga Min is of Kategoria wagowa  
create table "KATEGORIA WAGOWA" (
	ID_KATEGOTII NUMBER(38,0) not null,
	"NAZWA KATEGORII" CHAR(15) not null,
	"WAGA MAX" NUMBER(38,0) not null,
	"WAGA MIN" NUMBER not null, constraint "KATEGORIA WAGOWA_PK" primary key (ID_KATEGOTII) ); 

-- Create new table BOKSER.
-- BOKSER : Table of Bokser
-- 	ID_BOKSERA : Id_boksera identifies Bokser
-- 	IMIE : Imie partly identifies Bokser
-- 	NAZWISKO : Nazwisko is of Bokser
-- 	NARODOWOSC : Narodowosc is of Bokser
-- 	WIEK : Wiek is of Bokser
-- 	WAGA : Waga is of Bokser
-- 	WZROST : Wzrost is of Bokser
-- 	ID_TRENERA : Id_trenera is of Bokser
-- 	ID_KATEGOTII : Id_kategotii is of Bokser
-- 	ID_PROMOTORA : Id_promotora is of Bokser
-- 	WYGRANE : Wygrane is of Bokser
-- 	REMISY : Remisy is of Bokser
-- 	PRZEGRANE : Przegrane is of Bokser  
create table BOKSER (
	ID_BOKSERA NUMBER(38,0) not null,
	IMIE CHAR(15) not null,
	NAZWISKO CHAR(20) not null,
	NARODOWOSC CHAR(20) not null,
	WIEK NUMBER(38,0) not null,
	WAGA NUMBER not null,
	WZROST NUMBER(38,0) not null,
	ID_TRENERA NUMBER(38,0) not null,
	ID_KATEGOTII NUMBER(38,0) not null,
	ID_PROMOTORA NUMBER(38,0) not null,
	WYGRANE NUMBER(38,0) not null,
	REMISY NUMBER(38,0) not null,
	PRZEGRANE NUMBER(38,0) not null, constraint BOKSER_PK primary key (ID_BOKSERA) ); 

-- Add foreign key constraints to table RANKING.
alter table RANKING
	add constraint FEDBOKSERSKA_RANKING_FK1 foreign key (
		ID_FEDERACJI)
	 references "FEDERACJA BOKSERSKA" (
		ID_FEDERACJI); 

alter table RANKING
	add constraint BOKSER_RANKING_FK1 foreign key (
		ID_BOKSERA)
	 references BOKSER (
		ID_BOKSERA); 

-- Add foreign key constraints to table BOKSER.
alter table BOKSER
	add constraint "KATEGORIA WAGOWA_BOKSER_FK1" foreign key (
		ID_KATEGOTII)
	 references "KATEGORIA WAGOWA" (
		ID_KATEGOTII); 

alter table BOKSER
	add constraint PROMOTOR_BOKSER_FK1 foreign key (
		ID_PROMOTORA)
	 references PROMOTOR (
		ID_PROMOTORA); 

alter table BOKSER
	add constraint TRENER_BOKSER_FK1 foreign key (
		ID_TRENERA)
	 references TRENER (
		ID_TRENERA); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.
