package entities;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "Ad")
public class Ad {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;
    private String description;
    private String location;
    private Byte[] images;
    private Boolean haveWifi;
    private Boolean haveLaundry;


}
