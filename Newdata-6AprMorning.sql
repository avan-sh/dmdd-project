CREATE DATABASE IF NOT EXISTS AVANEESH_DB;

USE AVANEESH_DB;

 
DROP TABLE IF EXISTS AddressType;
 
--1. AddressType Table--

CREATE TABLE dbo.AddressType (
    AddressTypeID INT IDENTITY PRIMARY KEY ,
    Name VARCHAR(50) NOT NULL
);

select * from dbo.AddressType;

INSERT INTO AddressType (Name)
VALUES 
     ('Kitchen'),
    ('DeliveryDriver'),
    ('Customer'),
    ('Collection points');
   
   
   select * from AddressType;
  
  --2.PersonType Table--
 
  
 DROP TABLE IF EXISTS PersonType;
  
  CREATE TABLE dbo.PersonType (
  PersonTypeID INT IDENTITY PRIMARY KEY,
  PersonTypeName VARCHAR(50) NOT NULL
);

INSERT INTO PersonType (PersonTypeName) VALUES
('Customers'),
('DeliveryDrivers');

  
select * from PersonType;



--3. Contact Table--

DROP TABLE IF EXISTS Contact;

CREATE TABLE Contact (
  ContactID INT IDENTITY PRIMARY KEY,
  Email VARCHAR(255) NOT NULL ,
  PrimaryContact VARCHAR(255) NOT NULL,
  SecondaryContact VARCHAR(255),
);

 
INSERT INTO Contact (Email, PrimaryContact, SecondaryContact)
VALUES
  ('kitchen1@example.com', '555-1234-455', '555-5678-455'),
  ('kitchen2@example.com', '555-4321-789', '555-8765-897'),
  ('kitchen3@example.com', '555-4321-789', '555-8765-789'),
  ('kitchen4@example.com', '555-4321-789', '555-8765-789'),
  ('customer1@example.com', '555-1234-455', '555-5678-985'),
  ('customer2@example.com', '555-4321-789', '555-8765-683'),
  ('customer3@example.com', '555-4321-789', '555-8765-897'),
  ('customer4@example.com', '555-4321-789', '555-8765-897'),
  ('customer5@example.com', '555-4321-789', '555-8765-897'),
  ('customer6@example.com', '555-4321-789', '555-8765-897'),
  ('customer7@example.com', '555-4321-789', '555-8765-897'),
  ('customer8@example.com', '555-4321-789', '555-8765-897'),    
  ('driver1@example.com', '555-1234-455', '555-5678-455'),
  ('driver2@example.com', '555-4321-789', '555-8765-897'),
  ('driver3@example.com', '555-4321-789', '555-8765-368'),
  ('driver4@example.com', '555-3487-455', '555-3629-455'),
  ('driver5@example.com', '555-3467-455', '555-3729-455'),
  ('driver6@example.com', '555-3497-455', '555-3829-455')
  ;
  -- ('kitchen5@example.com', '555-4321-789', '555-8765-789'),
  -- ('kitchen6@example.com', '555-4321-789', '555-8765-789');
 
 
 SELECT * FROM Contact;


 --4. EquipmentType Table--
 
 DROP TABLE IF EXISTS EquipmentType;
 
 CREATE TABLE EquipmentType (
  EquipmentTypeID INT IDENTITY PRIMARY KEY,
  EquipmentType VARCHAR(50) NOT NULL
);



INSERT INTO EquipmentType (EquipmentType)
VALUES ('Cooking'),
       ('Food preparation'),
       ('Storage'),
       ('Serving'),
       ('Cleaning'),
       ('Safety'),
       ('Baking'),
      ('Beverage'),
     ('Ventilation'),
    ('Measuring');

 select * from EquipmentType;

--5. Cuisine Table--

DROP TABLE IF EXISTS Cuisine;

