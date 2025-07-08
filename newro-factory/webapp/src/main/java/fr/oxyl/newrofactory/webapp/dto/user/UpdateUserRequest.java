package fr.oxyl.newrofactory.webapp.dto.user;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;

/**
 * DTO for user profile update
 * Note: Email/username cannot be changed as it's the primary identifier
 */
public record UpdateUserRequest(
        @NotBlank @JsonProperty("firstName") String firstname,
        @NotBlank @JsonProperty("lastName") String lastname) {
}