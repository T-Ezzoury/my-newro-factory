package fr.oxyl.newrofactory.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.persistence.repository.PromotionRepo;


@Service
public final class PromotionService {
    private final PromotionRepo promotionDao;

    private PromotionService(PromotionRepo promotionDao) {
        this.promotionDao = promotionDao;
    }

    public List<Promotion> findAll() {
        return promotionDao.findAll();
    }

    public Optional<Promotion> findById(long id){
        return promotionDao.findById(id);
    }

}
