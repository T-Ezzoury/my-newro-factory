package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.PromotionEntity;

@Repository
public interface PromotionInternalDao extends CrudRepository<PromotionEntity, Long> {

    Optional<PromotionEntity> findById(long id);
}
