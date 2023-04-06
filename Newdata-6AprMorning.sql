




 
 drop table AddressType;
 
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
    ('Zone'),
    ('Customer'),
    ('Collection points');
   
   
   select * from AddressType;
  
  --2.PersonType Table--
 
  
 drop table PersonType;
  
  CREATE TABLE dbo.PersonType (
  PersonTypeID INT IDENTITY PRIMARY KEY,
  PersonTypeName VARCHAR(50) NOT NULL
);

INSERT INTO PersonType (PersonTypeName) VALUES
('Customers'),
('DeliveryDrivers');

  
select * from PersonType;



--3. Contact Table--

drop table Contact;

CREATE TABLE Contact (
  ContactID INT IDENTITY PRIMARY KEY,
  Email VARCHAR(255) NOT NULL ,
  PrimaryContact VARCHAR(255) NOT NULL,
  SecondaryContact VARCHAR(255),
);

INSERT INTO Contact (Email, PrimaryContact, SecondaryContact)
VALUES
  ('john@example.com', '555-1234-455', '555-5678-455'),
  ('jane@example.com', '555-4321-789', '555-8765-897'),
  ('bill@example.com', '555-1111-098', '555-2222-876'),
  ('susan@example.com', '555-3333-785', '555-4444-837'),
  ('peter@example.com', '555-5555-738', '555-6666-938'),
  ('amy@example.com', '555-7777-782', '555-8888-368'),
  ('david@example.com', '555-9999-378', '555-0000-287'),
  ('jenny@example.com', '555-7777-467', '555-6666-826'),
  ('robert@example.com', '555-5555-926', '555-6666-378'),
  ('mike@example.com', '555-4321-238', '555-8765-239');
 
INSERT INTO Contact (Email, PrimaryContact, SecondaryContact)
VALUES
  ('kitchen1@example.com', '555-1234-455', '555-5678-455'),
  ('kitchen2@example.com', '555-4321-789', '555-8765-897');

 
 --4. EquipmentType Table--
 
 drop table EquipmentType;
 
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

drop table Cuisine;

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


drop table DishType;

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

drop table DietType;

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

drop table DeliveryZone;

CREATE TABLE DeliveryZone (
  DeliveryZoneID INT IDENTITY PRIMARY KEY,
  City VARCHAR(50) NOT NULL,
  Zipcode VARCHAR(10) NOT NULL,
  State VARCHAR(2) NOT NULL
);

INSERT INTO DeliveryZone (City, Zipcode, State) VALUES
('New York', '10001', 'NY'),
('Los Angeles', '90001', 'CA'),
('Chicago', '60601', 'IL'),
('Houston', '77001', 'TX'),
('Philadelphia', '19101', 'PA'),
('Phoenix', '85001', 'AZ'),
('San Antonio', '78201', 'TX'),
('San Diego', '92101', 'CA'),
('Dallas', '75201', 'TX'),
('Boston', '02120', 'MA'),
('Boston', '02115', 'MA'),
('Cambridge', '02114', 'CA'),
('Cambridge', '02134', 'CA'),
('Cambridge', '02138', 'CA');


select * from DeliveryZone;


--9. Address Table--

drop table Address;

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

INSERT INTO Address (AddressTypeID, DeliveryZoneID, AddressLine1, AddressLine2, City, StateProvince, PostalCode)
VALUES 
  (1, 1, '123 Main St', '', 'New York', 'NY', '10001'),
  (2, 2, '456 High St', '', 'Los Angeles', 'CA', '90001'),
  (4, 1, '123 Main St', '', 'New York', 'NY', '10001'),
  (4, 2, '456 High St', '', 'Los Angeles', 'CA', '90001'),
  (4, 1, '123 Main St', '', 'New York', 'NY', '10001'),
  (4, 2, '456 High St', '', 'Los Angeles', 'CA', '90001'),
  (4, 1, '123 Main St', '', 'New York', 'NY', '10001'),
  (4, 2, '456 High St', '', 'Los Angeles', 'CA', '90001'),
  (3, 3, '789 Broad St', 'Apt 4', 'Chicago', 'IL', '60601'),
  (4, 4, '555 Park Ave', '', 'Houston', 'TX', '77001'),
  (1, 5, '777 Main St', 'Suite 100', 'Philadelphia', 'PA', '19101'),
  (2, 6, '234 Elm St', '', 'Phoenix', 'AZ', '85001'),
  (3, 7, '888 High St', '', 'San Antonio', 'TX', '78201'),
  (4, 8, '456 Main St', '', 'San Diego', 'CA', '92101'),
  (3, 9, '333 Maple Ave', '', 'Dallas', 'TX', '75201')
  
  
