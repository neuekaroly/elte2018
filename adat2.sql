--Kik azok a felhasználók, akiknek van triggere és nézete is?
select owner from dba_objects where object_type = 'TRIGGER'
intersect
select owner from dba_objects where object_type = 'VIEW';

--Kik azok a felhasználók, akiknek van nézete, de nincs triggere?
select owner from dba_objects where object_type = 'TRIGGER'
minus
select owner from dba_objects where object_type = 'VIEW';

--Kik azok a felhasználók, akiknek több mint 40 táblájuk, de maximum 37 indexük van?
select owner, count(*) from dba_objects where object_type = 'TABLE' group by owner having count(*)>40
minus
select owner, count(*) from dba_objects where object_type = 'INDEX' group by owner having count(*)>37;

--másik megoldás
select owner, count(*) from dba_objects where object_type = 'TABLE' group by owner having count(*)>40
intersect
(select owner, count(*) from dba_objects where object_type = 'INDEX' group by owner having count(*)>37;
union
(select owner from dba_objects
minus
select from owner from dba_objects where object_type='INDEX'));

--Kilistázz az oszlop neveket
desc sila.emp

--
select * from user_tab_columns;

--Hány oszlopa van a nikovits.emp táblának?
select count(*) from dba_tab_columns where owner = 'NIKOVITS' and table_name = 'EMP'
--vagy
select max(column_id) from dba_tab_columns where owner = 'NIKOVITS' and table_name = 'EMP'

--
select * emp where rownum=1;

select * emp where rownum<=2;

--Milyen típusú a nikovits.emp tábla 6. oszlopa?
select data_type from dba_tab_columns where owner = 'NIKOVITS' and table_name = 'EMP' and column_id = 6;

--Adjuk meg azoknak a tábláknak a tulajdonosát és nevét, amelyeknek van 'Z' betűvel 
--kezdődő oszlopa.
select distinct owner, table_name from dba_tab_columns where column_name like 'Z%';

--Adjuk meg azoknak a tábláknak a nevét, amelyeknek legalább 8 darab dátum tipusú oszlopa van.
select owner, table_name, count(*) from dba_tab_columns
where data_type = 'DATE' group by owner, table_name having count(*) > 8;

--