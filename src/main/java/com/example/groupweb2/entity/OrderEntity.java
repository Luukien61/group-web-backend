package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
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
