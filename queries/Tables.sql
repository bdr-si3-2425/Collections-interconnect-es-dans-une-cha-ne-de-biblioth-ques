
CREATE TABLE AUTHORS (
  PRIMARY KEY (id_author),
  id_author  INTEGER NOT NULL,
  first_name VARCHAR(42),
  last_name  VARCHAR(42)
);

CREATE TABLE BOOKS (
  PRIMARY KEY (isbn),
  isbn         VARCHAR(42) NOT NULL,
  title        VARCHAR(42),
  release_date DATE,
  id_author    INTEGER NOT NULL,
  id_publisher INTEGER NOT NULL
);

CREATE TABLE EMPLOYEES (
  PRIMARY KEY (id_employee),
  id_employee INTEGER NOT NULL,
  first_name  VARCHAR(42),
  last_name   VARCHAR(42),
  is_present  VARCHAR(42), --references une table du calendirer, ou des triggers l'update chaque jour
  id_library  INTEGER NOT NULL
);

CREATE TABLE EVENTS (
  PRIMARY KEY (id_event),
  id_event   INTEGER NOT NULL,
  event_type VARCHAR(42),
  event_date DATE,
  id_library INTEGER NOT NULL
);

CREATE TABLE IS_LENDED (
  PRIMARY KEY (id_lending, isbn),
  id_lending INTEGER NOT NULL,
  isbn       VARCHAR(42) NOT NULL
);

CREATE TABLE LENDINGS (
  PRIMARY KEY (id_lending),
  id_lending  INTEGER NOT NULL,
  id_library VARCHAR(42) NOT NULL,
  email       VARCHAR(42) NOT NULL,
  begin_date  DATE DEFAULT CURRENT_DATE,
  end_date    DATE,
  returned    BOOLEAN DEFAULT FALSE,
  delays      VARCHAR(42) DEFAULT NULL,
  return_date DATE DEFAULT NULL
);

CREATE TABLE LIBRARIES (
  PRIMARY KEY (id_library),
  id_library       INTEGER NOT NULL,
  library_name     VARCHAR(42),
  id_address       INTEGER NOT NULL
);

CREATE TABLE ORDERED (
  PRIMARY KEY (id_order, isbn),
  id_order INTEGER NOT NULL,
  isbn     VARCHAR(42) NOT NULL,
  quantity INTEGER NOT NULL
);

CREATE TABLE ORDERS (
  PRIMARY KEY (id_order),
  id_order     INTEGER NOT NULL,
  id_lending   INTEGER NOT NULL,
  id_transfert INTEGER NOT NULL,
  id_library_from INTEGER,
  id_library_to INTEGER,
  UNIQUE (id_lending)
);

CREATE TABLE PUBLISHERS (
  PRIMARY KEY (id_publisher),
  id_publisher   INTEGER NOT NULL,
  publisher_name VARCHAR(42)
);

CREATE TABLE SUBSCRIBERS (
  PRIMARY KEY (email),
  email      VARCHAR(42) NOT NULL,
  first_name VARCHAR(42),
  last_name  VARCHAR(42),
  dob        DATE
);

CREATE TABLE TRANSFERTS (
  PRIMARY KEY (id_transfert),
  id_transfert  INTEGER NOT NULL,
  date_sent     DATE,
  date_received DATE,
  id_employee   INTEGER NOT NULL
);

CREATE TABLE HOLDINGS (
  PRIMARY KEY (isbn, id_library),
  isbn VARCHAR(42) NOT NULL,
  id_library INTEGER NOT NULL,
  quantity     INTEGER,
  room         VARCHAR(42),
  shelf        VARCHAR(42),
  position     VARCHAR(42)
);

CREATE TABLE CONFERENCES (
  id_author INTEGER NOT NULL
) INHERITS (EVENTS);

CREATE TABLE EXPOSITIONS (
  id_collection INTEGER NOT NULL
) INHERITS (EVENTS);

CREATE TABLE COLLECTIONS (
  PRIMARY KEY (id_collection),
  id_collection INTEGER NOT NULL,
  name VARCHAR(42)
);

CREATE TABLE COLLECTIONARY (
  PRIMARY KEY (isbn, id_collection),
  isbn VARCHAR(42) NOT NULL,
  id_collection INTEGER NOT NULL
);

CREATE TABLE ADDRESSES (
  PRIMARY KEY (id_address),
  id_address INTEGER NOT NULL,
  region VARCHAR(42),
  address_name VARCHAR(42),
  address_number INTEGER,
  city VARCHAR(42),
  postal INTEGER
);




ALTER TABLE BOOKS ADD FOREIGN KEY (id_publisher) REFERENCES PUBLISHERS (id_publisher);
ALTER TABLE BOOKS ADD FOREIGN KEY (id_author) REFERENCES AUTHORS (id_author);

ALTER TABLE EMPLOYEES ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE EVENTS ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE IS_LENDED ADD FOREIGN KEY (isbn) REFERENCES BOOKS (isbn);
ALTER TABLE IS_LENDED ADD FOREIGN KEY (id_lending) REFERENCES LENDINGS (id_lending);

ALTER TABLE LENDINGS ADD FOREIGN KEY (email) REFERENCES SUBSCRIBERS (email);

ALTER TABLE ORDERED ADD FOREIGN KEY (isbn) REFERENCES BOOKS (isbn);
ALTER TABLE ORDERED ADD FOREIGN KEY (id_order) REFERENCES ORDERS (id_order);

ALTER TABLE ORDERS ADD FOREIGN KEY (id_transfert) REFERENCES TRANSFERTS (id_transfert);
ALTER TABLE ORDERS ADD FOREIGN KEY (id_lending) REFERENCES LENDINGS (id_lending);

ALTER TABLE TRANSFERTS ADD FOREIGN KEY (id_employee) REFERENCES EMPLOYEES (id_employee);

ALTER TABLE HOLDINGS ADD FOREIGN KEY (isbn) REFERENCES BOOKS (isbn);
ALTER TABLE HOLDINGS ADD FOREIGN KEY (id_library) REFERENCES LIBRARIES (id_library);

ALTER TABLE CONFERENCES ADD FOREIGN KEY (id_author) REFERENCES AUTHORS;

ALTER TABLE EXPOSITIONS ADD FOREIGN KEY (id_collection) REFERENCES COLLECTIONS;

ALTER TABLE COLLECTIONARY ADD FOREIGN KEY (id_collection) REFERENCES COLLECTIONS;
ALTER TABLE COLLECTIONARY ADD FOREIGN KEY (isbn) REFERENCES BOOKS;

ALTER TABLE LIBRARIES ADD FOREIGN KEY (id_address) REFERENCES ADDRESSES;