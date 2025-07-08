package fr.oxyl.newrofactory.core.model;


public final class Reponse {
    private long id;
    private String label;
    private String contenu;
    private boolean isCorrect;

    public Reponse(long id, String label, String contenu, boolean isCorrect) {
        this.id = id;
        this.label = label;
        this.contenu = contenu;
        this.isCorrect = isCorrect;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String reponse) {
        this.contenu = reponse;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((label == null) ? 0 : label.hashCode());
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
        Reponse other = (Reponse) obj;
        if (id != other.id)
            return false;
        if (label == null) {
            if (other.label != null)
                return false;
        } else if (!label.equals(other.label))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Reponse [id=" + id + ", label=" + label + ", reponse=" + contenu + ", isCorrect=" + isCorrect + "]";
    }
    
}
