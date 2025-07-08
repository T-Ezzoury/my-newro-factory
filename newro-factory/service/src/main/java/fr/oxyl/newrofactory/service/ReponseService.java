package fr.oxyl.newrofactory.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;
import fr.oxyl.newrofactory.persistence.repository.ResponseRepo;

@Service
public class ReponseService {
    
    private final ResponseRepo responseDaoService;

    public ReponseService(ResponseRepo responseDaoService) {
        this.responseDaoService = responseDaoService;
    }

    public long count() {
        return responseDaoService.count();
    }

    public Iterable<ResponseEntity> findAll() {
        return responseDaoService.findAll();
    }

    public Optional<ResponseEntity> findById(long id) {
        return responseDaoService.findById(id);
    }

    public ResponseEntity save(ResponseEntity responseEntity) {
        return responseDaoService.save(responseEntity);
    }

    public void deleteById(long id) {
        responseDaoService.deleteById(id);
    }
}