-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-10-07 05:53:26.731

-- tables
-- Table: Invoice
CREATE TABLE Invoice (
    id int NOT NULL AUTO_INCREMENT,
    invoiceId int NULL,
    shipmentId int NOT NULL,
    createDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    lastUpdated timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    businessName varchar(100) NOT NULL,
    businessPhone varchar(15) NOT NULL,
    businessStreet1 varchar(50) NOT NULL,
    businessStreet2 varchar(50) NOT NULL,
    businessCity varchar(50) NOT NULL,
    businessState varchar(50) NOT NULL,
    businessZip varchar(50) NOT NULL,
    businessEmail varchar(50) NOT NULL,
    notes varchar(300) NOT NULL,
    subTotal decimal(10,2) NOT NULL DEFAULT 0.00,
    total decimal(10,2) NOT NULL DEFAULT 0.00,
    tax decimal(7,5) NOT NULL DEFAULT 0.00,
    CONSTRAINT Invoice_pk PRIMARY KEY (id)
);

-- Table: Invoice_Line_Item
CREATE TABLE Invoice_Line_Item (
    id int NOT NULL,
    productId varchar(20) NOT NULL,
    description varchar(75) NOT NULL,
    price decimal(10,2) NOT NULL,
    quantity int NOT NULL,
    Invoice_id int NOT NULL,
    CONSTRAINT Invoice_Line_Item_pk PRIMARY KEY (id)
);

-- Table: Order
CREATE TABLE `Order` (
    orderId int NOT NULL AUTO_INCREMENT,
    Invoice_id int NOT NULL,
    Shipment_id int NOT NULL,
    users_id int NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY (orderId)
);

-- Table: Shipment
CREATE TABLE Shipment (
    id int NOT NULL AUTO_INCREMENT,
    shipmentId int NULL,
    easyPostShipmentId varchar(200) NOT NULL,
    easyPostTrackerId varchar(200) NOT NULL,
    Order_orderId int NOT NULL,
    createDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    lastUpdated timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fromName varchar(50) NOT NULL,
    fromEmail varchar(50) NOT NULL,
    fromPhone varchar(50) NOT NULL,
    fromStreet1 varchar(50) NOT NULL,
    fromStreet2 varchar(50) NOT NULL,
    fromCity varchar(50) NOT NULL,
    fromState varchar(50) NOT NULL,
    fromZip varchar(50) NOT NULL,
    toName int NOT NULL,
    toBusiness int NOT NULL,
    toStreet1 int NOT NULL,
    toStreet2 int NOT NULL,
    toCity int NOT NULL,
    toState int NOT NULL,
    toZip int NOT NULL,
    weight int NOT NULL,
    CONSTRAINT Shipment_pk PRIMARY KEY (id)
);

-- Table: Shipment_Tracking
CREATE TABLE Shipment_Tracking (
    id int NOT NULL,
    shipmentId int NOT NULL,
    easyPostTracker varchar(200) NOT NULL,
    trackingNumber varchar(75) NOT NULL,
    CONSTRAINT Shipment_Tracking_pk PRIMARY KEY (id)
);

-- Table: Shipping_Account
CREATE TABLE Shipping_Account (
    id int NOT NULL AUTO_INCREMENT,
    carrier_name varchar(50) NULL,
    easyApiKeyProdection varchar(100) NULL,
    easyPostApiKeyTest varchar(100) NULL,
    CONSTRAINT Shipping_Account_pk PRIMARY KEY (id)
);

-- Table: User_Password
CREATE TABLE User_Password (
    Users_id int NOT NULL,
    password varchar(100) NULL,
    CONSTRAINT User_Password_pk PRIMARY KEY (Users_id)
);

-- Table: User_Shipping_Account
CREATE TABLE User_Shipping_Account (
    Users_id int NOT NULL,
    Shipping_Account_id int NOT NULL,
    CONSTRAINT User_Shipping_Account_pk PRIMARY KEY (Users_id)
);

-- Table: Users
CREATE TABLE Users (
    id int NOT NULL AUTO_INCREMENT,
    firstName varchar(50) NULL,
    lastName varchar(50) NULL,
    email varchar(100) NULL,
    street1 varchar(100) NOT NULL,
    street2 varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    state varchar(50) NOT NULL,
    postalCode varchar(50) NOT NULL,
    businessName varchar(100) NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Invoice_Line_Item_Invoice (table: Invoice_Line_Item)
ALTER TABLE Invoice_Line_Item ADD CONSTRAINT Invoice_Line_Item_Invoice FOREIGN KEY Invoice_Line_Item_Invoice (Invoice_id)
    REFERENCES Invoice (id)
    ON DELETE CASCADE;

-- Reference: Order_Invoice (table: Invoice)
ALTER TABLE Invoice ADD CONSTRAINT Order_Invoice FOREIGN KEY Order_Invoice (id)
    REFERENCES `Order` (orderId)
    ON DELETE CASCADE;

-- Reference: Order_users (table: Order)
ALTER TABLE `Order` ADD CONSTRAINT Order_users FOREIGN KEY Order_users (users_id)
    REFERENCES Users (id)
    ON DELETE CASCADE;

-- Reference: Shipment_Order (table: Shipment)
ALTER TABLE Shipment ADD CONSTRAINT Shipment_Order FOREIGN KEY Shipment_Order (Order_orderId)
    REFERENCES `Order` (orderId)
    ON DELETE CASCADE;

-- Reference: Shipment_Shipment_Tracking (table: Shipment_Tracking)
ALTER TABLE Shipment_Tracking ADD CONSTRAINT Shipment_Shipment_Tracking FOREIGN KEY Shipment_Shipment_Tracking (id)
    REFERENCES Shipment (id)
    ON DELETE CASCADE;

-- Reference: User_Shipping_Account_Shipping_Account (table: Shipping_Account)
ALTER TABLE Shipping_Account ADD CONSTRAINT User_Shipping_Account_Shipping_Account FOREIGN KEY User_Shipping_Account_Shipping_Account (id)
    REFERENCES User_Shipping_Account (Users_id)
    ON DELETE CASCADE;

-- Reference: User_Shipping_Account_Users (table: User_Shipping_Account)
ALTER TABLE User_Shipping_Account ADD CONSTRAINT User_Shipping_Account_Users FOREIGN KEY User_Shipping_Account_Users (Users_id)
    REFERENCES Users (id);

-- Reference: user_password_Users (table: User_Password)
ALTER TABLE User_Password ADD CONSTRAINT user_password_Users FOREIGN KEY user_password_Users (Users_id)
    REFERENCES Users (id)
    ON DELETE CASCADE;

-- End of file.

