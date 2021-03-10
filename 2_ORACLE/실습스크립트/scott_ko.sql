
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

INSERT INTO dept (dno, dname, loc) VALUES ('01','�ѹ�','����');
INSERT INTO dept (dno, dname, loc) VALUES ('02','ȸ��','����');
INSERT INTO dept (dno, dname, loc) VALUES ('10','ERP','����');
INSERT INTO dept (dno, dname, loc) VALUES ('20','ISP','�λ�');
INSERT INTO dept (dno, dname, loc) VALUES ('30','ITEA','����');
INSERT INTO dept (dno, dname, loc) VALUES ('40','CRM','����');
INSERT INTO dept (dno, dname, loc) VALUES ('50','POS','');
commit;


ALTER SESSION SET nls_date_format='YYYY-MM-DD';
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0001','�ȿ���','��','�濵',NULL,'1991-01-01',4800,0,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno)
 VALUES  ('0201','�ȿ���','��','����','0001','1991-02-01',3900,2200,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0202','���ϴ�','��','����','0001','1991-02-01',3510,980,'01');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0301','�̽�ö','��','ȸ��','0001','1991-02-01',3400,0,'02');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0302','�ڼ���','��','ȸ��','0301','1991-02-01',3300,0,'02');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1001','������','��','�𵨸�','0201','1991-02-01',4500,520,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1002','���ֶ�','��','�𵨸�','0201','1992-03-03',4100,330,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('1003','�缱ȣ','��','�𵨸�','0201','1995-02-21',4300,NULL,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2001','���ÿ�ȣ','��','����','0202','1993-12-13',3950,200,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2002','������','��','����','0202','1996-04-30',1520,2000,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2003','������','��','����','0202','1992-03-03',4350,NULL,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2007','���ʷ�','��','����','0001','1992-09-05',1989,2300,'30');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('2008','������','��','����','0001','1992-03-03',2100,NULL,'40');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('3001','�輱��','��','�м�','1001','1998-10-17',3200,300,'10');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('3002','�Ǿ���','��','�м�','1002','2001-01-29',2900,NULL,'20');
INSERT INTO emp (eno, ename, sex, job, mgr, hdate, sal, comm, dno) 
VALUES  ('0309','�輱��','��','ȸ��','0302','2011-01-03',900,90,'02');
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


INSERT INTO student VALUES ('915301','����','��',4,'ȭ��','0.95');
INSERT INTO student VALUES ('925301','ä��','��',3,'ȭ��','0.58');
INSERT INTO student VALUES ('935301','����','��',2,'ȭ��','0.99');
INSERT INTO student VALUES ('945301','����','��',1,'ȭ��','2.56');
INSERT INTO student VALUES ('913901','���','��',4,'����','0.15');
INSERT INTO student VALUES ('923901','���ĵ�','��',3,'����','0.96');
INSERT INTO student VALUES ('933901','���','��',2,'����','1.48');
INSERT INTO student VALUES ('943901','�ұ�','��',1,'����','2.54');
INSERT INTO student VALUES ('943905','ȭ��','��',1,'����','3.25');
INSERT INTO student VALUES ('914501','����','��',4,'����','1.25');
INSERT INTO student VALUES ('924501','����','��',3,'����','4.00');
INSERT INTO student VALUES ('934504','����','��',2,'����','2.16');
INSERT INTO student VALUES ('944501','����','��',1,'����','0.96'); 
INSERT INTO student VALUES ('944502','�縶��','��',1,'����','2.99');
INSERT INTO student VALUES ('944511','�縶��','��',1,'����','1.99');
INSERT INTO student VALUES ('944512','�縶��','��',1,'ȭ��','1.56');
INSERT INTO student VALUES ('944513','�縶��','��',2,'����','3.44');
INSERT INTO student VALUES ('944514','�縶��','��',3,'����','3.54');
INSERT INTO student VALUES ('944515','�縶��','��',4,'����','2.54');
INSERT INTO student VALUES ('944516','�縶��','��',2,'�Ŀ�','3.33');
INSERT INTO student VALUES ('915605','����','��',4,'����','0.96');
INSERT INTO student VALUES ('925601','���','��',3,'����','2.54');
INSERT INTO student VALUES ('945602','����','��',1,'����','2.56');
INSERT INTO student VALUES ('916805','����','��',4,'�Ŀ�','0.96');
INSERT INTO student VALUES ('926801','����','��',3,'�Ŀ�','2.54');
INSERT INTO student VALUES ('936805','�ʼ�','��',2,'�Ŀ�','3.21');
INSERT INTO student VALUES ('946805','����','��',1,'�Ŀ�','1.99');

INSERT INTO professor VALUES ('1001','�۰�','ȭ��','������',to_date('1999-12-12','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1004','����','ȭ��','�α���',to_date('2000-12-04','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1006','��û','ȭ��','�α���',to_date('1999-05-20','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1007','����','ȭ��','������',to_date('1997-07-06','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1008','�̱�','ȭ��','������',to_date('1998-02-11','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1010','�̱�','����','������',to_date('1995-10-07','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1013','����','����','�α���',to_date('1999-04-19','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1016','ȣ����','����','������',to_date('1999-10-21','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1017','����','����','������',to_date('1994-01-24','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1018','����','����','������',to_date('1998-02-18','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1021','����','����','������',to_date('1998-02-17','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1022','����','����','�α���',to_date('1994-05-05','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1027','����','����','������',to_date('1998-06-03','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1029','�ֵ�','����','������',to_date('1995-01-26','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1030','����','����','������',to_date('1999-02-15','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1031','����','�Ŀ�','�α���',to_date('1997-10-09','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1032','����','����','�α���',to_date('1998-11-01','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1033','����','����','������',to_date('1997-07-14','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1034','�ؿ�','�Ŀ�','�α���',to_date('1997-07-02','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1035','���','�Ŀ�','������',to_date('1997-07-28','YYYY-MM-DD'));
INSERT INTO professor VALUES ('1036','ȭ��','����','�α���',to_date('1997-07-13','YYYY-MM-DD'));

INSERT INTO course VALUES ('1211','�Ϲ�ȭ��',3,'1001');
INSERT INTO course VALUES ('1214','����ȭ��',2,'1004');
INSERT INTO course VALUES ('1216','ȯ��ȭ��',2,'1006');
INSERT INTO course VALUES ('1217','�����ȭ��',3,'1007');
INSERT INTO course VALUES ('1218','��ȭ��',2,'1008');
INSERT INTO course VALUES ('1220','�Ϲݹ���',3,'1010');
INSERT INTO course VALUES ('1223','�ڱ���',3,'1013');
INSERT INTO course VALUES ('1226','���ڹ�����',3,'1016');
INSERT INTO course VALUES ('1227','���м���',2,'1017');
INSERT INTO course VALUES ('1228','�����',2,'1018');
INSERT INTO course VALUES ('2357','���⹰����',3,'1021');
INSERT INTO course VALUES ('2358','�Ĺ���',3,'1022');
INSERT INTO course VALUES ('2363','ȭ�н���',3,'1027');
INSERT INTO course VALUES ('2365','���ڱ���',2,'1029');
INSERT INTO course VALUES ('2366','��������',2,'1030');
INSERT INTO course VALUES ('2367','�غ���',3,'1031');
INSERT INTO course VALUES ('2368','��ȭ��',3,'1032');
INSERT INTO course VALUES ('2369','�������',2,NULL);

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
col �̸� format a10
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
col �������̺� format a10
col ������������ format a12
col �������̺� format a10
col ������������ format a12
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

