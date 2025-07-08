package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Quiz;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;

@Component
public class QuizMapper {

    private final QuizQuestionMapper quizQuestionMapper;

    public QuizMapper(QuizQuestionMapper quizQuestionMapper) {
        this.quizQuestionMapper = quizQuestionMapper;
    }

    public Quiz map(QuizEntity quizEntity) {
        if (quizEntity == null) {
            return null;
        }

        return new Quiz(
            quizEntity.getId(),
            quizEntity.getName(),
            quizEntity.getDescription(),
            quizEntity.getUserId(),
            quizEntity.getCreatedAt(),
            quizEntity.getUpdatedAt(),
            quizQuestionMapper.map(quizEntity.getQuizQuestions())
        );
    }

    public Optional<Quiz> map(Optional<QuizEntity> quizEntityOpt) {
        return quizEntityOpt.map(this::map);
    }

    public List<Quiz> map(Iterable<QuizEntity> quizEntities) {
        if (quizEntities == null) {
            return null;
        }

        List<Quiz> quizzes = new ArrayList<>();
        for (QuizEntity quizEntity : quizEntities) {
            quizzes.add(map(quizEntity));
        }
        return quizzes;
    }

    public QuizEntity mapToEntity(Quiz quiz) {
        if (quiz == null) {
            return null;
        }

        QuizEntity quizEntity = new QuizEntity();
        quizEntity.setId(quiz.getId() > 0 ? quiz.getId() : null);
        quizEntity.setName(quiz.getName());
        quizEntity.setDescription(quiz.getDescription());
        quizEntity.setUserId(quiz.getUserId());
        
        // Don't set createdAt and updatedAt as they are managed by the database
        
        // We need to set the quiz entity before mapping quiz questions
        if (quiz.getQuizQuestions() != null) {
            quizEntity.setQuizQuestions(quizQuestionMapper.mapToEntities(quiz.getQuizQuestions(), quizEntity));
        }
        
        return quizEntity;
    }

    public List<QuizEntity> mapToEntities(List<Quiz> quizzes) {
        if (quizzes == null) {
            return null;
        }

        List<QuizEntity> quizEntities = new ArrayList<>();
        for (Quiz quiz : quizzes) {
            quizEntities.add(mapToEntity(quiz));
        }
        return quizEntities;
    }
}