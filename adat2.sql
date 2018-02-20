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


