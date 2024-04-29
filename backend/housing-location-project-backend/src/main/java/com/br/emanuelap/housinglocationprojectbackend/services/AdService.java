package com.br.emanuelap.housinglocationprojectbackend.services;

import com.br.emanuelap.housinglocationprojectbackend.entities.Ad;
import com.br.emanuelap.housinglocationprojectbackend.exceptions.AppException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import com.br.emanuelap.housinglocationprojectbackend.repositories.AdRepository;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class AdService implements CrudInterface<Ad> {

    private final AdRepository adRepository;


    @Override
    public Ad save(Ad ad) {
        Optional<Ad> optionalAd = adRepository.findByTitle(ad.getTitle());
        if (optionalAd.isPresent()) {
            throw new AppException("Add with same tittle already exist", HttpStatus.CONFLICT);
        }

        return adRepository.save(ad);
}

    @Override
    public List<Ad> findAll() {
        return List.of();
    }

    @Override
    public Optional<Ad> findById(Long id) {
        return Optional.empty();
    }

    @Override
    public Ad update(Object obj) {
        return null;
    }

    @Override
    public void deleteById(Long id) {

    }
}