INSERT INTO Address (AddressTypeID, DeliveryZoneID, AddressLine1, AddressLine2, City, StateProvince, PostalCode)
VALUES 
  (4, 11, '123 Main St', '', 'Boston', 'MA', '10001'),
  (4, 10, '456 High St', '', 'Boston', 'MA', '90001');

select * from DeliveryZone dz ;

select * from Address;



--10. Person Table--

drop table Person;

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
    ('John', 'Doe', 2, 1),
    ('Jane', 'Doe', 2, 2),
    ('bill', 'Smith', 1, 3),
    ('Susan', 'Johnson', 1, 4),
    ('Peter', 'Williams', 1, 5),
    ('Amy', 'Jones', 1, 6),
    ('David', 'Brown', 1, 7),
    ('Jenny', 'Lee', 1, 8),
    ('Robert', 'Davis', 1, 9),
    ('Mike', 'Wilson', 2, 10);
  

select * from Person;


--11. Customer Table--

CREATE TABLE Customer (
  CustomerID INT IDENTITY PRIMARY KEY,
  PersonID INT NOT NULL,
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

INSERT INTO Customer (PersonID)
VALUES
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9);
  


select * from Customer

--12. CustomerAddress Table--
drop table CustomerAddress ;
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
VALUES (1, 3),
       (1, 4),
       (1, 5),
       (2, 6),
       (2, 7),
       (3, 8),
       (3, 10),
       (3, 14);

select * from CustomerAddress;     
      
      --13. Kitchen Table--

select * from AddressType at2 ;
select * from Address;


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

select * from Kitchen;
select * from Customer;
select * from Person p ;
select * from Contact c ;

INSERT INTO Kitchen (AddressID, ContactID, CuisineID, KitchenName)
VALUES 
  (1, 11, 1, 'Kitchen 1'),
  (11, 12, 2, 'Kitchen 2');

 select * from Kitchen;
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
VALUES (1, 'Refrigerator', 1500.00, 'Samsung'),
       (1, 'Oven', 800.00, 'LG'),
       (2, 'Mixer', 200.00, 'KitchenAid'),
       (2, 'Blender', 75.00, 'Cuisinart'),
       (3, 'Coffee Maker', 100.00, 'Keurig'),
       (3, 'Espresso Machine', 400.00, 'DeLonghi'),
       (4, 'Dishwasher', 900.00, 'Bosch'),
       (4, 'Microwave', 150.00, 'Panasonic'),
       (1, 'Knife Set', 75.00, 'Chicago Cutlery'),
       (1, 'Cookware Set', 200.00, 'Calphalon');
      
select * from Equipment;
      
 --15. KitchenEquipmentAssociation Table--     

 CREATE TABLE KitchenEquipmentAssociation (
    KitchenID INT NOT NULL,
    EquipmentID INT NOT NULL,
    Quantity INT,
    PRIMARY KEY (KitchenID, EquipmentID),
    FOREIGN KEY (KitchenID) REFERENCES Kitchen,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment
);


select * from Kitchen;

INSERT INTO KitchenEquipmentAssociation (KitchenID, EquipmentID, Quantity)
VALUES
    (1, 10, 31),
    (1, 2, 22),
    (1, 3, 46),
    (1, 1, 14),
    (1, 6, 51),
    (2, 4, 25),
    (2, 8, 24),
    (2, 9, 33),
    (2, 7, 10),
    (2, 5, 12);
   
   
select * from KitchenEquipmentAssociation;
   
 --16. Orders Table--   
 
drop table Orders;

 CREATE TABLE Orders (
  OrderID INT IDENTITY PRIMARY KEY,
  CustomerID INT NOT NULL,
  KitchenID INT NOT NULL,
  OrderPrice DECIMAL(10,2),
  OrderDate DATETIME default GETDATE()
  CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_KitchenID FOREIGN KEY (KitchenID) REFERENCES Kitchen(KitchenID)
);

select * from Customer c ;
select * from Orders;

