-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-09-30 06:19:41.335

-- tables
-- Table: Shipping_Account
CREATE TABLE Shipping_Account (
    id int NOT NULL,
    carrier_name varchar(50) NULL,
    easyApiKeyProdection varchar(100) NULL,
    easyPostApiKeyTest varchar(100) NULL,
    CONSTRAINT Shipping_Account_pk PRIMARY KEY (id)
);

-- Table: User_Shipping_Account
CREATE TABLE User_Shipping_Account (
    Users_id int NOT NULL,
    Shipping_Account_id int NOT NULL,
    CONSTRAINT User_Shipping_Account_pk PRIMARY KEY (Users_id)
);

-- Table: user_password
CREATE TABLE user_password (
    Users_id int NOT NULL,
    password varchar(100) NULL,
    CONSTRAINT user_password_pk PRIMARY KEY (Users_id)
);

-- Table: users
CREATE TABLE users (
    id int NOT NULL,
    firstName varchar(50) NULL,
    lastName varchar(50) NULL,
    email varchar(100) NULL,
    street1 varchar(100) NOT NULL,
    street2 varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    state varchar(50) NOT NULL,
    postalCode varchar(50) NOT NULL,
    businessName varchar(100) NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: User_Shipping_Account_Shipping_Account (table: User_Shipping_Account)
ALTER TABLE User_Shipping_Account ADD CONSTRAINT User_Shipping_Account_Shipping_Account FOREIGN KEY User_Shipping_Account_Shipping_Account (Shipping_Account_id)
    REFERENCES Shipping_Account (id);

-- Reference: User_Shipping_Account_Users (table: User_Shipping_Account)
ALTER TABLE User_Shipping_Account ADD CONSTRAINT User_Shipping_Account_Users FOREIGN KEY User_Shipping_Account_Users (Users_id)
    REFERENCES users (id);

-- Reference: user_password_Users (table: user_password)
ALTER TABLE user_password ADD CONSTRAINT user_password_Users FOREIGN KEY user_password_Users (Users_id)
    REFERENCES users (id);

-- End of file.

