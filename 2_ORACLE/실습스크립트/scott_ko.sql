
DROP TABLE emp;
DROP TABLE dept;
DROP TABLE salgrade;
DROP TABLE emp2;
DROP TABLE emp3;

purge recyclebin;

CREATE TABLE dept (
dno varchar2(2),
dname varchar2(10),
loc varchar2(6)
);

CREATE TABLE emp (
eno varchar2(4),
ename varchar2(10),
sex varchar2(2),
job varchar2(8),
mgr varchar2(4),
hdate date,
sal number,
comm number,
dno varchar2(2)
);

CREATE TABLE salgrade (
grade number,
losal number,
hisal number
);

CREATE TABLE emp2 (
eno varchar2(4),
asal number
);

CREATE TABLE emp3 (
eno varchar2(4),
ename varchar2(10),
dno varchar2(2),
dname varchar2(10)
);

INSERT INTO dept (dno, dname, loc) VALUES ('01','총무','서울');
INSERT INTO dept (dno, dname, loc) VALUES ('02','회계','서울');
INSERT INTO dept (dno, dname, loc) VALUES ('10','ERP','서울');
INSERT INTO dept (dno, dname, loc) VALUES ('20','ISP','부산');
INSERT INTO dept (dno, dname, loc) VALUES ('30','ITEA','광주');
INSERT INTO dept (dno, dname, loc) VALUES ('40','CRM','대전');
INSERT INTO dept (dno, dname, loc) VALUES ('50','POS','');
commit;


ALTER SESSION SET nls_date_format='YYYY-MM-DD';
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0001','안영희','여','경영',NULL,'1991-01-01',4800,0,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno)
 VALUES  ('0201','안영숙','여','지원','0001','1991-02-01',3900,2200,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0202','손하늘','여','지원','0001','1991-02-01',3510,980,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0301','이승철','남','회계','0001','1991-02-01',3400,0,'02');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0302','박선경','여','회계','0301','1991-02-01',3300,0,'02');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1001','문시현','남','모델링','0201','1991-02-01',4500,520,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1002','김주란','여','모델링','0201','1992-03-03',4100,330,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1003','양선호','남','모델링','0201','1995-02-21',4300,NULL,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2001','남궁연호','남','개발','0202','1993-12-13',3950,200,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2002','제갈민','남','개발','0202','1996-04-30',1520,2000,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2003','정의찬','남','개발','0202','1992-03-03',4350,NULL,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2007','이초록','남','개발','0001','1992-09-05',1989,2300,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2008','윤고은','여','개발','0001','1992-03-03',2100,NULL,'40');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('3001','김선유','남','분석','1001','1998-10-17',3200,300,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('3002','권아현','여','분석','1002','2001-01-29',2900,NULL,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0309','김선유','남','회계','0302','2011-01-03',900,90,'02');
commit;


INSERT INTO SALGRADE VALUES (1,4000,9999);
INSERT INTO SALGRADE VALUES (2,3000,3999);
INSERT INTO SALGRADE VALUES (3,2000,2999);
INSERT INTO SALGRADE VALUES (4,1000,1999);
INSERT INTO SALGRADE VALUES (5,0,999);
commit;


SELECT count(*) FROM dept;
SELECT count(*) FROM emp;
SELECT count(*) FROM salgrade;


DROP TABLE score;
DROP TABLE course;
DROP TABLE professor;
DROP TABLE student;
DROP TABLE scgrade;
DROP TABLE st_score
DROP TABLE st_score_avg

purge recyclebin;

CREATE TABLE student (
sno varchar2(6), 
sname varchar2(10),
sex varchar2(2),
syear number(1),
major varchar2(4),
avr number(4,2)
);

CREATE TABLE professor (
pno varchar2(4), 
pname varchar2(10),
section varchar2(4),
orders varchar2(6),
hiredate date
);

CREATE TABLE course (
cno varchar2(4),
cname varchar2(14),
st_num number(1),
pno varchar2(4)
);

CREATE TABLE score (
sno varchar2(6),
cno varchar2(4),
result number(3)
);       

