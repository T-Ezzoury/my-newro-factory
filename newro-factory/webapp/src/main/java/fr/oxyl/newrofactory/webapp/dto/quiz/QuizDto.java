package fr.oxyl.newrofactory.webapp.dto.quiz;

import java.time.LocalDateTime;
import java.util.List;

public class QuizDto {
    private long id;
    private String name;
    private String description;
    private long userId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private List<QuizQuestionDto> quizQuestions;

    public QuizDto() {
    }

    public QuizDto(long id, String name, String description, long userId, 
                  LocalDateTime createdAt, LocalDateTime updatedAt, List<QuizQuestionDto> quizQuestions) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.userId = userId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.quizQuestions = quizQuestions;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<QuizQuestionDto> getQuizQuestions() {
        return quizQuestions;
    }

    public void setQuizQuestions(List<QuizQuestionDto> quizQuestions) {
        this.quizQuestions = quizQuestions;
    }
}