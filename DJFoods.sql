create database DJFoods;
use DJFoods;

set @@auto_increment_offset = 200;

create table restaurant(
RID int unsigned primary key auto_increment ,
ResNAme varchar(50) not null unique,
Type enum('Cloud Kitchen','Cafe','Bakery','Dine-In'),
Rating int not null
);

set @@auto_increment_offset = 4000;

create table Catogary(
CID int unsigned primary key auto_increment,
cName enum('North Indian', 'South Indian','Chinese','Italian','Maxican')
);

set @@auto_increment_offset = 54300;

create table Dish(
DID int unsigned primary key auto_increment,
CID int unsigned,
dishName varchar(30) not null unique
);

alter table Dish add foreign key(CID) references Catogary(CID);

create table RnD(
RID int unsigned ,
DID int unsigned ,
Price int not null,
foreign key(RID) references restaurant(RID),
foreign key(DID) references dish(DID),
primary key(RID, DID)
);

create table OrderList(
SrNO int unsigned primary key auto_increment,
Dish varchar(30) not null,
quantity int not null,
rate int not null,
price int not null
);

alter table orderList drop `price` ;

alter table orderList add price int AS (quantity * rate);

create table Orders(
OID int unsigned primary key auto_increment,
oStatus enum('Being Prepared','Picked Up','Delivered','Accepted','Pending'),
oTotal int not null
);

alter table orderList add OID int unsigned not null ;
alter table orderList add foreign key(OID) references Orders(OID);
alter table orderList add foreign key(Dish) references Dish(dishname);

alter table orderList add RID int unsigned not null ;
alter table orderList add foreign key(RID) references Restaurant(RID);