CREATE TABLE scgrade (
   grade varchar2(1),
   hiscore number(3),
   loscore number(3)
);


CREATE TABLE st_score (
sno varchar2(6), 
sname varchar2(10),
syear number(1),
cno varchar2(4),
cname varchar2(14),
result number(3)
);


CREATE TABLE st_score_avg (
sno varchar2(6), 
sname varchar2(10),
syear number(1),
avg_result number(3)
);


INSERT INTO student VALUES ('915301','공융','남',4,'화학','0.95');
INSERT INTO student VALUES ('925301','채염','여',3,'화학','0.58');
INSERT INTO student VALUES ('935301','상총','남',2,'화학','0.99');
INSERT INTO student VALUES ('945301','견희','여',1,'화학','2.56');
INSERT INTO student VALUES ('913901','담웅','남',4,'생물','0.15');
INSERT INTO student VALUES ('923901','하후돈','남',3,'생물','0.96');
INSERT INTO student VALUES ('933901','등애','남',2,'생물','1.48');
INSERT INTO student VALUES ('943901','소교','여',1,'생물','2.54');
INSERT INTO student VALUES ('943905','화만','여',1,'생물','3.25');
INSERT INTO student VALUES ('914501','동충','남',4,'물리','1.25');
INSERT INTO student VALUES ('924501','축융','여',3,'물리','4.00');
INSERT INTO student VALUES ('934504','배준','남',2,'물리','2.16');
INSERT INTO student VALUES ('944501','괴월','남',1,'물리','0.96'); 
INSERT INTO student VALUES ('944502','사마윤','여',1,'생물','2.99');
INSERT INTO student VALUES ('944511','사마광','남',1,'물리','1.99');
INSERT INTO student VALUES ('944512','사마의','남',1,'화학','1.56');
INSERT INTO student VALUES ('944513','사마사','남',2,'생물','3.44');
INSERT INTO student VALUES ('944514','사마염','여',3,'유공','3.54');
INSERT INTO student VALUES ('944515','사마광','남',4,'물리','2.54');
INSERT INTO student VALUES ('944516','사마원','여',2,'식영','3.33');
INSERT INTO student VALUES ('915605','문공','남',4,'유공','0.96');
INSERT INTO student VALUES ('925601','노식','남',3,'유공','2.54');
INSERT INTO student VALUES ('945602','방장','남',1,'유공','2.56');
INSERT INTO student VALUES ('916805','반준','남',4,'식영','0.96');
INSERT INTO student VALUES ('926801','동현','남',3,'식영','2.54');
INSERT INTO student VALUES ('936805','초선','여',2,'식영','3.21');
INSERT INTO student VALUES ('946805','동결','남',1,'식영','1.99');

