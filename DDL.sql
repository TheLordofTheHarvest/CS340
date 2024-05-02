CREATE TABLE Books (
  isbn varchar(14) UNIQUE NOT NULL,
  title varchar(50) NOT NULL,
  seriesID int,
  PRIMARY KEY (isbn),
  FOREIGN KEY (seriesID) REFERENCES Series(seriesID)
);

CREATE TABLE Series (
  seriesID int UNIQUE NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  PRIMARY KEY (seriesID)
);

CREATE TABLE AuthorsSeries (
  authorID int NOT NULL,
  seriesID int NOT NULL,
  FOREIGN KEY (authorID) REFERENCES Authors(authorID),
  FOREIGN KEY (seriesID) REFERENCES Series(seriesID)
);

CREATE TABLE Authors (
  authorID int UNIQUE NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (authorID)
);

CREATE TABLE AuthorsBooks (
  authorID int NOT NULL,
  isbn int NOT NULL,
  FOREIGN KEY (authorID) REFERENCES Authors(authorID),
  FOREIGN KEY (isbn) REFERENCES Books(isbn)
);

CREATE TABLE Copies (
  copyID int UNIQUE NOT NULL AUTO_INCREMENT,
  isbn varchar(14) NOT NULL,
  format varchar(50) NOT NULL,
  `condition` varchar(50) NOT NULL,
  price dec(19, 2) NOT NULL,
  count int NOT NULL,
  PRIMARY KEY (copyID),
  FOREIGN KEY (isbn) REFERENCES Books(isbn),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

CREATE TABLE OrderedCopies (
  copyID int NOT NULL,
  orderID int NOT NULL,
  salesPrice dec(19, 2) NOT NULL,
  FOREIGN KEY (copyID) REFERENCES Copies(copyID),
  FOREIGN KEY (orderID) REFERENCES Orders(orderID)
);

CREATE TABLE Customers (
  customerID int UNIQUE NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  addressLine varchar(50),
  city varchar(50),
  state varchar(3),
  postalCode int,
  email varchar(50) NOT NULL,
  PRIMARY KEY (customerID)
);

CREATE TABLE Orders (
  orderID int UNIQUE NOT AUTO_INCREMENT,
  customerID int NOT NULL,
  transactionDate date,
  lastFourCardNo int,
  shippingStatus varchar(50) NOT NULL,
  total dec(19, 2) NOT NULL,
  PRIMARY KEY (orderID), 
  FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

INSERT INTO Books (isbn, title, seriesID)
VALUES
("9780395489314", "The Fellowship of the Ring", 2),
("9780439139595", "Harry Potter and the Goblet of Fire", 1),
("9788175992771", "Moby Dick", NULL),
("9780545010221", "Harry Potter and the Deathly Hallows", 1),
("9780553381696", "A Clash of Kings", 3);

INSERT INTO Series (seriesID, title)
VALUES
(1, "Harry Potter"),
(2, "The Lord of the Rings"),
(3, "A Song of Ice and Fire");

INSERT INTO AuthorsSeries (authorID, seriesID)
VALUES
(1, 1),
(2, 3),
(4, 2);

INSERT INTO Authors (authorID, name)
VALUES
(1, "J. K. Rowling"),
(2, "George R. R. Martin"),
(3, "Herman Melville"),
(4, "J. R. R. Tolkien");

INSERT INTO AuthorsBooks (authorID, isbn)
VALUES
(1, "9780439139595"),
(1, "9780545010221"),
(2, "9780553381696"),
(3, "9788175992771"),
(4, "9780395489314");

INSERT INTO Copies (copyID, isbn, format, condition, price, count)
VALUES
(1,"9780439139595", "hardcover", "like new", 21.00, 19),
(2, "9780395489314", "hardcover", "good", 17.00, 3),
(3, "9788175992771", "paperback", "used", 12.00, 0),
(4, "9780545010221", "hardcover", "used", 10.00, 15),
(5, "9780553381696", "paperback", "poor", 5.00, 1);

INSERT INTO OrderedCopies (copyID, orderID, salesPrice)
VALUES
(1, 2, 15.00),
(2, 2, 13.00),
(2, 4, 17.00),
(3, 3, 5.00),
(4, 1, 10.00),
(5, 1, 5.00);

INSERT INTO Customers (customerID, name, phone, addressLine, city, state, postalCode, email)
VALUES
(1, "Jane Doe", "111-222-3333", "111 Apple Ave.", "Salt Lake City", "UT", 84101, "JaneDoe91@gmail.com"),
(2, "John Doe", "999-888-7777", "222 Banana Blvd.", "Jefferson City", "MO", 65043, "JohnDoe91@gmail.com"),
(3, "Jack Roe", "444-555-6666", "333 Cherry Ct.", "Patterson", "NJ", 07501, "JackRoe75@gmail.com");

INSERT INTO Orders (orderID, customerID, transactionDate, lastFourCardNo, shippingStatus, total)
VALUES
(1, 1, '2024-04-24', 1234, "processing", 15.00),
(2, 2, '2014-05-16', 6789, "delivered", 28.00),
(3, 1, '2001-04-16', 5545, "delivered", 5.00),
(4, 3, '2024-04-20', 7117, "shipped", 17.00);