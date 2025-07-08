package fr.oxyl.newrofactory.service.unitaire;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import static org.mockito.Mockito.when;
import org.mockito.junit.jupiter.MockitoExtension;

import fr.oxyl.newrofactory.persistence.repository.QuestionRepo;
import fr.oxyl.newrofactory.service.QuestionService;

@ExtendWith(MockitoExtension.class)
class QuestionServiceTest {

    @Mock
    QuestionRepo questionDao;
    @InjectMocks  QuestionService service;

    @Test
    void count() {
        when(questionDao.count()).thenReturn(12L);
        assertEquals(12L, service.count());
    }
}
