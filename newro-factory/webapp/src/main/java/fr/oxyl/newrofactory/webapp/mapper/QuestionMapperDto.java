package fr.oxyl.newrofactory.webapp.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Question;
import fr.oxyl.newrofactory.webapp.dto.question.QuestionAffichageDto;
import fr.oxyl.newrofactory.webapp.dto.question.QuestionDto;

@Component
public class QuestionMapperDto {

    private final ChapitreMapperDto chapitreMapperDto;
    private final ReponseMapperDto reponseMapperDto;

    public QuestionMapperDto(ChapitreMapperDto chapitreMapperDto,
            ReponseMapperDto reponseMapperDto) {
        this.chapitreMapperDto = chapitreMapperDto;
        this.reponseMapperDto = reponseMapperDto;
    }

    public QuestionDto mapToDto(Question question) {
        return new QuestionDto(
                question.getId(),
                question.getTitre(),
                question.getContenu(),
                chapitreMapperDto.mapToDtoWithoutParent(question.getChapitre()),
                reponseMapperDto.mapToDto(question.getReponses())    
            );
    }

     public QuestionAffichageDto mapToAffichageDto(Question question) {
        return new QuestionAffichageDto(
                question.getTitre(),
                question.getContenu(),
                question.getChapitre().getNom());
    }

    public QuestionDto mapToDto(Optional<Question> optional) {
        return optional.map(this::mapToDto).orElseThrow();
    }

    public List<QuestionDto> mapToDto(List<Question> questions) {
        if (questions == null) {
            return null;
        }

        List<QuestionDto> questionDtos = new ArrayList<>();
        for (Question question : questions) {
            questionDtos.add(mapToDto(question));
        }
        return questionDtos;
    }
}
