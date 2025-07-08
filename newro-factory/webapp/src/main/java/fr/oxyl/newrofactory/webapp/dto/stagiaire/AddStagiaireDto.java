package fr.oxyl.newrofactory.webapp.dto.stagiaire;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

public record AddStagiaireDto(
        @JsonProperty String prenom,

        @JsonProperty String nom,

        @JsonProperty("date_arrivee") @JsonFormat(pattern = "yyyy-MM-dd") LocalDate dateArrivee,

        @JsonProperty("date_depart") @JsonFormat(pattern = "yyyy-MM-dd") LocalDate dateDepart,

        @JsonProperty String promotionId) {

}
