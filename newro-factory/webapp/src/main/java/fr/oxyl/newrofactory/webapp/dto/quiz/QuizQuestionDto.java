package fr.oxyl.newrofactory.webapp.dto.quiz;

import fr.oxyl.newrofactory.webapp.dto.question.QuestionDto;

public class QuizQuestionDto {
    private long id;
    private long quizId;
    private QuestionDto question;
    private int position;

    public QuizQuestionDto() {
    }

    public QuizQuestionDto(long id, long quizId, QuestionDto question, int position) {
        this.id = id;
        this.quizId = quizId;
        this.question = question;
        this.position = position;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuizId() {
        return quizId;
    }

    public void setQuizId(long quizId) {
        this.quizId = quizId;
    }

    public QuestionDto getQuestion() {
        return question;
    }

    public void setQuestion(QuestionDto question) {
        this.question = question;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
}