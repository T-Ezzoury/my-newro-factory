package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizQuestionEntity;

@Repository
public interface QuizQuestionInternalDao extends CrudRepository<QuizQuestionEntity, Long> {

    Optional<QuizQuestionEntity> findById(long id);
    
    List<QuizQuestionEntity> findByQuizEntity(QuizEntity quizEntity);
    
    List<QuizQuestionEntity> findByQuizEntityId(Long quizId);
    
    List<QuizQuestionEntity> findByQuestionEntity(QuestionEntity questionEntity);
    
    List<QuizQuestionEntity> findByQuestionEntityId(Long questionId);
    
    List<QuizQuestionEntity> findByQuizEntityOrderByPosition(QuizEntity quizEntity);
    
    List<QuizQuestionEntity> findByQuizEntityIdOrderByPosition(Long quizId);
    
    void deleteByQuizEntityId(Long quizId);
}