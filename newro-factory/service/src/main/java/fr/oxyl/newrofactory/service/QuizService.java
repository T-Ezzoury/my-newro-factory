package fr.oxyl.newrofactory.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.core.model.Quiz;
import fr.oxyl.newrofactory.core.model.QuizQuestion;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;
import fr.oxyl.newrofactory.persistence.repository.QuizRepo;
import fr.oxyl.newrofactory.persistence.repository.QuizQuestionRepo;

@Service
public class QuizService {

    private final QuizRepo quizDaoService;
    private final QuizQuestionRepo quizQuestionDaoService;

    public QuizService(QuizRepo quizDaoService, QuizQuestionRepo quizQuestionDaoService) {
        this.quizDaoService = quizDaoService;
        this.quizQuestionDaoService = quizQuestionDaoService;
    }

    public Optional<Quiz> findById(long id) {
        return quizDaoService.findById(id);
    }

    public List<Quiz> findAll() {
        return quizDaoService.findAll();
    }

    public List<Quiz> findByUserId(Long userId) {
        return quizDaoService.findByUserId(userId);
    }

    public List<Quiz> findByNameContaining(String name) {
        return quizDaoService.findByNameContaining(name);
    }

    public long count() {
        return quizDaoService.count();
    }

    @Transactional
    public Quiz save(Quiz quiz) {
        return quizDaoService.save(quiz);
    }

    @Transactional
    public void deleteById(long id) {
        quizDaoService.deleteById(id);
    }

    @Transactional
    public List<QuizQuestion> findQuizQuestionsByQuizId(Long quizId) {
        return quizQuestionDaoService.findByQuizId(quizId);
    }

    @Transactional
    public void updateQuizQuestions(Quiz quiz) {
        // First, delete all existing quiz questions
        quizQuestionDaoService.deleteByQuizId(quiz.getId());
        
        // Then, save the new quiz questions
        if (quiz.getQuizQuestions() != null && !quiz.getQuizQuestions().isEmpty()) {
            QuizEntity quizEntity = new QuizEntity();
            quizEntity.setId(quiz.getId());
            quizQuestionDaoService.saveAll(quiz.getQuizQuestions(), quizEntity);
        }
    }
}