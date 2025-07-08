package fr.oxyl.newrofactory.persistence.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariDataSource;

import jakarta.persistence.EntityManagerFactory;

@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "fr.oxyl.newrofactory.persistence.internal.dao")
@Configuration
@PropertySource("classpath:database-test.properties")
@ComponentScan(basePackages = {
        "fr.oxyl.newrofactory.persistence.repository",
    "fr.oxyl.newrofactory.persistence.internal.mapper",
})
public class TestPersistenceConfig {

    @Bean
    public DataSource dataSource(Environment env) {
        HikariDataSource ds = new HikariDataSource();
        ds.setDriverClassName(env.getRequiredProperty("datasource.driverClassName"));
        ds.setJdbcUrl(env.getRequiredProperty("datasource.url"));
        ds.setUsername(env.getRequiredProperty("datasource.username"));
        ds.setPassword(env.getRequiredProperty("datasource.password"));
        ds.setMaximumPoolSize(env.getProperty("datasource.hikari.maximum-pool-size", Integer.class, 10));
        ds.setMinimumIdle(env.getProperty("datasource.hikari.minimum-idle", Integer.class, 2));
        ds.setConnectionTimeout(env.getProperty("datasource.hikari.connection-timeout", Long.class, 30_000L));
        ds.setIdleTimeout(env.getProperty("datasource.hikari.idle-timeout", Long.class, 600_000L));
        ds.setMaxLifetime(env.getProperty("datasource.hikari.max-lifetime", Long.class, 1_800_000L));
        return ds;
    }

    @Bean
    public JdbcTemplate jdbcTemplate(DataSource ds) {
        return new JdbcTemplate(ds);
    }

    @Bean
    LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {

        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        vendorAdapter.setDatabase(Database.H2);
        vendorAdapter.setGenerateDdl(false);
        vendorAdapter.setShowSql(true);

        Properties properties = new Properties();
        properties.put("hibernate.hbm2ddl.auto", "create-drop");

        LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
        emf.setDataSource(dataSource);
        emf.setPackagesToScan("fr.oxyl.newrofactory.persistence.internal.entity");
        emf.setJpaVendorAdapter(vendorAdapter);
        emf.setJpaProperties(properties);

        return emf;
    }

    @Bean
    public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {
        return new JpaTransactionManager(emf);
    }

}
