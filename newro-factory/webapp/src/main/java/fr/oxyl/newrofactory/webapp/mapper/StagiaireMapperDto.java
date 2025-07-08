package fr.oxyl.newrofactory.webapp.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.core.model.Stagiaire;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.AddStagiaireDto;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.DeleteStagiairesDto;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.StagiaireDto;

@Component
public final class StagiaireMapperDto {

    public StagiaireMapperDto() {}

    public Stagiaire map(AddStagiaireDto addStagiaireDto) {
        return new Stagiaire.Builder()
                .nom(addStagiaireDto.nom())
                .prenom(addStagiaireDto.prenom())
                .dateArrivee(addStagiaireDto.dateArrivee())
                .dateDepart(addStagiaireDto.dateDepart())
                .promotion(new Promotion(Long.parseLong(addStagiaireDto.promotionId()), null))
                .build();
    }

    public Stagiaire map(StagiaireDto stagiaireDto) {
        return new Stagiaire.Builder()
                .id(stagiaireDto.id())
                .nom(stagiaireDto.nom())
                .prenom(stagiaireDto.prenom())
                .dateArrivee(stagiaireDto.dateArrivee())
                .dateDepart(stagiaireDto.dateDepart())
                .promotion(new Promotion(Long.parseLong(stagiaireDto.promotionId()), null))
                .build();
    }

    public List<Stagiaire> map(DeleteStagiairesDto deleteStagiairesDto) {
        return deleteStagiairesDto.stagiaireDtos().stream()
                .map(stagiaireDto -> new Stagiaire.Builder()
                        .id(stagiaireDto.id())
                        .nom(null)
                        .prenom(null)
                        .dateArrivee(null)
                        .dateDepart(null)
                        .promotion(null)
                        .build())
                .toList();
    }

    public StagiaireDto mapToDto(Stagiaire stagiaire){
        return new StagiaireDto(
            stagiaire.getId(),
            stagiaire.getPrenom(),
            stagiaire.getNom(), 
            stagiaire.getDateArrivee(),
            stagiaire.getDateDepart(),
            String.valueOf((stagiaire.getPromotion().getId())));
    }

    public List<StagiaireDto> mapToDto(List<Stagiaire> stagiaires){
        return stagiaires.stream().map(this::mapToDto).toList();
    }
}
