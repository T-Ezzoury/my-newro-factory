package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.Optional;
import java.util.List;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Question;
import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;


@Component
public final class QuestionMapper {

    private final ReponseMapper reponseMapperDao;
    private final ChapitreMapper chapitreMapperDao;

    public QuestionMapper(ReponseMapper reponseMapperDao,
            ChapitreMapper chapitreMapperDao) {
        this.reponseMapperDao = reponseMapperDao;
        this.chapitreMapperDao = chapitreMapperDao;
    }

    public Question map(QuestionEntity questionEntity){
        if (questionEntity == null) {
            return null;
        }

        return new Question(
            questionEntity.getId(),
            questionEntity.getTitle(), 
            questionEntity.getStatement(), 
            chapitreMapperDao.map(questionEntity.getChapitreEntity()), 
            reponseMapperDao.map(questionEntity.getReponsesEntities()));
    }

    public Optional<Question> map(Optional<QuestionEntity> questionEntity) {
        return questionEntity.map(this::map);
    }

    public QuestionEntity mapToEntity(Question question) {
        if (question == null) {
            return null;
        }

        // For simplicity, we're only mapping the ID
        // This is used when we need to reference existing questions
        QuestionEntity entity = new QuestionEntity();
        entity.setId(question.getId());
        return entity;
    }

    public List<QuestionEntity> mapToEntities(List<Question> questions) {
        if (questions == null) {
            return null;
        }

        List<QuestionEntity> entities = new ArrayList<>();
        for (Question question : questions) {
            entities.add(mapToEntity(question));
        }
        return entities;
    }

    public List<Question> map(Iterable<QuestionEntity> questionEntities) {
        if (questionEntities == null) {
            return null;
        }

        List<Question> questions = new ArrayList<>();
        for (QuestionEntity questionEntity : questionEntities) {
            questions.add(map(questionEntity));
        }
        return questions;
    }
}
