package com.br.emanuelap.housinglocationprojectbackend.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity

@Table(name = "Ad")
public class Ad {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
    @Column(name = "avaliable_units")
    private Integer avaliableUnits;
    private String description;
    private String location;
    @Column(name = "caminho_imagem")
    private String caminhoImagem;
    @Column(name = "have_wifi")
    private Boolean haveWifi;
    @Column(name = "have_laundry")
    private Boolean haveLaundry;
    @Column(name = "poster_cpf")
    private String posterCpf;


}
