# 🤝 Guide de contribution

Merci de votre intérêt pour contribuer au projet de base de données Newro Factory !

## 🚀 Démarrage rapide pour les développeurs

1. **Cloner le projet**
   ```bash
   git clone <repository-url>
   cd db-newro-factory
   ```

2. **Démarrer l'environnement**
   ```bash
   ./scripts/quick-start.sh
   ```

3. **Vérifier que tout fonctionne**
   ```bash
   ./scripts/check-migration.sh
   ```

## 🔧 Développement

### Structure du code

- **`app/script.py`** : Script de migration principal
- **`sql/`** : Scripts d'initialisation de la base de données
- **`scripts/`** : Scripts d'aide pour les développeurs

### Modifier le script de migration

1. **Tester localement**
   ```bash
   # Réinitialiser la base
   docker-compose down -v
   
   # Relancer avec vos modifications
   docker-compose up --build
   ```

2. **Vérifier les résultats**
   ```bash
   ./scripts/check-migration.sh
   ```

### Ajouter des données

1. **Modifier les scripts SQL** dans `sql/`
2. **Réinitialiser pour tester**
   ```bash
   docker-compose down -v
   docker-compose up --build
   ```

## 🧪 Tests

### Tests manuels

```bash
# Test complet de A à Z
docker-compose down -v
./scripts/quick-start.sh
./scripts/check-migration.sh
```

### Vérifications importantes

- [ ] La migration fonctionne sur une base vide
- [ ] La migration est idempotente (peut être relancée)
- [ ] Les relations parent-enfant sont correctes
- [ ] Aucune donnée n'est perdue

## 📝 Conventions

### Messages de commit

- `feat:` Nouvelle fonctionnalité
- `fix:` Correction de bug
- `docs:` Documentation
- `refactor:` Refactoring
- `test:` Tests

### Code Python

- Utiliser des **emojis** dans les logs pour la lisibilité
- Gérer les **erreurs** avec try/catch appropriés
- Ajouter des **commentaires** pour la logique complexe

## 🐛 Signaler un problème

1. **Vérifier** que le problème n'existe pas déjà
2. **Reproduire** le problème avec des étapes claires
3. **Inclure** les logs d'erreur
4. **Préciser** l'environnement (OS, Docker version)

## 📋 Checklist avant contribution

- [ ] Le code fonctionne localement
- [ ] La migration est testée
- [ ] La documentation est mise à jour
- [ ] Les scripts d'aide fonctionnent
- [ ] Aucune régression détectée

## 🆘 Besoin d'aide ?

- Consultez le **README.md** pour la documentation complète
- Utilisez `./scripts/check-migration.sh` pour diagnostiquer
- Vérifiez le **CHANGELOG.md** pour les changements récents
