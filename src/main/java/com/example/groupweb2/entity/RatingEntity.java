package com.example.groupweb2.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "rating")
public class RatingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Float average;
    private Integer fiveStarts;
    private Integer fourStarts;
    private Integer threeStarts;
    private Integer twoStarts;
    private Integer oneStart;

    @OneToOne
    @JsonBackReference
    private ProductEntity product;

    @PrePersist
    public void persistRating(){
        if(this.fiveStarts==null){
            this.fiveStarts=0;
        }
        if(this.fourStarts==null){
            this.fourStarts=0;
        }
        if(this.threeStarts==null){
            this.threeStarts=0;
        }
        if(this.twoStarts==null){
            this.twoStarts=0;
        }
        if(this.oneStart==null){
            this.oneStart=0;
        }
        if(this.average==null){
            this.average=0f;
        }
    }
    @PreUpdate
    public void updateRating(){
        int totalVotes = fiveStarts + fourStarts + threeStarts + twoStarts + oneStart;
        if (totalVotes == 0) {
            this.average = 0f;
        } else {
            float totalPoints = (5 * fiveStarts) + (4 * fourStarts) + (3 * threeStarts) + (2 * twoStarts) + (oneStart);
            this.average = totalPoints / totalVotes;
            this.average= Math.round(average * 10) / 10.0f;
        }
    }

    public void insertNewRating(int value){
        switch (value){
            case 1:{
                oneStart+=1;
                break;
            }
            case 2: {
                twoStarts+=1;
                break;
            }
            case 3: {
                threeStarts+=1;
                break;
            }
            case 4:{
                fourStarts+=1;
                break;
            }
            case 5:{
                fiveStarts+=1;
                break;
            }
        }
    }
}
