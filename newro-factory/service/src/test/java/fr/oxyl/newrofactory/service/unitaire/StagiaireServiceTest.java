package fr.oxyl.newrofactory.service.unitaire;

import static org.mockito.Mockito.verify;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import fr.oxyl.newrofactory.persistence.repository.StagiaireRepo;
import fr.oxyl.newrofactory.service.StagiaireService;

@ExtendWith(MockitoExtension.class)
class StagiaireServiceTest {

    @Mock
    StagiaireRepo stagiaireDao;
    @InjectMocks  StagiaireService service;

    @Test
    void delete() {
        service.delete(99L);
        verify(stagiaireDao).deleteById(99L);
    }
}
