create database world;
use world;
 CREATE TABLE IF NOT EXISTS Artists
(
   pKArtistId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120) NULL
);

insert into Artists(Name) values("First Artist");
insert into Artists(Name) values('Second Artist');

UPDATE artists SET Name = 'Second One One Artist' WHERE (pKArtistId = 2);


 CREATE TABLE IF NOT EXISTS Albums
(
    pkAlbumId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Title NVARCHAR(160)  NOT NULL,
    fkArtistId INT NOT NULL,
    FOREIGN KEY (fkArtistId) REFERENCES artists (pkArtistId)
    ON DELETE NO ACTION ON UPDATE NO ACTION);
    
  

CREATE TABLE IF NOT EXISTS Employees
(
    pkEmployeeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    LastName NVARCHAR(20)  NOT NULL,
    FirstName NVARCHAR(20)  NOT NULL,
    Title NVARCHAR(30),
    ReportsTo INTEGER,
    BirthDate DATETIME,
    HireDate DATETIME,
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
	Fax NVARCHAR(24),
    Email NVARCHAR(60),
    FOREIGN KEY (ReportsTo) REFERENCES Employees (pkEmployeeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);



CREATE TABLE IF NOT EXISTS Genres
(
    pkGenreId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);


CREATE TABLE IF NOT EXISTS Customers
(
    pkCustomerId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    FirstName NVARCHAR(40)  NOT NULL,
    LastName NVARCHAR(20)  NOT NULL,
    Company NVARCHAR(80),
    Address NVARCHAR(70),
    City NVARCHAR(40),
    State NVARCHAR(40),
    Country NVARCHAR(40),
    PostalCode NVARCHAR(10),
    Phone NVARCHAR(24),
    Fax NVARCHAR(24),
    Email NVARCHAR(60)  NOT NULL,
    SupportRepId INTEGER,
    FOREIGN KEY (SupportRepId) REFERENCES Employees (pkEmployeeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Invoices
(
    pkInvoiceId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CustomerId INTEGER  NOT NULL,
    InvoiceDate DATETIME  NOT NULL,
    BillingAddress NVARCHAR(70),
    BillingCity NVARCHAR(40),
    BillingState NVARCHAR(40),
    BillingCountry NVARCHAR(40),
    BillingPostalCode NVARCHAR(10),
    Total NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers (pkCustomerId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Media_types
(
    pkMediaTypeId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);

/*
CREATE TABLE IF NOT EXISTS Playlists
(
    pkPlaylistId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120)
);

CREATE TABLE IF NOT EXISTS Tracks
(
    pkTrackId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(200)  NOT NULL,
    pkAlbumId INTEGER,
    MediaTypeId INTEGER  NOT NULL,
    GenreId INTEGER,
    Composer NVARCHAR(220),
    Milliseconds INTEGER  NOT NULL,
    Bytes INTEGER,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY (pkAlbumId) REFERENCES Albums (pkAlbumId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (GenreId) REFERENCES Genres (pkGenreId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (MediaTypeId) REFERENCES Media_types (pkMediaTypeId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS Invoice_items
(
    pkInvoiceLineId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    InvoiceId INTEGER  NOT NULL,
    TrackId INTEGER  NOT NULL,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    Quantity INTEGER  NOT NULL,
    FOREIGN KEY (InvoiceId) REFERENCES Invoices (pkInvoiceId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (TrackId) REFERENCES Tracks (pkTrackId) 
        ON DELETE NO ACTION ON UPDATE NO ACTION
);