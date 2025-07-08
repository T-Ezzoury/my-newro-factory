package fr.oxyl.newrofactory.webapp.dto.auth;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

/**
 * DTO for user registration
 * Note: Role is not included as all new registrations are assigned the USER role by default
 */
public record RegisterRequest(
        @NotBlank @JsonProperty("firstName") String firstname,
        @NotBlank @JsonProperty("lastName") String lastname,
        @NotBlank @Email String email,
        @NotBlank String password,
        @NotBlank @JsonProperty("confirm_password") String confirmPassword) {
}
