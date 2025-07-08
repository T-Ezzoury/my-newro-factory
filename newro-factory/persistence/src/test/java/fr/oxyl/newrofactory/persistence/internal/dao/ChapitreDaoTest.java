package fr.oxyl.newrofactory.persistence.internal.dao;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.persistence.config.TestPersistenceConfig;
import fr.oxyl.newrofactory.persistence.internal.entity.ChapitreEntity;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestPersistenceConfig.class)
@Transactional
class ChapitreDaoTest {

    @Autowired
    private ChapitreInternalDao chapitreDao;

    private ChapitreEntity sampleChapitre;

    @BeforeEach
    void setUp() {
        sampleChapitre = new ChapitreEntity();
        sampleChapitre.setName("Test Chapitre");
    }

    @Test
    void testSaveAndFindById() {
        assertThat(chapitreDao.findAll()).isEmpty();

        ChapitreEntity saved = chapitreDao.save(sampleChapitre);
        Long id = saved.getId();
        assertThat(id).isNotNull();

        Optional<ChapitreEntity> retrieved = chapitreDao.findById(id);
        assertThat(retrieved).isPresent();
        assertThat(retrieved.get().getName()).isEqualTo("Test Chapitre");
    }

    @Test
    void testDelete() {
        ChapitreEntity saved = chapitreDao.save(sampleChapitre);
        Long id = saved.getId();
        assertThat(chapitreDao.existsById(id)).isTrue();

        chapitreDao.deleteById(id);
        assertThat(chapitreDao.existsById(id)).isFalse();
    }

    @Test
    void testFindAll() {
        ChapitreEntity c1 = new ChapitreEntity();
        c1.setName("A");
        ChapitreEntity c2 = new ChapitreEntity();
        c2.setName("B");

        chapitreDao.save(c1);
        chapitreDao.save(c2);

        Iterable<ChapitreEntity> all = chapitreDao.findAll();
        assertThat(all).hasSize(2)
                       .extracting(ChapitreEntity::getName)
                       .containsExactlyInAnyOrder("A", "B");
    }

    @Test
    void testChaptereNotFound() {
        Optional<ChapitreEntity> notFound = chapitreDao.findById(999L);
        assertThat(notFound).isEmpty();
    }

    @Test
    void testUpdate() {
        ChapitreEntity saved = chapitreDao.save(sampleChapitre);
        Long id = saved.getId();
        assertThat(id).isNotNull();

        saved.setName("Updated Chapitre");
        chapitreDao.save(saved);

        Optional<ChapitreEntity> retrieved = chapitreDao.findById(id);
        assertThat(retrieved).isPresent();
        assertThat(retrieved.get().getName()).isEqualTo("Updated Chapitre");
    }

    @Test
    void testChapterHasParents() {
        ChapitreEntity parent = new ChapitreEntity();
        parent.setName("Parent Chapitre");
        chapitreDao.save(parent);

        ChapitreEntity child = new ChapitreEntity();
        child.setName("Child Chapitre");
        child.setParent(List.of(parent));
        chapitreDao.save(child);

        Optional<ChapitreEntity> retrieved = chapitreDao.findById(child.getId());
        assertThat(retrieved).isPresent();
        assertThat(retrieved.get().getParent()).isNotNull();
        assertThat(retrieved.get().getParent().getFirst().getName()).isEqualTo("Parent Chapitre");
    }

}
