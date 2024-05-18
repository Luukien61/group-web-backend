package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@Table(name = "Product")
public class ProductEntity {
    @Id
    String id;
    String name;
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.MERGE})
    @JoinColumn(name = "category_name", referencedColumnName = "name")
    @JsonManagedReference
    CategoryEntity category;
    @ElementCollection(targetClass = String.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "product_images", joinColumns = @JoinColumn(name = "product_id"))
    @Column(name = "image_url")
    List<String> imgs;
    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    List<PriceEntity> price;
    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    List<ColorEntity> color;
    @OneToOne(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    FeatureEntity features;
    @OneToOne(mappedBy = "product", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    DescriptionEntity description;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "producer_name", referencedColumnName = "name")
    @JsonManagedReference
    ProducerEntity producer;
}
