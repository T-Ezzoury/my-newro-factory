package fr.oxyl.newrofactory.persistence.internal.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;

@Repository
public interface ResponseInternalDao extends CrudRepository<ResponseEntity, Long> {
    
}
