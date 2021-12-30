DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles(
        vehicle_id serial PRIMARY KEY, 
        charge120 numeric(5),
        charge240 numeric(5),
        city08 numeric(5),
        comb08 numeric(5),
        cylinders numeric(2),
        displ numeric(5),
        drive varchar(30),
        fuelType varchar(35),
        fuelType1 varchar(30),
        highway08 numeric(5),
        hlv numeric(5),
        hpv numeric(5),
        id numeric(10),
        lv2 numeric(5),
        lv4 numeric(5),
        make varchar(30),
        model varchar(50),
        phevBlended boolean,
        pv2 numeric(5),
        pv4 numeric(5),
        range numeric(5),
        rangeCity numeric(5),
        rangeHwy numeric(5),
        trany varchar(35),
        VClass varchar(35),
        year integer,
        tCharger char,
        sCharger char,
        atvType varchar(30),
        fuelType2 varchar(30),
        rangeA varchar(20),
        evMotor varchar(100),
        mfrCode varchar(5),        
        createdOn date,
        modifiedOn date,
        startStop char,
        phevCity numeric(5),
        phevHwy numeric(5),
        phevComb numeric(5)
        );
        
 copy public.vehicles (charge120, charge240, city08, comb08, cylinders, displ, drive, fueltype, fueltype1, highway08, hlv, hpv, id, lv2, lv4, make, model, phevBlended, pv2, pv4, range, rangecity, rangehwy, trany, vclass, year,
  tcharger, scharger, atvtype, fueltype2, rangea, evmotor, mfrcode, createdon, modifiedon, startstop, phevcity, phevhwy, phevcomb) 
  FROM 'C:/projects/vehicles.csv' DELIMITER ',' CSV HEADER;
 
select * from vehicles where model='Civic Hybrid'; --and startstop='Y';

CREATE TABLE USERS(
ID serial PRIMARY KEY, 
USERNAME varchar(100), 
PASSWORD varchar(200), 
FIRSTNAME varchar(50), 
LASTNAME varchar(50), 
EMAIL varchar(50), 
ACTIVATED integer
);

DROP TABLE IF EXISTS AUTHORITY;
CREATE TABLE AUTHORITY( NAME varchar(20) PRIMARY KEY);

CREATE TABLE USER_AUTHORITY( 
USER_ID integer, 
AUTHORITY_NAME varchar(20),

FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (AUTHORITY_NAME) REFERENCES AUTHORITY(name)  );

INSERT INTO USERs (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ACTIVATED) VALUES (1, 'admin', '$2a$08$lDnHPz7eUkSi6ao14Twuau08mzhWrL4kyZGGU5xfiGALO/Vxd5DOi', 'admin', 'admin', 'admin@admin.com', 1);
INSERT INTO USERs (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ACTIVATED) VALUES (2, 'user', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'enabled@user.com', 1);
INSERT INTO USERs (ID, USERNAME, PASSWORD, FIRSTNAME, LASTNAME, EMAIL, ACTIVATED) VALUES (3, 'disabled', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'user', 'user', 'disabled@user.com', 0);

INSERT INTO AUTHORITY (NAME) VALUES ('ROLE_USER');
INSERT INTO AUTHORITY (NAME) VALUES ('ROLE_ADMIN');

INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (1, 'ROLE_USER');
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (1, 'ROLE_ADMIN');
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (2, 'ROLE_USER');
INSERT INTO USER_AUTHORITY (USER_ID, AUTHORITY_NAME) VALUES (3, 'ROLE_USER');
