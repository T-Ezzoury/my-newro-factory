package fr.oxyl.newrofactory.persistence.internal.dao;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.persistence.config.TestPersistenceConfig;
import fr.oxyl.newrofactory.persistence.internal.entity.PromotionEntity;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestPersistenceConfig.class)
@Transactional
class PromotionDaoTest {

    @Autowired
    private PromotionInternalDao promotionDao;

    private PromotionEntity samplePromo;

    @BeforeEach
    void setUp() {
        samplePromo = new PromotionEntity();
        samplePromo.setName("Avril 2025");
    }

    @Test
    void testSaveAndFindById() {
        assertThat(promotionDao.findAll()).isEmpty();

        PromotionEntity saved = promotionDao.save(samplePromo);
        Long id = saved.getId();
        assertThat(id).isNotNull();

        Optional<PromotionEntity> retrieved = promotionDao.findById(id);
        assertThat(retrieved).isPresent()
                             .get()
                             .extracting(PromotionEntity::getName)
                             .isEqualTo("Avril 2025");
    }

    @Test
    void testDelete() {
        PromotionEntity saved = promotionDao.save(samplePromo);
        Long id = saved.getId();
        assertThat(promotionDao.existsById(id)).isTrue();

        promotionDao.deleteById(id);
        assertThat(promotionDao.existsById(id)).isFalse();
    }

    @Test
    void testFindAll() {
        PromotionEntity p1 = new PromotionEntity();
        p1.setName("X");
        PromotionEntity p2 = new PromotionEntity();
        p2.setName("Y");

        promotionDao.save(p1);
        promotionDao.save(p2);

        Iterable<PromotionEntity> all = promotionDao.findAll();
        assertThat(all).hasSize(2)
                       .extracting(PromotionEntity::getName)
                       .containsExactlyInAnyOrder("X", "Y");
    }
}
