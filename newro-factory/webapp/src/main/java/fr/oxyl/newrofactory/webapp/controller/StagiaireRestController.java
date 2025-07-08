package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.core.model.Stagiaire;
import fr.oxyl.newrofactory.service.PromotionService;
import fr.oxyl.newrofactory.service.StagiaireService;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.AddStagiaireDto;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.StagiaireDto;
import fr.oxyl.newrofactory.webapp.dto.stagiaire.StagiairesDto;
import fr.oxyl.newrofactory.webapp.mapper.PromotionMapperDto;
import fr.oxyl.newrofactory.webapp.mapper.StagiaireMapperDto;

@RestController
@RequestMapping("/api/stagiaires")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class StagiaireRestController {

    private final StagiaireService stagiaireService;
    private final StagiaireMapperDto stagiaireMapperDto;

    public StagiaireRestController(StagiaireService stagiaireService, StagiaireMapperDto stagiaireMapperDto,
            PromotionService promotionService, PromotionMapperDto promotionMapperDto) {
        this.stagiaireService = stagiaireService;
        this.stagiaireMapperDto = stagiaireMapperDto;
    }

    @GetMapping("")
    public StagiairesDto getDashboard(@RequestParam(name = "search", required = false) String search,
            @RequestParam(name = "currentPage", required = false, defaultValue = "0") int currentPage,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {

        return new StagiairesDto(stagiaireService.findAll(search, currentPage, pageSize).map(stagiaireMapperDto::mapToDto).getContent());
    }

    @GetMapping("/{stagiaireId}")
    public StagiaireDto getStagiaire(@PathVariable("stagiaireId") long stagiaireId) {
        Stagiaire stagiaire = stagiaireService.findById(stagiaireId).orElse(null);
        return stagiaireMapperDto.mapToDto(stagiaire);

    }

    @GetMapping("/total")
    public long getCountStagiaire() {
        return stagiaireService.countAll();
    }


    @PostMapping("/stagiaire")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> creeStagiaire(@RequestBody AddStagiaireDto addStagiaireDto) {
        Stagiaire stagiaire = stagiaireMapperDto.map(addStagiaireDto);
        stagiaireService.create(stagiaire);
        return new ResponseEntity<>("Création effectué avec succès", HttpStatus.OK);
    }

    @PatchMapping("/{stagiaireId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> updateStagiaire(@RequestBody StagiaireDto stagiaireDto) {
        stagiaireService.update(stagiaireMapperDto.map(stagiaireDto));
        return new ResponseEntity<>("Supression effectué avec succès", HttpStatus.OK);
    }

    @DeleteMapping("/{stagiaireId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> deleteStagiaire(@PathVariable("stagiaireId") long stagiaireId) {
        stagiaireService.delete(stagiaireId);
        return new ResponseEntity<>("Supression effectué avec succès", HttpStatus.OK);
    }
}
