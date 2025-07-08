package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Reponse;
import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;


@Component
public final class ReponseMapper{

    public ReponseMapper() {}

    public Reponse map(ResponseEntity responseEntity) {
        if(responseEntity == null) {
            return null;
        }
        return new Reponse(
            responseEntity.getId(),
            responseEntity.getLabel(),
            responseEntity.getText(),
            responseEntity.isValidAnswer()
        );
    }

    public List<Reponse> map(List<ResponseEntity> responseEntities) {
        if(responseEntities == null) {
            return null;
        }
        return responseEntities.stream()
                .map(this::map)
                .toList();
    }
    
}
