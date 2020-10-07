-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-10-07 05:53:26.731

-- foreign keys
ALTER TABLE Invoice_Line_Item
    DROP FOREIGN KEY Invoice_Line_Item_Invoice;

ALTER TABLE Invoice
    DROP FOREIGN KEY Order_Invoice;

ALTER TABLE `Order`
    DROP FOREIGN KEY Order_users;

ALTER TABLE Shipment
    DROP FOREIGN KEY Shipment_Order;

ALTER TABLE Shipment_Tracking
    DROP FOREIGN KEY Shipment_Shipment_Tracking;

ALTER TABLE Shipping_Account
    DROP FOREIGN KEY User_Shipping_Account_Shipping_Account;

ALTER TABLE User_Shipping_Account
    DROP FOREIGN KEY User_Shipping_Account_Users;

ALTER TABLE User_Password
    DROP FOREIGN KEY user_password_Users;

-- tables
DROP TABLE Invoice;

DROP TABLE Invoice_Line_Item;

DROP TABLE `Order`;

DROP TABLE Shipment;

DROP TABLE Shipment_Tracking;

DROP TABLE Shipping_Account;

DROP TABLE User_Password;

DROP TABLE User_Shipping_Account;

DROP TABLE Users;

-- End of file.

