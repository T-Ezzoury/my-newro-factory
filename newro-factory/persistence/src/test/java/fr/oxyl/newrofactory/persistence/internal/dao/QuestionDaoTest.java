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
import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;
import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestPersistenceConfig.class)
@Transactional
class QuestionDaoTest {

    @Autowired
    private QuestionInternalDao questionDao;

    @Autowired
    private ChapitreInternalDao chapitreDao;

    @Autowired
    private ResponseInternalDao responseDao;

    private QuestionEntity sampleQuestion;

    @BeforeEach
    void setUp() {
        ChapitreEntity chapitre = new ChapitreEntity();
        chapitre.setName("Brain Rot");
        chapitreDao.save(chapitre);

        ResponseEntity response1 = new ResponseEntity();
        response1.setLabel("A");
        response1.setText("Le gorille gagne");
        response1.setValidAnswer(false);

        ResponseEntity response2 = new ResponseEntity();
        response2.setLabel("B");
        response2.setText("Les 100 hommes gagnent");
        response2.setValidAnswer(true);
        responseDao.save(response1);
        responseDao.save(response2);

        sampleQuestion = new QuestionEntity();
        sampleQuestion.setTitle("Question serieuse !");
        sampleQuestion.setStatement("1 gorille vs 100 hommes qui gagne ?");
        sampleQuestion.setChapitreEntity(chapitre);
        sampleQuestion.setReponsesEntities(List.of(response1, response2));
    }

    @Test
    void testSaveAndFindById() {
        assertThat(questionDao.findAll()).isEmpty();

        QuestionEntity saved = questionDao.save(sampleQuestion);
        Long id = saved.getId();
        assertThat(id).isNotNull();

        Optional<QuestionEntity> retrieved = questionDao.findById(id);
        assertThat(retrieved).isPresent()
                             .get()
                             .extracting(QuestionEntity::getTitle, QuestionEntity::getStatement, QuestionEntity::getChapitreEntity, 
                                         QuestionEntity::getReponsesEntities)
                             .containsExactly("Question serieuse !", "1 gorille vs 100 hommes qui gagne ?", 
                                              sampleQuestion.getChapitreEntity(), sampleQuestion.getReponsesEntities());
    }

    @Test
    void testDelete() {
        QuestionEntity saved = questionDao.save(sampleQuestion);
        Long id = saved.getId();
        assertThat(questionDao.existsById(id)).isTrue();

        questionDao.deleteById(id);
        assertThat(questionDao.existsById(id)).isFalse();
    }
}
