package fr.oxyl.newrofactory.webapp.mapper;
import java.util.List;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.webapp.dto.promotion.PromotionDto;


@Component
public final class PromotionMapperDto {

    public PromotionMapperDto(){
    }

    public PromotionDto mapToDto(Promotion promotion){
        return new PromotionDto(
            promotion.getId(),
            promotion.getNom());
    }

    public List<PromotionDto> mapToDto(List<Promotion> promotions){
        return promotions.stream().map(this::mapToDto).toList();
    }
}
