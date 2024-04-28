package com.br.emanuelap.housinglocationprojectbackend.entities;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "renter")
public class Renter {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String name;
    private String email;
    private String phone;



}
