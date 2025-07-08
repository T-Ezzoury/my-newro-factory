package fr.oxyl.newrofactory.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Chapitre;
import fr.oxyl.newrofactory.persistence.internal.entity.ChapitreEntity;
import fr.oxyl.newrofactory.persistence.repository.ChapitreRepo;

@Service
public class ChapitreService {

    private final ChapitreRepo chapitreDao;

    public ChapitreService(ChapitreRepo chapitreDao) {
        this.chapitreDao = chapitreDao;
    }

    public long compterChapitres() {
        return chapitreDao.count();
    }

    public Page<Chapitre> findAll(String search, int currentPage, int pageSize) 
    {
        return chapitreDao.findAll(search, currentPage, pageSize);
    }


    public Optional<Chapitre> findById(long id) {
        return chapitreDao.findById(id);
    }

    /**
     * Find all chapters that have the specified chapter as a parent
     * @param parentId the ID of the parent chapter
     * @return list of chapters that have the specified parent
     */
    public List<Chapitre> findByParentId(long parentId) {
        return chapitreDao.findByParentId(parentId);
    }

    public Chapitre save(ChapitreEntity chapitreEntity) {
        return chapitreDao.save(chapitreEntity);
    }

    public Chapitre save(Chapitre chapitre) {
        return chapitreDao.save(chapitre);
    }

    public void deleteById(long id) {
        chapitreDao.deleteById(id);
    }
}
