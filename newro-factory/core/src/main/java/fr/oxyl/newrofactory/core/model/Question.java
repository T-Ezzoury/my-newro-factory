package fr.oxyl.newrofactory.core.model;


import java.util.List;

public final class Question {
    private long id;
    private String titre;
    private String contenu;
    private Chapitre chapitre;
    private List<Reponse> reponses;

    public Question(long id, String titre, String contenu, Chapitre chapitre, List<Reponse> reponses) {
        this.id = id;
        this.titre = titre;
        this.contenu = contenu;
        this.chapitre = chapitre;
        this.reponses = reponses;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getContenu() {
        return contenu;
    }

    public void setContenu(String contenu) {
        this.contenu = contenu;
    }

    public Chapitre getChapitre() {
        return chapitre;
    }

    public void setChapitre(Chapitre chapitre) {
        this.chapitre = chapitre;
    }

    public List<Reponse> getReponses() {
        return reponses;
    }

    public void setReponses(List<Reponse> reponses) {
        this.reponses = reponses;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((titre == null) ? 0 : titre.hashCode());
        result = prime * result + ((contenu == null) ? 0 : contenu.hashCode());
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
        Question other = (Question) obj;
        if (id != other.id)
            return false;
        if (titre == null) {
            if (other.titre != null)
                return false;
        } else if (!titre.equals(other.titre))
            return false;
        if (contenu == null) {
            if (other.contenu != null)
                return false;
        } else if (!contenu.equals(other.contenu))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Question [id=" + id + ", titre=" + titre + ", contenu=" + contenu + ", chapitre=" + chapitre
                + ", reponses=" + reponses + "]";
    }
    
    
}
