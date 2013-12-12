/*---------------------------------------------------------------------------
 | Title : SQL Source Code for Super Shopping Assistant.
 +---------------------------------------------------------------------------
 | Description  : SQL commands for Super Shopping Assistant database system.
 | Subject      : BCI2023 Database Systems (Semester 1 2013/2014)
 |                FSKKP Universiti Malaysia Pahang
 | Date Created : 10 December 2013
 +---------------------------------------------------------------------------
 | Group Name   : Group 4
 | Group Member : 1) Nik Mohamad Aizuddin b. Nik Azmi
 |                2) Muhammad Mahfudz b. Muhammad
 |                3) Mohd Amirul Firdaus b. Abdul Manaf
 |                4) Che Abdul Hadi b. Che Haron
 |                5) Jannatul Farid b. Rahman
 | Lab Session  : 2B
 | Supervisor   : Prof Madya Dr. Noraziah Ahmad
 +---------------------------------------------------------------------------
 | These SQL Codes are targeted for PostgreSQL 9.2.5 Database.
 | You may use these codes for study or for any purposes.
 +-------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------
 | SECTION 1.0: CREATE SCHEMA
 +-------------------------------------------------------------------------*/


/**
 * create schema Super Shopping Assistant (SSA)
 * NOTE: nlck is my laptop username.
 */
CREATE SCHEMA ssa;
GRANT ALL ON SCHEMA ssa TO nlck;
GRANT ALL ON ALL TABLES IN SCHEMA ssa TO nlck;


/*---------------------------------------------------------------------------
 | SECTION 2.0: CREATE TABLE
 |   LINE 050 --> create table admin
 |   LINE 065 --> create table customer
 |   LINE 080 --> create table supplier
 |   LINE 096 --> create table product
 |   LINE 108 --> create table announcement
 +-------------------------------------------------------------------------*/


/**
 * create table admin
 */
CREATE TABLE ssa.admin(
  "admin_id"    SERIAL4     NOT NULL PRIMARY KEY,
  "firstName"   VARCHAR(32) NOT NULL,
  "lastName"    VARCHAR(32) NOT NULL,
  "street"      VARCHAR(32) NOT NULL,
  "city"        VARCHAR(32) NOT NULL,
  "state"       VARCHAR(32) NOT NULL,
  "zipcode"     VARCHAR(32) NOT NULL,
  "phoneNumber" VARCHAR(32) NOT NULL
);


/**
 * create table customer
 */
CREATE TABLE ssa.customer(
  "customer_id" SERIAL4     NOT NULL PRIMARY KEY,
  "firstName"   VARCHAR(32) NOT NULL,
  "lastName"    VARCHAR(32) NOT NULL,
  "street"      VARCHAR(32) NOT NULL,
  "city"        VARCHAR(32) NOT NULL,
  "state"       VARCHAR(32) NOT NULL,
  "zipcode"     VARCHAR(32) NOT NULL,
  "phoneNumber" VARCHAR(32) NOT NULL
);


/**
 * create table supplier
 */
CREATE TABLE ssa.supplier(
  "supplier_id" SERIAL4     NOT NULL PRIMARY KEY,
  "firstName"   VARCHAR(32) NOT NULL,
  "lastName"    VARCHAR(32) NOT NULL,
  "company"     VARCHAR(32) NOT NULL,
  "street"      VARCHAR(32) NOT NULL,
  "city"        VARCHAR(32) NOT NULL,
  "state"       VARCHAR(32) NOT NULL,
  "zipcode"     VARCHAR(32) NOT NULL,
  "phoneNumber" VARCHAR(32) NOT NULL
);


/**
 * create table product
 */
CREATE TABLE ssa.product(
  "product_id"  SERIAL4      NOT NULL PRIMARY KEY,
  "name"        VARCHAR(32)  NOT NULL,
  "description" VARCHAR(512) NOT NULL,
  "price(RM)"   FLOAT8       NOT NULL,
  "location"    VARCHAR(32)  NOT NULL
);


/**
 * create table announcement
 */
CREATE TABLE ssa.announcement(
  "announcement_id" SERIAL4       NOT NULL PRIMARY KEY,
  "title"           VARCHAR(32)   NOT NULL,
  "description"     VARCHAR(2048) NOT NULL,
  "begin"           DATE          NOT NULL,
  "due"             DATE          NOT NULL,
  "supplier_id"     INT4          NOT NULL
    CONSTRAINT announcement__ref_supplier
      REFERENCES ssa.supplier
);


/*---------------------------------------------------------------------------
 | SECTION 3.0: INSERT DATA
 |   LINE 133 --> insert data into table admin
 |   LINE 164 --> insert data into table announcement
 |   LINE 192 --> insert data into table customer
 |   LINE 214 --> insert data into table product
 |   LINE 232 --> insert data into table supplier
 +-------------------------------------------------------------------------*/


