package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "Description")
public class DescriptionEntity extends BaseEntity {

    @Column(columnDefinition = "TEXT")
    String title;

    @OneToMany(mappedBy = "description", cascade = CascadeType.ALL, orphanRemoval = true)
    @JsonManagedReference
    List<ContentChildEntity> contentChild;


    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @JsonBackReference
    ProductEntity product;
}
