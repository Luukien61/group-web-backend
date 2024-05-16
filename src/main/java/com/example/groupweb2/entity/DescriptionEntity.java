package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Getter
@Setter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@Table(name = "Description")
public class DescriptionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    @Column(columnDefinition = "TEXT")
    String title;
    @Column(columnDefinition = "TEXT")
    String content;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonBackReference
    ProductEntity product;
}
