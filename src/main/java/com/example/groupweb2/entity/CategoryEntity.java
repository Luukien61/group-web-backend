package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@Table(name = "Category")
public class CategoryEntity extends  BaseEntity {

    String name;
    @OneToMany(mappedBy = "category",cascade = CascadeType.MERGE)
    @JsonBackReference
    List<ProductEntity> product;

    @ManyToMany(mappedBy = "categories", cascade = {CascadeType.MERGE,CascadeType.PERSIST})
    @JsonManagedReference
    Set<ProducerEntity> producers;
}
