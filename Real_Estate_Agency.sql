drop table Transaction;
drop table Offer;
drop table Appointment;
drop table Agent;
drop table Property;
drop table Client;
drop table Categories;


-- Table: Agent
CREATE TABLE Agent (
   ID integer,
   NAME varchar2(50),
   EMAIL varchar2(255),
   PHONE integer,
   CONSTRAINT Agent_pk PRIMARY KEY (ID)
);

-- Table: Categories
CREATE TABLE Categories (
   ID integer,
   CNAME varchar2(100),
   SSIZE integer,
   BSIZE integer,
   CONSTRAINT Categories_pk PRIMARY KEY (ID)
);

-- Table: Client
CREATE TABLE Client (
   ID integer,
   NAME varchar2(50),
   EMAIL varchar2(255),
   PHONE integer,
   CONSTRAINT Client_pk PRIMARY KEY (ID)
);



-- Table: Property
CREATE TABLE Property (
   ID integer,
   TYPE varchar2(255),
   ADDRESS varchar2(255),
   PRICE integer,
   "SIZE" integer,
   NUM_OF_BEDROOMS smallint,
   "DESC" varchar2(500),
   CONSTRAINT Property_pk PRIMARY KEY (ID)
);



-- Table: Appointment
CREATE TABLE Appointment (
   ID integer,
   "DATE" date,
   "TIME" timestamp,
   Client_ID integer,
   Property_ID integer,
   Agent_ID integer,
   CONSTRAINT Appointment_pk PRIMARY KEY (ID),
   CONSTRAINT Appointment_Agent_fk FOREIGN KEY (Agent_ID) REFERENCES Agent (ID),
   CONSTRAINT Appointment_Client_fk FOREIGN KEY (Client_ID) REFERENCES Client (ID),
   CONSTRAINT Appointment_Property_fk FOREIGN KEY (Property_ID) REFERENCES Property (ID)
);


-- Table: Offer
CREATE TABLE Offer (
   ID integer,
   AMOUNT integer,
   "DATE" date,
   Property_ID integer,
   Client_ID integer,
   CONSTRAINT Offer_pk PRIMARY KEY (ID),
   CONSTRAINT Offer_Property_fk FOREIGN KEY (Property_ID) REFERENCES Property (ID),
   CONSTRAINT Offer_Client_fk FOREIGN KEY (Client_ID) REFERENCES Client (ID)
);


-- Table: Transaction
CREATE TABLE Transaction (
   ID integer,
   "DATE" date,
   AMOUNT integer,
   Offer_ID integer,
   Agent_ID integer,
   CONSTRAINT Transaction_pk PRIMARY KEY (ID),
   CONSTRAINT Transaction_Agent_fk FOREIGN KEY (Agent_ID) REFERENCES Agent (ID),
   CONSTRAINT Transaction_Offer_fk FOREIGN KEY (Offer_ID) REFERENCES Offer (ID)
);


-- Table: Agent
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (1, 'John Smith', 'johnsmith@example.com', 1234567890);
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (2, 'Emily Johnson', 'emilyjohnson@example.com', 9876543210);
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (3, 'Michael Brown', 'michaelbrown@example.com', 5555555555);
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (4, 'Sarah Davis', 'sarahdavis@example.com', 1111111111);
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (5, 'David Wilson', 'davidwilson@example.com', 9999999999);
INSERT INTO Agent (ID, NAME, EMAIL, PHONE) VALUES (6, 'Jennifer Martinez', 'jennifermartinez@example.com', 7777777777);

-- Table: Categories
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (1, 'Apartment', 500, 2);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (2, 'House', 1000, 4);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (3, 'Condo', 800, 3);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (4, 'Townhouse', 700, 3);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (5, 'Duplex', 600, 2);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (6, 'Villa', 1200, 5);
INSERT INTO Categories (ID, CNAME, SSIZE, BSIZE) VALUES (7, 'Penthouse', 1500, 4);
-- Table: Client
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (1, 'Alice Johnson', 'alicejohnson@example.com', 5551234567);
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (2, 'Robert Smith', 'robertsmith@example.com', 9876543210);
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (3, 'Emily Davis', 'emilydavis@example.com', 1234567890);
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (4, 'William Brown', 'williambrown@example.com', 7894561230);
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (5, 'Sophia Wilson', 'sophiawilson@example.com', 3216549870);
INSERT INTO Client (ID, NAME, EMAIL, PHONE) VALUES (6, 'James Martinez', 'jamesmartinez@example.com', 4567891230);

-- Table: Property
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (1, 'Apartment', '123 Main St', 200000, 1000, 2, 'Beautiful apartment with a view');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (2, 'House', '456 Oak Ave', 500000, 2000, 4, 'Spacious house with a backyard');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (3, 'Condo', '789 Elm St', 300000, 1500, 3, 'Modern condo in a prime location');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (4, 'Townhouse', '10 Pine Dr', 400000, 1800, 3, 'Cozy townhouse with a garage');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (5, 'Duplex', '111 Maple Ave', 250000, 1200, 2, 'Charming duplex with a garden');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (6, 'Villa', '222 Sunset Blvd', 800000, 3000, 5, 'Luxurious villa with a pool');
INSERT INTO Property (ID, TYPE, ADDRESS, PRICE, "SIZE", NUM_OF_BEDROOMS, "DESC") VALUES (7, 'Penthouse', '333 Beach Rd', 1000000, 2500, 4, 'Stunning penthouse with ocean views');