/**
 * insert data into table admin
 */
INSERT INTO ssa.admin(
  "firstName",
  "lastName",
  "street",
  "city",
  "state",
  "zipcode",
  "phoneNumber"
)
VALUES
('Mohd','Firdaus','13','Kuantan','Pahang','70500',
 '013-4567892'),
('Hairul','Naim','15/2','Gambang','Pahang','76009',
 '019-2828383'),
('Siti','Saodah','111','Kuala Besut','Terengganu','56779',
 '012-3390087'),
('Putri','Anis Syuhada','123','Pasir Puteh','Kelantan','73566',
 '011-4356789'),
('Mikail','Ahmad','12','Rantau Panjang','Kelantan','75668',
 '012-8900767'),
('Hasif','Fathrul','13','Kuantan','Pahang','70500',
 '012-3990010'),
('Aiman','Hakimi','15','Jaya Gading','Pahang','75000',
 '012-3399001'),
('Nik','Mahfudz','55','Muadzam Shah','Pahang','34566',
 '013-9087688');


/**
 * insert data into table announcement
 */
INSERT INTO ssa.announcement(
  "title",
  "description",
  "begin",
  "due",
  "supplier_id"
)
VALUES
('Family Day','Event for Members Manis Choc',
 '2013-03-15','2013-03-16','1'),
('Membership Special: Free Boucher',
 'Buy RM400++ on single resit free RM50 boucher',
 '2013-05-01','2013-05-10','2'),
('Mystery Gift','Free Gift for AinDa & CO product over RM150',
 '2013-04-27','2013-04-30','3'),
('Cut Price Sale','Discount Sale for Ayam Fresh Holding product',
 '2013-01-18','2013-02-23','4'),
('Discount Day','Discount sale for any Haji Detergent products',
 '2013-02-27','2013-02-28','6'),
('Durian Runtuh','Discount Sale for A&A Product',
 '2013-04-01','2013-04-05','8'),
('1 Day Special','Discount Sale for Manis Choc Product',
 '2013-04-10','2013-04-10','1');


/**
 * insert data into table customer
 */
INSERT INTO ssa.customer(
  "firstName",
  "lastName",
  "street",
  "city",
  "state",
  "zipcode",
  "phoneNumber"
)
VALUES
('Siti','Aminah','12','Pekan','Pahang','72000','012-8909861'),
('Kadir','Idrus','45','Gambang','Pahang','76009','013-8991889'),
('Aznah','Hamid','45','Jaya Gading','Pahang','78990','012-9263773'),
('Said','Jailani','89','Kuantan','Pahang','92122','012-9088998'),
('Hajah','Zainab','99','Kuantan','Pahang','92122','019-2562556'),
('Mitcheone','Odawa','123','Kuantan','Pahang','92157','012-3675667'),
('Arien','Maliki','133','Pekan','Pahang','73000','012-3328128');


/**
 * insert data into table product
 */
INSERT INTO ssa.product(
  "name",
  "description",
  "price(RM)",
  "location"
)
VALUES
('Colgate','Oral Healthcare','2.00','Kuantan'),
('Ayam Fresh Holding','Food Based on Chicken','2.00','Kuantan'),
('VegeTamin','Vegetable','5.00','Pekan'),
('Ice Aged','Ice Product','5.00','Jaya Gading'),
('A&A Cold','Frozen Food','4.00','Kelantan'),
('Haji Detergent','Detergent Product','10.00','Kuala Lumpur');


/**
 * insert data into table supplier
 */
INSERT INTO ssa.supplier(
  "firstName",
  "lastName",
  "company",
  "street",
  "city",
  "state",
  "zipcode",
  "phoneNumber"
)
VALUES
('Nik','Azhar','Manis Choc','12','Johor Bharu','Johor','901899',
 '019-9098289'),
('Azlee','Azhar','Era Holding','123','Seremban','Negeri Sembilan','70400',
 '017-8903466'),
('Aida','Rahim','AinDa & CO','23','Senawang','Negeri Sembilan','75000',
 '017-3457788'),
('Munir','Aizat','Ayam Fresh Holding','166','Pandan Jaya','Kuantan','23477',
 '018-9002200'),
('Saleha','Ainor','Johor Fresh Vege','13','Melaka Jaya','Pahang','12331',
 '012-9988001'),
('Haji Aman','Dasir','Haji Detergent','233','Setapak','Kuala Lumpur',
 '76900','012-3459877'),
('Suraya','Annoor','My Choice','45','Segamat','Johor','345566',
 '018-9909981'),
('Ainor','Ahmad','A&A Cold','23','Pasir Mas','Kelantan','234789',
 '012-3448900');


