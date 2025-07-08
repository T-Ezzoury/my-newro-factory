package fr.oxyl.newrofactory.webapp.dto.promotion;

import com.fasterxml.jackson.annotation.JsonProperty;

public record PromotionDto(
        @JsonProperty Long id,
        @JsonProperty String nom) {
}