-- Table: Appointment
INSERT INTO Appointment (ID, "DATE", "TIME", Client_ID, Property_ID, Agent_ID) VALUES (2, TO_DATE('2023-06-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-06-08 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2,1,4);
INSERT INTO Appointment (ID, "DATE", "TIME", Client_ID, Property_ID, Agent_ID) VALUES (3, TO_DATE('2023-06-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-06-09 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3,4,2);
INSERT INTO Appointment (ID, "DATE", "TIME", Client_ID, Property_ID, Agent_ID) VALUES (4, TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-06-10 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 4,3,1);
INSERT INTO Appointment (ID, "DATE", "TIME", Client_ID, Property_ID, Agent_ID) VALUES (5, TO_DATE('2023-06-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2023-06-11 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5,5,5);

-- Table: Offer
INSERT INTO Offer (ID, AMOUNT, "DATE", Property_ID, Client_ID) VALUES (1, 350000, TO_DATE('2023-06-07', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Offer (ID, AMOUNT, "DATE", Property_ID, Client_ID) VALUES (2, 520000, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 2, 2);
INSERT INTO Offer (ID, AMOUNT, "DATE", Property_ID, Client_ID) VALUES (3, 280000, TO_DATE('2023-06-09', 'YYYY-MM-DD'), 3, 3);
INSERT INTO Offer (ID, AMOUNT, "DATE", Property_ID, Client_ID) VALUES (4, 400000, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 4, 4);
INSERT INTO Offer (ID, AMOUNT, "DATE", Property_ID, Client_ID) VALUES (5, 220000, TO_DATE('2023-06-11', 'YYYY-MM-DD'), 5, 5);

-- Table: Transaction
INSERT INTO Transaction (ID, "DATE", AMOUNT, Offer_ID, Agent_ID)
VALUES (1, TO_DATE('2023-06-07', 'YYYY-MM-DD'), 350000, 1, 3);
INSERT INTO Transaction (ID, "DATE", AMOUNT, Offer_ID, Agent_ID)
VALUES (2, TO_DATE('2023-06-08', 'YYYY-MM-DD'), 500000, 2, 4);

INSERT INTO Transaction (ID, "DATE", AMOUNT, Offer_ID, Agent_ID)
VALUES (3, TO_DATE('2023-06-09', 'YYYY-MM-DD'), 200000, 1, 5);



-- Equi join between Appointment and Property tables based on Property_ID
SELECT *
FROM Appointment
JOIN Property ON Appointment.Property_ID = Property.ID;

-- Self join on the Agent table to retrieve agents who have the same phone number
SELECT a1.NAME AS Agent1Name, a2.NAME AS Agent2Name
FROM Agent a1
JOIN Agent a2 ON a1.PHONE = a2.PHONE
WHERE a1.ID <> a2.ID;

-- Non-equi join between Offer and Property tables based on the price range
SELECT *
FROM Offer
JOIN Property ON Offer.AMOUNT BETWEEN Property.PRICE - 50000 AND Property.PRICE + 50000;

-- Left outer join between Agent and Appointment tables to retrieve all agents with or without appointments
SELECT Agent.NAME, Appointment.ID
FROM Agent
LEFT JOIN Appointment ON Agent.ID = Appointment.Agent_ID;

-- Vertical join by selecting specific columns from Agent and Client tables
SELECT Agent.NAME, Client.NAME
FROM Agent
JOIN Client ON 2 = 2;

-- Select agents with their names and emails, replacing NULL email values with 'Not available'
SELECT NAME, NVL(EMAIL, 'Not available') AS EMAIL
FROM Agent;

-- Calculate the average price and count of properties in each property type category
SELECT TYPE, AVG(PRICE) AS AveragePrice, COUNT(*) AS PropertyCount
FROM Property
GROUP BY TYPE;

-- Retrieve appointments scheduled for a specific date
SELECT *
FROM Appointment
WHERE "DATE" = TO_DATE('2023-06-09', 'YYYY-MM-DD');

-- Retrieve property types with an average price higher than $400,000
SELECT TYPE, AVG(PRICE) AS AveragePrice
FROM Property
GROUP BY TYPE
HAVING AVG(PRICE) > 400000;

-- Retrieve clients who have made offers on properties with a price higher than the average price
SELECT NAME
FROM Client
WHERE ID IN (SELECT Client_ID FROM Offer WHERE AMOUNT > (SELECT AVG(PRICE) FROM Property));



-- Retrieve agents who have handled appointments for properties of the same type as their own property
SELECT a.NAME
FROM Agent a
WHERE EXISTS (
    SELECT *
    FROM Property p
    WHERE p.TYPE = (SELECT TYPE FROM Property WHERE ID IN (SELECT Property_ID FROM Appointment WHERE Agent_ID = a.ID))
    AND p.ID IN (SELECT Property_ID FROM Appointment WHERE Agent_ID = a.ID)
);

-- Retrieve clients who have made offers
SELECT *
FROM Client c
WHERE EXISTS (SELECT * FROM Offer WHERE Client_ID = c.ID);

-- Retrieve properties with a size larger than all properties in the 'Apartment' category
SELECT *
FROM Property
WHERE "SIZE" > ALL (SELECT "SIZE" FROM Property WHERE TYPE = 'Apartment');





