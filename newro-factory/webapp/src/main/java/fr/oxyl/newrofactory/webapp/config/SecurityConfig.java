package fr.oxyl.newrofactory.webapp.config;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.service.AuthentificationService;

@EnableWebSecurity
@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http,
            JwtAuthentificationFilter jwtAuthentificationFilter) throws Exception {

        http.csrf(AbstractHttpConfigurer::disable)
                .cors(cors -> cors.configurationSource(corsConfigurationSource())) // Enable CORS with our custom configuration
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                    // Public endpoints
                    // Allow preflight requests
                    .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()

                    // Authentication endpoints - publicly accessible
                    .requestMatchers("/api/authentification/**", "/qlf/api/authentification/**").permitAll()

                    // Read operations - accessible to both USER and ADMIN
                    .requestMatchers(HttpMethod.GET, "/api/**", "/qlf/api/**").hasAnyAuthority(RoleConstants.ROLE_USER, RoleConstants.ROLE_ADMIN)

                    // Write operations - accessible to both USER and ADMIN
                    .requestMatchers(HttpMethod.POST, "/api/**", "/qlf/api/**").hasAnyAuthority(RoleConstants.ROLE_USER, RoleConstants.ROLE_ADMIN)
                    .requestMatchers(HttpMethod.PUT, "/api/**", "/qlf/api/**").hasAnyAuthority(RoleConstants.ROLE_USER, RoleConstants.ROLE_ADMIN)
                    .requestMatchers(HttpMethod.PATCH, "/api/**", "/qlf/api/**").hasAnyAuthority(RoleConstants.ROLE_USER, RoleConstants.ROLE_ADMIN)
                    .requestMatchers(HttpMethod.DELETE, "/api/**", "/qlf/api/**").hasAnyAuthority(RoleConstants.ROLE_USER, RoleConstants.ROLE_ADMIN)

                    // Admin-specific endpoints
                    .requestMatchers("/api/admin/**", "/qlf/api/admin/**").hasAuthority(RoleConstants.ROLE_ADMIN)

                    // Any other request requires authentication
                    .anyRequest().authenticated())
                .addFilterBefore(jwtAuthentificationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("http://localhost:4200"));
        configuration.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        configuration.setExposedHeaders(Arrays.asList("Authorization"));
        configuration.setMaxAge(3600L); // 1 hour in seconds

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationProvider authenticationProvider(AuthentificationService authentificationService) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider(authentificationService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(
            AuthentificationService authentificationService) {
        return new ProviderManager(authenticationProvider(authentificationService));
    }


}
