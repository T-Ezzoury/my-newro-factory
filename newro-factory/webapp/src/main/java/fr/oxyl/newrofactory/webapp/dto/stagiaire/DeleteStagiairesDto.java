package fr.oxyl.newrofactory.webapp.dto.stagiaire;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public record DeleteStagiairesDto(
        @JsonProperty List<StagiaireDto> stagiaireDtos) {

}
