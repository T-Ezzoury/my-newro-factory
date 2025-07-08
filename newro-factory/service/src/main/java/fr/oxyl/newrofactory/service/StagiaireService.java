package fr.oxyl.newrofactory.service;


import java.util.Optional;

import org.springframework.data.domain.Page;

import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Stagiaire;
import fr.oxyl.newrofactory.persistence.repository.StagiaireRepo;


@Service
public final class StagiaireService {

    private final StagiaireRepo stagiaireDao;

    public StagiaireService(StagiaireRepo stagiaireDao) {
        this.stagiaireDao = stagiaireDao;
    }

    public Page<Stagiaire> findAll(String search, int currentPage, int pageSize){
      return stagiaireDao.findAll(search, currentPage, pageSize);
    }

    public Optional<Stagiaire> findById(long id){
        return stagiaireDao.findById(id);
    }

    public void create(Stagiaire stagiaire){
        stagiaireDao.create(stagiaire);
    }

    public void update(Stagiaire stagiaire) {
        stagiaireDao.create(stagiaire);
    }

    public void delete(long id) {
        stagiaireDao.deleteById(id);
    }

    public long countAll()
    {
        return stagiaireDao.getCount();
    }

    
}
