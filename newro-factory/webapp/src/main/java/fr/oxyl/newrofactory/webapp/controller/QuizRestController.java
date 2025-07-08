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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.core.model.Quiz;
import fr.oxyl.newrofactory.core.model.QuizQuestion;
import fr.oxyl.newrofactory.service.QuizService;
import fr.oxyl.newrofactory.webapp.dto.quiz.QuizDto;
import fr.oxyl.newrofactory.webapp.dto.quiz.QuizQuestionDto;
import fr.oxyl.newrofactory.webapp.mapper.QuizMapperDto;
import fr.oxyl.newrofactory.webapp.mapper.QuizQuestionMapperDto;

@RestController
@RequestMapping("/api/quizzes")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class QuizRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(QuizRestController.class);

    private final QuizService quizService;
    private final QuizMapperDto quizMapperDto;
    private final QuizQuestionMapperDto quizQuestionMapperDto;

    public QuizRestController(QuizService quizService, QuizMapperDto quizMapperDto, QuizQuestionMapperDto quizQuestionMapperDto) {
        this.quizService = quizService;
        this.quizMapperDto = quizMapperDto;
        this.quizQuestionMapperDto = quizQuestionMapperDto;
    }

    /**
     * Get the count of quizzes
     * @return ResponseEntity containing the count of quizzes
     */
    @GetMapping("/count")

    public ResponseEntity<Long> getQuizCount() {
        LOGGER.debug("Getting quiz count");
        long count = quizService.count();
        return new ResponseEntity<>(count, HttpStatus.OK);
    }

    /**
     * Get all quizzes
     * @return List of all quizzes
     */
    @GetMapping
    public List<QuizDto> getAllQuizzes() {
        LOGGER.debug("Getting all quizzes");
        List<Quiz> quizzes = quizService.findAll();
        return quizMapperDto.mapToDto(quizzes);
    }

    /**
     * Get quizzes by user ID
     * @param userId The ID of the user
     * @return List of quizzes for the user
     */
    @GetMapping("/user/{userId}")
    public List<QuizDto> getQuizzesByUser(@PathVariable("userId") long userId) {
        LOGGER.debug("Getting quizzes for user with ID: {}", userId);
        List<Quiz> quizzes = quizService.findByUserId(userId);
        return quizMapperDto.mapToDto(quizzes);
    }

    /**
     * Search quizzes by name
     * @param name The name to search for
     * @return List of quizzes matching the search
     */
    @GetMapping("/search")
    public List<QuizDto> searchQuizzes(@RequestParam("name") String name) {
        LOGGER.debug("Searching quizzes with name containing: {}", name);
        List<Quiz> quizzes = quizService.findByNameContaining(name);
        return quizMapperDto.mapToDto(quizzes);
    }

    /**
     * Get a specific quiz by ID
     * @param quizId The ID of the quiz to retrieve
     * @return ResponseEntity containing the quiz or an error message
     */
    @GetMapping("/{quizId}")
    public ResponseEntity<Object> getQuiz(@PathVariable("quizId") long quizId) {
        LOGGER.debug("Getting quiz with ID: {}", quizId);

        Optional<Quiz> quizOpt = quizService.findById(quizId);

        if (quizOpt.isPresent()) {
            Quiz quiz = quizOpt.get();
            QuizDto quizDto = quizMapperDto.mapToDto(quiz);
            return new ResponseEntity<>(quizDto, HttpStatus.OK);
        } else {
            LOGGER.error("Quiz with ID {} not found", quizId);
            return new ResponseEntity<>("Quiz not found", HttpStatus.NOT_FOUND);
        }
    }

    /**
     * Get quiz questions for a specific quiz
     * @param quizId The ID of the quiz
     * @return List of quiz questions
     */
    @GetMapping("/{quizId}/questions")
    public ResponseEntity<Object> getQuizQuestions(@PathVariable("quizId") long quizId) {
        LOGGER.debug("Getting questions for quiz with ID: {}", quizId);

        Optional<Quiz> quizOpt = quizService.findById(quizId);

        if (quizOpt.isEmpty()) {
            LOGGER.error("Quiz with ID {} not found", quizId);
            return new ResponseEntity<>("Quiz not found", HttpStatus.NOT_FOUND);
        }

        List<QuizQuestion> quizQuestions = quizService.findQuizQuestionsByQuizId(quizId);
        List<QuizQuestionDto> quizQuestionDtos = quizQuestionMapperDto.mapToDto(quizQuestions);
        return new ResponseEntity<>(quizQuestionDtos, HttpStatus.OK);
    }

    /**
     * Create a new quiz
     * @param quizDto The quiz data to create
     * @return ResponseEntity containing the created quiz or an error message
     */
    @PostMapping
    public ResponseEntity<Object> createQuiz(@RequestBody QuizDto quizDto) {
        LOGGER.debug("Creating new quiz");

        try {
            Quiz quiz = quizMapperDto.map(quizDto);
            Quiz savedQuiz = quizService.save(quiz);
            QuizDto savedQuizDto = quizMapperDto.mapToDto(savedQuiz);
            return new ResponseEntity<>(savedQuizDto, HttpStatus.CREATED);
        } catch (Exception e) {
            LOGGER.error("Error creating quiz: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error creating quiz: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Update a quiz
     * @param quizId The ID of the quiz to update
     * @param quizDto The updated quiz data
     * @return ResponseEntity containing the updated quiz or an error message
     */
    @PutMapping("/{quizId}")
    public ResponseEntity<Object> updateQuiz(@PathVariable("quizId") long quizId, @RequestBody QuizDto quizDto) {
        LOGGER.debug("Updating quiz with ID: {}", quizId);

        Optional<Quiz> quizOpt = quizService.findById(quizId);

        if (quizOpt.isEmpty()) {
            LOGGER.error("Quiz with ID {} not found", quizId);
            return new ResponseEntity<>("Quiz not found", HttpStatus.NOT_FOUND);
        }

        try {
            Quiz quiz = quizMapperDto.map(quizDto);
            quiz.setId(quizId); // Ensure the ID is set correctly
            Quiz updatedQuiz = quizService.save(quiz);
            
            // Update quiz questions
            quizService.updateQuizQuestions(updatedQuiz);
            
            QuizDto updatedQuizDto = quizMapperDto.mapToDto(updatedQuiz);
            return new ResponseEntity<>(updatedQuizDto, HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error("Error updating quiz: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error updating quiz: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Delete a quiz
     * @param quizId The ID of the quiz to delete
     * @return ResponseEntity containing a success message or an error message
     */
    @DeleteMapping("/{quizId}")
    @PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<String> deleteQuiz(@PathVariable("quizId") long quizId) {
        LOGGER.debug("Deleting quiz with ID: {}", quizId);

        Optional<Quiz> quizOpt = quizService.findById(quizId);

        if (quizOpt.isEmpty()) {
            LOGGER.error("Quiz with ID {} not found", quizId);
            return new ResponseEntity<>("Quiz not found", HttpStatus.NOT_FOUND);
        }

        try {
            quizService.deleteById(quizId);
            return new ResponseEntity<>("Quiz deleted successfully", HttpStatus.OK);
        } catch (Exception e) {
            LOGGER.error("Error deleting quiz: {}", e.getMessage(), e);
            return new ResponseEntity<>("Error deleting quiz: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}