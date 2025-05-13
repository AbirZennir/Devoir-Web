package com.devoir.devoir;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import javax.sql.DataSource;
import java.sql.Connection;

@SpringBootApplication
public class DevoirApplication implements CommandLineRunner {

    private final DataSource dataSource;

    // Injection du DataSource via le constructeur
    public DevoirApplication(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public static void main(String[] args) {
        SpringApplication.run(DevoirApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {  // Correction ici
        try (Connection conn = dataSource.getConnection()) {
            System.out.println(" Connexion à PostgreSQL réussie !");
        } catch (Exception e) {
            System.err.println(" Échec de connexion : " + e.getMessage());
        }
    }
}