# 📝 Changelog

Toutes les modifications importantes de ce projet seront documentées dans ce fichier.

## [2.0.0] - 2025-07-08

### ✨ Ajouté
- **Script de migration automatique** pour optimiser les relations hiérarchiques
- **Healthcheck MySQL** pour assurer la disponibilité avant migration
- **Retry logic** dans le script Python (5 tentatives avec délai)
- **Support multi-plateforme** (macOS et Linux)
- **Script de vérification** `scripts/check-migration.sh`
- **Variables d'environnement** configurables via `.env`
- **Documentation complète** avec exemples et résolution de problèmes

### 🔄 Modifié
- **Colonne `parent_path` renommée** en `parent_chapter`
- **Relations hiérarchiques optimisées** : chaque chapitre pointe vers son parent le plus général
- **Docker Compose** avec healthcheck et dépendances conditionnelles
- **Port externe** changé de `3306` vers `33006` pour éviter les conflits

### 🐛 Corrigé
- **Problèmes de timing** entre MySQL et le script de migration sur Linux
- **Gestion d'erreurs** améliorée avec messages informatifs
- **Migration idempotente** : peut être relancée sans problème

### 📊 Statistiques de migration
- **779 chapitres** avec relations parent-enfant optimisées
- **45 chapitres racines** (sans parent)
- **824 chapitres** au total dans la base

### 🔧 Technique
- **Python 3.11** avec PyMySQL pour la migration
- **MySQL 8.0** avec scripts d'initialisation automatique
- **Docker** avec healthcheck et retry automatique
- **Logs détaillés** avec emojis pour faciliter le debugging

## [1.0.0] - Version initiale

### ✨ Fonctionnalités initiales
- Base de données MySQL avec structure complète
- Scripts d'initialisation SQL
- Configuration Docker Compose basique
- Données de test pour les chapitres et questions