CREATE TABLE Cuisine (
    CuisineID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

INSERT INTO Cuisine (Name)
VALUES 
    ('Italian'),
    ('Chinese'),
    ('Mexican'),
    ('Japanese'),
    ('Indian'),
    ('French'),
    ('Greek'),
    ('Thai'),
    ('Spanish'),
    ('Lebanese');


select * from Cuisine;

--6. DishType Table--


DROP TABLE IF EXISTS DishType;

CREATE TABLE DishType (
    DishTypeID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

INSERT INTO DishType (Name) VALUES
    ('Appetizer'),
    ('Entrees'),
    ('Side dishes'),
    ('Desserts'),
    ('Beverages'),
    ('Combos/Platters');

select * from DishType;

--7. DietType Table--

drop table if exists DietType;

CREATE TABLE DietType (
  DietTypeID INT IDENTITY PRIMARY KEY,
  Name VARCHAR(50) NOT NULL
);

INSERT INTO DietType (Name) VALUES
('Vegetarian'),
('Vegan'),
('Pescatarian'),
('Ketogenic'),
('Paleo'),
('Gluten-free'),
('Dairy-free'),
('Low-carb'),
('Mediterranean'),
('Flexitarian');

select * from DietType;

--8. DeliveryZone Table--

DROP TABLE IF EXISTS DeliveryZone;

CREATE TABLE DeliveryZone (
  DeliveryZoneID INT IDENTITY PRIMARY KEY,
  City VARCHAR(50) NOT NULL,
  Zipcode VARCHAR(10) NOT NULL,
  State VARCHAR(2) NOT NULL
);

INSERT INTO DeliveryZone (City, Zipcode, State) VALUES
('Boston', '02120', 'MA'),
('Boston', '02115', 'MA'),
('Cambridge', '02114', 'MA'),
('Cambridge', '02134', 'MA'),
('Cambridge', '02138', 'MA'),
('Boston', '02109', 'MA'),
('Cambridge', '02139', 'MA'),
('Boston', '02215', 'MA'),
('Cambridge', '02140', 'MA'),
('Boston', '02116', 'MA')
;


select * from DeliveryZone;


--9. Address Table--

DROP TABLE IF EXISTS Address;

CREATE TABLE Address(
  AddressID INT NOT NULL IDENTITY PRIMARY KEY,
  AddressTypeID INT NOT NULL,
  DeliveryZoneID INT NOT NULL,
  AddressLine1 VARCHAR(255) NOT NULL,
  AddressLine2 VARCHAR(255 ),
  City VARCHAR(255) NOT NULL,
  StateProvince VARCHAR(2) NOT NULL,
  PostalCode VARCHAR(10) NOT NULL,
  FOREIGN KEY (AddressTypeID) REFERENCES AddressType(AddressTypeID),
  FOREIGN KEY (DeliveryZoneID) REFERENCES DeliveryZone(DeliveryZoneID)
);


-- INSERT INTO AddressType (Name)
-- VALUES 
--      ('Kitchen'),
--     ('DeliveryDriver'),
--     ('Customer'),
--     ('Collection points');

INSERT INTO Address (AddressTypeID, DeliveryZoneID, AddressLine1, AddressLine2, City, StateProvince, PostalCode)
VALUES
---CUSTOMER
  (3, 1, '123 Main St', '', 'Boston', 'MA', '02120'),
  (3, 2, '456 High St', '', 'Boston', 'MA', '02115'),
  (3, 3, '789 Broad St', '', 'Cambridge', 'MA', '02114'),
  (3, 4, '555 Park Ave', '', 'Cambridge', 'MA', '02134'),
  (3, 1, '999 Central St', '', 'Cambridge', 'MA', '02120'),
  (3, 2, '888 Harvard St', '', 'Boston', 'MA', '02115'),
  (3, 3, '777 Main St', 'Apt 2', 'Cambridge', 'MA', '02114'),
  (3, 4, '234 Elm St', '', 'Boston', 'MA', '02134'), 
  --DelDriver
  (2, 1, '123 Main St', '', 'Boston', 'MA', '02120'),
  (2, 2, '456 Elm St', '', 'Boston', 'MA', '02115'),
  (2, 3, '789 Harvard Ave', '', 'Cambridge', 'MA', '02114'),
  (2, 4, '987 Central St', 'Apt 2', 'Cambridge', 'MA', '02134'),
  (2, 1, '555 Tremont St', '', 'Boston', 'MA', '02120'),
  (2, 2, '777 Massachusetts Ave', '', 'Boston', 'MA', '02115'),
  --Kitchen
  (1, 1, '111 Beacon St', '', 'Boston', 'MA', '02215'),
  (1, 2, '222 Commonwealth Ave', '', 'Boston', 'MA', '02115'),
  (1, 2, '222 Centre St', '', 'Cambridge', 'MA', '02114'),
  (1, 4, '333 Boylston St', '', 'Cambridge', 'MA', '02134'),
  --CollectionPoint
  (4, 1, '888 Huntington Ave', '', 'Boston', 'MA', '02215'),
  (4, 2, '444 Commonwealth Ave', '', 'Boston', 'MA', '02115'),
  (4, 3, '555 Columbus Ave', '', 'Cambridge', 'MA', '02114'),
  (4, 4, '666 Newbury St', '', 'Cambridge', 'MA', '02134');

 
SELECT * FROM Address;


--10. Person Table--

DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    PersonID INT IDENTITY PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    PersonTypeID INT NOT NULL,
    ContactID INT NOT NULL,
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID)
);

