package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;
import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;
import fr.oxyl.newrofactory.webapp.dto.admin.AdminCreateUserRequest;
import fr.oxyl.newrofactory.webapp.dto.admin.UserDto;
import fr.oxyl.newrofactory.webapp.dto.admin.UsersDto;
import jakarta.validation.Valid;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * REST controller for admin-only operations
 */
@RestController
@RequestMapping("/api/admin")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
@PreAuthorize("hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
public class AdminRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminRestController.class);

    private final UtilisateurRepo utilisateurDaoService;
    private final PasswordEncoder passwordEncoder;

    public AdminRestController(UtilisateurRepo utilisateurDaoService, PasswordEncoder passwordEncoder) {
        this.utilisateurDaoService = utilisateurDaoService;
        this.passwordEncoder = passwordEncoder;
    }

    /**
     * Response class for admin errors
     */
    private static class AdminErrorResponse {
        private final String error;
        private final String message;

        public AdminErrorResponse(String error, String message) {
            this.error = error;
            this.message = message;
        }

        public String getError() {
            return error;
        }

        public String getMessage() {
            return message;
        }
    }

    /**
     * Get all users in the system
     * Only accessible to admins
     */
    @GetMapping("/users")
    public UsersDto getAllUsers() {
        LOGGER.debug("Admin requesting all users");

        Iterable<UserEntity> users = utilisateurDaoService.findAll();
        List<UserDto> userDtos = new ArrayList<>();

        for (UserEntity user : users) {
            userDtos.add(new UserDto(
                user.getUsername(), // Email is stored in username field
                user.getFirstname(),
                user.getLastname(),
                user.getRole()
            ));
        }

        return new UsersDto(userDtos);
    }

    /**
     * Change a user's role
     * Only accessible to admins
     */
    @PostMapping("/users/{username}/role")
    public ResponseEntity<String> changeUserRole(
            @PathVariable("username") String username,
            @RequestBody String newRole) {

        LOGGER.debug("Admin changing role for user {} to {}", username, newRole);

        // Validate role
        if (!newRole.equals(RoleConstants.ROLE_USER) && !newRole.equals(RoleConstants.ROLE_ADMIN)) {
            return new ResponseEntity<>("Invalid role: " + newRole, HttpStatus.BAD_REQUEST);
        }

        // Find user
        Optional<? extends UserDetails> userDetailsOpt = utilisateurDaoService.findById(username);
        if (userDetailsOpt.isEmpty()) {
            return new ResponseEntity<>("User not found: " + username, HttpStatus.NOT_FOUND);
        }

        // Update role
        UserEntity user = (UserEntity) userDetailsOpt.get();
        user.setRole(newRole);
        utilisateurDaoService.save(user);

        return new ResponseEntity<>("Role updated successfully", HttpStatus.OK);
    }

    /**
     * Get user data by username
     * This endpoint is protected and only accessible to admins
     * It allows admins to search for users by username
     * 
     * @param username The username (email) of the user to retrieve
     * @return ResponseEntity containing UserDto with user information or error response
     */
    @GetMapping("/user/{username}")
    public ResponseEntity<Object> getUserByUsername(@PathVariable String username) {
        LOGGER.debug("Admin requesting user data for username: {}", username);

        return utilisateurDaoService.findById(username)
            .map(userDetails -> {
                UserEntity user = (UserEntity) userDetails;
                UserDto userDto = new UserDto(
                    user.getUsername(),
                    user.getFirstname(),
                    user.getLastname(),
                    user.getRole()
                );
                return new ResponseEntity<Object>(userDto, HttpStatus.OK);
            })
            .orElseGet(() -> {
                LOGGER.error("User {} not found in database", username);
                return new ResponseEntity<Object>(
                    new AdminErrorResponse("NOT_FOUND", "User not found: " + username), 
                    HttpStatus.NOT_FOUND
                );
            });
    }

    /**
     * Create a new user
     * This endpoint is protected and only accessible to admins
     * It allows admins to create new users with any role
     * 
     * @param createUserRequest The request containing user details
     * @return ResponseEntity containing success message or error response
     */
    @PostMapping("/users")
    public ResponseEntity<Object> createUser(@Valid @RequestBody AdminCreateUserRequest createUserRequest) {
        LOGGER.debug("Admin creating new user with email: {}", createUserRequest.email());

        // Check if passwords match
        if (!createUserRequest.password().equals(createUserRequest.confirmPassword())) {
            return new ResponseEntity<>(
                new AdminErrorResponse("PASSWORD_MISMATCH", "Passwords do not match"), 
                HttpStatus.BAD_REQUEST
            );
        }

        // Check if email already exists
        if (utilisateurDaoService.findById(createUserRequest.email()).isPresent()) {
            return new ResponseEntity<>(
                new AdminErrorResponse("EMAIL_EXISTS", "Email already exists: " + createUserRequest.email()), 
                HttpStatus.BAD_REQUEST
            );
        }

        // Validate role
        String role = createUserRequest.role();
        if (!role.equals(RoleConstants.ROLE_USER) && !role.equals(RoleConstants.ROLE_ADMIN)) {
            return new ResponseEntity<>(
                new AdminErrorResponse("INVALID_ROLE", "Invalid role: " + role), 
                HttpStatus.BAD_REQUEST
            );
        }

        // Create user
        UserEntity newUser = new UserEntity(
            createUserRequest.email(),
            passwordEncoder.encode(createUserRequest.password()),
            role,
            createUserRequest.firstname(),
            createUserRequest.lastname()
        );

        // Save user
        utilisateurDaoService.save(newUser);

        return new ResponseEntity<>(
            new AdminErrorResponse("SUCCESS", "User created successfully"), 
            HttpStatus.CREATED
        );
    }

    /**
     * Update a user
     * This endpoint is protected and only accessible to admins
     * It allows admins to update user details including role
     * 
     * @param username The username (email) of the user to update
     * @param updateRequest The request containing updated user details
     * @return ResponseEntity containing success message or error response
     */
    @PutMapping("/users/{username}")
    public ResponseEntity<Object> updateUser(@PathVariable String username, @Valid @RequestBody AdminCreateUserRequest updateRequest) {
        LOGGER.debug("Admin updating user with email: {}", username);

        // Check if user exists
        Optional<? extends UserDetails> userDetailsOpt = utilisateurDaoService.findById(username);
        if (userDetailsOpt.isEmpty()) {
            return new ResponseEntity<>(
                new AdminErrorResponse("NOT_FOUND", "User not found: " + username), 
                HttpStatus.NOT_FOUND
            );
        }

        // Validate role
        String role = updateRequest.role();
        if (!role.equals(RoleConstants.ROLE_USER) && !role.equals(RoleConstants.ROLE_ADMIN)) {
            return new ResponseEntity<>(
                new AdminErrorResponse("INVALID_ROLE", "Invalid role: " + role), 
                HttpStatus.BAD_REQUEST
            );
        }

        UserEntity user = (UserEntity) userDetailsOpt.get();

        // Update user details
        user.setFirstname(updateRequest.firstname());
        user.setLastname(updateRequest.lastname());
        user.setRole(updateRequest.role());

        // Update password if provided and matches confirmation
        if (updateRequest.password() != null && !updateRequest.password().isEmpty()) {
            if (!updateRequest.password().equals(updateRequest.confirmPassword())) {
                return new ResponseEntity<>(
                    new AdminErrorResponse("PASSWORD_MISMATCH", "Passwords do not match"), 
                    HttpStatus.BAD_REQUEST
                );
            }
            user.setPassword(passwordEncoder.encode(updateRequest.password()));
        }

        // Save updated user
        utilisateurDaoService.save(user);

        return new ResponseEntity<>(
            new AdminErrorResponse("SUCCESS", "User updated successfully"), 
            HttpStatus.OK
        );
    }
}
