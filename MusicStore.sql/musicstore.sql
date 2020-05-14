ALTER TABLE Album DROP CONSTRAINT artist_fk;
ALTER TABLE Album DROP CONSTRAINT genre_fk;
ALTER TABLE Cart DROP CONSTRAINT album_fk2;
ALTER TABLE Users1 DROP CONSTRAINT userrole_fk;
ALTER TABLE Orders DROP CONSTRAINT users1_fk;
ALTER TABLE OrderDetail DROP CONSTRAINT album_fk3;
ALTER TABLE OrderDetail DROP CONSTRAINT order_fk;


DROP TABLE Cart;
DROP TABLE Genre;
DROP TABLE Artist;
DROP TABLE Album;
DROP TABLE UserRole;
DROP TABLE Users1;
DROP TABLE Orders;
DROP TABLE OrderDetail;

CREATE TABLE Genre(GenreId number(20,0) not null, NameGenre varchar2(120 char)null, Description varchar2(4000 char) null, CONSTRAINT Genre_pk PRIMARY KEY(GenreId));
CREATE TABLE Artist(ArtistId number(20,0) not null, NameArtist varchar2(120 char) null, CONSTRAINT Artist_pk PRIMARY KEY(ArtistId));
CREATE TABLE Album(AlbumId number(20,0)not null, GenreId number(20,0) not null, ArtistId number(20,0) not null, Title varchar2(120 char) not null, Price number(10,2) not null, AlbumArtURL varchar2(1024 char) null, CONSTRAINT genre_fk FOREIGN KEY (GenreId) REFERENCES Genre(GenreId),CONSTRAINT artist_fk FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId), CONSTRAINT album_pk PRIMARY KEY (AlbumId));
CREATE TABLE Cart(RecordId number(20,0) not null, CartId varchar(20) not null, AlbumId number(20,0) not null, Count1 number(20,0) not null, DateCreated date not null, CONSTRAINT album_fk2 FOREIGN KEY(AlbumId) REFERENCES Album(AlbumId), CONSTRAINT cart_pk PRIMARY KEY(RecordId));   
CREATE TABLE UserRole(RoleId number(20,0) not null, RoleName varchar(30) not null, CONSTRAINT userrole_pk PRIMARY KEY(RoleId));
CREATE TABLE Users1(Users1Id number not null, UserName varchar2(50) not null,Password1 varchar2(50) not null, FirstName varchar2(50) not null, LastName varchar2(50) not null, RoleId number(20,0) not null, CONSTRAINT userrole_fk FOREIGN KEY(RoleId) REFERENCES UserRole(RoleId), CONSTRAINT users1_pk PRIMARY KEY(Users1Id));
CREATE TABLE Orders(OrdersId number(20,0) not null, Address varchar2(70 char) null, OrderDate date not null,City varchar2(40 char) null, State varchar2(40 char) null, PostalCode varchar2(10 char) null, Country varchar2(40 char) null, Phone varchar2(24 char) null, Email varchar2(140 char), Total number(10,2) not null, Users1Id number(20,0) null, CONSTRAINT users1_fk FOREIGN KEY(Users1Id) REFERENCES Users1(Users1Id),CONSTRAINT orders_pk PRIMARY KEY(OrdersId));
CREATE TABLE OrderDetail(OrderDetailId number(20,0) not null, OrdersId number(20,0) not null, AlbumId number(20,0) not null, Quantity number(20,0) not null, UnitPrice number not null, CONSTRAINT album_fk3 FOREIGN KEY(AlbumId) REFERENCES Album(AlbumId), CONSTRAINT order_fk FOREIGN KEY(OrdersId) REFERENCES Orders(OrdersId), CONSTRAINT orderdetail_pk PRIMARY KEY(OrderDetailId));