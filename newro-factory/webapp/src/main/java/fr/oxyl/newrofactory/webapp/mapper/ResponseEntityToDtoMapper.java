package fr.oxyl.newrofactory.webapp.mapper;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity;
import fr.oxyl.newrofactory.webapp.dto.reponse.ReponseDto;

/**
 * Mapper for converting ResponseEntity objects to ReponseDto objects
 * This mapper is specifically designed to avoid naming conflicts with Spring's ResponseEntity class
 */
@Component
public class ResponseEntityToDtoMapper {

    /**
     * Convert a single ResponseEntity to a ReponseDto
     * @param responseEntity The ResponseEntity to convert
     * @return The converted ReponseDto
     */
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

    /**
     * Convert a collection of ResponseEntity objects to a list of ReponseDto objects
     * @param responseEntities The ResponseEntity objects to convert
     * @return The converted list of ReponseDto objects
     */
    public List<ReponseDto> mapToDto(Iterable<ResponseEntity> responseEntities) {
        if (responseEntities == null) {
            return null;
        }
        return StreamSupport.stream(responseEntities.spliterator(), false)
                .map(this::mapToDto)
                .collect(Collectors.toList());
    }
}