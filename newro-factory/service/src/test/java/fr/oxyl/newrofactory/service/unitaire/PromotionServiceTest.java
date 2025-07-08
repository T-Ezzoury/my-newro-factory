package fr.oxyl.newrofactory.service.unitaire;

import static org.mockito.Mockito.verify;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import fr.oxyl.newrofactory.persistence.repository.PromotionRepo;
import fr.oxyl.newrofactory.service.PromotionService;

@ExtendWith(MockitoExtension.class)
class PromotionServiceTest {

    @Mock
    PromotionRepo promotionDao;
    @InjectMocks  PromotionService service;

    @Test
    void findAll() {
        service.findAll();
        verify(promotionDao).findAll();
    }
}
