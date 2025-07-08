package fr.oxyl.newrofactory.core.model;

import java.time.LocalDate;

public final class Stagiaire {
    private Long id;
    private String prenom;
    private String nom;
    private LocalDate dateArrivee;
    private LocalDate dateDepart;
    private Promotion promotion;

    private Stagiaire(Builder builder) {
        this.id = builder.id;
        this.prenom = builder.prenom;
        this.nom = builder.nom;
        this.dateArrivee = builder.dateArrivee;
        this.dateDepart = builder.dateDepart;
        this.promotion = builder.promotion;
    }

    public static Builder builder() {
        return new Builder();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public LocalDate getDateArrivee() {
        return dateArrivee;
    }

    public void setDateArrivee(LocalDate dateArrivee) {
        this.dateArrivee = dateArrivee;
    }

    public LocalDate getDateDepart() {
        return dateDepart;
    }

    public void setDateDepart(LocalDate dateDepart) {
        this.dateDepart = dateDepart;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + (int) (id ^ (id >>> 32));
        result = prime * result + ((prenom == null) ? 0 : prenom.hashCode());
        result = prime * result + ((nom == null) ? 0 : nom.hashCode());
        result = prime * result + ((dateArrivee == null) ? 0 : dateArrivee.hashCode());
        result = prime * result + ((dateDepart == null) ? 0 : dateDepart.hashCode());
        result = prime * result + ((promotion == null) ? 0 : promotion.hashCode());
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
        Stagiaire other = (Stagiaire) obj;
        if (id != other.id)
            return false;
        if (prenom == null) {
            if (other.prenom != null)
                return false;
        } else if (!prenom.equals(other.prenom))
            return false;
        if (nom == null) {
            if (other.nom != null)
                return false;
        } else if (!nom.equals(other.nom))
            return false;
        if (dateArrivee == null) {
            if (other.dateArrivee != null)
                return false;
        } else if (!dateArrivee.equals(other.dateArrivee))
            return false;
        if (dateDepart == null) {
            if (other.dateDepart != null)
                return false;
        } else if (!dateDepart.equals(other.dateDepart))
            return false;
        if (promotion == null) {
            if (other.promotion != null)
                return false;
        } else if (!promotion.equals(other.promotion))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Stagiaire [id=" + id + ", prenom=" + prenom + ", nom=" + nom + ", dateArrivee=" + dateArrivee
                + ", dateDepart=" + dateDepart + ", promotion=" + promotion + "]";
    }


    public static class Builder{
        private Long id;
        private String prenom;
        private String nom;
        private LocalDate dateArrivee;
        private LocalDate dateDepart;
        private Promotion promotion;

        public Builder id(Long id){
            this.id = id;
            return this;
        }

        public Builder prenom(String prenom){
            this.prenom = prenom;
            return this;
        }
        public Builder nom(String nom){
            this.nom = nom;
            return this;
        }
        public Builder dateArrivee(LocalDate dateArrivee){
            this.dateArrivee = dateArrivee;
            return this;
        }
        public Builder dateDepart(LocalDate dateDepart){
            this.dateDepart = dateDepart;
            return this;
        }
        public Builder promotion(Promotion promotion){
            this.promotion = promotion;
            return this;
        }

        public Stagiaire build(){
            return new Stagiaire(this);
        }
    }
}
