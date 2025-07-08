package fr.oxyl.newrofactory.webapp.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Question;
import fr.oxyl.newrofactory.core.model.QuizQuestion;
import fr.oxyl.newrofactory.webapp.dto.quiz.QuizQuestionDto;

@Component
public class QuizQuestionMapperDto {

    private final QuestionMapperDto questionMapperDto;

    public QuizQuestionMapperDto(QuestionMapperDto questionMapperDto) {
        this.questionMapperDto = questionMapperDto;
    }

    public QuizQuestionDto mapToDto(QuizQuestion quizQuestion) {
        if (quizQuestion == null) {
            return null;
        }

        return new QuizQuestionDto(
            quizQuestion.getId(),
            quizQuestion.getQuizId(),
            questionMapperDto.mapToDto(quizQuestion.getQuestion()),
            quizQuestion.getPosition()
        );
    }

    public Optional<QuizQuestionDto> mapToDto(Optional<QuizQuestion> quizQuestionOpt) {
        return quizQuestionOpt.map(this::mapToDto);
    }

    public List<QuizQuestionDto> mapToDto(List<QuizQuestion> quizQuestions) {
        if (quizQuestions == null) {
            return null;
        }

        List<QuizQuestionDto> quizQuestionDtos = new ArrayList<>();
        for (QuizQuestion quizQuestion : quizQuestions) {
            quizQuestionDtos.add(mapToDto(quizQuestion));
        }
        return quizQuestionDtos;
    }

    public QuizQuestion map(QuizQuestionDto quizQuestionDto) {
        if (quizQuestionDto == null) {
            return null;
        }

        Question question = null;
        if (quizQuestionDto.getQuestion() != null) {
            question = new Question(
                quizQuestionDto.getQuestion().id(),
                quizQuestionDto.getQuestion().titre(),
                quizQuestionDto.getQuestion().contenu(),
                null, // We don't need to map the chapter here
                null  // We don't need to map the responses here
            );
        }

        return new QuizQuestion(
            quizQuestionDto.getId(),
            quizQuestionDto.getQuizId(),
            question,
            quizQuestionDto.getPosition()
        );
    }

    public List<QuizQuestion> map(List<QuizQuestionDto> quizQuestionDtos) {
        if (quizQuestionDtos == null) {
            return null;
        }

        List<QuizQuestion> quizQuestions = new ArrayList<>();
        for (QuizQuestionDto quizQuestionDto : quizQuestionDtos) {
            quizQuestions.add(map(quizQuestionDto));
        }
        return quizQuestions;
    }
}
