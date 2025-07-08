package fr.oxyl.newrofactory.webapp.dto.reponse;

import com.fasterxml.jackson.annotation.JsonProperty;

public record ReponseDto(

        @JsonProperty long id,

        @JsonProperty String label,

        @JsonProperty String contenu,

        @JsonProperty("is_correct") boolean isCorrect) {

}