INSERT INTO Person (First_Name, Last_Name, PersonTypeID, ContactID)
VALUES
    ('customer1', 'example1', 1, 5),
    ('customer2', 'example2', 1, 6),
    ('customer3', 'example3', 1, 7),
    ('customer4', 'example4', 1, 8),
    ('customer5', 'example5', 1, 9),
    ('customer6', 'example5', 1, 10),
    ('customer7', 'example5', 1, 11),
    ('customer8', 'example5', 1, 12),
    
    ('driver1', 'example1', 2, 13),
    ('driver2', 'example2', 2, 14),
    ('driver3', 'example3', 2, 15),
    ('driver4', 'example4', 2, 16),
    ('driver5', 'example5', 2, 17),
    ('driver6', 'example6', 2, 18);
   

select * from Person;


--11. Customer Table--

DROP TABLE IF EXISTS Customer;


CREATE TABLE Customer (
  CustomerID INT IDENTITY PRIMARY KEY,
  PersonID INT NOT NULL,
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

INSERT INTO Customer (PersonID)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8);
  


select * from Customer;


--12. CustomerAddress Table--
DROP TABLE IF EXISTS CustomerAddress ;
-- Create the CustomerAddress table
CREATE TABLE CustomerAddress (
  CustomerID INT NOT NULL,
  AddressID INT NOT NULL,
  PRIMARY KEY (CustomerID, AddressID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

select * from Address;
select * from Customer;
select * from CustomerAddress;
-- Add 10 entries to the table
INSERT INTO CustomerAddress (CustomerID, AddressID)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8);

select * from CustomerAddress;     
      
--13. Kitchen Table--


CREATE TABLE Kitchen (
  KitchenID INT IDENTITY PRIMARY KEY,
  AddressID INT NOT NULL,
  ContactID INT NOT NULL,
  CuisineID INT NOT NULL,
  KitchenName VARCHAR(255),
  --Rating FLOAT,
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
  FOREIGN KEY (CuisineID) REFERENCES Cuisine(CuisineID)
);


INSERT INTO Kitchen (AddressID, ContactID, CuisineID, KitchenName)
VALUES 
  (15, 1, 1, 'Kitchen1'),
  (16, 2, 2, 'Kitchen2'),
  (17, 3, 2, 'Kitchen3'),
  (18, 4, 1, 'Kitchen4');

 SELECT * from Kitchen WHERE 1=1;
 --Rating will be a computed column



--14. Equipment Table--
 
CREATE TABLE Equipment (
    EquipmentID INT IDENTITY PRIMARY KEY,
    EquipmentTypeID INT NOT NULL,
    EquipmentName VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    Brand VARCHAR(50),
    CONSTRAINT FK_EquipmentType_Equipment
        FOREIGN KEY (EquipmentTypeID)
        REFERENCES EquipmentType(EquipmentTypeID)
);

INSERT INTO Equipment (EquipmentTypeID, EquipmentName, UnitPrice, Brand)
VALUES (1, 'Oven', 1500.00, 'Samsung'),
       (1, 'Stove', 800.00, 'LG'),
       (2, 'Mixer', 200.00, 'KitchenAid'),
       (2, 'Blender', 75.00, 'Cuisinart'),
       (3, 'Bowl', 100.00, 'Keurig'),
       (3, 'Refrigerator', 400.00, 'DeLonghi'),
       (4, 'Dishes', 900.00, 'Bosch'),
       (4, 'Glasses', 150.00, 'Panasonic'),
       (5, 'Scrub', 75.00, 'Chicago Cutlery'),
       (5, 'Dishwasher', 200.00, 'Calphalon'),
       (6, 'Spatula', 200.00, 'Panasonic'),
       (6, 'Gloves', 200.00, 'Samsung'),
       (7, 'Microwave', 200.00, 'LG'),
       (7, 'Baking pan', 200.00, 'KitchenAid'),
       (8, 'Coffee Maker', 200.00, 'Cuisinart'),
       (8, 'Espresso Machine', 200.00, 'Keurig'),
       (9, 'Chimney', 200.00, 'Bosch'),
       (9, 'Smoke Detector', 200.00, 'Panasonic'),
       (10, 'Measuring Cups', 200.00, 'Calphalon'),
       (10, 'Measuring spoons', 200.00, 'Chicago Cutlery');
            
      
 --15. KitchenEquipmentAssociation Table--     

 CREATE TABLE KitchenEquipmentAssociation (
    KitchenID INT NOT NULL,
    EquipmentID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (KitchenID, EquipmentID),
    FOREIGN KEY (KitchenID) REFERENCES Kitchen,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment
);



INSERT INTO KitchenEquipmentAssociation (KitchenID, EquipmentID, Quantity)
VALUES
    (1, 1, 31),
    (1, 2, 22),
    (1, 3, 46),
    (1, 4, 14),
    (1, 5, 51),
    (1, 6, 31),
    (1, 7, 22),
    (2, 8, 46),
    (2, 9, 14),
    (2, 10, 51),
    (2, 11, 25),
    (2, 12, 24),
    (2, 13, 33),
    (2, 14, 10),
    (2, 15, 12),
    (3, 16, 31),
    (3, 17, 22),
    (3, 18, 46),
    (3, 19, 14),
    (3, 20, 51);
   
select * from KitchenEquipmentAssociation;
   
 --16. Orders Table--   
 
DROP TABLE IF EXISTS Orders;

 CREATE TABLE Orders (
  OrderID INT IDENTITY PRIMARY KEY,
  CustomerID INT NOT NULL,
  KitchenID INT NOT NULL,
  OrderPrice DECIMAL(10,2),
  OrderDeliveryAddressID INT,
  OrderDate DATETIME default GETDATE()
  CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_KitchenID FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID),
  CONSTRAINT fk_OrderDeliveryAddressID FOREIGN KEY (OrderDeliveryAddressID) REFERENCES Address(AddressID)
);


