package com.br.emanuelap.housinglocationprojectbackend.services;

import com.br.emanuelap.housinglocationprojectbackend.entities.Ad;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.br.emanuelap.housinglocationprojectbackend.repositories.AdRepository;

@RequiredArgsConstructor
@Service
public class AdService {

    @Autowired
    private  AdRepository adRepository;
//    public List<Ad> findAll() {}



    public Ad save(Ad ad) {
//
//        Optional<Ad> optionalAd = adRepository.findByTitle(ad.getTitle());
//        if (optionalAd.isPresent()) {
//            throw new AppException("Add with same tittle already exist", HttpStatus.CONFLICT);
//        }
//


        return adRepository.save(ad);

    }
}
