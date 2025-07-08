package fr.oxyl.newrofactory.persistence.internal.entity;

import org.jspecify.annotations.NonNull;

import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "answer")
public class ResponseEntity {

    @Id
    @GeneratedValue
    private Long id;

    @NonNull
    private String label;

    @NonNull
    private String text;

    @NonNull
    @Column(name= "valid_answer")
    private boolean validAnswer;

    @ManyToOne
    @JoinColumn(name = "question_id")
    private QuestionEntity questionEntity;

    public ResponseEntity() {
    }

    public ResponseEntity(Long id, String label, String statement, boolean validAnswer, QuestionEntity questionEntity) {
        this.id = id;
        this.label = label;
        this.text = statement;
        this.validAnswer = validAnswer;
        this.questionEntity = questionEntity;
    }

    public ResponseEntity(Long id, String label, String statement, boolean validAnswer) {
        this(id, label, statement, validAnswer, null);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isValidAnswer() {
        return validAnswer;
    }

    public void setValidAnswer(boolean validAnswer) {
        this.validAnswer = validAnswer;
    }

    public QuestionEntity getQuestionEntity() {
        return questionEntity;
    }

    public void setQuestionEntity(QuestionEntity questionEntity) {
        this.questionEntity = questionEntity;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((label == null) ? 0 : label.hashCode());
        result = prime * result + ((text == null) ? 0 : text.hashCode());
        result = prime * result + (validAnswer ? 1231 : 1237);
        result = prime * result + ((questionEntity == null) ? 0 : questionEntity.hashCode());
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
        ResponseEntity other = (ResponseEntity) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (label == null) {
            if (other.label != null)
                return false;
        } else if (!label.equals(other.label))
            return false;
        if (text == null) {
            if (other.text != null)
                return false;
        } else if (!text.equals(other.text))
            return false;
        if (validAnswer != other.validAnswer)
            return false;
        if (questionEntity == null) {
            if (other.questionEntity != null)
                return false;
        } else if (!questionEntity.equals(other.questionEntity))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "ResponseEntity [id=" + id + ", label=" + label + ", statement=" + text + ", valid_answer=" + validAnswer
                + ", questionEntity=" + (questionEntity != null ? questionEntity.getId() : null) + "]";
    }


}
