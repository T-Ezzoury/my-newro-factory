package fr.oxyl.newrofactory.persistence.internal.mapper;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Chapitre;
import fr.oxyl.newrofactory.persistence.internal.entity.ChapitreEntity;

@Component
public class ChapitreMapper {

    public ChapitreMapper() {}

    public Chapitre map(ChapitreEntity chapitreEntity) {
        if (chapitreEntity == null) {
            return null;
        }
        return new Chapitre(
            chapitreEntity.getId(),
            chapitreEntity.getName(),
            null
        );
    }

    public List<Chapitre> map(List<ChapitreEntity> chapitreEntities) {
        if (chapitreEntities == null) {
            return null;
        }
        return chapitreEntities.stream()
                .map(this::map)
                .toList();
    }

    public List<Chapitre> map(Iterable<ChapitreEntity> chapitreEntities) {
        if (chapitreEntities == null) {
            return null;
        }
        return StreamSupport.stream(chapitreEntities.spliterator(), false)
                .map(this::map)
                .collect(Collectors.toList());
    }

    public Optional<Chapitre> map(Optional<ChapitreEntity> chapitreEntityOpt) {
        if (chapitreEntityOpt == null || chapitreEntityOpt.isEmpty()) {
            return Optional.empty();
        }
        return Optional.of(map(chapitreEntityOpt.get()));
    }

    public ChapitreEntity mapToEntity(Chapitre chapitre) {
        if (chapitre == null) {
            return null;
        }
        return new ChapitreEntity(
            chapitre.getId(),
            chapitre.getNom(),
            chapitre.getParents() == null ? null : 
                chapitre.getParents().stream()
                    .map(this::mapToEntity)
                    .collect(Collectors.toList())
        );
    }
}
