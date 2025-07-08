package fr.oxyl.newrofactory.webapp.mapper;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;
import fr.oxyl.newrofactory.webapp.dto.reponse.ReponseDto;

@Component
public class ResponseEntityMapperDto {

    public ReponseDto mapToDto(ResponseEntity responseEntity) {
        if (responseEntity == null) {
            return null;
        }
        return new ReponseDto(
            responseEntity.getId(),
            responseEntity.getLabel(),
            responseEntity.getText(),
            responseEntity.isValidAnswer()
        );
    }

    public List<ReponseDto> mapToDto(Iterable<ResponseEntity> responseEntities) {
        if (responseEntities == null) {
            return null;
        }
        return StreamSupport.stream(responseEntities.spliterator(), false)
                .map(this::mapToDto)
                .collect(Collectors.toList());
    }
}