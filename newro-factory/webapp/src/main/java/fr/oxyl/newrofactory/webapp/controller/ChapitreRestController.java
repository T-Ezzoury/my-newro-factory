package fr.oxyl.newrofactory.webapp.controller;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import fr.oxyl.newrofactory.core.model.Chapitre;
import fr.oxyl.newrofactory.service.ChapitreService;
import fr.oxyl.newrofactory.webapp.dto.chapitre.ChapitreDto;
import fr.oxyl.newrofactory.webapp.dto.chapitre.ChapitresAffichageDto;
import fr.oxyl.newrofactory.webapp.mapper.ChapitreMapperDto;

@RestController
@RequestMapping("/api/chapters")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class ChapitreRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ChapitreRestController.class);

    private final ChapitreService chapitreService;
    private final ChapitreMapperDto chapitreMapperDto;

    public ChapitreRestController(ChapitreService chapitreService, ChapitreMapperDto chapitreMapperDto) {
        this.chapitreService = chapitreService;
        this.chapitreMapperDto = chapitreMapperDto;
    }

    /**
     * Get the count of chapters
     * @return ResponseEntity containing the count of chapters
     */
    @GetMapping("/count")
    public ResponseEntity<Long> getChapitreCount() {
        LOGGER.debug("Getting chapter count");
        long count = chapitreService.compterChapitres();
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    /**
     * Get all chapters
     * @return List of all chapters
     */
    @GetMapping("")
    public ChapitresAffichageDto getChapitres(@RequestParam(name = "search", required = false) String search,
            @RequestParam(name = "sortBy", required = false, defaultValue = "id") String sortBy,
            @RequestParam(name = "currentPage", required = false, defaultValue = "0") int currentPage,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) 
    {
        return new ChapitresAffichageDto(chapitreService.findAll(search, currentPage, pageSize).map(chapitreMapperDto::mapToAffichageDto).getContent());
    }


    /**
     * Get a specific chapter by ID
     * @param chapitreId The ID of the chapter to retrieve
     * @return ResponseEntity containing the chapter or an error message
     */
    @GetMapping("/{chapitreId}")
    public ResponseEntity<Object> getChapitre(@PathVariable("chapitreId") long chapitreId) {
        LOGGER.debug("Getting chapter with ID: {}", chapitreId);

        Optional<Chapitre> chapitreOpt = chapitreService.findById(chapitreId);

        if (chapitreOpt.isPresent()) {
            Chapitre chapitre = chapitreOpt.get();
            ChapitreDto chapitreDto = chapitreMapperDto.mapToDto(chapitre);
            return new ResponseEntity<>(chapitreDto, HttpStatus.OK);
        } else {
            LOGGER.error("Chapter with ID {} not found", chapitreId);
            return new ResponseEntity<>("Chapter not found", HttpStatus.NOT_FOUND);
        }
    }


    /**
     * Get the total of chapters
     * @return number of chapters
     */
    @GetMapping("/total")
    public long getCountChapitre() {
        return chapitreService.compterChapitres();
    }


    /**
     * Create a new chapter
     * @param chapitreDto The chapter data to create
     * @return ResponseEntity containing the created chapter or an error message
     */
    @PostMapping
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<Object> createChapitre(@RequestBody ChapitreDto chapitreDto) {
        LOGGER.debug("Creating new chapter");

        try {
            Chapitre chapitre = chapitreMapperDto.map(chapitreDto);
            Chapitre savedChapitre = chapitreService.save(chapitre);
            ChapitreDto savedChapitreDto = chapitreMapperDto.mapToDto(savedChapitre);
            return new ResponseEntity<>(savedChapitreDto, HttpStatus.CREATED);
        } catch (Exception e) {
            LOGGER.error("Error creating chapter: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error creating chapter: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Update a chapter
     * @param chapitreId The ID of the chapter to update
     * @param chapitreDto The updated chapter data
     * @return ResponseEntity containing the updated chapter or an error message
     */
    @PatchMapping("/{chapitreId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<Object> updateChapitre(@PathVariable("chapitreId") long chapitreId, @RequestBody ChapitreDto chapitreDto) {
        LOGGER.debug("Updating chapter with ID: {}", chapitreId);

        Optional<Chapitre> chapitreOpt = chapitreService.findById(chapitreId);

        if (chapitreOpt.isEmpty()) {
            LOGGER.error("Chapter with ID {} not found", chapitreId);
            return new ResponseEntity<>("Chapter not found", HttpStatus.NOT_FOUND);
        }

        try {
            Chapitre chapitre = chapitreMapperDto.map(chapitreDto);
            chapitre.setId(chapitreId); // Ensure the ID is set correctly
            Chapitre updatedChapitre = chapitreService.save(chapitre);
            ChapitreDto updatedChapitreDto = chapitreMapperDto.mapToDto(updatedChapitre);
            return new ResponseEntity<>(updatedChapitreDto, HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error("Error updating chapter: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error updating chapter: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Delete a chapter
     * @param chapitreId The ID of the chapter to delete
     * @return ResponseEntity containing a success message or an error message
     */
    @DeleteMapping("/{chapitreId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> deleteChapitre(@PathVariable("chapitreId") long chapitreId) {
        LOGGER.debug("Deleting chapter with ID: {}", chapitreId);

        Optional<Chapitre> chapitreOpt = chapitreService.findById(chapitreId);

        if (chapitreOpt.isEmpty()) {
            LOGGER.error("Chapter with ID {} not found", chapitreId);
            return new ResponseEntity<>("Chapter not found", HttpStatus.NOT_FOUND);
        }

        try {
            chapitreService.deleteById(chapitreId);
            return new ResponseEntity<>("Chapter deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error("Error deleting chapter: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error deleting chapter: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Get all chapters that have the specified chapter as a parent
     * @param parentId The ID of the parent chapter
     * @return ResponseEntity containing the list of chapters or an error message
     */
    @GetMapping("/parent/{parentId}")
    public ResponseEntity<Object> getChapitresByParent(@PathVariable("parentId") long parentId) {
        LOGGER.debug("Getting chapters with parent ID: {}", parentId);

        Optional<Chapitre> parentOpt = chapitreService.findById(parentId);

        if (parentOpt.isEmpty()) {
            LOGGER.error("Parent chapter with ID {} not found", parentId);
            return new ResponseEntity<>("Parent chapter not found", HttpStatus.NOT_FOUND);
        }

        List<Chapitre> children = chapitreService.findByParentId(parentId);
        List<ChapitreDto> childrenDto = chapitreMapperDto.mapToDto(children);
        return new ResponseEntity<>(childrenDto, HttpStatus.OK);
    }
}
