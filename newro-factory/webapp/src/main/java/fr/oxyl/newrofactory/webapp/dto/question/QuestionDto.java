package fr.oxyl.newrofactory.webapp.dto.question;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import fr.oxyl.newrofactory.webapp.dto.chapitre.ChapitreDto;
import fr.oxyl.newrofactory.webapp.dto.reponse.ReponseDto;

public record QuestionDto(
                @JsonProperty long id,

                @JsonProperty String titre,

                @JsonProperty String contenu,

                @JsonProperty ChapitreDto chapitre,

                @JsonProperty List<ReponseDto> reponses) {
}
