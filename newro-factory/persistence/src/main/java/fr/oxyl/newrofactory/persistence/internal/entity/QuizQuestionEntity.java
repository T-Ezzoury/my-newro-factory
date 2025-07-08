package fr.oxyl.newrofactory.persistence.internal.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "quiz_question")
public class QuizQuestionEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id")
    private QuizEntity quizEntity;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "question_id")
    private QuestionEntity questionEntity;

    @Column(name = "position")
    private Integer position;

    public QuizQuestionEntity() {
    }

    public QuizQuestionEntity(Long id, QuizEntity quizEntity, QuestionEntity questionEntity, Integer position) {
        this.id = id;
        this.quizEntity = quizEntity;
        this.questionEntity = questionEntity;
        this.position = position;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public QuizEntity getQuizEntity() {
        return quizEntity;
    }

    public void setQuizEntity(QuizEntity quizEntity) {
        this.quizEntity = quizEntity;
    }

    public QuestionEntity getQuestionEntity() {
        return questionEntity;
    }

    public void setQuestionEntity(QuestionEntity questionEntity) {
        this.questionEntity = questionEntity;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((quizEntity == null) ? 0 : quizEntity.hashCode());
        result = prime * result + ((questionEntity == null) ? 0 : questionEntity.hashCode());
        result = prime * result + ((position == null) ? 0 : position.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        QuizQuestionEntity other = (QuizQuestionEntity) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (quizEntity == null) {
            if (other.quizEntity != null)
                return false;
        } else if (!quizEntity.equals(other.quizEntity))
            return false;
        if (questionEntity == null) {
            if (other.questionEntity != null)
                return false;
        } else if (!questionEntity.equals(other.questionEntity))
            return false;
        if (position == null) {
            if (other.position != null)
                return false;
        } else if (!position.equals(other.position))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "QuizQuestionEntity [id=" + id + 
               ", quizEntity=" + (quizEntity != null ? quizEntity.getId() : null) + 
               ", questionEntity=" + (questionEntity != null ? questionEntity.getId() : null) + 
               ", position=" + position + "]";
    }
}