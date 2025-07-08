package fr.oxyl.newrofactory.persistence.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.core.model.Quiz;
import fr.oxyl.newrofactory.persistence.internal.dao.QuizInternalDao;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;
import fr.oxyl.newrofactory.persistence.internal.mapper.QuizMapper;

@Service
public class QuizRepo {

    private final QuizInternalDao quizInternalDao;
    private final QuizMapper quizMapper;

    public QuizRepo(QuizInternalDao quizInternalDao, QuizMapper quizMapper) {
        this.quizInternalDao = quizInternalDao;
        this.quizMapper = quizMapper;
    }

    public Optional<Quiz> findById(long id) {
        return quizMapper.map(quizInternalDao.findById(id));
    }

    public List<Quiz> findAll() {
        return quizMapper.map(quizInternalDao.findAll());
    }

    public List<Quiz> findByUserId(Long userId) {
        return quizMapper.map(quizInternalDao.findByUserId(userId));
    }

    public List<Quiz> findByNameContaining(String name) {
        return quizMapper.map(quizInternalDao.findByNameContainingIgnoreCase(name));
    }

    public long count() {
        return quizInternalDao.count();
    }

    @Transactional
    public Quiz save(Quiz quiz) {
        QuizEntity quizEntity = quizMapper.mapToEntity(quiz);
        QuizEntity savedEntity = quizInternalDao.save(quizEntity);
        return quizMapper.map(savedEntity);
    }

    @Transactional
    public void deleteById(long id) {
        quizInternalDao.deleteById(id);
    }
}