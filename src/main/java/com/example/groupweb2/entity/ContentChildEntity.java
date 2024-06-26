package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

@EqualsAndHashCode(callSuper = true)
@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "content_children")
public class ContentChildEntity extends BaseEntity{
    @Column(columnDefinition = "TEXT")
    private String title;
    @Column(columnDefinition = "TEXT")
    private String content;
    private String image;

    @ManyToOne()
    @JoinColumn(name = "description_id", referencedColumnName = "id")
    @JsonBackReference
    @EqualsAndHashCode.Exclude
    private DescriptionEntity description;
}
