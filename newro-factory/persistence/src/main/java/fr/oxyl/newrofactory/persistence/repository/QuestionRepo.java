package fr.oxyl.newrofactory.persistence.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.core.model.Question;
import fr.oxyl.newrofactory.persistence.internal.dao.QuestionInternalDao;
import fr.oxyl.newrofactory.persistence.internal.mapper.QuestionMapper;

@Service
public class QuestionRepo {

    private final QuestionInternalDao questionInternalDao;
    private final QuestionMapper questionMapper;

    public QuestionRepo(QuestionInternalDao questionInternalDao,
                        QuestionMapper questionMapper){
        this.questionInternalDao = questionInternalDao;
        this.questionMapper = questionMapper;
    }

    public Optional<Question> findById(long id){
        return questionMapper.map(questionInternalDao.findById(id));
    }

    public long count(){
        return questionInternalDao.count();
    }

    public void deleteById(long id){
        questionInternalDao.deleteById(id);
    }

    @Transactional(readOnly = true)
    public Page<Question> findAll(String search, int currentPage, int pageSize){
        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.unsorted());
        return questionInternalDao.findAll(search, pageable).map(questionMapper::map);
    }
}
