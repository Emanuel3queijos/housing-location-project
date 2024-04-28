package com.br.emanuelap.housinglocationprojectbackend.repositories;

import com.br.emanuelap.housinglocationprojectbackend.entities.Ad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository

public interface AdRepository  extends JpaRepository<Ad, Long>  {
        Optional<Ad> findByTitle(String Title);


}
