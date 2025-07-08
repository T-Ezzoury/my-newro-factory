package fr.oxyl.newrofactory.persistence.repository;

import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.persistence.internal.dao.ResponseInternalDao;
import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;
import fr.oxyl.newrofactory.persistence.internal.mapper.ReponseMapper;

import java.util.Optional;

@Service
public class ResponseRepo {

    private final ResponseInternalDao responseInternalDao;
    private final ReponseMapper reponseMapper;

    public ResponseRepo(ResponseInternalDao responseInternalDao,
                        ReponseMapper reponseMapper) {
        this.responseInternalDao = responseInternalDao;
        this.reponseMapper = reponseMapper;
    }

    public long count() {
        return responseInternalDao.count();
    }

    public Iterable<ResponseEntity> findAll() {
        return responseInternalDao.findAll();
    }

    public Optional<ResponseEntity> findById(long id) {
        return responseInternalDao.findById(id);
    }

    public ResponseEntity save(ResponseEntity responseEntity) {
        return responseInternalDao.save(responseEntity);
    }

    public void deleteById(long id) {
        responseInternalDao.deleteById(id);
    }
}