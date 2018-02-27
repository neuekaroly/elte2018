--dba_synonyms
select * from dba_synonyms

--synonym nikovits.szeret táblára
create synonym nsz for nikovits.szeret

--saját synonymok lekérés
select * from user_synonyms

--view készítése
create or replace view nevsor as select nev from nikovits.szeret;

--táblázat oszlopainak kiírása
desc szeret

--sequence
create sequence szamok 
start with 20
increment by 5
nocycle
nocache;

--kezdőértéket ad
select szamok.nextval from dual

--jelenlegi érték
select szamok.currval from dual

--data base link
create database link ullman connect to rb653s identified by rb653s using 'ullman.inf.elte.hu:1521/ullman';

--data base link hivatkozas
