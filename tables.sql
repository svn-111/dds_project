clear screen;

--delete existing table
drop table vaccine_record cascade constraints;
drop table vaccine_center cascade constraints;
drop table users cascade constraints;

--Create vaccine, vaccine_record

create table vaccine_record(
vid integer,
brand varchar2(30),
        PRIMARY KEY (vid)
);

create table vaccine_center(
cid     integer, 
city   varchar2(30), 
cname varchar2(30),
        PRIMARY KEY (cid)
);

create table users(
nid varchar2(30), 
name varchar2(30), 
city varchar2(30),
vid integer null,
cid integer null,
        PRIMARY KEY (nid)
		--FOREIGN KEY(cid) REFERENCES vaccine_center(cid), 
		--FOREIGN KEY(vid) REFERENCES vaccine_record(vid)
);

-----insert into vaccine_center----------
INSERT into vaccine_center values(1,'Dhaka', 'Mohanagar Institute');
INSERT into vaccine_center values(2,'Dhaka', 'Jahangir Institute');
INSERT into vaccine_center values(3,'Dhaka', 'Popular Diagnostics');

INSERT into vaccine_center values(4,'Sylhet', 'Sylhet Institute1');
INSERT into vaccine_center values(5,'Sylhet', 'Sylhet Institute2');
INSERT into vaccine_center values(6,'Sylhet', 'Sylhet Institute3');


-----insert into vaccine_record----------
INSERT into vaccine_record values(1, 'AstraZeneca');
INSERT into vaccine_record values(2, 'Pfizer');
INSERT into vaccine_record values(3, 'Sputnik V');

commit;

