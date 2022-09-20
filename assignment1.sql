CREATE DATABASE assignment;

USE assignment;


#Table:1 SalesPeople

CREATE TABLE salespeople(snum INT PRIMARY KEY,sname VARCHAR(100) UNIQUE,city Varchar(100),comm INT);
INSERT INTO salespeople(snum,sname,city,comm) VALUES(1001,' Peel',' London', 12);
INSERT INTO salespeople(snum,sname,city,comm) VALUES(1002 , 'Serres',' Sanjose',13);
INSERT INTO salespeople(snum,sname,city,comm) VALUES(1004,' Motika', 'London',11);
INSERT INTO salespeople(snum,sname,city,comm) VALUES(1007 ,'Rifkin ','Barcelona',15);
INSERT INTO salespeople(snum,sname,city,comm) VALUES(1003, 'Axelrod',' Newyork ',10);

SELECT * FROM salespeople;

#Table:2 Customers

CREATE TABLE customers(Cnum INT PRIMARY KEY, Cname VARCHAR(100), City VARCHAR(100), Snum INT NOT NULL);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES (2001,'Hoffman' ,'London', 1001);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2002 ,' Giovanni',' Rome', 1003);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2003,'  Liu',' Sanjose', 1002);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2004 ,' Grass',' Berlin', 1002);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2006 ,'Clemens',' London', 1001);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2008 ,'Cisneros ','Sanjose', 1007);
INSERT INTO customers(Cnum,Cname,City,Snum) VALUES(2007, 'Pereira',' Rome ',1004);

SELECT * FROM customers;

#Table 3 Orders

CREATE TABLE Orders(Onum INT PRIMARY KEY, Amt FLOAT, Odate DATE, Cnum INT,Snum INT);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum)  VALUES(3001, 18.69, '1990-10-03', 2008, 1007);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3003 ,767.19, '1990-10-03', 2001 ,1001);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3002 ,1900.10 ,'1990-10-03', 2007, 1004);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3005 , 5160.45 ,'1990-10-03', 2003, 1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3006 , 1098.16, '1990-10-03', 2008, 1007);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3009, 1713.23 ,'1990-10-04', 2002 ,1003);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3007 , 75.75 ,'1990-10-04', 2004 ,1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3008,  4273.00, '1990-10-05' ,2006, 1001);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3010  ,1309.95 ,'1990-10-06' ,2004, 1002);
INSERT INTO Orders(Onum,Amt,Odate,Cnum,Snum) VALUES(3011 , 9891.88, '1990-10-06', 2006, 1001);


SELECT * FROM Orders;



#Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT COUNT(*) FROM  salespeople WHERE Sname LIKE'a%' or  'A%';


#Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT salespeople.sname,orders.amt
FROM salespeople
INNER JOIN  orders
ON salespeople.snum=orders.snum
WHERE orders.amt>2000;


#Count the number of Salesperson belonging to Newyork.

SELECT  COUNT(*)  AS total_number_of_people  FROM salespeople  WHERE city='newyork';

#Display the number of Salespeople belonging to London and belonging to Paris.

SELECT COUNT(*)  AS total_no_of_people FROM SalesPeople UNION SELECT COUNT(*) AS total_no_of_people FROM customers WHERE city="landon" AND "paris";

#Display the number of orders taken by each Salesperson and their date of orders.

SELECT Sname,COUNT(DISTINCT orders.Snum)  AS total_quantity 
FROM  SalesPeople,Orders
WHERE salespeople.snum=orders.snum;

