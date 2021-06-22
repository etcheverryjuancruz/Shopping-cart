CREATE DATABASE Market;

USE Market;
CREATE USER sqluser IDENTIFIED BY 'sqluserpw';

grant usage on *.* to sqluser@localhost identified by 'sqluserpw';
grant all privileges on feedback.* to sqluser@localhost;


CREATE TABLE Users(
	nickName VARCHAR(30)	NOT NULL,
	firstName	VARCHAR(30)	NOT NULL,
	lastName	VARCHAR(30)	NOT NULL,
	password	VARCHAR(30)	NOT NULL,
	PRIMARY KEY (nickName)
);

CREATE TABLE Products(
	name VARCHAR(30)	NOT NULL,
	category	VARCHAR(30)	NOT NULL,
	price	DOUBLE(5,2)	NOT NULL,
	PRIMARY KEY (name)
);

CREATE TABLE Carts(
	id	int	NOT NULL AUTO_INCREMENT,
	nickName VARCHAR(30)	NOT NULL,
	PRIMARY KEY (id,nickName),
	FOREIGN KEY(nickName) REFERENCES Users(nickName) ON DELETE CASCADE
);
CREATE TABLE CartRows(
	id	int	NOT NULL,
	name VARCHAR(30)	NOT NULL,
	quantity	int	NOT NULL,
	PRIMARY KEY (id,name),
	FOREIGN KEY(id) REFERENCES Carts(id) ON DELETE CASCADE,
	FOREIGN KEY(name) REFERENCES Products(name) ON DELETE CASCADE
);

USE Market;

INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User1NickName','User1FirstName','User1LastName','User1Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User2NickName','User2FirstName','User2LastName','User2Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User3NickName','User3FirstName','User3LastName','User3Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User4NickName','User4FirstName','User4LastName','User4Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User5NickName','User5FirstName','User5LastName','User5Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User6NickName','User6FirstName','User6LastName','User6Password');
INSERT INTO Users (nickName,firstName,lastName,password) VALUES ('User7NickName','User7FirstName','User7LastName','User7Password');

INSERT INTO Products (name,category,price) VALUES ('Product1Name','Category1',10);
INSERT INTO Products (name,category,price) VALUES ('Product2Name','Category2',20);
INSERT INTO Products (name,category,price) VALUES ('Product3Name','Category2',30);
INSERT INTO Products (name,category,price) VALUES ('Product4Name','Category3',40);
INSERT INTO Products (name,category,price) VALUES ('Product5Name','Category3',50);
INSERT INTO Products (name,category,price) VALUES ('Product6Name','Category3',60);

INSERT INTO Carts (nickName) VALUES ('User6NickName');
INSERT INTO Carts (nickName) VALUES ('User7NickName');

INSERT INTO CartRows (id,name,quantity) VALUES (1,'Product6Name',1);
INSERT INTO CartRows (id,name,quantity) VALUES (1,'Product5Name',2);
INSERT INTO CartRows (id,name,quantity) VALUES (2,'Product1Name',1);
INSERT INTO CartRows (id,name,quantity) VALUES (2,'Product2Name',2);
INSERT INTO CartRows (id,name,quantity) VALUES (2,'Product3Name',3);