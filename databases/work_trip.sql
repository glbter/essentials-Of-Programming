------------------------human-----------------------
create table EMPLOYEES (
    ID NUMBER(10) NOT NULL,
    DATE_OF_BIRTH DATE,
    PASSPORT VARCHAR2(9) NOT NULL,
    IPN NUMBER(10) NOT NULL,
    SALARY NUMBER(5) NOT NULL,
    ID_PERSON NUMBER(10)  NOT NULL
);

alter table EMPLOYEES add constraint EMPLOYEES_PK primary key (ID);

alter table EMPLOYEES add constraint FK_EMPLOYEES_IDPERSON_PERSONS
    foreign key (ID_PERSON) references PERSONS;

create sequence EMPLOYEES_ID_SEQ start with 1;
create trigger EMPLOYEES_ID
    before insert on EMPLOYEES
    for each row
    begin
        select EMPLOYEES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table PERSONS (
    ID NUMBER(10) NOT NULL,
    ID_COMPANY NUMBER(10) NOT NULL,
    NAME VARCHAR2(12) NOT NULL,
    SNAME VARCHAR2(16) NOT NULL,
    PNAME VARCHAR2(14) NOT NULL,
    POSITION VARCHAR2(20),
    EMAIL VARCHAR2(50),
    ID_EMPLOYEE NUMBER(10)
);

alter table PERSONS add constraint  PERSONS_PK primary key (ID);

alter table PERSONS add constraint FK_PERSONS_IDEMPLOYEE_EMPLOYEES
    foreign key (ID_EMPLOYEE) references EMPLOYEES;
alter table PERSONS add constraint FK_PERSONS_IDCOMPANY_COMPANIES
    foreign key (ID_COMPANY) references COMPANIES;

create sequence PERSONS_ID_SEQ start with 1;
create trigger PERSONS_ID
    before insert on PERSONS
    for each row
    begin
        select PERSONS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table PHONE_PERSONS (
    ID NUMBER(10) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    ID_PERSON NUMBER(10) NOT NULL
);
alter table PHONE_PERSONS add constraint PHONEPERSONS primary key (ID);

alter table PHONE_PERSONS add constraint FK_PHONES_IDPERSON_PERSONS
    foreign key (ID_PERSON) references PERSONS;

create sequence PHONEPERSONS_ID_SEQ start with 1;
create trigger PHONEPERSONS_ID
    before insert on PHONE_PERSONS
    for each row
    begin
        select PHONEPERSONS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;
--------------------------------------------------------------------
--------------------------hotels------------------------------
create table HOTELS (
    ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    STARS_AMOUNT NUMBER(1),
    PHONE VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(50),
    ID_MAP_POINT NUMBER(10) NOT NULL
);
alter table HOTELS add constraint HOTELS_PK  primary key (ID);

alter table HOTELS add constraint FK_HOTELS_IDMAPPOINT_MAPPOINTS
    foreign key (ID_MAP_POINT) references MAP_POINTS;

create sequence HOTELS_ID_SEQ start with 1;
create trigger HOTELS_ID
    before insert on HOTELS
    for each row
    begin
        select HOTELS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table ROOM_TYPES (
    ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(6) NOT NULL,
    COST_PER_PERSON NUMBER(5)
);
alter table ROOM_TYPES add constraint ROOMTYPES_PK primary key (ID);

create sequence ROOMTYPES_ID_SEQ start with 1;
create trigger ROOMTYPES_ID
    before insert on ROOM_TYPES
    for each row
    begin
        select ROOMTYPES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table ROOMS (
    ID NUMBER(10) NOT NULL,
    ROOM_NUM VARCHAR2(5) NOT NULL,
    SQUARE NUMBER(2),
    PLACES_AMOUNT NUMBER(1),
    ID_HOTEL NUMBER(10) NOT NULL,
    ID_ROOM_TYPE NUMBER(10) NOT NULL
);
alter table ROOMS add constraint ROOMS_PK primary key (ID);

alter table ROOMS add constraint FK_ROOMS_IDHOTEL_HOTELS
    foreign key (ID_HOTEL) references HOTELS;
alter table ROOMS add constraint FK_ROOMS_IDROOMTYPE_ROOMTYPES
    foreign key (ID_ROOM_TYPE) references ROOM_TYPES;

create sequence ROOMS_ID_SEQ start with 1;
create trigger ROOMS_ID
    before insert on ROOMS
    for each row
    begin
        select ROOMS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table LIVING_EMPLOYEE_ROOM (
    ID NUMBER(10) NOT NULL,
    ID_EMPLOYEE NUMBER(10) NOT NULL,
    ID_ROOM NUMBER(10) NOT NULL,
    START_DATE_TIME DATE NOT NULL,
    END_DATE_TIME DATE NOT NULL
);
alter table LIVING_EMPLOYEE_ROOM add constraint LIVINGEMPLOYEEROOM_PK
    primary key (ID);

