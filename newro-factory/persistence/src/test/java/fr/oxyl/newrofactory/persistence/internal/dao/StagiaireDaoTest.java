package fr.oxyl.newrofactory.persistence.internal.dao;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.jpa.impl.JPAQueryFactory;

import fr.oxyl.newrofactory.persistence.config.TestPersistenceConfig;
import fr.oxyl.newrofactory.persistence.internal.entity.PromotionEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QPromotionEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.QStagiaireEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.StagiaireEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestPersistenceConfig.class)
@Transactional
class StagiaireDaoTest {

    @Autowired
    private StagiaireInternalDao stagiaireDao;
    @Autowired
    private PromotionInternalDao promotionDao;

    @PersistenceContext
    private EntityManager em;

    private JPAQueryFactory queryFactory;

    private PromotionEntity promoTest;
    private StagiaireEntity s1, s2;

    @BeforeEach
    void setUp() {
        promoTest = new PromotionEntity();
        promoTest.setName("PromoTest");
        promotionDao.save(promoTest);

        s1 = new StagiaireEntity();
        s1.setLastName("Dupont");
        s1.setFirstName("Alice");
        s1.setPromotion(promoTest);

        s2 = new StagiaireEntity();
        s2.setLastName("Durand");
        s2.setFirstName("Bob");
        s2.setPromotion(promoTest);

        queryFactory = new JPAQueryFactory(em);
    }

    @Test
    void testSaveAndFindById() {
        assertThat(stagiaireDao.findAll()).isEmpty();

        StagiaireEntity saved = stagiaireDao.save(s1);
        Long id = saved.getId();
        assertThat(id).isNotNull();

        Optional<StagiaireEntity> retrieved = stagiaireDao.findById(id);
        assertThat(retrieved).isPresent()
                .get()
                .extracting(StagiaireEntity::getLastName, StagiaireEntity::getFirstName)
                .containsExactly("Dupont", "Alice");
    }

    @Test
    void testFindAllPaginationWithoutSearch() {
        stagiaireDao.save(s1);
        stagiaireDao.save(s2);

        Page<StagiaireEntity> page = stagiaireDao.findAll(null, PageRequest.of(0, 10));
        assertThat(page.getTotalElements()).isEqualTo(2);
        assertThat(page.getContent())
                .extracting(StagiaireEntity::getLastName)
                .containsExactlyInAnyOrder("Dupont", "Durand");
    }

    @Test
    void testFindAllPaginationWithSearchOnNom() {
        stagiaireDao.save(s1);
        stagiaireDao.save(s2);

        Page<StagiaireEntity> page = stagiaireDao.findAll("Dura", PageRequest.of(0, 10));
        assertThat(page.getTotalElements()).isEqualTo(1);
        assertThat(page.getContent().get(0).getLastName()).isEqualTo("Durand");
    }

    @Test
    void testFindAllPaginationWithSearchOnPrenom() {
        stagiaireDao.save(s1);
        stagiaireDao.save(s2);

        Page<StagiaireEntity> page = stagiaireDao.findAll("Ali", PageRequest.of(0, 10));
        assertThat(page.getTotalElements()).isEqualTo(1);
        assertThat(page.getContent().get(0).getFirstName()).isEqualTo("Alice");
    }

    @Test
    void testFindAllPaginationWithSearchOnPromotionName() {
        stagiaireDao.save(s1);
        stagiaireDao.save(s2);

        Page<StagiaireEntity> page = stagiaireDao.findAll("Promo", PageRequest.of(0, 10));
        assertThat(page.getTotalElements()).isEqualTo(2);
    }

    @Test
    void testInsertAndSelectWithQueryDSL() {
        QStagiaireEntity stagiaire = QStagiaireEntity.stagiaireEntity;
        QPromotionEntity promotion = QPromotionEntity.promotionEntity;

        assertThat(queryFactory.select(stagiaire).from(stagiaire).fetch()).isEmpty();
    
        queryFactory
                .insert(promotion)
                .columns(promotion.name)
                .values("PromoQDSL")
                .execute();

        em.flush();
        
        PromotionEntity promoQDSL = queryFactory
                .selectFrom(promotion)
                .where(promotion.name.eq("PromoQDSL"))
                .fetchOne();
        
        em.clear();

        queryFactory
                .insert(stagiaire)
                .columns(
                        stagiaire.firstName,
                        stagiaire.lastName,
                        stagiaire.promotion)
                .values(
                        "Alice",
                        "Dupont",
                        promoQDSL)
                .execute();

        em.flush();
        em.clear();

        StagiaireEntity result = queryFactory
                .selectFrom(stagiaire)
                .where(stagiaire.firstName.eq("Alice"))
                .fetchOne();

        assertThat(result).isNotNull();
        assertThat(result.getFirstName()).isEqualTo("Alice");
        assertThat(result.getLastName()).isEqualTo("Dupont");
        assertThat(result.getPromotion().getName()).isEqualTo("PromoQDSL");
    }
}
