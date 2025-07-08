package fr.oxyl.newrofactory.persistence.internal.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "chapter")
public class ChapitreEntity {

    @Id
    @GeneratedValue
    private Long id;

    private String name;

    @Column(name = "parent_chapter")
    private String parentPath;

    @Transient
    private List<ChapitreEntity> parent;

    public ChapitreEntity() {
    }

    public ChapitreEntity(Long id, String nom, List<ChapitreEntity> parent) {
        this.id = id;
        this.name = nom;
        this.parent = parent;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String nom) {
        this.name = nom;
    }

    public List<ChapitreEntity> getParent() {
        // If parent is null but parentPath is not, initialize parent from parentPath
        if (parent == null && parentPath != null && !parentPath.isEmpty()) {
            parent = new ArrayList<>();
            // The parentPath contains comma-separated IDs of parent chapters
            // We can't fully initialize the parent objects here without a reference to the DAO
            // This will be handled by the service layer
        }
        return parent;
    }

    public void setParent(List<ChapitreEntity> parent) {
        this.parent = parent;
        // Update parentPath based on parent IDs
        if (parent != null && !parent.isEmpty()) {
            StringBuilder pathBuilder = new StringBuilder();
            for (ChapitreEntity p : parent) {
                if (p.getId() != null) {
                    pathBuilder.append(p.getId()).append(",");
                }
            }
            if (pathBuilder.length() > 0) {
                pathBuilder.deleteCharAt(pathBuilder.length() - 1); // Remove trailing comma
            }
            this.parentPath = pathBuilder.toString();
        } else {
            this.parentPath = "";
        }
    }

    public String getParentPath() {
        return parentPath;
    }

    public void setParentPath(String parentPath) {
        this.parentPath = parentPath;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((parent == null) ? 0 : parent.hashCode());
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
        ChapitreEntity other = (ChapitreEntity) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (parent == null) {
            if (other.parent != null)
                return false;
        } else if (!parent.equals(other.parent))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "ChapitreEntity [id=" + id + ", nom=" + name + ", parent=" + parent + "]";
    }

}