INSERT INTO professor VALUES ('1001','송강','화학','정교수',to_date('1999-12-12','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1004','시진','화학','부교수',to_date('2000-12-04','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1006','장청','화학','부교수',to_date('1999-05-20','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1007','삭초','화학','조교수',to_date('1997-07-06','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1008','이규','화학','조교수',to_date('1998-02-11','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1010','이규','물리','정교수',to_date('1995-10-07','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1013','해진','물리','부교수',to_date('1999-04-19','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1016','호연작','물리','조교수',to_date('1999-10-21','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1017','무송','유공','조교수',to_date('1994-01-24','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1018','이응','물리','조교수',to_date('1998-02-18','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1021','사진','생물','정교수',to_date('1998-02-17','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1022','이준','생물','부교수',to_date('1994-05-05','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1027','임충','생물','조교수',to_date('1998-06-03','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1029','주동','생물','정교수',to_date('1995-01-26','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1030','동평','유공','정교수',to_date('1999-02-15','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1031','서령','식영','부교수',to_date('1997-10-09','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1032','유당','유공','부교수',to_date('1998-11-01','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1033','삭의','유공','정교수',to_date('1997-07-14','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1034','해연','식영','부교수',to_date('1997-07-02','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1035','장관','식영','정교수',to_date('1997-07-28','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1036','화충','유공','부교수',to_date('1997-07-13','YYYY-MM-DD'));

INSERT INTO course VALUES ('1211','일반화학',3,'1001');
INSERT INTO course VALUES ('1214','무기화학',2,'1004');
INSERT INTO course VALUES ('1216','환경화학',2,'1006');
INSERT INTO course VALUES ('1217','고분자화학',3,'1007');
INSERT INTO course VALUES ('1218','생화학',2,'1008');
INSERT INTO course VALUES ('1220','일반물리',3,'1010');
INSERT INTO course VALUES ('1223','자기학',3,'1013');
INSERT INTO course VALUES ('1226','양자물리학',3,'1016');
INSERT INTO course VALUES ('1227','이학수학',2,'1017');
INSERT INTO course VALUES ('1228','대수학',2,'1018');
INSERT INTO course VALUES ('2357','유기물리학',3,'1021');
INSERT INTO course VALUES ('2358','식물학',3,'1022');
INSERT INTO course VALUES ('2363','화학실험',3,'1027');
INSERT INTO course VALUES ('2365','전자기학',2,'1029');
INSERT INTO course VALUES ('2366','물리실험',2,'1030');
INSERT INTO course VALUES ('2367','해부학',3,'1031');
INSERT INTO course VALUES ('2368','핵화학',3,'1032');
INSERT INTO course VALUES ('2369','무기재료',2,NULL);

INSERT INTO scgrade VALUES ('A',100,85);
INSERT INTO scgrade VALUES ('B',84,70);
INSERT INTO scgrade VALUES ('C',69,55);
INSERT INTO scgrade VALUES ('D',54,40);
INSERT INTO scgrade VALUES ('F',39,0);

INSERT INTO score VALUES ('915301','1211',63);
INSERT INTO score VALUES ('925301','1211',21);
INSERT INTO score VALUES ('935301','1211',46);
INSERT INTO score VALUES ('945301','1211',85);
INSERT INTO score VALUES ('913901','1211',44);
INSERT INTO score VALUES ('923901','1211',61);
INSERT INTO score VALUES ('933901','1211',91);
INSERT INTO score VALUES ('943901','1211',15);
INSERT INTO score VALUES ('943905','1211',22);
INSERT INTO score VALUES ('914501','1211',16);
INSERT INTO score VALUES ('924501','1211',81);
INSERT INTO score VALUES ('934504','1211',27);
INSERT INTO score VALUES ('944501','1211',22);
INSERT INTO score VALUES ('944502','1211',7);
INSERT INTO score VALUES ('915605','1211',39);
INSERT INTO score VALUES ('925601','1211',56);
INSERT INTO score VALUES ('945602','1211',16);
INSERT INTO score VALUES ('916805','1211',19);
INSERT INTO score VALUES ('926801','1211',96);
INSERT INTO score VALUES ('936805','1211',6);
INSERT INTO score VALUES ('946805','1211',79);
INSERT INTO score VALUES ('915301','1214',83);
INSERT INTO score VALUES ('925301','1214',40);
INSERT INTO score VALUES ('935301','1214',65);
INSERT INTO score VALUES ('945301','1214',17);
INSERT INTO score VALUES ('913901','1214',39);
INSERT INTO score VALUES ('923901','1214',89);
INSERT INTO score VALUES ('933901','1214',57);
INSERT INTO score VALUES ('943901','1214',57);
INSERT INTO score VALUES ('943905','1214',74);
INSERT INTO score VALUES ('914501','1214',75);
INSERT INTO score VALUES ('924501','1214',12);
INSERT INTO score VALUES ('934504','1214',94);
INSERT INTO score VALUES ('944501','1214',3);
INSERT INTO score VALUES ('944502','1214',76);
INSERT INTO score VALUES ('915605','1214',73);
INSERT INTO score VALUES ('925601','1214',59);
INSERT INTO score VALUES ('945602','1214',71);
INSERT INTO score VALUES ('916805','1214',4);
INSERT INTO score VALUES ('926801','1214',7);
INSERT INTO score VALUES ('936805','1214',37);
INSERT INTO score VALUES ('946805','1214',0);
INSERT INTO score VALUES ('915301','1216',91);
INSERT INTO score VALUES ('925301','1216',59);
INSERT INTO score VALUES ('935301','1216',54);
INSERT INTO score VALUES ('945301','1216',60);
INSERT INTO score VALUES ('913901','1216',30);
INSERT INTO score VALUES ('923901','1216',84);
INSERT INTO score VALUES ('933901','1216',83);
INSERT INTO score VALUES ('943901','1216',34);
INSERT INTO score VALUES ('943905','1216',56);
INSERT INTO score VALUES ('914501','1216',58);
INSERT INTO score VALUES ('924501','1216',51);
INSERT INTO score VALUES ('934504','1216',81);
INSERT INTO score VALUES ('944501','1216',99);
INSERT INTO score VALUES ('944502','1216',27);
INSERT INTO score VALUES ('915605','1216',40);
INSERT INTO score VALUES ('925601','1216',2);
INSERT INTO score VALUES ('945602','1216',33);
INSERT INTO score VALUES ('916805','1216',2);
INSERT INTO score VALUES ('926801','1216',35);
INSERT INTO score VALUES ('936805','1216',0);
INSERT INTO score VALUES ('946805','1216',72);
INSERT INTO score VALUES ('915301','1217',43);
INSERT INTO score VALUES ('925301','1217',52);
INSERT INTO score VALUES ('935301','1217',7);
INSERT INTO score VALUES ('945301','1217',84);
INSERT INTO score VALUES ('913901','1217',64);
INSERT INTO score VALUES ('923901','1217',100);
INSERT INTO score VALUES ('933901','1217',78);
INSERT INTO score VALUES ('943901','1217',58);
INSERT INTO score VALUES ('943905','1217',32);
INSERT INTO score VALUES ('914501','1217',16);
INSERT INTO score VALUES ('924501','1217',10);
INSERT INTO score VALUES ('934504','1217',18);
INSERT INTO score VALUES ('944501','1217',35);
INSERT INTO score VALUES ('944502','1217',80);
INSERT INTO score VALUES ('915605','1217',79);
INSERT INTO score VALUES ('925601','1217',24);
INSERT INTO score VALUES ('945602','1217',7);
INSERT INTO score VALUES ('916805','1217',36);
INSERT INTO score VALUES ('926801','1217',75);
INSERT INTO score VALUES ('936805','1217',49);
INSERT INTO score VALUES ('946805','1217',80);
INSERT INTO score VALUES ('915301','1218',92);
INSERT INTO score VALUES ('925301','1218',74);
INSERT INTO score VALUES ('935301','1218',26);
INSERT INTO score VALUES ('945301','1218',40);
INSERT INTO score VALUES ('913901','1218',72);
INSERT INTO score VALUES ('923901','1218',61);
INSERT INTO score VALUES ('933901','1218',39);
INSERT INTO score VALUES ('943901','1218',44);
INSERT INTO score VALUES ('943905','1218',71);
INSERT INTO score VALUES ('914501','1218',25);
INSERT INTO score VALUES ('924501','1218',48);
INSERT INTO score VALUES ('934504','1218',75);
INSERT INTO score VALUES ('944501','1218',37);
INSERT INTO score VALUES ('944502','1218',31);
INSERT INTO score VALUES ('915605','1218',50);
INSERT INTO score VALUES ('925601','1218',92);
INSERT INTO score VALUES ('945602','1218',64);
INSERT INTO score VALUES ('916805','1218',21);
INSERT INTO score VALUES ('926801','1218',80);
INSERT INTO score VALUES ('936805','1218',76);
INSERT INTO score VALUES ('946805','1218',5);
INSERT INTO score VALUES ('915301','1220',60);
INSERT INTO score VALUES ('925301','1220',89);
INSERT INTO score VALUES ('935301','1220',53);
INSERT INTO score VALUES ('945301','1220',32);
INSERT INTO score VALUES ('913901','1220',53);
INSERT INTO score VALUES ('923901','1220',97);
INSERT INTO score VALUES ('933901','1220',97);
INSERT INTO score VALUES ('943901','1220',12);
INSERT INTO score VALUES ('943905','1220',68);
INSERT INTO score VALUES ('914501','1220',97);
INSERT INTO score VALUES ('924501','1220',65);
INSERT INTO score VALUES ('934504','1220',52);
INSERT INTO score VALUES ('944501','1220',25);
INSERT INTO score VALUES ('944502','1220',84);
INSERT INTO score VALUES ('915605','1220',62);
INSERT INTO score VALUES ('925601','1220',66);
INSERT INTO score VALUES ('945602','1220',44);
INSERT INTO score VALUES ('916805','1220',87);
INSERT INTO score VALUES ('926801','1220',72);
INSERT INTO score VALUES ('936805','1220',72);
INSERT INTO score VALUES ('946805','1220',1);
INSERT INTO score VALUES ('915301','1223',63);
INSERT INTO score VALUES ('925301','1223',9);
INSERT INTO score VALUES ('935301','1223',54);
INSERT INTO score VALUES ('945301','1223',98);
INSERT INTO score VALUES ('913901','1223',70);
INSERT INTO score VALUES ('923901','1223',37);
INSERT INTO score VALUES ('933901','1223',35);
INSERT INTO score VALUES ('943901','1223',52);
INSERT INTO score VALUES ('943905','1223',98);
INSERT INTO score VALUES ('914501','1223',29);
INSERT INTO score VALUES ('924501','1223',40);
INSERT INTO score VALUES ('934504','1223',3);
INSERT INTO score VALUES ('944501','1223',55);
INSERT INTO score VALUES ('944502','1223',51);
INSERT INTO score VALUES ('915605','1223',50);
INSERT INTO score VALUES ('925601','1223',39);
INSERT INTO score VALUES ('945602','1223',77);
INSERT INTO score VALUES ('916805','1223',33);
INSERT INTO score VALUES ('926801','1223',86);
INSERT INTO score VALUES ('936805','1223',23);
INSERT INTO score VALUES ('946805','1223',38);
INSERT INTO score VALUES ('915301','1226',87);
INSERT INTO score VALUES ('925301','1226',84);
INSERT INTO score VALUES ('935301','1226',22);
INSERT INTO score VALUES ('945301','1226',28);
INSERT INTO score VALUES ('913901','1226',16);
INSERT INTO score VALUES ('923901','1226',49);
INSERT INTO score VALUES ('933901','1226',11);
INSERT INTO score VALUES ('943901','1226',75);
INSERT INTO score VALUES ('943905','1226',88);
INSERT INTO score VALUES ('914501','1226',28);
INSERT INTO score VALUES ('924501','1226',40);
INSERT INTO score VALUES ('934504','1226',80);
INSERT INTO score VALUES ('944501','1226',76);
INSERT INTO score VALUES ('944502','1226',20);
INSERT INTO score VALUES ('915605','1226',18);
INSERT INTO score VALUES ('925601','1226',53);
INSERT INTO score VALUES ('945602','1226',43);
INSERT INTO score VALUES ('916805','1226',1);
INSERT INTO score VALUES ('926801','1226',23);
INSERT INTO score VALUES ('936805','1226',74);
INSERT INTO score VALUES ('946805','1226',82);
INSERT INTO score VALUES ('915301','1227',76);
INSERT INTO score VALUES ('925301','1227',76);
INSERT INTO score VALUES ('935301','1227',43);
INSERT INTO score VALUES ('945301','1227',92);
INSERT INTO score VALUES ('913901','1227',49);
INSERT INTO score VALUES ('923901','1227',43);
INSERT INTO score VALUES ('933901','1227',20);
INSERT INTO score VALUES ('943901','1227',52);
INSERT INTO score VALUES ('943905','1227',76);
INSERT INTO score VALUES ('914501','1227',36);
INSERT INTO score VALUES ('924501','1227',64);
INSERT INTO score VALUES ('934504','1227',67);
INSERT INTO score VALUES ('944501','1227',17);
INSERT INTO score VALUES ('944502','1227',6);
INSERT INTO score VALUES ('915605','1227',79);
INSERT INTO score VALUES ('925601','1227',40);
INSERT INTO score VALUES ('945602','1227',84);
INSERT INTO score VALUES ('916805','1227',8);
INSERT INTO score VALUES ('926801','1227',75);
INSERT INTO score VALUES ('936805','1227',54);
INSERT INTO score VALUES ('946805','1227',35);
INSERT INTO score VALUES ('915301','1228',76);
INSERT INTO score VALUES ('925301','1228',47);
INSERT INTO score VALUES ('935301','1228',94);
INSERT INTO score VALUES ('945301','1228',86);
INSERT INTO score VALUES ('913901','1228',16);
INSERT INTO score VALUES ('923901','1228',14);
INSERT INTO score VALUES ('933901','1228',79);
INSERT INTO score VALUES ('943901','1228',14);
INSERT INTO score VALUES ('943905','1228',29);
INSERT INTO score VALUES ('914501','1228',87);
INSERT INTO score VALUES ('924501','1228',94);
INSERT INTO score VALUES ('934504','1228',86);
INSERT INTO score VALUES ('944501','1228',89);
INSERT INTO score VALUES ('944502','1228',70);
INSERT INTO score VALUES ('915605','1228',80);
INSERT INTO score VALUES ('925601','1228',96);
INSERT INTO score VALUES ('945602','1228',7);
INSERT INTO score VALUES ('916805','1228',87);
INSERT INTO score VALUES ('926801','1228',69);
INSERT INTO score VALUES ('936805','1228',46);
INSERT INTO score VALUES ('946805','1228',36);
INSERT INTO score VALUES ('915301','2357',54);
INSERT INTO score VALUES ('925301','2357',22);
INSERT INTO score VALUES ('935301','2357',58);
INSERT INTO score VALUES ('945301','2357',63);
INSERT INTO score VALUES ('913901','2357',25);
INSERT INTO score VALUES ('923901','2357',84);
INSERT INTO score VALUES ('933901','2357',74);
INSERT INTO score VALUES ('943901','2357',71);
INSERT INTO score VALUES ('943905','2357',18);
INSERT INTO score VALUES ('914501','2357',75);
INSERT INTO score VALUES ('924501','2357',78);
INSERT INTO score VALUES ('934504','2357',78);
INSERT INTO score VALUES ('944501','2357',9);
INSERT INTO score VALUES ('944502','2357',20);
INSERT INTO score VALUES ('915605','2357',29);
INSERT INTO score VALUES ('925601','2357',72);
INSERT INTO score VALUES ('945602','2357',35);
INSERT INTO score VALUES ('916805','2357',78);
INSERT INTO score VALUES ('926801','2357',80);
INSERT INTO score VALUES ('936805','2357',48);
INSERT INTO score VALUES ('946805','2357',30);
INSERT INTO score VALUES ('915301','2358',33);
INSERT INTO score VALUES ('925301','2358',20);
INSERT INTO score VALUES ('935301','2358',58);
INSERT INTO score VALUES ('945301','2358',71);
INSERT INTO score VALUES ('913901','2358',0);
INSERT INTO score VALUES ('923901','2358',10);
INSERT INTO score VALUES ('933901','2358',67);
INSERT INTO score VALUES ('943901','2358',37);
INSERT INTO score VALUES ('943905','2358',62);
INSERT INTO score VALUES ('914501','2358',82);
INSERT INTO score VALUES ('924501','2358',29);
INSERT INTO score VALUES ('934504','2358',44);
INSERT INTO score VALUES ('944501','2358',61);
INSERT INTO score VALUES ('944502','2358',14);
INSERT INTO score VALUES ('915605','2358',54);
INSERT INTO score VALUES ('925601','2358',3);
INSERT INTO score VALUES ('945602','2358',57);
INSERT INTO score VALUES ('916805','2358',86);
INSERT INTO score VALUES ('926801','2358',70);
INSERT INTO score VALUES ('936805','2358',49);
INSERT INTO score VALUES ('946805','2358',92);
INSERT INTO score VALUES ('915301','2363',36);
INSERT INTO score VALUES ('925301','2363',5);
INSERT INTO score VALUES ('935301','2363',28);
INSERT INTO score VALUES ('945301','2363',68);
INSERT INTO score VALUES ('913901','2363',2);
INSERT INTO score VALUES ('923901','2363',32);
INSERT INTO score VALUES ('933901','2363',46);
INSERT INTO score VALUES ('943901','2363',97);
INSERT INTO score VALUES ('943905','2363',49);
INSERT INTO score VALUES ('914501','2363',12);
INSERT INTO score VALUES ('924501','2363',65);
INSERT INTO score VALUES ('934504','2363',78);
INSERT INTO score VALUES ('944501','2363',29);
INSERT INTO score VALUES ('944502','2363',77);
INSERT INTO score VALUES ('915605','2363',33);
INSERT INTO score VALUES ('925601','2363',36);
INSERT INTO score VALUES ('945602','2363',37);
INSERT INTO score VALUES ('916805','2363',11);
INSERT INTO score VALUES ('926801','2363',43);
INSERT INTO score VALUES ('936805','2363',33);
INSERT INTO score VALUES ('946805','2363',91);
INSERT INTO score VALUES ('915301','2365',86);
INSERT INTO score VALUES ('925301','2365',70);
INSERT INTO score VALUES ('935301','2365',65);
INSERT INTO score VALUES ('945301','2365',38);
INSERT INTO score VALUES ('913901','2365',34);
INSERT INTO score VALUES ('923901','2365',69);
INSERT INTO score VALUES ('933901','2365',3);
INSERT INTO score VALUES ('943901','2365',95);
INSERT INTO score VALUES ('943905','2365',6);
INSERT INTO score VALUES ('914501','2365',97);
INSERT INTO score VALUES ('924501','2365',60);
INSERT INTO score VALUES ('934504','2365',78);
INSERT INTO score VALUES ('944501','2365',94);
INSERT INTO score VALUES ('944502','2365',1);
INSERT INTO score VALUES ('915605','2365',29);
INSERT INTO score VALUES ('925601','2365',70);
INSERT INTO score VALUES ('945602','2365',83);
INSERT INTO score VALUES ('916805','2365',7);
INSERT INTO score VALUES ('926801','2365',83);
INSERT INTO score VALUES ('936805','2365',44);
INSERT INTO score VALUES ('946805','2365',44);
INSERT INTO score VALUES ('915301','2366',74);
INSERT INTO score VALUES ('925301','2366',39);
INSERT INTO score VALUES ('935301','2366',29);
INSERT INTO score VALUES ('945301','2366',67);
INSERT INTO score VALUES ('913901','2366',7);
INSERT INTO score VALUES ('923901','2366',13);
INSERT INTO score VALUES ('933901','2366',84);
INSERT INTO score VALUES ('943901','2366',45);
INSERT INTO score VALUES ('943905','2366',35);
INSERT INTO score VALUES ('914501','2366',86);
INSERT INTO score VALUES ('924501','2366',28);
INSERT INTO score VALUES ('934504','2366',81);
INSERT INTO score VALUES ('944501','2366',85);
INSERT INTO score VALUES ('944502','2366',34);
INSERT INTO score VALUES ('915605','2366',39);
INSERT INTO score VALUES ('925601','2366',83);
INSERT INTO score VALUES ('945602','2366',72);
INSERT INTO score VALUES ('916805','2366',52);
INSERT INTO score VALUES ('926801','2366',54);
INSERT INTO score VALUES ('936805','2366',25);
INSERT INTO score VALUES ('946805','2366',35);
INSERT INTO score VALUES ('915301','2367',39);
INSERT INTO score VALUES ('925301','2367',76);
INSERT INTO score VALUES ('935301','2367',84);
INSERT INTO score VALUES ('945301','2367',45);
INSERT INTO score VALUES ('913901','2367',55);
INSERT INTO score VALUES ('923901','2367',72);
INSERT INTO score VALUES ('933901','2367',63);
INSERT INTO score VALUES ('943901','2367',79);
INSERT INTO score VALUES ('943905','2367',31);
INSERT INTO score VALUES ('914501','2367',18);
INSERT INTO score VALUES ('924501','2367',18);
INSERT INTO score VALUES ('934504','2367',68);
INSERT INTO score VALUES ('944501','2367',27);
INSERT INTO score VALUES ('944502','2367',53);
INSERT INTO score VALUES ('915605','2367',87);
INSERT INTO score VALUES ('925601','2367',62);
INSERT INTO score VALUES ('945602','2367',48);
INSERT INTO score VALUES ('916805','2367',9);
INSERT INTO score VALUES ('926801','2367',62);
INSERT INTO score VALUES ('936805','2367',68);
INSERT INTO score VALUES ('946805','2367',56);
INSERT INTO score VALUES ('915301','2368',1);
INSERT INTO score VALUES ('925301','2368',88);
INSERT INTO score VALUES ('935301','2368',81);
INSERT INTO score VALUES ('945301','2368',36);
INSERT INTO score VALUES ('913901','2368',67);
INSERT INTO score VALUES ('923901','2368',3);
INSERT INTO score VALUES ('933901','2368',42);
INSERT INTO score VALUES ('943901','2368',51);
INSERT INTO score VALUES ('943905','2368',36);
INSERT INTO score VALUES ('914501','2368',3);
INSERT INTO score VALUES ('924501','2368',90);
INSERT INTO score VALUES ('934504','2368',66);
INSERT INTO score VALUES ('944501','2368',56);
INSERT INTO score VALUES ('944502','2368',35);
INSERT INTO score VALUES ('915605','2368',70);
INSERT INTO score VALUES ('925601','2368',42);
INSERT INTO score VALUES ('945602','2368',55);
INSERT INTO score VALUES ('916805','2368',55);
INSERT INTO score VALUES ('926801','2368',82);
INSERT INTO score VALUES ('936805','2368',84);
INSERT INTO score VALUES ('946805','2368',21);
commit;


alter session set nls_date_format='YYYY/MM/DD';
set line 80
set pages 200
col column_name format a15
col value format a30
col table_name  format a15
col CONSTRAINT_NAME format a20
col R_OWNER format a10
col R_CONSTRAINT_NAME format a20
col OBJECT_NAME format a20
col SEARCH_CONDITION format a20
col file_name format a40
col tablespace_name format a16
col member format a38
col name format a40
col table_name format a20
col segment_name format a20
col owner format a16
col ROW_ID format a19
col profile format a20
col limit format a20
col COMMENTS format a65
col grantor format a10
col grantee format a10
col table_schema format a15
col table_name format a15
col privilege format a31
col gra format a10 
col type format a30
col Null? format a10
col WAIT_CLASS format a16
col parameter1 format a25
col parameter3 format a25
col parameter2 format a25
col event format a30
col PROPERTY_NAME format a30
col PROPERTY_VALUE format a10
col DESCRIPTION format a40 
col username format a10
col PROFILE format a10
col DEFAULT_TABLESPACE format a10
col ACCOUNT_STATUS format a20
col temporary_tablespace format a10
COL name FORMAT a5
COL sub FORMAT a15
COL content FORMAT a15  
col sname format a10
col ename format a10
col cname format a10
col pname format a10
col major format a10
col orders format a10
col section format a10
col 이름 format a10
col sex format a3
col dno format a3
col table_name format a10
col view_name format a20
col text format a40
col column_name format a14
col data_type format a14
col constraint_name format a28
col name format a10
COL column_expression FORMAT a40
COL INDEX_NAME FORMAT a20
col 상위테이블 format a10
col 상위제약조건 format a12
col 하위테이블 format a10
col 참조제약조건 format a12
col dno format a3
col data_type format a10
col SEQUENCE_NAME format a15

SELECT count(*) dept FROM dept;
SELECT count(*) emp FROM emp;
SELECT count(*) salgrade FROM salgrade;

select count(*) student from student;
select count(*) professor from professor;
select count(*) course from course;
select count(*) score from score;

