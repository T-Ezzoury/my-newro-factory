package fr.oxyl.newrofactory.webapp.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.service.QuestionService;
import fr.oxyl.newrofactory.webapp.dto.question.QuestionDto;
import fr.oxyl.newrofactory.webapp.dto.question.QuestionsAffichageDto;
import fr.oxyl.newrofactory.webapp.mapper.QuestionMapperDto;

@RestController
@RequestMapping("/api/questions")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class QuestionRestController {

    private final QuestionService questionService;
    private final QuestionMapperDto questionMapperDto;

    public QuestionRestController(QuestionService questionService,
            QuestionMapperDto questionMapperDto) {
        this.questionService = questionService;
        this.questionMapperDto = questionMapperDto;
    }
    
    @GetMapping("")
    public QuestionsAffichageDto getQuestions(@RequestParam(name = "search", required = false) String search,
            @RequestParam(name = "currentPage", required = false, defaultValue = "0") int currentPage,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {

        return new QuestionsAffichageDto(questionService.findAll(search, currentPage, pageSize).map(questionMapperDto::mapToAffichageDto).getContent());
    }

    @GetMapping("/total")
    public long getCountQuestion() {
        return questionService.count();
    }

    @GetMapping("/{questionId}")
    public QuestionDto getQuestion(@PathVariable("questionId") long questionId){
        return questionMapperDto.mapToDto(questionService.findById(questionId));
    }

    @GetMapping("/chapter/{chapterId}")
    public List<QuestionDto> getQuestionsByChapter(@RequestParam(name = "search", required = false) String search,
            @RequestParam(name = "currentPage", required = false, defaultValue = "0") int currentPage,
            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
            @PathVariable("chapterId") long chapterId){
        return questionMapperDto.mapToDto(questionService.findByChapitreId(search, currentPage, pageSize, chapterId));
    }

    @DeleteMapping("/{questionId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> deleteQuestion(@PathVariable("questionId") long questionId){
        questionService.deleteById(questionId);
        return new ResponseEntity<>("Supression avec succès", HttpStatus.OK);
    }

}
