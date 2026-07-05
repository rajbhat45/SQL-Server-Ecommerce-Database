create database OnlineShoppingDB

use OnlineShoppingDB

CREATE TABLE Customers
(CustomerID INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(255) NOT NULL,
LastNmae VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE NOT NULL,
Phone VARCHAR(255) UNIQUE NOT NULL,
City VARCHAR(255) NOT NULL,
State VARCHAR(255) NOT NULL,
RegistrationDate DATE DEFAULT GETDATE()
)
SELECT * FROM Customers
SP_RENAME 'Customers.LastNmae','LastName'

CREATE TABLE Categories(
CategoryID INT IDENTITY(1,1)PRIMARY KEY,
CategoryName VARCHAR(255) UNIQUE NOT NULL,
Description VARCHAR(255))

CREATE TABLE Suppliers(
SupplierID INT IDENTITY(1,1)PRIMARY KEY,
SupplierName VARCHAR(255) NOT NULL,
Email VARCHAR(255) UNIQUE,
Phone VARCHAR(255) UNIQUE,
City VARCHAR(255))

SELECT * FROM Customers
SELECT * FROM Categories
SELECT * FROM Suppliers

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,

    ProductName VARCHAR(100) NOT NULL,

    ProductDescription VARCHAR(255),

    Price DECIMAL(10,2) NOT NULL,

    Brand VARCHAR(50),

    Stock INT NOT NULL,

    CategoryID INT NOT NULL,

    SupplierID INT NOT NULL,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);

SELECT * FROM Products

CREATE TABLE Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,

    CustomerID INT NOT NULL,

    OrderDate DATE DEFAULT GETDATE(),

    OrderStatus VARCHAR(20) NOT NULL,

    TotalAmount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY(CustomerID)
        REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails(
OrderDetailID INT IDENTITY(1,1)PRIMARY KEY,

OrderID INT NOT NULL,

ProductID INT NOT NULL,

Quantity INT NOT NULL,

UnitPrice DECIMAL(10,2) NOT NULL,
 

FOREIGN KEY(OrderID)
 REFERENCES Orders(OrderID),
 
 FOREIGN KEY(ProductID)
 REFERENCES Products(ProductID)
 
 )


 SELECT * FROM Orders
 SELECT * FROM OrderDetails


 CREATE TABLE Payments
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    PaymentMethod VARCHAR(30) NOT NULL,

    Amount DECIMAL(10,2) NOT NULL,

    PaymentDate DATE DEFAULT GETDATE(),

    PaymentStatus VARCHAR(20) NOT NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
)

CREATE TABLE WishList(
WishlistID INT IDENTITY(1,1) PRIMARY KEY,

CustomerID INT NOT NULL,

ProductID INT NOT NULL,

AddedDate DATE DEFAULT GETDATE(),

FOREIGN KEY(CustomerID)
  REFERENCES Customers(CustomerID),
  
 FOREIGN KEY(ProductID)
  REFERENCES Products(ProductID)
  )

CREATE TABLE Reviews(
ReviewID INT IDENTITY(1,1)PRIMARY KEY,

CustomerID INT NOT NULL,

ProductID INT NOT NULL,

Rating INT CHECK(Rating BETWEEN 1 AND 5),

ReviewText VARCHAR(255),

ReviewDate DATE DEFAULT GETDATE(),

 FOREIGN KEY(CustomerID)
  REFERENCES Customers(CustomerID),
  
  FOREIGN KEY (ProductID)
   REFERENCES Products(ProductID),

   UNIQUE(CustomerID,ProductID)
   )

CREATE TABLE Shipping(
ShippingID INT IDENTITY(1,1)PRIMARY KEY,

OrderID INT NOT NULL,

ShippingAddress VARCHAR(255),

ShippingDate DATE DEFAULT GETDATE(),

DeliveryDate DATE NULL,

ShippingStatus VARCHAR(255),

 FOREIGN KEY(OrderID)
 REFERENCES orders(OrderID)
 )

 INSERT INTO Categories (CategoryName, Description)
VALUES
('Electronics','Electronic gadgets'),
('Fashion','Clothing and accessories'),
('Books','Educational and story books'),
('Home Appliances','Household appliances'),
('Sports','Sports equipment');


