package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.Optional;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Stagiaire;
import fr.oxyl.newrofactory.persistence.internal.entity.StagiaireEntity;

@Component
public final class StagiaireMapper {
    
    private final PromotionMapper promotionMapperDao;

    public StagiaireMapper(PromotionMapper promotionMapperDao) {
        this.promotionMapperDao = promotionMapperDao;
    }

    public Stagiaire map(StagiaireEntity stagiaireEntity) {
        if (stagiaireEntity == null) {
            return null;
        }
        return Stagiaire.builder()
            .id(stagiaireEntity.getId())
            .nom(stagiaireEntity.getLastName())
            .prenom(stagiaireEntity.getFirstName())
            .dateArrivee(stagiaireEntity.getArrival())
            .dateDepart(stagiaireEntity.getFormationOver())
            .promotion(promotionMapperDao.map(stagiaireEntity.getPromotion()))
            .build();
    }

    public Optional<Stagiaire> map(Optional<StagiaireEntity> stagiaireEntity) {
        return stagiaireEntity.map(this::map);
    }

   public StagiaireEntity map(Stagiaire stagiaire){
        return new StagiaireEntity(
            stagiaire.getId(), 
            stagiaire.getNom(), 
            stagiaire.getPrenom(), 
            stagiaire.getDateArrivee(), 
            stagiaire.getDateDepart(), 
            promotionMapperDao.map(stagiaire.getPromotion()));
   }

}
