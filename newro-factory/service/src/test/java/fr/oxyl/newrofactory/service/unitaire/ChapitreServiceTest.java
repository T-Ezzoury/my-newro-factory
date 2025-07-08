package fr.oxyl.newrofactory.service.unitaire;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import fr.oxyl.newrofactory.persistence.repository.ChapitreRepo;
import fr.oxyl.newrofactory.service.ChapitreService;

@ExtendWith(MockitoExtension.class)
class ChapitreServiceTest {

    @Mock
    ChapitreRepo chapitreDao;
    @InjectMocks  ChapitreService service;

    @Test
    void compterChapitres() {
        when(chapitreDao.count()).thenReturn(5L);

        assertEquals(5L, service.compterChapitres());
        verify(chapitreDao).count();
    }
}