INSERT INTO Suppliers (SupplierName, Email, Phone, City)
VALUES
('TechWorld','techworld@gmail.com','9876543210','Mumbai'),
('FashionHub','fashionhub@gmail.com','9876543211','Delhi'),
('BookStore','bookstore@gmail.com','9876543212','Pune'),
('HomeNeeds','homeneeds@gmail.com','9876543213','Bangalore'),
('SportsZone','sportszone@gmail.com','9876543214','Hyderabad');


INSERT INTO Customers
(FirstName, LastName, Email, Phone, City, State)
VALUES
('Raj','Bhat','raj@gmail.com','9000000001','Pune','Maharashtra'),
('Amit','Patil','amit@gmail.com','9000000002','Mumbai','Maharashtra'),
('Sneha','Sharma','sneha@gmail.com','9000000003','Delhi','Delhi'),
('Rohan','Joshi','rohan@gmail.com','9000000004','Nagpur','Maharashtra'),
('Priya','Singh','priya@gmail.com','9000000005','Lucknow','Uttar Pradesh'),
('Karan','Mehta','karan@gmail.com','9000000006','Ahmedabad','Gujarat'),
('Neha','Gupta','neha@gmail.com','9000000007','Jaipur','Rajasthan'),
('Ankit','Verma','ankit@gmail.com','9000000008','Indore','Madhya Pradesh'),
('Pooja','Kulkarni','pooja@gmail.com','9000000009','Nashik','Maharashtra'),
('Rahul','Yadav','rahul@gmail.com','9000000010','Patna','Bihar');


select * from categories
select * from suppliers
select * from customers


INSERT INTO Products
(ProductName,
ProductDescription,
Price,
Brand,
Stock,
CategoryID,
SupplierID)
VALUES

('Dell Inspiron 15',
'15.6 inch Laptop',
55000,
'Dell',
20,
1,
1),

('Boat Rockerz 450',
'Wireless Headphones',
1800,
'Boat',
50,
1,
1),

('Nike Running Shoes',
'Comfortable Sports Shoes',
4500,
'Nike',
35,
5,
5),

('Harry Potter',
'Fantasy Novel',
650,
'Bloomsbury',
100,
3,
3),

('Samsung Refrigerator',
'Double Door Refrigerator',
32000,
'Samsung',
15,
4,
4),

('Levis Jeans',
'Blue Denim Jeans',
2200,
'Levis',
40,
2,
2),

('LG Washing Machine',
'Front Load Washing Machine',
28000,
'LG',
10,
4,
4),

('Football',
'Professional Football',
1200,
'Nivia',
45,
5,
5),

('Polo T-Shirt',
'Cotton T-Shirt',
900,
'US Polo',
60,
2,
2),

('Data Structures Book',
'Computer Science Book',
850,
'Pearson',
80,
3,
3);

select * from products


INSERT INTO Orders
(CustomerID, OrderDate, OrderStatus, TotalAmount)
VALUES
(1,'2025-01-05','Delivered',56800),
(2,'2025-01-08','Delivered',2200),
(3,'2025-01-10','Shipped',32000),
(1,'2025-01-15','Delivered',650),
(4,'2025-01-18','Pending',1800),
(5,'2025-01-20','Delivered',4500),
(6,'2025-01-22','Cancelled',28000),
(7,'2025-01-25','Delivered',900),
(8,'2025-01-28','Shipped',1200),
(9,'2025-01-30','Pending',850);

select * from orders

INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice)
VALUES

(1,1,1,55000),
(1,2,1,1800),

(2,6,1,2200),

(3,5,1,32000),

(4,4,1,650),

(5,2,1,1800),

(6,3,1,4500),

(7,7,1,28000),

(8,9,1,900),

(9,8,1,1200),

(10,10,1,850);

select * from OrderDetails


INSERT INTO Payments
(OrderID, PaymentMethod, Amount, PaymentDate, PaymentStatus)
VALUES

