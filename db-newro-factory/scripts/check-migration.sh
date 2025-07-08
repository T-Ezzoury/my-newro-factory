#!/bin/bash

# Script d'aide pour vérifier l'état de la migration
# Usage: ./scripts/check-migration.sh

echo "🔍 Vérification de l'état de la migration de la base de données..."
echo ""

# Vérifier si MySQL est en cours d'exécution
if ! docker ps | grep -q mysql-newro; then
    echo "❌ Le conteneur MySQL n'est pas en cours d'exécution"
    echo "💡 Lancez: docker-compose up -d"
    exit 1
fi

echo "✅ Conteneur MySQL en cours d'exécution"
echo ""

# Vérifier la structure de la table chapter
echo "📋 Structure de la table chapter:"
docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "DESCRIBE chapter;" 2>/dev/null

echo ""
echo "📊 Statistiques de migration:"

# Compter les chapitres avec parent_chapter
CHAPTERS_WITH_PARENT=$(docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "SELECT COUNT(*) FROM chapter WHERE parent_chapter IS NOT NULL;" 2>/dev/null | tail -n 1)
echo "   - Chapitres avec parent: $CHAPTERS_WITH_PARENT"

# Compter les chapitres racines
CHAPTERS_ROOT=$(docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "SELECT COUNT(*) FROM chapter WHERE parent_chapter IS NULL;" 2>/dev/null | tail -n 1)
echo "   - Chapitres racines: $CHAPTERS_ROOT"

# Total des chapitres
TOTAL_CHAPTERS=$(docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "SELECT COUNT(*) FROM chapter;" 2>/dev/null | tail -n 1)
echo "   - Total des chapitres: $TOTAL_CHAPTERS"

echo ""
echo "🏆 Top 5 des parents avec le plus d'enfants:"
docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "
SELECT c2.name as parent_name, COUNT(c1.id) as nb_children
FROM chapter c1 
JOIN chapter c2 ON c1.parent_chapter = c2.id 
GROUP BY c2.id, c2.name 
ORDER BY nb_children DESC 
LIMIT 5;" 2>/dev/null

echo ""
echo "✅ Vérification terminée!"
