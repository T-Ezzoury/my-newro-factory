package fr.oxyl.newrofactory.core.model;

public final class QuizQuestion {
    private long id;
    private long quizId;
    private Question question;
    private int position;

    public QuizQuestion(long id, long quizId, Question question, int position) {
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

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + (int) (quizId ^ (quizId >>> 32));
        result = prime * result + ((question == null) ? 0 : question.hashCode());
        result = prime * result + position;
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
        QuizQuestion other = (QuizQuestion) obj;
        if (id != other.id)
            return false;
        if (quizId != other.quizId)
            return false;
        if (question == null) {
            if (other.question != null)
                return false;
        } else if (!question.equals(other.question))
            return false;
        if (position != other.position)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "QuizQuestion [id=" + id + ", quizId=" + quizId + ", question=" + question + ", position=" + position + "]";
    }
}