alter table LIVING_EMPLOYEE_ROOM add constraint
    FK_LIVINGEMPLOYEEROOM_IDEMPLOYEE_EMPLOYEES foreign key (ID_EMPLOYEE)
    references EMPLOYEES;
alter table LIVING_EMPLOYEE_ROOM add constraint
    FK_LIVINGEMPLOYEEROOM_IDROOM_ROOMSS foreign key (ID_ROOM)
    references ROOMS;

create sequence LIVINGEMPLOYEEROOM_ID_SEQ start with 1;
create trigger LIVINGEMPLOYEEROOM_ID
    before insert on LIVING_EMPLOYEE_ROOM
    for each row
    begin
        select LIVINGEMPLOYEEROOM_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;
---------------------------------------------------------------------
----------------------transport---------------------------------

create table TRANSPORT (
    ID NUMBER(10) NOT NULL,
    SERIAL_NUM VARCHAR2(12),
    NAME VARCHAR2(40) NOT NULL,
    PREPAYMENT NUMBER(4),
    ID_TRANSPORT_TYPE NUMBER(10) NOT NULL
);
alter table TRANSPORT add constraint TRANSPORT_PK primary key (ID);

alter table TRANSPORT add constraint FK_TRANSPORT_IDTRANSPORTTYPE_TRANSPORTTYPES
    foreign key (ID_TRANSPORT_TYPE) references TRANSPORT_TYPES;

create sequence TRANSPORT_ID_SEQ start with 1;
create trigger TRANSPORT_ID
    before insert on TRANSPORT
    for each row
    begin
        select TRANSPORT_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table TRANSPORT_TYPES (
    ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(20) NOT NULL,
    CAPACITY NUMBER(2)
);

alter table TRANSPORT_TYPES add constraint  TRANSPORTTYPES_PK primary key (ID);

create sequence TRANSPORTTYPES_ID_SEQ start with 1;
create trigger TRANSPORTTYPES_ID
    before insert on TRANSPORT_TYPES
    for each row
    begin
        select TRANSPORTTYPES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table RIDES_EMPLOYEE_TRANSPORT (
    ID NUMBER(10) NOT NULL,
    ID_EMPLOYEE NUMBER(10) NOT NULL,
    ID_TRANSPORT NUMBER(10) NOT NULL,
    ID_MEETING NUMBER(10) NOT NULL,
    DATE_TIME DATE NOT NULL,
    COST_PER_PERSON NUMBER(4),
    ID_START_MAP_POINT NUMBER(10) NOT NULL,
    ID_END_MAP_POINT NUMBER(10) NOT NULL
);
alter table RIDES_EMPLOYEE_TRANSPORT add constraint RIDESEMPLOYEETRANSPORT_PK
    primary key (ID);

alter table RIDES_EMPLOYEE_TRANSPORT add constraint
    FK_RIDESEMPLOYEETRANSPORT_IDEMPLOYEE_EMPLOYEES foreign key (ID_EMPLOYEE)
    references EMPLOYEES;
alter table RIDES_EMPLOYEE_TRANSPORT add constraint
    FK_RIDESEMPLOYEETRANSPORT_IDTRANSPORT_TRANSPORT foreign key (ID_TRANSPORT)
    references TRANSPORT;
alter table RIDES_EMPLOYEE_TRANSPORT add constraint
    FK_RIDESEMPLOYEETRANSPORT_IDMEETING_MEETINGS foreign key (ID_MEETING)
    references MEETINGS;
alter table RIDES_EMPLOYEE_TRANSPORT add constraint
    FK_RIDESEMPLOYEETRANSPORT_IDSTARTMAPPOINT_MAPPOINTS foreign key (ID_START_MAP_POINT)
    references MAP_POINTS;
alter table RIDES_EMPLOYEE_TRANSPORT add constraint
    FK_RIDESEMPLOYEETRANSPORT_IDENDMAPPOINT_MAPPOINTS foreign key (ID_END_MAP_POINT)
    references MAP_POINTS;

create sequence RIDESEMPLOYEETRANSPORT_ID_SEQ start with 1;
create trigger RIDESEMPLOYEETRANSPORT_ID
    before insert on RIDES_EMPLOYEE_TRANSPORT
    for each row
    begin
        select RIDESEMPLOYEETRANSPORT_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;
------------------------------------------------------------------
------------------------map points and companies------------------

create table COMPANIES (
    ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    ID_MAP_POINT NUMBER(10)
);
alter table COMPANIES add constraint COMPANIES_PK primary key (ID);

alter table COMPANIES add constraint FK_COMPANIES_IDMAPPOINT_MAPPOINTS
    foreign key (ID_MAP_POINT) references MAP_POINTS;

