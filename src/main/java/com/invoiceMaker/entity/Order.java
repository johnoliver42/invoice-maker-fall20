package com.invoiceMaker.entity;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/** Represents an Order that can have one or both
 * a shipment and/or an invoice.
 *
 * @author John Oliver
 */
@Entity(name = "Order")
@Table(name = "Order")
public class Order {

    @Id
    @Column(name = "orderId")
    @GeneratedValue(strategy= GenerationType.AUTO, generator="native")
    @GenericGenerator(name = "native",strategy = "native")
    private int id;

    private int invoiceId;

    private int shipmentId;

    private int usersId;



}