(1,'UPI',56800,'2025-01-05','Completed'),
(2,'Credit Card',2200,'2025-01-08','Completed'),
(3,'Net Banking',32000,'2025-01-10','Completed'),
(4,'Cash on Delivery',650,'2025-01-15','Completed'),
(5,'UPI',1800,'2025-01-18','Pending'),
(6,'Debit Card',4500,'2025-01-20','Completed'),
(7,'Credit Card',28000,'2025-01-22','Refunded'),
(8,'UPI',900,'2025-01-25','Completed'),
(9,'Cash on Delivery',1200,'2025-01-28','Pending'),
(10,'Net Banking',850,'2025-01-30','Completed');


INSERT INTO Wishlist
(CustomerID, ProductID)
VALUES

(1,5),
(2,3),
(3,1),
(4,10),
(5,2),
(6,4),
(7,8),
(8,7),
(9,6),
(10,9);


INSERT INTO Reviews
(CustomerID, ProductID, Rating, ReviewText)
VALUES

(1,1,5,'Excellent laptop'),
(2,6,4,'Very comfortable jeans'),
(3,5,5,'Great refrigerator'),
(4,2,4,'Sound quality is good'),
(5,3,5,'Perfect for running'),
(6,7,4,'Works very well'),
(7,9,5,'Nice quality'),
(8,8,4,'Good football'),
(9,10,5,'Very useful book'),
(10,4,5,'Amazing story');


INSERT INTO Shipping
(OrderID, ShippingAddress, ShippingDate, DeliveryDate, ShippingStatus)
VALUES

(1,'Pune, Maharashtra','2025-01-06','2025-01-08','Delivered'),
(2,'Mumbai, Maharashtra','2025-01-09','2025-01-11','Delivered'),
(3,'Delhi','2025-01-11',NULL,'Shipped'),
(4,'Nagpur, Maharashtra','2025-01-16','2025-01-18','Delivered'),
(5,'Lucknow, Uttar Pradesh','2025-01-19',NULL,'Pending'),
(6,'Ahmedabad, Gujarat','2025-01-21','2025-01-23','Delivered'),
(7,'Jaipur, Rajasthan',NULL,NULL,'Cancelled'),
(8,'Indore, Madhya Pradesh','2025-01-26','2025-01-28','Delivered'),
(9,'Nashik, Maharashtra','2025-01-29',NULL,'Shipped'),
(10,'Patna, Bihar','2025-01-31',NULL,'Pending');


select * from WishList


select TOP 5 c.CustomerID, c.FirstName,c.LastName,SUM(O.TotalAmount) AS TotalSpent from Customers c inner join Orders o
on c.CustomerID=o.CustomerID group by c.FirstName,c.CustomerID,c.LastName order by TotalSpent DESC

select top 5 p.ProductID,p.ProductName,SUM(o.Quantity) as TotalQuantitySold from Products P inner join OrderDetails o on
p.productID=o.ProductID Group by p.ProductID,p.ProductName order by TotalQuantitySold DESC

SELECT
    DATENAME(MONTH, OrderDate) AS Month,
    SUM(TotalAmount) AS Revenue
FROM Orders
GROUP BY
    MONTH(OrderDate),
    DATENAME(MONTH, OrderDate)
ORDER BY MONTH(OrderDate);

select p.ProductID,p.ProductName from Products P LEFT JOIN OrderDetails o on p.ProductID=o.ProductID
where OrderID IS NULL

SELECT p.ProductID,p.ProductName,AVG(r.Rating) as AverageRating from Products p inner join Reviews r on
p.ProductID=r.ProductID GROUP BY p.ProductID,P.ProductName having AVG(r.Rating)>=4.5 order by AverageRating

SELECT
    c.CategoryName,
    SUM(od.Quantity) AS ProductsSold,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM Categories c

INNER JOIN Products p
ON c.CategoryID = p.CategoryID

INNER JOIN OrderDetails od
ON p.ProductID = od.ProductID

GROUP BY c.CategoryName

ORDER BY Revenue DESC;

SELECT c.FirstName+''+c.LastName AS CustomerName,p.ProductName,od.Quantity,od.UnitPrice,O.OrderDate from Customers c inner join Orders o on
c.CustomerID=o.CustomerID

INNER JOIN  OrderDetails od on
o.OrderID=od.OrderID

INNER JOIN Products p on 
od.ProductID=p.ProductID