--Insert 10 sample entries
INSERT INTO Orders (CustomerID, KitchenID, OrderPrice) VALUES
(1, 1, 25.00),
(1, 2, 35.50),
(2, 1, 15.75),
(2, 2, 42.00),
(2, 1, 28.25),
(2, 2, 18.50),
(3, 1, 20.00),
(2, 2, 30.75),
(4, 2, 19.00),
(4, 2, 27.50);

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
(10, 2, 3, 'The service was good, but the food was just okay.'),
(2, 1, 5, 'Absolutely loved the food and service!'),
(3, 2, 2, 'The food was terrible and the service was slow.'),
(5, 1, 4, 'The food was great and the atmosphere was lovely.'),
(7, 2, 5, 'We had a fantastic experience!'),
(8, 1, 3, 'The food was decent, but the service was lacking.'),
(4, 2, 5, 'One of the best meals I have ever had!'),
(9, 2, 4, 'The food was really good and the service was attentive.'),
(6, 2, 2, 'I did not enjoy my meal at all.');

select * from Reviews;


drop table Reviews;
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
  (1, 5, 3, 'Seafood Paella', 'Spanish rice dish with prawns and mussels', 16.50),
  (1, 7, 4, 'Beef Stroganoff', 'Creamy beef stroganoff with tagliatelle', 14.75),
  (1, 9, 3, 'Lamb Tagine', 'Moroccan-style lamb stew with couscous', 15.25),
  (1, 8, 5, 'Falafel Wrap', 'Middle Eastern wrap with falafel and hummus', 7.99),
  (1, 6, 6, 'Pork Schnitzel', 'Breaded pork schnitzel with potato salad', 13.50),
  (2, 4, 6, 'Mushroom Risotto', 'Creamy mushroom risotto with parmesan', 10.50),
  (2, 3, 5, 'Vegetable Curry', 'Mild vegetable curry with naan bread', 8.75),
  (2, 1, 1, 'Chicken Kiev', 'Breaded chicken kiev with mashed potatoes', 12.25);
 
 
 select * from FoodItem;

--19. OrderItems Table--      

CREATE TABLE OrderItems (
  OrderItemID INT NOT NULL,
  OrderID INT NOT NULL,
  FoodItemID INT NOT NULL,
  Quantity INT,
  ItemPrice DECIMAL(10,2),
  PRIMARY KEY (OrderItemID, OrderID),
  FOREIGN KEY (FoodItemID) REFERENCES FoodItem(FoodItemID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

select * from orders;
select * from OrderItems;
select * from FoodItem;

INSERT INTO OrderItems (OrderItemID, OrderID, FoodItemID, Quantity, ItemPrice)
VALUES
  (1, 1, 1, 2, 10.99),
  (2, 1, 3, 1, 5.99),
  (3, 1, 5, 4, 8.99),
  (4, 2, 8, 2, 10.99),
  (5, 2, 9, 1, 5.99),
  (6, 2, 10, 4, 8.99),
  

-- 20. Deliver Drivers table-- 
 
 drop table DeliveryDrivers
 select * from Person p;
 
 CREATE TABLE DeliveryDrivers (
  DeliveryDriverID INT IDENTITY PRIMARY KEY,
  AddressID INT NOT NULL,
  PersonID INT NOT NULL,
  DeliveryZoneID INT NOT NULL,  -- ADDED BY UNNATI to assigned a particular zoneID for the deliveryDriver
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
  FOREIGN KEY (DeliveryZoneID) REFERENCES DeliveryZone(DeliveryZoneID)
);


select * from Person p ; -- 1, 2, 10
select * from Customer c ;
select * from CustomerAddress ca ;
select * from Address a ; -- customer addressID 3,4,5,6,7,8,10,14
select * from PersonType pt ;
select * from DeliveryZone dz ;
INSERT INTO DeliveryDrivers (AddressID, PersonID, DeliveryZoneID) VALUES 
  (1, 1, 11),
  (2, 2, 10),
  (9, 10, 12);
 
select * from DeliveryDrivers; 


-- 21. Deliver Drivers table-- 
 

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
 
select * from orders;
select * from Address a ;
select * from AddressType at2 ;
select * from DeliveryZone dz ;
select * from DeliveryDrivers;
-- 

INSERT INTO Deliveries (DeliveryID, OrderID, DeliveryDriverID, PickUpAddressID, DeliveryAddressID, DeliveryStatus)
VALUES 
(1, 1, 3, 1, 16, 'Out for delivery'),
(2, 2, 2, 1, 17, 'In transit');






select * from Deliveries;