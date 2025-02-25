-- Generated by Mocodo 4.2.12

CREATE TABLE AUTHORS (
  PRIMARY KEY (id_author),
  id_author  VARCHAR(42) NOT NULL,
  first_name VARCHAR(42),
  last_name  VARCHAR(42)
);

CREATE TABLE BOOKS (
  PRIMARY KEY (isbn),
  isbn         VARCHAR(42) NOT NULL,
  title        VARCHAR(42),
  release_date VARCHAR(42),
  collection   VARCHAR(42),
  id_author    VARCHAR(42) NOT NULL,
  id_library   VARCHAR(42) NOT NULL,
  quantity     VARCHAR(42),
  room         VARCHAR(42),
  shelf        VARCHAR(42),
  position     VARCHAR(42),
  id_publisher VARCHAR(42) NOT NULL
);

CREATE TABLE EMPLOYEES (
  PRIMARY KEY (id_employee),
  id_employee VARCHAR(42) NOT NULL,
  first_name  VARCHAR(42),
  last_name   VARCHAR(42),
  is_present  VARCHAR(42),
  id_library  VARCHAR(42) NOT NULL
);

CREATE TABLE EVENTS (
  PRIMARY KEY (id_event),
  id_event   VARCHAR(42) NOT NULL,
  type       VARCHAR(42),
  date       VARCHAR(42),
  id_library VARCHAR(42) NOT NULL
);

CREATE TABLE FROM_TO (
  PRIMARY KEY (id_library, id_order),
  id_library VARCHAR(42) NOT NULL,
  id_order   VARCHAR(42) NOT NULL
);

CREATE TABLE IS_LENDED (
  PRIMARY KEY (id_lending, isbn),
  id_lending VARCHAR(42) NOT NULL,
  isbn       VARCHAR(42) NOT NULL
);

CREATE TABLE LENDINGS (
  PRIMARY KEY (id_lending),
  id_lending  VARCHAR(42) NOT NULL,
  begin_date  VARCHAR(42),
  end_date    VARCHAR(42),
  returned    VARCHAR(42),
  email_1     VARCHAR(42) NOT NULL,
  delay       VARCHAR(42),
  return_date VARCHAR(42),
  email_2     VARCHAR(42) NOT NULL
);

CREATE TABLE LIBRARIES (
  PRIMARY KEY (id_library),
  id_library VARCHAR(42) NOT NULL,
  name       VARCHAR(42),
  address    VARCHAR(42),
  region     VARCHAR(42)
);

CREATE TABLE ORDERED (
  PRIMARY KEY (id_order, isbn),
  id_order VARCHAR(42) NOT NULL,
  isbn     VARCHAR(42) NOT NULL
);

CREATE TABLE ORDERS (
  PRIMARY KEY (id_order),
  id_order     VARCHAR(42) NOT NULL,
  id_lending   VARCHAR(42) NOT NULL,
  id_transfert VARCHAR(42) NOT NULL,
  UNIQUE (id_lending)
);

CREATE TABLE PUBLISHERS (
  PRIMARY KEY (id_publisher),
  id_publisher VARCHAR(42) NOT NULL,
  name         VARCHAR(42)
);

CREATE TABLE SUBSCRIBERS (
  PRIMARY KEY (email),
  email      VARCHAR(42) NOT NULL,
  first_name VARCHAR(42),
  last_name  VARCHAR(42),
  dob        VARCHAR(42)
);

CREATE TABLE TRANSFERTS (
  PRIMARY KEY (id_transfert),
  id_transfert  VARCHAR(42) NOT NULL,
  date_sent     VARCHAR(42),
  date_received VARCHAR(42),
  id_employee   VARCHAR(42) NOT NULL
);

ALTER TABLE BOOKS ADD FOREIGN KEY (id_publisher) REFERENCES PUBLISHERS (id_publisher);
ALTER TABLE BOOKS ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);
ALTER TABLE BOOKS ADD FOREIGN KEY (id_author) REFERENCES AUTHORS (id_author);

ALTER TABLE EMPLOYEES ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE EVENTS ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE FROM_TO ADD FOREIGN KEY (id_order) REFERENCES ORDERS (id_order);
ALTER TABLE FROM_TO ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE IS_LENDED ADD FOREIGN KEY (isbn) REFERENCES BOOKS (isbn);
ALTER TABLE IS_LENDED ADD FOREIGN KEY (id_lending) REFERENCES LENDINGS (id_lending);

ALTER TABLE LENDINGS ADD FOREIGN KEY (email_2) REFERENCES SUBSCRIBERS (email);
ALTER TABLE LENDINGS ADD FOREIGN KEY (email_1) REFERENCES SUBSCRIBERS (email);

ALTER TABLE ORDERED ADD FOREIGN KEY (isbn) REFERENCES BOOKS (isbn);
ALTER TABLE ORDERED ADD FOREIGN KEY (id_order) REFERENCES ORDERS (id_order);

ALTER TABLE ORDERS ADD FOREIGN KEY (id_transfert) REFERENCES TRANSFERTS (id_transfert);
ALTER TABLE ORDERS ADD FOREIGN KEY (id_lending) REFERENCES LENDINGS (id_lending);

ALTER TABLE TRANSFERTS ADD FOREIGN KEY (id_employee) REFERENCES EMPLOYEES (id_employee);