SELECT p.ProductID,p.ProductName,SUM(od.Quantity) as Qtysold,SUM(od.Quantity*od.UnitPrice) AS Revenue,
COUNT(od.OrderID) as orders from Products p inner join OrderDetails od on p.ProductID=od.ProductID
GROUP BY p.ProductID,p.ProductName


SELECT c.CustomerID,c.FirstName+' '+c.LastName as CustomerName,AVG(o.TotalAmount) as AvgOrderAmt FROM 
Customers c inner join Orders o on c.CustomerID=o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName


SELECT TOP 3 c.CustomerID,c.FirstName+' '+c.LastName as CustomerName,COUNT(o.OrderID) AS TotalOrders,
SUM(o.TotalAmount) as TotalAmountSpent,AVG(o.TotalAmount) AS AvgAmountSpent FROM 
Customers c inner join Orders o on c.CustomerID=o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName


CREATE VIEW vw_CustomerOrderSummary
AS
SELECT o.OrderID,c.FirstName+' '+c.LastName AS CustomerName,o.OrderDate,o.TotalAmount from Customers c inner join Orders o
on c.CustomerID=o.CustomerID

SELECT * FROM vw_CustomerOrderSummary

CREATE VIEW vw_ProductSalesSummary
AS
SELECT p.ProductID,p.ProductName,SUM(od.Quantity)AS TotalQuantitySold,SUM(od.Quantity*od.UnitPrice) AS Revenue
FROM Products p INNER JOIN OrderDetails od on p.ProductID=od.ProductID
GROUP BY p.ProductID,p.ProductName

SELECT * FROM vw_ProductSalesSummary

CREATE VIEW vw_CustomerPurchaseSummary
AS
SELECT c.CustomerID,c.FirstName+' '+c.LastName AS CustomerName,COUNT(o.OrderID)AS TotalOrderS,SUM(o.TotalAmount)AS
TotalSpent FROM Customers c INNER JOIN Orders o on c.CustomerID=o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName

SELECT * FROM vw_CustomerPurchaseSummary

CREATE PROCEDURE sp_GetCustomerOrders
@CustomerID INT
AS 
SELECT OrderID,OrderDate,TotalAmount FROM Orders WHERE CustomerID=@CustomerID

EXEC sp_GetCustomerOrders 1


CREATE PROCEDURE sp_GetOrdersBetweenDates
@StartDate DATE,
@EndDate DATE
AS BEGIN
SELECT OrderID,CustomerID,OrderDate,TotalAmount FROM Orders WHERE
OrderDate BETWEEN @StartDate AND @EndDate
END

EXEC sp_GetOrdersBetweenDates
  '2025-01-01',
  '2025-01-31'


CREATE PROCEDURE sp_GetTopCustomers
@TopN INT
AS BEGIN
SELECT TOP(@TopN)c.CustomerID,c.FirstName+' '+c.LastName AS CustomerName,COUNT(o.OrderID) AS TotalOrders,
SUM(o.TotalAmount) AS TotalSpent FROM Customers c INNER JOIN Orders o on c.CustomerID=o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName ORDER BY TotalSpent DESC
END

EXEC sp_GetTopCustomers 5

CREATE TRIGGER tr_UpdateProductStock
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.Stock = p.Stock - i.Quantity
    FROM Products p
    INNER JOIN inserted i
        ON p.ProductID = i.ProductID;
END;


CREATE TRIGGER tr_CheckStockBeforeInsert
ON OrderDetails
INSTEAD OF INSERT
AS
BEGIN
    -- Check if ordered quantity is greater than available stock
    IF EXISTS (
        SELECT 1
        FROM Products p
        INNER JOIN inserted i
            ON p.ProductID = i.ProductID
        WHERE i.Quantity > p.Stock
    )
    BEGIN
        RAISERROR ('Insufficient stock available.', 16, 1);
        RETURN;
    END

    -- Insert the order if sufficient stock is available
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    SELECT OrderID, ProductID, Quantity, UnitPrice
    FROM inserted;
END;


CREATE INDEX IX_Customers_Email on Customers(Email)


CREATE INDEX IX_Orders_Customer_OrderDate on Orders(CustomerID,OrderDate)
