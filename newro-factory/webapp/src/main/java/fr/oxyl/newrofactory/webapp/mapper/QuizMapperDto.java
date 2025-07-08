package fr.oxyl.newrofactory.webapp.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Quiz;
import fr.oxyl.newrofactory.webapp.dto.quiz.QuizDto;

@Component
public class QuizMapperDto {

    private final QuizQuestionMapperDto quizQuestionMapperDto;

    public QuizMapperDto(QuizQuestionMapperDto quizQuestionMapperDto) {
        this.quizQuestionMapperDto = quizQuestionMapperDto;
    }

    public QuizDto mapToDto(Quiz quiz) {
        if (quiz == null) {
            return null;
        }

        return new QuizDto(
            quiz.getId(),
            quiz.getName(),
            quiz.getDescription(),
            quiz.getUserId(),
            quiz.getCreatedAt(),
            quiz.getUpdatedAt(),
            quizQuestionMapperDto.mapToDto(quiz.getQuizQuestions())
        );
    }

    public Optional<QuizDto> mapToDto(Optional<Quiz> quizOpt) {
        return quizOpt.map(this::mapToDto);
    }

    public List<QuizDto> mapToDto(List<Quiz> quizzes) {
        if (quizzes == null) {
            return null;
        }

        List<QuizDto> quizDtos = new ArrayList<>();
        for (Quiz quiz : quizzes) {
            quizDtos.add(mapToDto(quiz));
        }
        return quizDtos;
    }

    public Quiz map(QuizDto quizDto) {
        if (quizDto == null) {
            return null;
        }

        return new Quiz(
            quizDto.getId(),
            quizDto.getName(),
            quizDto.getDescription(),
            quizDto.getUserId(),
            quizDto.getCreatedAt(),
            quizDto.getUpdatedAt(),
            quizQuestionMapperDto.map(quizDto.getQuizQuestions())
        );
    }

    public List<Quiz> map(List<QuizDto> quizDtos) {
        if (quizDtos == null) {
            return null;
        }

        List<Quiz> quizzes = new ArrayList<>();
        for (QuizDto quizDto : quizDtos) {
            quizzes.add(map(quizDto));
        }
        return quizzes;
    }
}