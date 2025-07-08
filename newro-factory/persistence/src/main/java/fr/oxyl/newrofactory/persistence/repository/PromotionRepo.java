package fr.oxyl.newrofactory.persistence.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.persistence.internal.dao.PromotionInternalDao;
import fr.oxyl.newrofactory.persistence.internal.mapper.PromotionMapper;

@Service
public class PromotionRepo {

    private final PromotionInternalDao promotionInternalDao;
    private final PromotionMapper promotionMapper;

    public PromotionRepo(PromotionInternalDao promotionInternalDao,
                         PromotionMapper promotionMapper){
        this.promotionInternalDao = promotionInternalDao;
        this.promotionMapper = promotionMapper;
    }

    public List<Promotion> findAll(){
        return promotionMapper.map(promotionInternalDao.findAll());
    }

    public Optional<Promotion> findById(long id){
        return promotionMapper.map(promotionInternalDao.findById(id));
    }
    
}
