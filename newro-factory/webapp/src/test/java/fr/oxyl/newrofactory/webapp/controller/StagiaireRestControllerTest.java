// package fr.oxyl.newrofactory.webapp.controller.rest;

// import static org.mockito.ArgumentMatchers.any;
// import static org.mockito.Mockito.doNothing;
// import static org.mockito.Mockito.when;
// import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
// import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

// import com.fasterxml.jackson.databind.ObjectMapper;
// import fr.oxyl.newrofactory.core.model.Stagiaire;
// import fr.oxyl.newrofactory.service.StagiaireService;
// import fr.oxyl.newrofactory.webapp.dto.AddStagiaireDto;
// import fr.oxyl.newrofactory.webapp.dto.StagiaireDto;
// import fr.oxyl.newrofactory.webapp.mapper.StagiaireMapperDto;
// import org.junit.jupiter.api.DisplayName;
// import org.junit.jupiter.api.Test;
// import org.mockito.Mock;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.domain.Page;
// import org.springframework.data.domain.PageImpl;
// import org.springframework.http.MediaType;
// import org.springframework.test.context.bean.override.mockito.MockitoBean;
// import org.springframework.test.web.servlet.MockMvc;

// import java.time.LocalDate;
// import java.util.Collections;
// import java.util.List;
// import java.util.Optional;

// class StagiaireRestControllerTest {

//     @Autowired
//     private MockMvc mockMvc;

//     @MockitoBean
//     private StagiaireService stagiaireService;

//     @MockitoBean
//     private StagiaireMapperDto stagiaireMapperDto;

//     @Autowired
//     private ObjectMapper objectMapper;

//     @Test
//     @DisplayName("GET all stagiaires - empty list")
//     void testGetAllStagiairesEmpty() throws Exception {
//         when(stagiaireService.findAll(null)).thenReturn(new PageImpl<>(Collections.emptyList()));

//         mockMvc.perform(get("/api/v1/stagiaires"))
//                .andExpect(status().isOk())
//                .andExpect(content().json("[]"));
//     }

//     @Test
//     @DisplayName("GET all stagiaires - one element")
//     void testGetAllStagiairesOne() throws Exception {
//         // Préparer entité et DTO
//         Stagiaire entity = Stagiaire.builder().id(1L).build();
//         // ... définir d'autres champs si nécessaire
//         StagiaireDto dto = new StagiaireDto(
//             1L, "Jean", "Dupont", LocalDate.of(2025,1,1), LocalDate.of(2025,6,1), null
//         );

//         when(stagiaireService.findAll(null)).thenReturn(new PageImpl<>(List.of(entity)));
//         when(stagiaireMapperDto.mapToDto(entity)).thenReturn(dto);

//         mockMvc.perform(get("/api/v1/stagiaires"))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("[0].id").value((Object) 1))
//                .andExpect(jsonPath("[0].prenom").value((Object) "Jean"))
//                .andExpect(jsonPath("[0].nom").value((Object) "Dupont"));
//     }

//     @Test
//     @DisplayName("GET one stagiaire - found")
//     void testGetStagiaireFound() throws Exception {
//         Long id = 5L;
//         Stagiaire entity = Stagiaire.builder().id(id).build();
//         StagiaireDto dto = new StagiaireDto(id, "Alice", "Martin", LocalDate.of(2025,2,2), null, null);

//         when(stagiaireService.findById(id)).thenReturn(Optional.of(entity));
//         when(stagiaireMapperDto.mapToDto(entity)).thenReturn(dto);

//         mockMvc.perform(get("/api/v1/stagiaires/{id}", id)
//                .param("stagiaireId", id.toString()))
//                .andExpect(status().isOk())
//                .andExpect(jsonPath("$.prenom").exists())
//                .andExpect(jsonPath("$.prenom").value((Object) "Alice"));
//     }

//     @Test
//     @DisplayName("GET one stagiaire - not found")
//     void testGetStagiaireNotFound() throws Exception {
//         Long id = 99L;
//         when(stagiaireService.findById(id)).thenReturn(Optional.empty());

//         mockMvc.perform(get("/api/v1/stagiaires/{id}", id)
//                .param("stagiaireId", id.toString()))
//                .andExpect(status().isOk())
//                .andExpect(content().string("")); // DTO null map yields empty body
//     }

//     @Test
//     @DisplayName("POST create stagiaire - success")
//     void testCreateStagiaire() throws Exception {
//         AddStagiaireDto addDto = new AddStagiaireDto("Paul", "Durand", LocalDate.of(2025,3,3), null, 1L);
//         Stagiaire entity = Stagiaire.builder().build();
//         when(stagiaireMapperDto.map(addDto)).thenReturn(entity);
//         doNothing().when(stagiaireService).create(entity);

//         mockMvc.perform(post("/api/v1/stagiaires/stagiaire")
//                .contentType(MediaType.APPLICATION_JSON)
//                .content(objectMapper.writeValueAsString(addDto)))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Création effectué avec succès"));
//     }

//     @Test
//     @DisplayName("PATCH update stagiaire - success")
//     void testUpdateStagiaire() throws Exception {
//         StagiaireDto updateDto = new StagiaireDto(2L, "Luc", "Leroy", null, null, null);
//         Stagiaire toUpdate = Stagiaire.builder().build();
//         when(stagiaireMapperDto.map(updateDto)).thenReturn(toUpdate);
//         doNothing().when(stagiaireService).update(toUpdate);

//         mockMvc.perform(patch("/api/v1/stagiaires/{id}", 2)
//                .contentType(MediaType.APPLICATION_JSON)
//                .content(objectMapper.writeValueAsString(updateDto)))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Supression effectué avec succès"));
//     }

//     @Test
//     @DisplayName("DELETE stagiaire - success")
//     void testDeleteStagiaire() throws Exception {
//         doNothing().when(stagiaireService).delete(3L);

//         mockMvc.perform(delete("/api/v1/stagiaires/{id}", 3)
//                .param("stagiaireId", "3"))
//                .andExpect(status().isOk())
//                .andExpect(content().string("Supression effectué avec succès"));
//     }
// }
