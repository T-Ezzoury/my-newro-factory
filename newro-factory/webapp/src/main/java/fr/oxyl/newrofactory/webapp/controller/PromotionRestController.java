package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import fr.oxyl.newrofactory.core.model.Promotion;
import fr.oxyl.newrofactory.service.PromotionService;
import fr.oxyl.newrofactory.webapp.dto.promotion.PromotionDto;
import fr.oxyl.newrofactory.webapp.dto.promotion.PromotionsDto;
import fr.oxyl.newrofactory.webapp.mapper.PromotionMapperDto;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/promotions")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class PromotionRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(PromotionRestController.class);

    private final PromotionService promotionService;
    private final PromotionMapperDto promotionMapperDto;

    public PromotionRestController(PromotionService promotionService,
            PromotionMapperDto promotionMapperDto) {
        this.promotionService = promotionService;
        this.promotionMapperDto = promotionMapperDto;
    }

    /**
     * Get all promotions
     * @return PromotionsDto containing all promotions
     */
    @GetMapping
    public PromotionsDto getPromotions() {
        LOGGER.debug("Getting all promotions");
        return new PromotionsDto(
                promotionMapperDto.mapToDto(
                        promotionService.findAll()));
    }

    /**
     * Get a specific promotion by ID
     * @param promotionId The ID of the promotion to retrieve
     * @return ResponseEntity containing the promotion or an error message
     */
    @GetMapping("/{promotionId}")
    public ResponseEntity<Object> getPromotion(@PathVariable("promotionId") long promotionId) {
        LOGGER.debug("Getting promotion with ID: {}", promotionId);

        Optional<Promotion> promotionOpt = promotionService.findById(promotionId);

        if (promotionOpt.isPresent()) {
            Promotion promotion = promotionOpt.get();
            PromotionDto promotionDto = promotionMapperDto.mapToDto(promotion);
            return new ResponseEntity<>(promotionDto, HttpStatus.OK);
        } else {
            LOGGER.error("Promotion with ID {} not found", promotionId);
            return new ResponseEntity<>("Promotion not found", HttpStatus.NOT_FOUND);
        }
    }
}
