package fr.oxyl.newrofactory.persistence.internal.entity;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "intern")
public class StagiaireEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private LocalDate arrival;

    @Column(name = "formation_over")
    private LocalDate formationOver;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotion;

    public StagiaireEntity() {
    }

    public StagiaireEntity(Long id, String lastName, String firstName, LocalDate arrival, LocalDate formationOver,
            PromotionEntity promotion) {
        this.id = id;
        this.lastName = lastName;
        this.firstName = firstName;
        this.arrival = arrival;
        this.formationOver = formationOver;
        this.promotion = promotion;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public LocalDate getArrival() {
        return arrival;
    }

    public void setArrival(LocalDate arrival) {
        this.arrival = arrival;
    }

    public LocalDate getFormationOver() {
        return formationOver;
    }

    public void setFormationOver(LocalDate formationOver) {
        this.formationOver = formationOver;
    }

    public PromotionEntity getPromotion() {
        return promotion;
    }

    public void setPromotion(PromotionEntity promotion) {
        this.promotion = promotion;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
        result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
        result = prime * result + ((arrival == null) ? 0 : arrival.hashCode());
        result = prime * result + ((formationOver == null) ? 0 : formationOver.hashCode());
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
        StagiaireEntity other = (StagiaireEntity) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (lastName == null) {
            if (other.lastName != null)
                return false;
        } else if (!lastName.equals(other.lastName))
            return false;
        if (firstName == null) {
            if (other.firstName != null)
                return false;
        } else if (!firstName.equals(other.firstName))
            return false;
        if (arrival == null) {
            if (other.arrival != null)
                return false;
        } else if (!arrival.equals(other.arrival))
            return false;
        if (formationOver == null) {
            if (other.formationOver != null)
                return false;
        } else if (!formationOver.equals(other.formationOver))
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
        return "StagiaireEntity [id=" + id + ", last name=" + lastName + ", first name=" + firstName + ", arrival=" + arrival
                + ", formation over=" + formationOver + ", promotion=" + promotion + "]";
    }
    
}
