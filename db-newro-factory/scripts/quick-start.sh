#!/bin/bash

# Script de démarrage rapide pour la base de données Newro Factory
# Usage: ./scripts/quick-start.sh

echo "🚀 Démarrage rapide de la base de données Newro Factory"
echo ""

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé"
    echo "💡 Installez Docker depuis: https://docs.docker.com/get-docker/"
    exit 1
fi

# Vérifier si Docker Compose est installé
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose n'est pas installé"
    echo "💡 Installez Docker Compose depuis: https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker et Docker Compose sont installés"
echo ""

# Arrêter les conteneurs existants si ils existent
echo "🛑 Arrêt des conteneurs existants..."
docker-compose down 2>/dev/null

echo ""
echo "🔧 Démarrage de la base de données avec migration automatique..."
echo "⏳ Cela peut prendre 1-2 minutes lors du premier lancement..."
echo ""

# Démarrer avec build pour s'assurer que tout est à jour
docker-compose up --build

echo ""
echo "🎉 Base de données démarrée avec succès!"
echo ""
echo "📋 Informations de connexion:"
echo "   Host: localhost"
echo "   Port: 33006"
echo "   User: adminnewro"
echo "   Password: Qwerty1234"
echo "   Database: newro-factory-db"
echo ""
echo "🔍 Pour vérifier la migration: ./scripts/check-migration.sh"
echo "🛑 Pour arrêter: docker-compose down"
