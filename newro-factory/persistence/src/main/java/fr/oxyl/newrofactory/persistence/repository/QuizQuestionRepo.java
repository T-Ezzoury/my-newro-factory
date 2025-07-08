package fr.oxyl.newrofactory.persistence.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.core.model.QuizQuestion;
import fr.oxyl.newrofactory.persistence.internal.dao.QuizQuestionInternalDao;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizQuestionEntity;
import fr.oxyl.newrofactory.persistence.internal.mapper.QuizQuestionMapper;

@Service
public class QuizQuestionRepo {

    private final QuizQuestionInternalDao quizQuestionInternalDao;
    private final QuizQuestionMapper quizQuestionMapper;

    public QuizQuestionRepo(QuizQuestionInternalDao quizQuestionInternalDao, QuizQuestionMapper quizQuestionMapper) {
        this.quizQuestionInternalDao = quizQuestionInternalDao;
        this.quizQuestionMapper = quizQuestionMapper;
    }

    public Optional<QuizQuestion> findById(long id) {
        return quizQuestionMapper.map(quizQuestionInternalDao.findById(id));
    }

    public List<QuizQuestion> findByQuizId(Long quizId) {
        return quizQuestionMapper.map(quizQuestionInternalDao.findByQuizEntityIdOrderByPosition(quizId));
    }

    public List<QuizQuestion> findByQuestionId(Long questionId) {
        return quizQuestionMapper.map(quizQuestionInternalDao.findByQuestionEntityId(questionId));
    }

    public long count() {
        return quizQuestionInternalDao.count();
    }

    @Transactional
    public QuizQuestion save(QuizQuestion quizQuestion, QuizEntity quizEntity) {
        QuizQuestionEntity quizQuestionEntity = quizQuestionMapper.mapToEntity(quizQuestion, quizEntity);
        QuizQuestionEntity savedEntity = quizQuestionInternalDao.save(quizQuestionEntity);
        return quizQuestionMapper.map(savedEntity);
    }

    @Transactional
    public List<QuizQuestion> saveAll(List<QuizQuestion> quizQuestions, QuizEntity quizEntity) {
        List<QuizQuestionEntity> quizQuestionEntities = quizQuestionMapper.mapToEntities(quizQuestions, quizEntity);
        Iterable<QuizQuestionEntity> savedEntities = quizQuestionInternalDao.saveAll(quizQuestionEntities);
        return quizQuestionMapper.map(savedEntities);
    }

    @Transactional
    public void deleteById(long id) {
        quizQuestionInternalDao.deleteById(id);
    }

    @Transactional
    public void deleteByQuizId(Long quizId) {
        quizQuestionInternalDao.deleteByQuizEntityId(quizId);
    }
}