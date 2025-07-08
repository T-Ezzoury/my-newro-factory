package fr.oxyl.newrofactory.webapp.mapper;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.model.Chapitre;
import fr.oxyl.newrofactory.webapp.dto.chapitre.ChapitreAffichageDto;
import fr.oxyl.newrofactory.webapp.dto.chapitre.ChapitreDto;

@Component
public class ChapitreMapperDto {

    public ChapitreDto mapToDtoWithoutParent(Chapitre chapitre){
        if (chapitre == null) {
            return null;
        }
        return new ChapitreDto(
            chapitre.getId(), 
            chapitre.getNom(),
            null);
    }

    public ChapitreAffichageDto mapToAffichageDto(Chapitre chapitre)
    {
        return new ChapitreAffichageDto(chapitre.getNom());
    }

    public ChapitreDto mapToAffichageDto(Optional<Chapitre> optional) 
    {
        return optional.map(this::mapToDtoWithoutParent).orElseThrow();
    }

    public ChapitreDto mapToDto(Chapitre chapitre) 
    {
        if (chapitre == null) 
        {
            return null;
        }
        List<ChapitreDto> parentDtos = null;
        if (chapitre.getParents() != null) {
            parentDtos = chapitre.getParents().stream()
                .map(this::mapToDtoWithoutParent)
                .collect(Collectors.toList());
        }
        return new ChapitreDto(
            chapitre.getId(),
            chapitre.getNom(),
            parentDtos);
    }

    public List<ChapitreDto> mapToDto(List<Chapitre> chapitres) {
        if (chapitres == null) {
            return null;
        }
        return chapitres.stream()
            .map(this::mapToDto)
            .collect(Collectors.toList());
    }

    public Chapitre map(ChapitreDto chapitreDto) {
        if (chapitreDto == null) {
            return null;
        }
        List<Chapitre> parents = null;
        if (chapitreDto.parents() != null) {
            parents = chapitreDto.parents().stream()
                .map(this::map)
                .collect(Collectors.toList());
        }
        return new Chapitre(
            chapitreDto.id() != null ? chapitreDto.id() : 0,
            chapitreDto.titre(),
            parents);
    }
}
