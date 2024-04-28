package com.br.emanuelap.housinglocationprojectbackend.controllers;


import com.br.emanuelap.housinglocationprojectbackend.entities.Ad;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.br.emanuelap.housinglocationprojectbackend.services.AdService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/ad")
public class AdController {

    private final AdService adService;


    @GetMapping("/sayHi")
    public ResponseEntity<String> sayHi() {
        return ResponseEntity.ok("Hi");
    }
    @PostMapping("/register")
    public ResponseEntity<Ad> register(@RequestBody @Valid Ad ad) {

        System.out.println(ad.getId());
        Ad added =  adService.save(ad);
        return ResponseEntity.ok(added);

    }


}
