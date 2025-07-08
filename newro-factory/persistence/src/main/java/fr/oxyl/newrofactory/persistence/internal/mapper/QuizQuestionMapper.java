package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.QuizQuestion;
import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QuizQuestionEntity;

@Component
public class QuizQuestionMapper {

    private final QuestionMapper questionMapper;

    public QuizQuestionMapper(QuestionMapper questionMapper) {
        this.questionMapper = questionMapper;
    }

    public QuizQuestion map(QuizQuestionEntity quizQuestionEntity) {
        if (quizQuestionEntity == null) {
            return null;
        }

        return new QuizQuestion(
            quizQuestionEntity.getId(),
            quizQuestionEntity.getQuizEntity() != null ? quizQuestionEntity.getQuizEntity().getId() : 0,
            questionMapper.map(quizQuestionEntity.getQuestionEntity()),
            quizQuestionEntity.getPosition() != null ? quizQuestionEntity.getPosition() : 0
        );
    }

    public Optional<QuizQuestion> map(Optional<QuizQuestionEntity> quizQuestionEntityOpt) {
        return quizQuestionEntityOpt.map(this::map);
    }

    public List<QuizQuestion> map(Iterable<QuizQuestionEntity> quizQuestionEntities) {
        if (quizQuestionEntities == null) {
            return null;
        }

        List<QuizQuestion> quizQuestions = new ArrayList<>();
        for (QuizQuestionEntity quizQuestionEntity : quizQuestionEntities) {
            quizQuestions.add(map(quizQuestionEntity));
        }
        return quizQuestions;
    }

    public QuizQuestionEntity mapToEntity(QuizQuestion quizQuestion, QuizEntity quizEntity) {
        if (quizQuestion == null) {
            return null;
        }

        QuestionEntity questionEntity = null;
        if (quizQuestion.getQuestion() != null) {
            questionEntity = new QuestionEntity();
            questionEntity.setId(quizQuestion.getQuestion().getId());
        }

        QuizQuestionEntity quizQuestionEntity = new QuizQuestionEntity();
        quizQuestionEntity.setId(quizQuestion.getId() > 0 ? quizQuestion.getId() : null);
        quizQuestionEntity.setQuizEntity(quizEntity);
        quizQuestionEntity.setQuestionEntity(questionEntity);
        quizQuestionEntity.setPosition(quizQuestion.getPosition());

        return quizQuestionEntity;
    }

    public List<QuizQuestionEntity> mapToEntities(List<QuizQuestion> quizQuestions, QuizEntity quizEntity) {
        if (quizQuestions == null) {
            return null;
        }

        List<QuizQuestionEntity> quizQuestionEntities = new ArrayList<>();
        for (QuizQuestion quizQuestion : quizQuestions) {
            quizQuestionEntities.add(mapToEntity(quizQuestion, quizEntity));
        }
        return quizQuestionEntities;
    }
}