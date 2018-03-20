create table emp as select * from nikovits.emp;
create table dept as select * from nikovits.dept;
create table sz as select * from sz@aramis;

create index nsor on sz(n);
select * from sz order by n;

select * from sz where n = 'Kanga';

create index ngysor on sz(n,gy);
select * from sz order by n,gy;

create index nsorvissza on sz(n desc);
select * from sz order by n desc;

create index ngyvisszasor on sz(n, gy desc);
select * from sz order by n,gy desc;

create index hsor on sz(substr(n,3,1));
select * from sz order by substr(n,3,1);

select sz.*, substr(n,3,1) from sz order by substr(n,3,1);

create bitmap index gysor_bix on sz(gyumolcs);
select distinct gyumolcs from sz;

select * from dba_indexes;
select * from user_indexes;
select * from dba_ind_columns;
select * from user_ind_columns;

select * from DBA_IND_EXPRESSIONS;
select * from USER_IND_EXPRESSIONS;

--IOT tábla null helyen
select * from dba_tables where owner = "nikovits"
--IOT OVERFLOW -> ITO_NAME-BEN HOGY MELYIK TÁBLÁZHOZ TARTOZIK
select * from dba_indexes where owner = "Nikovits"

CREATE CLUSTER personnel_cl (department_number NUMBER(2)) SIZE 4K;

CREATE TABLE emp_clt
	(empno NUMBER PRIMARY KEY, ename VARCHAR2(30), job VARCHAR2(27), mgr NUMBER(4), hiredate DATE, sal NUMBER(7,2), com NUMBER(7,2). deptno NUMBER(2) NOT NULL)
CLUSTER personnel_cl (deptno)

--többi nikovits cr_cluster.txt insert stb...
--ce_part_table.txt -- aramis	



