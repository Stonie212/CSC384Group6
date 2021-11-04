CREATE TABLE EDITORIC(
    NAME VARCHAR(20),
    ID INT PRIMARY KEY
);

CREATE TABLE EDITORS(
    NAME VARCHAR(20),
    ID INT PRIMARY KEY,
    REPORTSTO INT REFERENCES EDITORIC
);

CREATE TABLE MAGAZINES(
    EDITION INT,
    NAME VARCHAR(20),
    PUBLISHER VARCHAR(20),
    GENRE VARCHAR(20),
    PRIMARY KEY(NAME, EDITION),
    EDITEDBY INT REFERENCES EDITORIC
);

CREATE TABLE MCUSTOMERS(
    NAME VARCHAR(20),
    ID INT PRIMARY KEY
);

CREATE TABLE PURCHASES(
    CID INT REFERENCES MCUSTOMERS,
    MEDITION INT,
    MNAME VARCHAR(20),
    FOREIGN KEY (MNAME, MEDITION) REFERENCES MAGAZINES(NAME, EDITION)
);

CREATE TABLE CONTRIBUTOR(
    ID INT PRIMARY KEY,
    TYPE VARCHAR(20),
    NAME VARCHAR(20)
);

CREATE TABLE MCONTENT(
    CID INT PRIMARY KEY,
    GENRE VARCHAR(20),
    NAME VARCHAR(20),
    CONTRIBUTEDBY INT REFERENCES CONTRIBUTOR
);

CREATE TABLE MEDIA(
    CID INT PRIMARY KEY REFERENCES MCONTENT,
    LINK VARCHAR(150),
    CAPTION VARCHAR(150),
    TYPE VARCHAR(20)
);

CREATE TABLE ARTICLE(
    CID INT PRIMARY KEY REFERENCES MCONTENT,
    CONTENTFLAG VARCHAR(20)
);

CREATE TABLE EDITS(
    AID INT REFERENCES ARTICLE,
    EID INT REFERENCES EDITORS
);

CREATE TABLE MAKESUP(
    CID INT REFERENCES MCONTENT,
    MEDITION INT,
    MNAME VARCHAR(20),
    FOREIGN KEY (MNAME, MEDITION) REFERENCES MAGAZINES(NAME, EDITION)
);

insert into editoric values('genevieve heydt', 1);
insert into editoric values('sally johnson', 2);
insert into editoric values('santiago ochoa', 3);
--good
insert into magazines values(1, 'Time', 'Ivory', 'Everyday Life', 1);
insert into magazines values(1, 'PC Gamer', 'Penguin','Horror',2);
insert into magazines values(1, 'Vogue', 'Ebony', 'Adult Modeling',3);
--good soup
insert into mcustomers values('jake range',1);
insert into purchases values(1,1,'PC Gamer');
--good
insert into mcustomers values('ryan reynolds',2);
insert into purchases values(2,1,'Vogue');
insert into purchases values(2,1,'Time');
--good
insert into editors values ('Edward Snowden',1,1);
insert into editors values ('Jacob Black',2,1);
insert into editors values ('Percy Jackson',3,1);
insert into editors values ('Edward Cullen',4,2);
insert into editors values ('Bella Swan',5,2);
insert into editors values ('Renesmee Swan-Cullen',6,2);
insert into editors values ('Annabeth Chase',7,3);
insert into editors values ('Karl Marx',8,3);
insert into editors values ('Jack Black',9,3);
--very good
insert into contributor values (1, 'author', 'name');
insert into contributor values (2, 'photographer', 'name');
insert into contributor values (3, 'videographer', 'name');
--cool cool cool





