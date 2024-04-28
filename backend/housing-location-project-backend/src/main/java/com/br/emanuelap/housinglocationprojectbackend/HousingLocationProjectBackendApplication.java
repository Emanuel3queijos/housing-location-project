package com.br.emanuelap.housinglocationprojectbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@EnableSwagger2

@SpringBootApplication
public class HousingLocationProjectBackendApplication {

    public static void main(String[] args) {
        SpringApplication.run(HousingLocationProjectBackendApplication.class, args);
    }

}
