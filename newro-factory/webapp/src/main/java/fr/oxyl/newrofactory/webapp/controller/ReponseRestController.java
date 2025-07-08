package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.service.ReponseService;
import fr.oxyl.newrofactory.webapp.dto.reponse.ReponseDto;
import fr.oxyl.newrofactory.webapp.mapper.ResponseEntityToDtoMapper;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/reponses")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class ReponseRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ReponseRestController.class);

    private final ReponseService reponseService;
    private final ResponseEntityToDtoMapper responseEntityToDtoMapper;

    public ReponseRestController(ReponseService reponseService, ResponseEntityToDtoMapper responseEntityToDtoMapper) {
        this.reponseService = reponseService;
        this.responseEntityToDtoMapper = responseEntityToDtoMapper;
    }

    /**
     * Get all responses
     * @return List of all responses
     */
    @GetMapping
    public List<ReponseDto> getAllReponses() {
        LOGGER.debug("Getting all responses");
        Iterable<fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity> reponses = reponseService.findAll();
        return responseEntityToDtoMapper.mapToDto(reponses);
    }

    /**
     * Get a specific response by ID
     * @param reponseId The ID of the response to retrieve
     * @return ResponseEntity containing the response or an error message
     */
    @GetMapping("/{reponseId}")
    public ResponseEntity<Object> getReponse(@PathVariable("reponseId") long reponseId) {
        LOGGER.debug("Getting response with ID: {}", reponseId);

        Optional<fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity> reponseOpt = reponseService.findById(reponseId);

        if (reponseOpt.isPresent()) {
            fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity reponseEntity = reponseOpt.get();
            ReponseDto reponseDto = responseEntityToDtoMapper.mapToDto(reponseEntity);
            return new ResponseEntity<>(reponseDto, HttpStatus.OK);
        } else {
            LOGGER.error("Response with ID {} not found", reponseId);
            return new ResponseEntity<>("Response not found", HttpStatus.NOT_FOUND);
        }
    }

    /**
     * Create a new response
     * @param reponseDto The response data to create
     * @return ResponseEntity containing success message or error
     */
    @PostMapping
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> createReponse(@RequestBody ReponseDto reponseDto) {
        LOGGER.debug("Creating new response");

        // Convert ReponseDto to ResponseEntity
        fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity reponseEntity = new fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity();
        reponseEntity.setLabel(reponseDto.label());
        reponseEntity.setText(reponseDto.contenu());
        reponseEntity.setValidAnswer(reponseDto.isCorrect());

        reponseService.save(reponseEntity);
        return new ResponseEntity<>("Response created successfully", HttpStatus.CREATED);
    }

    /**
     * Update an existing response
     * @param reponseId The ID of the response to update
     * @param reponseDto The updated response data
     * @return ResponseEntity containing success message or error
     */
    @PutMapping("/{reponseId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> updateReponse(@PathVariable("reponseId") long reponseId, @RequestBody ReponseDto reponseDto) {
        LOGGER.debug("Updating response with ID: {}", reponseId);

        Optional<fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity> reponseOpt = reponseService.findById(reponseId);

        if (reponseOpt.isPresent()) {
            fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity reponseEntity = reponseOpt.get();
            reponseEntity.setLabel(reponseDto.label());
            reponseEntity.setText(reponseDto.contenu());
            reponseEntity.setValidAnswer(reponseDto.isCorrect());

            reponseService.save(reponseEntity);
            return new ResponseEntity<>("Response updated successfully", HttpStatus.OK);
        } else {
            LOGGER.error("Response with ID {} not found", reponseId);
            return new ResponseEntity<>("Response not found", HttpStatus.NOT_FOUND);
        }
    }

    /**
     * Delete a response
     * @param reponseId The ID of the response to delete
     * @return ResponseEntity containing success message or error
     */
    @DeleteMapping("/{reponseId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> deleteReponse(@PathVariable("reponseId") long reponseId) {
        LOGGER.debug("Deleting response with ID: {}", reponseId);

        Optional<fr.oxyl.newrofactory.persistence.internal.entity.ResponseEntity> reponseOpt = reponseService.findById(reponseId);

        if (reponseOpt.isPresent()) {
            reponseService.deleteById(reponseId);
            return new ResponseEntity<>("Response deleted successfully", HttpStatus.OK);
        } else {
            LOGGER.error("Response with ID {} not found", reponseId);
            return new ResponseEntity<>("Response not found", HttpStatus.NOT_FOUND);
        }
    }
}
