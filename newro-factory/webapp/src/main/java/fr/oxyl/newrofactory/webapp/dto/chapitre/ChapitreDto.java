package fr.oxyl.newrofactory.webapp.dto.chapitre;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public record ChapitreDto(
        @JsonProperty Long id,
        @JsonProperty String titre,
        @JsonProperty List<ChapitreDto> parents) {

}
