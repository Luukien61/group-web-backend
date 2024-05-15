package com.example.groupweb2.entity;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@Table(name = "Feature")
public class FeatureEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String screen;
    @ElementCollection(targetClass = Integer.class, fetch = FetchType.EAGER)
    List<Integer> rearCamera;

    @ElementCollection(targetClass = Integer.class, fetch = FetchType.EAGER)
    List<Integer> frontCamera;

    String OS;
    int battery;
    String chip;
   // Date madeTime;
    @OneToMany(mappedBy = "feature", fetch = FetchType.EAGER)
    List<MemoryEntity> memory;

    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    ProductEntity product;

}
