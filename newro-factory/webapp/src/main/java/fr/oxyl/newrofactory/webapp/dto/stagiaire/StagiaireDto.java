package fr.oxyl.newrofactory.webapp.dto.stagiaire;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import fr.oxyl.newrofactory.webapp.dto.promotion.PromotionDto;

public record StagiaireDto(

        @JsonProperty Long id,

        @JsonProperty String prenom,

        @JsonProperty String nom,

        @JsonProperty("date_arrivee") @JsonFormat(pattern = "yyyy-MM-dd") LocalDate dateArrivee,

        @JsonProperty("date_depart") @JsonFormat(pattern = "yyyy-MM-dd") LocalDate dateDepart,

        @JsonProperty String promotionId) {
    public String dateArriveeIso() {
        if (dateArrivee == null) {
            return null;
        }
        return dateArrivee.format(DateTimeFormatter.ISO_LOCAL_DATE);
    }

    public String dateDepartIso() {
        if (dateDepart == null) {
            return null;
        }
        return dateDepart.format(DateTimeFormatter.ISO_LOCAL_DATE);
    }
}
