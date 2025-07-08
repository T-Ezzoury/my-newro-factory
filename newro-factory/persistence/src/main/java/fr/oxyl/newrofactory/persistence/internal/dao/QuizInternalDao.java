package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;

@Repository
public interface QuizInternalDao extends CrudRepository<QuizEntity, Long> {

    Optional<QuizEntity> findById(long id);
    
    List<QuizEntity> findByUserId(Long userId);
    
    List<QuizEntity> findByNameContainingIgnoreCase(String name);
}