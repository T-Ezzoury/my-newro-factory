package fr.oxyl.newrofactory.persistence.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Chapitre;
import fr.oxyl.newrofactory.persistence.internal.dao.ChapitreInternalDao;
import fr.oxyl.newrofactory.persistence.internal.entity.ChapitreEntity;
import fr.oxyl.newrofactory.persistence.internal.mapper.ChapitreMapper;

@Service
public class ChapitreRepo {

    private final ChapitreInternalDao chapitreInternalDao;
    private final ChapitreMapper chapitreMapper;

    public ChapitreRepo(ChapitreInternalDao chapitreInternalDao,
                        ChapitreMapper chapitreMapper){
        this.chapitreInternalDao = chapitreInternalDao;
        this.chapitreMapper = chapitreMapper;
    }

    public long count(){
        return chapitreInternalDao.count();
    }

    public Page<Chapitre> findAll(String search, int currentPage, int pageSize){
        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.unsorted());
        return chapitreInternalDao.findAll(search, pageable).map(chapitreMapper::map);
    }

    public Optional<Chapitre> findById(long id) {
        return chapitreMapper.map(chapitreInternalDao.findById(id));
    }

    /**
     * Find all chapters that have the specified chapter as a parent
     * @param parentId the ID of the parent chapter
     * @return list of chapters that have the specified parent
     */
    public List<Chapitre> findByParentId(long parentId) {
        Optional<ChapitreEntity> parentOpt = chapitreInternalDao.findById(parentId);
        if (parentOpt.isEmpty()) {
            return List.of();
        }
        // Construct the parent path string using the parent ID
        String parentPath = String.valueOf(parentId);

        // Find all chapters that have this parent ID in their parentPath
        List<ChapitreEntity> allChapters = new ArrayList<>();
        chapitreInternalDao.findAll().forEach(allChapters::add);

        List<ChapitreEntity> children = new ArrayList<>();
        for (ChapitreEntity chapter : allChapters) {
            if (chapter.getParentPath() != null && chapter.getParentPath().contains(parentPath)) {
                children.add(chapter);
            }
        }

        return chapitreMapper.map(children);
    }

    public Chapitre save(ChapitreEntity chapitreEntity) {
        ChapitreEntity savedEntity = chapitreInternalDao.save(chapitreEntity);
        return chapitreMapper.map(savedEntity);
    }

    public Chapitre save(Chapitre chapitre) {
        ChapitreEntity chapitreEntity = chapitreMapper.mapToEntity(chapitre);
        ChapitreEntity savedEntity = chapitreInternalDao.save(chapitreEntity);
        return chapitreMapper.map(savedEntity);
    }

    public void deleteById(long id) {
        chapitreInternalDao.deleteById(id);
    }
}
