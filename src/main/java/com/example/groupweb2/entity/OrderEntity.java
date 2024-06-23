package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class OrderEntity {
    @Id
    private String orderId;
    private String email;
    private Date time;
    private String phone;
    private Boolean done;

    @ManyToOne
    @JoinColumn(name = "product_id",
            referencedColumnName ="id")
    @JsonBackReference
    private ProductEntity product;
}