/*---------------------------------------------------------------------------
 | SECTION 4.1: RETRIEVE DATA FROM TABLE ADMIN
 |   SELECTION
 |     LINE 285 --> list all info
 |     LINE 292 --> list all info where admins from Kelantan
 |   PROJECTION
 |     LINE 300 --> list firstName and lastName of admins
 |     LINE 307 --> list admin_id, firstName and phoneNumber from Pahang
 |   CARTESIAN PRODUCT
 |     <unavailable>
 |   UNION
 |     LINE 315 --> list all cities from admin and supplier
 |   INTERSECT
 |     LINE 325 --> list state where customer and supplier live in same state
 |   SET DIFFERENCE
 |     LINE 335 --> list states that suppliers dont live in customer's states
 |   CALCULATION
 |     LINE 345 --> total number of admins
 |     LINE 352 --> total number of admins that live in Kelantan
 +-------------------------------------------------------------------------*/

/**
 * SELECTION: list all info
 */
SELECT *
  FROM ssa.admin;


/**
 * SELECTION: list admins from Kelantan
 */
SELECT *
  FROM ssa.admin
  WHERE "state" LIKE 'Kelantan';


/**
 * PROJECTION: list firstName and lastName of admins
 */
SELECT "firstName", "lastName"
  FROM ssa.admin;


/**
 * PROJECTION: list admin_id, firstName and phoneNumber from Pahang
 */
SELECT "admin_id", "firstName", "phoneNumber"
  FROM ssa.admin
  WHERE state LIKE 'Pahang';


/**
 * UNION: list all cities from admin and supplier
 */
SELECT "city" AS "admin.city UNION supplier.city"
  FROM ssa.admin
UNION
SELECT "city"
  FROM ssa.customer;


/**
 * INTERSECT: list state where customer and supplier live in same state
 */
SELECT "state" AS "customer.state INTERSECT supplier.state"
  FROM ssa.customer
INTERSECT
SELECT "state"
  FROM ssa.supplier;


/**
 * SET DIFFERENCE: list states that suppliers dont live in customer's states
 */
SELECT "state" AS "states_suppliers_dont_live_in_customer_states"
  FROM ssa.supplier
EXCEPT
SELECT "state"
  FROM ssa.customer;
  

/**
 * CALCULATION: total number of admins
 */
SELECT COUNT(*)
  FROM ssa.admin;


/**
 * CALCULATION: total number of admins that live in Kelantan
 */
SELECT COUNT(*) AS "no_of_admins_in_Kelantan"
  FROM ssa.admin
  WHERE "state" LIKE 'Kelantan';


/*---------------------------------------------------------------------------
 | SECTION 4.2: RETRIEVE DATA FROM TABLE ANNOUNCEMENT
 |   SELECTION
 |     LINE 380 --> list all info
 |     LINE 387 --> list all 2013 announcements
 |   PROJECTION
 |     LINE 395 --> list all anouncements' title
 |   CARTESIAN PRODUCT
 |     LINE 402 --> list supplier that have create announcement
 |   UNION
 |     <unavailable>
 |   INTERSECT
 |     LINE 410 --> list registered supplier_id that makes announcement
 |   SET DIFFERENCE
 |     LINE 420 --> list unregistered supplier_id that makes announcement
 |   CALCULATION
 |     LINE 430 --> total number of announcements
 +-------------------------------------------------------------------------*/


/**
 * SELECTION: list all info
 */
SELECT *
  FROM ssa.announcement;


/**
 * SELECTION: list all 2013 announcements
 */
SELECT *
  FROM ssa.announcement
  WHERE "begin" BETWEEN '2013-01-01' AND '2013-12-31';


/**
 * PROJECTION: list all announcements' title
 */
SELECT title
  FROM ssa.announcement;


/**
 * CARTESIAN PRODUCT: list supplier that have create announcement
 */
SELECT ssa.supplier.*
  FROM ssa.supplier, ssa.announcement
  WHERE supplier.supplier_id = announcement.supplier_id;


/**
 * INTERSECT: list registered supplier_id that makes announcement
 */
SELECT "supplier_id"
  FROM ssa.announcement
INTERSECT
SELECT "supplier_id"
  FROM ssa.supplier;


/**
 * SET DIFFERENCE: list unregistered supplier_id that makes announcement
 */
SELECT "supplier_id"
  FROM ssa.announcement
EXCEPT
SELECT "supplier_id"
  FROM ssa.supplier;


/**
 * CALCULATION: number of announcements
 */
SELECT COUNT(*)
  FROM ssa.announcement;


