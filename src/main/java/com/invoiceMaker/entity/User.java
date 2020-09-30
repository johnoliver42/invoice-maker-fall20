package com.invoiceMaker.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.ejb.Local;
import javax.persistence.*;


/** This class represents a user.
 *
 * @author John Oliver
 */
public class User {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO, generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    private int id;
    @Column(name = "")
    private String fistName;
    @Column(name = "")
    private String lastName;
    @Column(name = "")
    private String email;
    @Column(name = "")
    private String businessName;
    @Column(name = "")
    private String stree1;
    @Column(name = "")
    private String street2;
    @Column(name = "")
    private String city;
    @Column(name = "")
    private String state;
    @Column(name = "")
    private String postalCode;

    public User(){}


    public int getId() {
        return id;
    }

    public void setId(int userId) {
        this.id = userId;
    }

    public String getFistName() {
        return fistName;
    }

    public void setFistName(String fistName) {
        this.fistName = fistName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getStree1() {
        return stree1;
    }

    public void setStree1(String stree1) {
        this.stree1 = stree1;
    }

    public String getStreet2() {
        return street2;
    }

    public void setStreet2(String street2) {
        this.street2 = street2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
}