--Insert 10 sample entries
INSERT INTO Orders (CustomerID, KitchenID, OrderPrice, OrderDeliveryAddressID) VALUES
(1, 1, 25.00, 1),
(1, 1, 35.50, 1),
(2, 2, 15.75, 2),
(2, 2, 42.00, 2),
(2, 2, 28.25, 2),
(2, 2, 18.50, 2),
(3, 1, 20.00, 3),
(3, 1, 30.75, 3),
(3, 2, 19.00, 3),
(3, 2, 27.50, 3),
(4, 1, 20.00, 4),
(4, 1, 30.75, 4),
(4, 3, 19.00, 4),
(4, 3, 27.50, 4),
(5, 1, 20.00, 5),
(5, 1, 30.75, 5),
(6, 3, 19.00, 6),
(6, 3, 27.50, 6),
(7, 1, 19.00, 7),
(7, 1, 27.50, 7),
(8, 2, 19.00, 8),
(8, 2, 27.50, 8);



select * from Orders;

--17. Reviews Table--      

CREATE TABLE Reviews (
    OrderID INT NOT NULL,
    ReviewID INT NOT NULL IDENTITY,
    KitchenID INT NOT NULL,
    Rating FLOAT NOT NULL,
    ReviewText TEXT NOT NULL,
    FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Reviews (OrderID, KitchenID, Rating, ReviewText) VALUES
(1, 1, 4, 'The food was delicious!'),
(2, 1, 3, 'The service was good, but the food was just okay.'),
(3, 2, 5, 'Absolutely loved the food and service!'),
(4, 2, 2, 'The food was terrible and the service was slow.'),
(5, 2, 4, 'The food was great and the atmosphere was lovely.'),
(6, 2, 5, 'We had a fantastic experience!'),
(7, 1, 3, 'The food was decent, but the service was lacking.'),
(8, 1, 5, 'One of the best meals I have ever had!'),
(9, 2, 4, 'The food was really good and the service was attentive.'),
(10, 2, 2, 'I did not enjoy my meal at all.'),
(11, 1, 4, 'The food was really good and the service was attentive.'),
(12, 1, 2, 'I did not enjoy my meal at all.'),
(13, 3, 4, 'The food was delicious!'),
(14, 3, 3, 'The service was good, but the food was just okay.'),
(15, 1, 5, 'Absolutely loved the food and service!'),
(16, 1, 2, 'The food was terrible and the service was slow.'),
(17, 3, 4, 'The food was great and the atmosphere was lovely.'),
(18, 3, 5, 'We had a fantastic experience!'),
(19, 1, 3, 'The food was decent, but the service was lacking.'),
(20, 1, 5, 'One of the best meals I have ever had!'),
(21, 2, 4, 'The food was really good and the service was attentive.'),
(22, 2, 2, 'I did not enjoy my meal at all.');

SELECT * FROM Reviews;

--18. FoodItem Table--      
 
CREATE TABLE FoodItem (
  FoodItemID INT IDENTITY PRIMARY KEY,
  KitchenID INT NOT NULL,
  DietTypeID INT NOT NULL,
  DishTypeID INT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(255),
  Price DECIMAL(10, 2),
  FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID),
  FOREIGN KEY (DietTypeID) REFERENCES DietType(DietTypeID),
  FOREIGN KEY (DishTypeID) REFERENCES DishType(DishTypeID)
);



