package fr.oxyl.newrofactory.persistence.internal.mapper;
import java.util.List;
import java.util.Optional;
import java.util.stream.StreamSupport;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.persistence.internal.entity.PromotionEntity;


@Component
public final class PromotionMapper {

    public Promotion map(PromotionEntity promotionEntity){
        if (promotionEntity == null) {
            return null;
        }
        return new Promotion(promotionEntity.getId(),
                promotionEntity.getName());
    }

    public Optional<Promotion> map(Optional<PromotionEntity> promotionEntity) {
        return promotionEntity.map(this::map);
    }

    public List<Promotion> map(Iterable<PromotionEntity> promotionEntities) {
        return StreamSupport
            .stream(promotionEntities.spliterator(), false)
            .map(this::map)
            .toList();
    }

    public PromotionEntity map(Promotion promotion) {
        if (promotion == null) {
            return null;
        }
        return new PromotionEntity(promotion.getId(),
                promotion.getNom());
    }

    
}
