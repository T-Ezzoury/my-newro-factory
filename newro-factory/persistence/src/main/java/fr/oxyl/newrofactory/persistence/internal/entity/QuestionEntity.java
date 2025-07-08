package fr.oxyl.newrofactory.persistence.internal.entity;

import java.util.List;

import org.jspecify.annotations.NonNull;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "question")
public class QuestionEntity {

    @Id
    @GeneratedValue
    private Long id;

    @NonNull
    private String title;

    @NonNull
    private String statement;

    @ManyToOne
    @JoinColumn(name = "chapter_id")
    private ChapitreEntity chapitreEntity;

    @OneToMany(
        cascade = CascadeType.REMOVE,
        orphanRemoval = true,
        fetch = jakarta.persistence.FetchType.EAGER
    )
    @JoinColumn(name = "question_id")
    private List<ResponseEntity> reponsesEntities;

    public QuestionEntity() {
    }

    public QuestionEntity(Long id, String title, String statement, ChapitreEntity chapitreEntity,
            List<ResponseEntity> responsesEntities) {
        this.id = id;
        this.title = title;
        this.statement = statement;
        this.chapitreEntity = chapitreEntity;
        this.reponsesEntities = responsesEntities;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String titre) {
        this.title = titre;
    }

    public String getStatement() {
        return statement;
    }

    public void setStatement(String contenu) {
        this.statement = contenu;
    }

    public ChapitreEntity getChapitreEntity() {
        return chapitreEntity;
    }

    public void setChapitreEntity(ChapitreEntity chapitreEntity) {
        this.chapitreEntity = chapitreEntity;
    }

    public List<ResponseEntity> getReponsesEntities() {
        return reponsesEntities;
    }

    public void setReponsesEntities(List<ResponseEntity> reponses) {
        this.reponsesEntities = reponses;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((title == null) ? 0 : title.hashCode());
        result = prime * result + ((statement == null) ? 0 : statement.hashCode());
        result = prime * result + ((chapitreEntity == null) ? 0 : chapitreEntity.hashCode());
        result = prime * result + ((reponsesEntities == null) ? 0 : reponsesEntities.hashCode());
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
        QuestionEntity other = (QuestionEntity) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (title == null) {
            if (other.title != null)
                return false;
        } else if (!title.equals(other.title))
            return false;
        if (statement == null) {
            if (other.statement != null)
                return false;
        } else if (!statement.equals(other.statement))
            return false;
        if (chapitreEntity == null) {
            if (other.chapitreEntity != null)
                return false;
        } else if (!chapitreEntity.equals(other.chapitreEntity))
            return false;
        if (reponsesEntities == null) {
            if (other.reponsesEntities != null)
                return false;
        } else if (!reponsesEntities.equals(other.reponsesEntities))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "QuestionEntity [id=" + id + ", title=" + title + ", statement=" + statement + ", chapitreEntity="
                + chapitreEntity + ", reponsesEntites=" + reponsesEntities + "]";
    }

}