INSERT INTO FoodItem (KitchenID, DietTypeID, DishTypeID, Name, Description, Price)
VALUES
  (1, 10, 1, 'Chicken Curry', 'Spicy chicken curry with rice', 12.99),
  (2, 2, 2, 'Vegan Burger', 'Plant-based burger with sweet potato fries', 9.99),
  (3, 5, 3, 'Seafood Paella', 'Spanish rice dish with prawns and mussels', 16.50),
  (1, 7, 4, 'Beef Stroganoff', 'Creamy beef stroganoff with tagliatelle', 14.75),
  (2, 9, 3, 'Lamb Tagine', 'Moroccan-style lamb stew with couscous', 15.25),
  (3, 8, 5, 'Falafel Wrap', 'Middle Eastern wrap with falafel and hummus', 7.99),
  (1, 6, 6, 'Pork Schnitzel', 'Breaded pork schnitzel with potato salad', 13.50),
  (2, 4, 6, 'Mushroom Risotto', 'Creamy mushroom risotto with parmesan', 10.50),
  (3, 3, 5, 'Vegetable Curry', 'Mild vegetable curry with naan bread', 8.75),
  (1, 1, 1, 'Chicken Kiev', 'Breaded chicken kiev with mashed potatoes', 12.25);
 
 
 select * from FoodItem;

--19. OrderItems Table--      