/*---------------------------------------------------------------------------
 | SECTION 4.3: RETRIEVE DATA FROM TABLE CUSTOMER
 |   SELECTION
 |     LINE 456 --> list all info
 |   PROJECTION
 |     LINE 463 --> list firstName and lastName of all customers
 |   CARTESIAN PRODUCT
 |     <unavalaible>
 |   UNION
 |     LINE 470 --> list all cities that suppliers and customers live
 |   INTERSECT
 |     LINE 480 --> list all cities that both suppliers and customers live
 |   SET DIFFERENCE
 |     LINE 490 --> list cities that customers live but not in suppliers city
 |   CALCULATION
 |     LINE 500 --> total number of customers
 +-------------------------------------------------------------------------*/


/**
 * SELECTION: list all info
 */
SELECT *
  FROM ssa.customer;


/**
 * PROJECTION: list firstName and lastName of all customers
 */
SELECT firstName, lastName
  FROM ssa.customer;


/**
 * UNION: list all cities that suppliers and customers live
 */
SELECT "city"
  FROM ssa.customer
UNION
SELECT "city"
  FROM ssa.supplier;


/**
 * INTERSECT: list all cities that both suppliers and customers live
 */
SELECT "city"
  FROM ssa.customer
INTERSECT
SELECT "city"
  FROM ssa.supplier;


/**
 * SET DIFFERENCE: list cities that customers live but not in suppliers city
 */
SELECT "city"
  FROM ssa.customer
EXCEPT
SELECT "city"
  FROM ssa.supplier;


/**
 * CALCULATION: total number of customers
 */
SELECT COUNT(*)
  FROM ssa.customer;


/*---------------------------------------------------------------------------
 | SECTION 4.4: RETRIEVE DATA FROM TABLE PRODUCT
 |   SELECTION
 |     LINE 528 --> list all info
 |   PROJECTION
 |     LINE 535 --> list all product name and price
 |   CARTESIAN PRODUCT
 |     LINE 542 --> list product that available in customer location
 |   UNION
 |     <unavailable>
 |   SET DIFFERENCE
 |     LINE 550 --> list location where product is not in customer location
 |   CALCULATION
 |     LINE 560 --> total number of products
 |     LINE 566 --> min price of products
 |     LINE 572 --> max price of products
 |     LINE 579 --> average price of products
 |     LINE 586 --> total price of products
 +-------------------------------------------------------------------------*/


/**
 * SELECTION: list all info
 */
SELECT *
  FROM ssa.product;


/**
 * PROJECTION: list all product name and price
 */
SELECT "name", "price(RM)"
  FROM ssa.product;


/**
 * CARTESIAN PRODUCT: list product that available in customer location
 */
SELECT ssa.product.*
  FROM ssa.product, ssa.customer
  WHERE ssa.product."location" = ssa.customer."state";


/**
 * SET DIFFERENCE: list location where product is not in customer location
 */
SELECT "location"
  FROM ssa.product
EXCEPT
SELECT "state"
  FROM ssa.customer;


/**
 * CALCULATION: total number of products
 */
SELECT COUNT(*)
  FROM ssa.product;

/**
 * CALCULATION: min price of products
 */
SELECT MIN("price(RM)")
  FROM ssa.product;

/**
 * CALCULATION: max price of products
 */
SELECT MAX("price(RM)")
  FROM ssa.product;


/**
 * CALCULATION: average price of products
 */
SELECT AVG("price(RM)")
  FROM ssa.product;


/**
 * CALCULATION: total price of products
 */
SELECT SUM("price(RM)")
  FROM ssa.product;


/*---------------------------------------------------------------------------
 | SECTION 4.5: RETRIEVE DATA FROM TABLE SUPPLIER
 |   SELECTION
 |     LINE 610 --> list all info
 |   PROJECTION
 |     LINE 617 --> list all supplier_id and company names
 |   CARTESIAN PRODUCT
 |     <same as CARTESIAN PRODUCT in table announcement>
 |   UNION
 |     <same as UNION in table customer>
 |   SET DIFFERENCE
 |     <same as SET DIFFERENCE in table customer>
 |   CALCULATION
 |     LINE 624 --> total number of suppliers
 +-------------------------------------------------------------------------*/


/**
 * SELECTION: list all info
 */
SELECT *
  FROM ssa.supplier;


/**
 * PROJECTION: list all supplier_id and company names
 */
SELECT "supplier_id", "company"
  FROM ssa.supplier;


/**
 * CALCULATION: total number of suppliers
 */
SELECT COUNT(*)
  FROM ssa.supplier;


/*---------------------------------------------------------------------------
 | SECTION 5.0: UPDATE VALUE
 +-------------------------------------------------------------------------*/

/**
 * Update Location of Haji Detergent product
 */
UPDATE ssa.product
  SET "location" = 'Selangor'
  WHERE "name" = 'Haji Detergent';


/*---------------------------------------------------------------------------
 | SECTION 6.0: DELETE ROW
 +-------------------------------------------------------------------------*/
/**
 * Remove Haji Detergent product from table product
 */
DELETE FROM ssa.product
  WHERE "name" = 'Haji Detergent';
