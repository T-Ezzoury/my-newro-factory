-- ===================================
-- USER MANAGEMENT SCHEMA
-- ===================================
USE `newro-factory-db`;
SELECT 'Creating user table...' AS message;

-- Création de la table user avec les champs demandés
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'USER',
  `photo_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_email` (`email`),
  KEY `idx_user_role` (`role`),
  KEY `idx_user_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================
-- INSERTION DES UTILISATEURS DE TEST
-- ===================================

-- Utilisateur 1: Administrateur
INSERT INTO `user` (
  `first_name`, 
  `last_name`, 
  `email`, 
  `password`, 
  `role`, 
  `photo_url`
) VALUES (
  'Jean',
  'Dupont',
  'admin@newro-factory.com',
  '$2a$10$FG84ug01JhDP94dTjyAbBODid7GYrrm5lXBIGZIDu/qewNhdfep6m', -- password: qsdfsdfgsfdg
  'ADMIN',
  'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face'
);

-- Utilisateur 2: Utilisateur standard
INSERT INTO `user` (
  `first_name`, 
  `last_name`, 
  `email`, 
  `password`, 
  `role`, 
  `photo_url`
) VALUES (
  'Marie',
  'Martin',
  'marie.martin@newro-factory.com',
  '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', -- password: user123
  'USER',
  'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'
);

-- ===================================
-- COMMENTAIRES SUR LA STRUCTURE
-- ===================================

/*
Structure de la table user:
- id: Clé primaire auto-incrémentée
- first_name: Prénom de l'utilisateur (obligatoire, max 100 caractères)
- last_name: Nom de famille de l'utilisateur (obligatoire, max 100 caractères)
- email: Adresse email unique (obligatoire, max 255 caractères)
- password: Mot de passe hashé (obligatoire, max 255 caractères)
- role: Rôle de l'utilisateur (par défaut 'USER', peut être 'ADMIN', 'MODERATOR', etc.)
- photo_url: URL de la photo de profil (optionnel, max 500 caractères)
- created_at: Date de création automatique
- updated_at: Date de dernière modification automatique
- is_active: Statut actif/inactif (par défaut actif)

Index créés:
- uk_user_email: Index unique sur l'email
- idx_user_role: Index sur le rôle pour les requêtes de filtrage
- idx_user_active: Index sur le statut actif

Utilisateurs créés:
1. Admin: admin@newro-factory.com / admin123
2. User: marie.martin@newro-factory.com / user123

Les mots de passe sont hashés avec BCrypt (rounds=10).
*/
