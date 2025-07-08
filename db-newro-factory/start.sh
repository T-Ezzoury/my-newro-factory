#!/bin/bash

echo "🚀 Démarrage de la base de données..."

# Arrêter tout d'abord
docker compose down -v

# Lancer MySQL
echo "📦 Lancement de MySQL..."
docker compose up db -d

# Attendre que MySQL soit prêt
echo "⏳ Attente de MySQL (30s)..."
sleep 30

# Lancer les corrections
echo "🔧 Lancement des corrections..."
docker compose up app

echo "✅ Terminé!"
