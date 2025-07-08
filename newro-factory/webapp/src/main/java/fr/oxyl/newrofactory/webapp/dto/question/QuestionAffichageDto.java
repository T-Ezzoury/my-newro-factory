package fr.oxyl.newrofactory.webapp.dto.question;

import com.fasterxml.jackson.annotation.JsonProperty;


public record QuestionAffichageDto(
        @JsonProperty String titre,

        @JsonProperty String contenu,

        @JsonProperty String chapitreTitle) {
}