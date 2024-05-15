package com.example.groupweb2.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Getter
@Setter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@Table(name = "Memory")
public class MemoryEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    int ram;
    int rom;
    long currentPrice;
    long previousPrice;
    @ManyToOne
    @JoinColumn(name = "feature_id", referencedColumnName = "id")
    FeatureEntity feature;

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    ProductEntity product;
}