create sequence COMPANIES_ID_SEQ start with 1;
create trigger COMPANIES_ID
    before insert on COMPANIES
    for each row
    begin
        select COMPANIES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table PHONE_COMPANIES (
    ID NUMBER(10) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    ID_COMPANY NUMBER(10) NOT NULL
);
alter table PHONE_COMPANIES add constraint PHONECOMPANIES_PK primary key (ID);

alter table PHONE_COMPANIES add constraint FK_PHONECOMPANIES_IDCOMPANY_COMPANIES
    foreign key (ID_COMPANY) references COMPANIES;

create sequence PHONECOMPANIES_ID_SEQ start with 1;
create trigger PHONECOMPANIES_ID
    before insert on PHONE_COMPANIES
    for each row
    begin
        select PHONECOMPANIES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table COUNTRIES (
    ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(20) NOT NULL
);

alter table COUNTRIES add constraint COUNTRIES_PK primary key (ID);

create sequence COUNTRIES_ID_SEQ start with 1;
create trigger COUNTRIES_ID
    before insert on COUNTRIES
    for each row
    begin
        select COUNTRIES_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table MAP_POINTS (
    ID NUMBER(10) NOT NULL,
    ID_COUNTRY NUMBER(10) NOT NULL,
    CITY VARCHAR2(20) NOT NULL,
    ADDRESS VARCHAR2(50)
);
alter table MAP_POINTS add constraint MAPPOINTS_PK primary key (ID);

alter table MAP_POINTS add constraint FK_MAPPOINTS_IDCOUNTRY_COUNRIES
    foreign key (ID_COUNTRY) references COUNTRIES;

create sequence MAPPOINTS_ID_SEQ start with 1;
create trigger MAPPOINTS_ID
    before insert on MAP_POINTS
    for each row
    begin
        select MAPPOINTS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;
------------------------------------------------------------------
------------------meetings and contracts-----------------------
create table CONTRACTS (
    ID NUMBER(10) NOT NULL,
    ID_MEETING NUMBER(10),
    ID_EMPLOYEE NUMBER(10),
    ID_PERSON NUMBER(10),
    CONTRACT_NUM NUMBER(16),
    SERVICE VARCHAR2(50),
    COST NUMBER(8),
    EXPIRE_DATE DATE
);
alter table CONTRACTS add constraint CONTRACTS_PK primary key (ID);

alter table CONTRACTS add constraint FK_CONTRACTS_IDMEETING_MEETING
    foreign key (ID_MEETING) references MEETINGS;
alter table CONTRACTS add constraint FK_CONTRACTS_IDEMPLOYEE_EMPLOYEES
    foreign key (ID_EMPLOYEE) references EMPLOYEES;
alter table CONTRACTS add constraint FK_CONTRACTS_IDPERSON_PERSONS
    foreign key (ID_PERSON) references PERSONS;

create sequence CONTRACTS_ID_SEQ start with 1;
create trigger CONTRACTS_ID
    before insert on CONTRACTS
    for each row
    begin
        select CONTRACTS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table MEETINGS (
    ID NUMBER(10) NOT NULL,
    REASON VARCHAR2(50),
    BUDGET NUMBER(6),
    DATE_TIME DATE NOT NULL,
    ID_MAP_POINT NUMBER(10) NOT NULL
);
alter table MEETINGS add constraint MEETINGS_PK primary key (ID);

alter table MEETINGS add constraint FK_MEETINGS_IDMAPPOINT_PMAPOINTS
    foreign key (ID_MAP_POINT) references MAP_POINTS;

create sequence MEETINGS_ID_SEQ start with 1;
create trigger MEETINGS_ID
    before insert on MEETINGS
    for each row
    begin
        select MEETINGS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

create table MEETING_PARTICIPANTS (
    ID NUMBER(10) NOT NULL,
    ID_PERSON NUMBER(10) NOT NULL,
    ID_MEETING NUMBER(10) NOT NULL
);
alter table MEETING_PARTICIPANTS add constraint MEETINGPARTICIPANTS_PK
    primary key (ID);

alter table MEETING_PARTICIPANTS add constraint
    FK_MEETINGPARTICIPANTS_IDPERSON_PERSONS foreign key (ID_PERSON)
    references PERSONS;
alter table MEETING_PARTICIPANTS add constraint
    FK_MEETINGPARTICIPANTS_IDMEETING_MEETINGS foreign key (ID_MEETING)
    references MEETINGS;

create sequence MEETINGPARTICIPANTS_ID_SEQ start with 1;
create trigger MEETINGPARTICIPANTS_ID
    before insert on MEETING_PARTICIPANTS
    for each row
    begin
        select MEETINGPARTICIPANTS_ID_SEQ.nextval
        into :new.ID
        from dual;
    end;

--------------------------------------------------------------------
