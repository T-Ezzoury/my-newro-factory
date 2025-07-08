package fr.oxyl.newrofactory.webapp.dto.auth;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Response DTO for authentication containing JWT token and user information
 */
public record TokenJwt(
        @JsonProperty String token,
        @JsonProperty String email,
        @JsonProperty String firstname,
        @JsonProperty String lastname,
        @JsonProperty String role,
        @JsonProperty String tokenType) {

}
