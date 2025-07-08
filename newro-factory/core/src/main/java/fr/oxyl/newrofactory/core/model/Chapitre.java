package fr.oxyl.newrofactory.core.model;

import java.util.List;

public final class Chapitre {
    public long id;
    public String nom;
    public List<Chapitre> parents;

    public Chapitre(long id, String nom, List<Chapitre> parents) {
        this.id = id;
        this.nom = nom;
        this.parents = parents;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Chapitre> getParents() {
        return parents;
    }

    public void setParent(List<Chapitre> parents) {
        this.parents = parents;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((nom == null) ? 0 : nom.hashCode());
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
        Chapitre other = (Chapitre) obj;
        if (id != other.id)
            return false;
        if (nom == null) {
            if (other.nom != null)
                return false;
        } else if (!nom.equals(other.nom))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Chapitre [id=" + id + ", nom=" + nom + ", parent=" + parents + "]";
    }
}
