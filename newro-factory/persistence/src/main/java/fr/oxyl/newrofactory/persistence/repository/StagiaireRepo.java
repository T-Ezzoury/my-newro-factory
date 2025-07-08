package fr.oxyl.newrofactory.persistence.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Stagiaire;
import fr.oxyl.newrofactory.persistence.internal.dao.StagiaireInternalDao;
import fr.oxyl.newrofactory.persistence.internal.mapper.StagiaireMapper;

@Service
public class StagiaireRepo {

    private final StagiaireInternalDao stagiaireInternalDao;
    private final StagiaireMapper stagiaireMapper;

    public StagiaireRepo(StagiaireInternalDao stagiaireInternalDao,
                         StagiaireMapper stagiaireMapper){
        this.stagiaireInternalDao = stagiaireInternalDao;
        this.stagiaireMapper = stagiaireMapper;
    }

    public Page<Stagiaire> findAll(String search, int currentPage, int pageSize){
        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.unsorted());
        return stagiaireInternalDao.findAll(search, pageable).map(stagiaireMapper::map);
    }

    public Optional<Stagiaire> findById(long id){
        return stagiaireMapper.map(stagiaireInternalDao.findById(id));
    }

    public void create(Stagiaire stagiaire){
        stagiaireInternalDao.save(stagiaireMapper.map(stagiaire));
    }

    public void update(Stagiaire stagiaire){
        stagiaireInternalDao.save(stagiaireMapper.map(stagiaire));
    }

    public void deleteById(long id){
        stagiaireInternalDao.deleteById(id);
    }
    
    public long getCount() {
        return stagiaireInternalDao.count();
    }

}
