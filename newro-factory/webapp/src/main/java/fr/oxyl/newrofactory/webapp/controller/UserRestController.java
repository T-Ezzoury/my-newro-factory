package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;
import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;
import fr.oxyl.newrofactory.webapp.dto.admin.UserDto;
import fr.oxyl.newrofactory.webapp.dto.user.UpdateUserRequest;
import jakarta.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;

/**
 * REST controller for user profile operations
 */
@RestController
@RequestMapping("/api/user")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
@PreAuthorize("hasAnyAuthority('" + RoleConstants.ROLE_USER + "', '" + RoleConstants.ROLE_ADMIN + "')")
public class UserRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserRestController.class);

    private final UtilisateurRepo utilisateurDaoService;

    public UserRestController(UtilisateurRepo utilisateurDaoService) {
        this.utilisateurDaoService = utilisateurDaoService;
    }

    /**
     * Response class for profile errors
     */
    private static class ProfileErrorResponse {
        private final String error;

        public ProfileErrorResponse(String error) {
            this.error = error;
        }

        public String getError() {
            return error;
        }
    }

    /**
     * Get the profile of the currently authenticated user
     * This endpoint returns the user's information including email, firstname, lastname, and role
     * It requires authentication and will return 401 if not authenticated
     * 
     * @return ResponseEntity containing UserDto with user information or error response
     */
    @GetMapping("/profile")
    public ResponseEntity<Object> getCurrentUserProfile() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !authentication.isAuthenticated()) {
            LOGGER.warn("Attempt to access profile without authentication");
            return new ResponseEntity<>(
                new ProfileErrorResponse("Not authenticated"), 
                HttpStatus.UNAUTHORIZED
            );
        }

        String username = authentication.getName();
        LOGGER.debug("User {} requesting their profile", username);

        return utilisateurDaoService.findById(username)
            .map(userDetails -> {
                UserEntity user = (UserEntity) userDetails;
                UserDto userDto = new UserDto(
                    user.getUsername(),  // Email is stored in username field
                    user.getFirstname(),
                    user.getLastname(),
                    user.getRole()
                );
                return new ResponseEntity<Object>(userDto, HttpStatus.OK);
            })
            .orElseGet(() -> {
                LOGGER.error("User {} found in authentication but not in database", username);
                return new ResponseEntity<>(
                    new ProfileErrorResponse("User not found"), 
                    HttpStatus.NOT_FOUND
                );
            });
    }

    /**
     * Get user data by username
     * This endpoint is protected and only accessible to authenticated users
     * Users can only access their own data
     * 
     * @param username The username (email) of the user to retrieve
     * @return ResponseEntity containing UserDto with user information or error response
     */
    @GetMapping("/{username}")
    @PreAuthorize("authentication.name == #username or hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<Object> getUserByUsername(@PathVariable String username) {
        LOGGER.debug("Request to get user data for username: {}", username);

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
                return new ResponseEntity<>(
                    new ProfileErrorResponse("User not found"), 
                    HttpStatus.NOT_FOUND
                );
            });
    }

    /**
     * Update user data
     * This endpoint is protected and only accessible to authenticated users
     * Users can only update their own data
     * 
     * @param username The username (email) of the user to update
     * @param updateRequest The request containing updated user details
     * @return ResponseEntity containing success message or error response
     */
    @PutMapping("/{username}")
    @PreAuthorize("authentication.name == #username or hasAuthority('" + RoleConstants.ROLE_ADMIN + "')")
    public ResponseEntity<Object> updateUser(@PathVariable String username, @Valid @RequestBody UpdateUserRequest updateRequest) {
        LOGGER.debug("Request to update user data for username: {}", username);

        return utilisateurDaoService.findById(username)
            .map(userDetails -> {
                UserEntity user = (UserEntity) userDetails;

                // Update user details
                user.setFirstname(updateRequest.firstname());
                user.setLastname(updateRequest.lastname());

                // Save updated user
                utilisateurDaoService.save(user);

                return new ResponseEntity<Object>(
                    new ProfileErrorResponse("User updated successfully"), 
                    HttpStatus.OK
                );
            })
            .orElseGet(() -> {
                LOGGER.error("User {} not found in database", username);
                return new ResponseEntity<>(
                    new ProfileErrorResponse("User not found"), 
                    HttpStatus.NOT_FOUND
                );
            });
    }
}
