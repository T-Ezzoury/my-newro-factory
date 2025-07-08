package fr.oxyl.newrofactory.webapp.dto.admin;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

/**
 * DTO for admin user creation
 * Similar to RegisterRequest but includes a role field
 */
public record AdminCreateUserRequest(
        @NotBlank @JsonProperty("firstName") String firstname,
        @NotBlank @JsonProperty("lastName") String lastname,
        @NotBlank @Email String email,
        @NotBlank String password,
        @NotBlank @JsonProperty("confirm_password") String confirmPassword,
        @NotBlank String role) {
}