CREATE TABLE OrderItems (
  OrderItemID INT IDENTITY NOT NULL,
  OrderID INT NOT NULL,
  FoodItemID INT NOT NULL,
  Quantity INT,
  ItemPrice DECIMAL(10,2),
  PRIMARY KEY (OrderItemID),
  FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO OrderItems (OrderID, FoodItemID, Quantity, ItemPrice)
VALUES
  (1, 1, 2, 10.99),
  (2, 2, 1, 5.99),
  (3, 3, 4, 8.99),
  (4, 4, 2, 10.99),
  (5, 5, 1, 5.99),
  (6, 6, 4, 8.99),
  (7, 7, 2, 10.99),
  (8, 8, 1, 5.99),
  (9, 9, 4, 8.99),
  (10, 10, 2, 10.99),
  (11, 1, 1, 5.99),
  (12, 2, 4, 8.99),
  (13, 3, 2, 10.99),
  (14, 4, 1, 5.99),
  (15, 5, 4, 8.99),
  (16, 6, 2, 10.99),
  (17, 7, 1, 5.99),
  (18, 8, 4, 8.99),
  (19, 9, 2, 10.99),
  (20, 10, 1, 5.99),
  (21, 1, 4, 8.99),
  (22, 2, 2, 10.99);
   
  
-- 20. Deliver Drivers table-- 
 
DROP TABLE IF EXISTS DeliveryDrivers;
 
 CREATE TABLE DeliveryDrivers (
  DeliveryDriverID INT IDENTITY PRIMARY KEY,
  AddressID INT NOT NULL,
  PersonID INT NOT NULL,
  DeliveryZoneID INT NOT NULL,  -- ADDED BY UNNATI to assigned a particular zoneID for the deliveryDriver
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
  FOREIGN KEY (DeliveryZoneID) REFERENCES DeliveryZone(DeliveryZoneID)
);

INSERT INTO DeliveryDrivers (AddressID, PersonID, DeliveryZoneID) VALUES 
  (9, 9, 1),
  (10, 10, 2),
  (11, 11, 3),
  (12, 12, 4),
  (13, 13, 1),
  (14, 14, 1);
  
 
select * from DeliveryDrivers; 


-- 21. Deliveries table-- 
 

CREATE TABLE Deliveries (
  DeliveryID INT NOT NULL,
  OrderID INT NOT NULL,
  DeliveryDriverID INT NOT NULL,
  PickUpAddressID INT NOT NULL,
  DeliveryAddressID INT NOT NULL,
  DeliveryStatus VARCHAR(50),
  PRIMARY KEY (DeliveryID, OrderID),
  FOREIGN KEY (DeliveryDriverID) REFERENCES DeliveryDrivers(DeliveryDriverID),
  FOREIGN KEY (PickUpAddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (DeliveryAddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
); 



INSERT INTO Deliveries (DeliveryID, OrderID, DeliveryDriverID, PickUpAddressID, DeliveryAddressID, DeliveryStatus)
VALUES 
(1, 1, 3, 1, 1, 'Out for delivery'),
(2, 2, 2, 1, 17, 'In transit'),
(3, 3, 3, 1, 16, 'Out for delivery'),
(4, 4, 2, 1, 17, 'In transit'),
(5, 5, 3, 1, 16, 'Out for delivery'),
(6, 6, 2, 1, 17, 'In transit'),
(7, 7, 3, 1, 16, 'Out for delivery'),
(8, 8, 2, 1, 17, 'In transit'),
(9, 9, 3, 1, 16, 'Out for delivery'),
(10, 10, 2, 1, 17, 'In transit'),
(11, 11, 3, 1, 16, 'Out for delivery'),
(12, 12, 2, 1, 17, 'In transit'),
(13, 13, 3, 1, 16, 'Out for delivery'),
(14, 14, 2, 1, 17, 'In transit'),
(15, 15, 3, 1, 16, 'Out for delivery'),
(16, 16, 2, 1, 17, 'In transit'),
(17, 17, 3, 1, 16, 'Out for delivery'),
(18, 18, 2, 1, 17, 'In transit'),
(19, 19, 3, 1, 16, 'Out for delivery'),
(20, 20, 2, 1, 17, 'In transit'),
(19, 21, 3, 1, 16, 'Out for delivery'),
(20, 22, 2, 1, 17, 'In transit');




select * from Deliveries;













-----Computed Columns--------
CREATE FUNCTION CurrentRatingAverage(@KitchenID INT)
RETURNS FLOAT 
AS
BEGIN
DECLARE @rating float;
SET @rating =
(SELECT AVG(rw.Rating)
FROM dbo.Reviews rw
WHERE KitchenID = @KitchenID
GROUP BY KitchenID );

SET @rating = ISNULL(@rating, 5);
RETURN @rating;
END
;

-- Add a computed column to the Sales.Customer
ALTER TABLE dbo.Kitchen
ADD Rating AS (dbo.CurrentRatingAverage(KitchenID));




CREATE FUNCTION MostOrderedFoodItemName(@KitchenID INT)
RETURNS VARCHAR(255)
AS
BEGIN
DECLARE @mostOrderedFoodItemName varchar(255);
with temp as (select * from dbo.Orders o where o.KitchenID = @KitchenID ), 
temp2 as (
select FoodItemID, SUM (Quantity) TotalQuantityOrderedForThatFoodItemID, RANK() OVER (ORDER BY SUM (Quantity) DESC)  
as FoodItemRank from dbo.OrderItems oi
inner join temp t 
on t.OrderID = oi.OrderID
group by oi.FoodItemID)


SELECT TOP 1
        @mostOrderedFoodItemName = ft.Name
    FROM temp2
    INNER JOIN dbo.FoodItem ft ON temp2.FoodItemID = ft.FoodItemID
    WHERE FoodItemRank = 1;

SET @mostOrderedFoodItemName = ISNULL(@mostOrderedFoodItemName, 'Yet to be determined');
RETURN @mostOrderedFoodItemName;
END
;
-- Add a computed column to the Sales.Customer
ALTER TABLE dbo.Kitchen
ADD MostOrderedFoodItemName AS (dbo.MostOrderedFoodItemName(KitchenID));

SELECT * FROM dbo.Kitchen;



