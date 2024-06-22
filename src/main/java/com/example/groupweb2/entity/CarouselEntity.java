package com.example.groupweb2.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "carousel")
public class CarouselEntity extends  BaseEntity{
    private String imageUrl;
    private String targetUrl;
    private String title;
}
