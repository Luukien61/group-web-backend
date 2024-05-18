package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Producer")
public class ProducerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;
    String name;

    @OneToMany(mappedBy = "producer", cascade = CascadeType.MERGE)
    @JsonBackReference
    List<ProductEntity> products;

    @ManyToMany
    @JoinTable(
            name = "producer_category",
            joinColumns = @JoinColumn(name = "producer", referencedColumnName = "name"),
            inverseJoinColumns = @JoinColumn(name = "category", referencedColumnName = "name")
    )
    Set<CategoryEntity> categories;
}
