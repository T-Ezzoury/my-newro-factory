package fr.oxyl.newrofactory.webapp.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Reponse;
import fr.oxyl.newrofactory.webapp.dto.reponse.ReponseDto;

@Component
public class ReponseMapperDto {

    public ReponseDto mapToDto(Reponse reponse){
        return new ReponseDto(
            reponse.getId(), 
            reponse.getLabel(), 
            reponse.getContenu(), 
            reponse.isCorrect());
    }

    public List<ReponseDto> mapToDto(List<Reponse> reponses){
        return reponses.stream().map(this::mapToDto).toList();
    }
    
}
