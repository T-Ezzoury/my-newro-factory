package fr.oxyl.newrofactory.service.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@ComponentScan(basePackages = "fr.oxyl.newrofactory.service")
@Configuration
@PropertySource("classpath:security.properties")
public class ServiceConfig {
    
}
