package fr.oxyl.newrofactory.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Question;
import fr.oxyl.newrofactory.persistence.repository.QuestionRepo;

@Service
public final class QuestionService {

    private final QuestionRepo questionDao;

    public QuestionService(QuestionRepo questionDao) {
        this.questionDao = questionDao;
    }

    public Optional<Question> findById(long id) {
        return questionDao.findById(id);
    }

    public long count() {
        return questionDao.count();
    }

    public void deleteById(long id) {
        questionDao.deleteById(id);
    }

    public Page<Question> findAll(String search, int currentPage, int pageSize) {
        return questionDao.findAll(search, currentPage, pageSize);
    }


    public List<Question> findByChapitreId(String search, int currentPage, int pageSize, long chapitreId) {
        return findAll(search, currentPage, pageSize).stream()
                .filter(question -> question.getChapitre() != null && question.getChapitre().getId() == chapitreId)
                .collect(Collectors.toList());
    }
}
