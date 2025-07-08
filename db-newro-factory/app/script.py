import pymysql
import time
import sys

def connect_with_retry(max_retries=5):
    for attempt in range(max_retries):
        try:
            print(f"Tentative de connexion {attempt + 1}/{max_retries}...")
            conn = pymysql.connect(
                host='db',
                port=3306,
                user='adminnewro',
                password='Qwerty1234',
                database='newro-factory-db',
                charset='utf8mb4',
                cursorclass=pymysql.cursors.DictCursor
            )
            print("✅ Connexion réussie!")
            return conn
        except pymysql.Error as e:
            print(f"❌ Erreur de connexion: {e}")
            if attempt < max_retries - 1:
                print("⏳ Nouvelle tentative dans 3 secondes...")
                time.sleep(3)
            else:
                print("💥 Impossible de se connecter après toutes les tentatives")
                sys.exit(1)

def fix_encoding_issues(text):
    """Corrige les problèmes d'encodage courants"""
    if not text:
        return text

    # Dictionnaire des corrections d'encodage
    encoding_fixes = {
        'Ã©': 'é',
        'Ã¨': 'è',
        'Ã ': 'à',
        'Ã¢': 'â',
        'Ã´': 'ô',
        'Ã®': 'î',
        'Ã¯': 'ï',
        'Ã§': 'ç',
        'Ã¹': 'ù',
        'Ã»': 'û',
        'Ã«': 'ë',
        'Ã¶': 'ö',
        'Ã¼': 'ü',
        'Ã±': 'ñ',
        'Ã': 'À',
        'Ã‰': 'É',
        'Ã‡': 'Ç',
        'â€™': "'",
        'â€œ': '"',
        'â€': '"',
        'â€¦': '...',
        'â€"': '–',
        'â€"': '—'
    }

    fixed_text = text
    for wrong, correct in encoding_fixes.items():
        fixed_text = fixed_text.replace(wrong, correct)

    return fixed_text

conn = connect_with_retry()

try:
    with conn.cursor() as cursor:
        print("🔧 Début des corrections de la base de données...")
        print("")

        # ===== PARTIE 1: CORRECTION DES PROBLÈMES D'ENCODAGE =====
        print("📝 Correction des problèmes d'encodage dans toutes les tables...")

        # Obtenir toutes les tables
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        encoding_fixes_count = 0

        for table_info in tables:
            table_name = list(table_info.values())[0]
            print(f"🔍 Vérification de la table: {table_name}")

            # Obtenir les colonnes de type texte
            cursor.execute(f"DESCRIBE {table_name}")
            columns = cursor.fetchall()

            text_columns = []
            for col in columns:
                col_type = col['Type'].lower()
                if any(text_type in col_type for text_type in ['varchar', 'text', 'char']):
                    text_columns.append(col['Field'])

            if text_columns:
                # Vérifier et corriger les problèmes d'encodage
                for col_name in text_columns:
                    try:
                        cursor.execute(f"SELECT id, {col_name} FROM {table_name} WHERE {col_name} LIKE '%Ã%'")
                        rows_with_issues = cursor.fetchall()

                        for row in rows_with_issues:
                            original_text = row[col_name]
                            fixed_text = fix_encoding_issues(original_text)

                            if original_text != fixed_text:
                                cursor.execute(
                                    f"UPDATE {table_name} SET {col_name} = %s WHERE id = %s",
                                    (fixed_text, row['id'])
                                )
                                print(f"  🔧 Corrigé {table_name}.{col_name} (ID {row['id']}): '{original_text}' → '{fixed_text}'")
                                encoding_fixes_count += 1
                    except Exception as e:
                        print(f"  ⚠️ Erreur sur {table_name}.{col_name}: {e}")

        print(f"✅ Correction d'encodage terminée: {encoding_fixes_count} corrections effectuées")
        print("")

        # ===== PARTIE 2: MIGRATION PARENT_PATH → PARENT_CHAPTER =====
        print("🔄 Migration des relations parent-enfant...")

        # Vérifier si la colonne parent_path existe
        cursor.execute("SHOW COLUMNS FROM chapter LIKE 'parent_path'")
        has_parent_path = cursor.fetchone() is not None

        cursor.execute("SHOW COLUMNS FROM chapter LIKE 'parent_chapter'")
        has_parent_chapter = cursor.fetchone() is not None

        if has_parent_path and not has_parent_chapter:
            # Ajouter la nouvelle colonne parent_chapter
            cursor.execute("ALTER TABLE chapter ADD COLUMN parent_chapter INT NULL")
            print("✅ Colonne parent_chapter ajoutée")
        elif has_parent_chapter:
            print("ℹ️ Colonne parent_chapter existe déjà")
        else:
            print("⚠️ Aucune colonne parent_path trouvée")

        # Effectuer la migration si parent_path existe
        if has_parent_path:
            # Vérifier si la migration a déjà été effectuée
            cursor.execute("""
                SELECT COUNT(*) as count
                FROM chapter
                WHERE parent_chapter IS NOT NULL
            """)
            already_migrated = cursor.fetchone()['count'] > 0

            if already_migrated:
                print("ℹ️ Migration des relations déjà effectuée")
            else:
                print("🔄 Début de la migration des relations parent-enfant...")

                # Récupérer tous les chapitres avec un parent_path renseigné
                cursor.execute("""
                    SELECT id, name, parent_path
                    FROM chapter
                    WHERE parent_path IS NOT NULL
                    AND parent_path != ''
                    AND parent_path != '/'
                """)
                chapters = cursor.fetchall()

                print(f"📊 {len(chapters)} chapitres à migrer")

                # Pour chaque chapitre, chercher l'ID du parent le plus ancien (général)
                for chapter in chapters:
                    raw_value = chapter['parent_path']
                    path_parts = [part for part in raw_value.split('/') if part.strip()]

                    # Chercher le parent le plus ancien (le premier dans le chemin qui existe)
                    parent_found = None
                    parent_name_used = None

                    # Parcourir du plus général au plus spécifique et prendre le PREMIER trouvé
                    for i in range(len(path_parts)):
                        parent_name = path_parts[i]
                        cursor.execute("SELECT id FROM chapter WHERE name = %s", (parent_name,))
                        potential_parent = cursor.fetchone()

                        if potential_parent:
                            parent_found = potential_parent
                            parent_name_used = parent_name
                            # ARRÊTER dès qu'on trouve le premier parent (le plus ancien/général)
                            break

                    if parent_found:
                        print(f"🔁 Mise à jour chapter {chapter['id']} ({chapter['name']}) → parent_chapter = {parent_found['id']} (parent: '{parent_name_used}', chemin: '{raw_value}')")
                        cursor.execute(
                            "UPDATE chapter SET parent_chapter = %s WHERE id = %s",
                            (parent_found['id'], chapter['id'])
                        )
                    else:
                        print(f"⚠️ Aucun parent trouvé pour chapter {chapter['id']} ({chapter['name']}) dans le chemin '{raw_value}', mise à NULL")

                # Mettre à NULL les chapitres racines (parent_path = '/')
                cursor.execute("UPDATE chapter SET parent_chapter = NULL WHERE parent_path = '/'")
                print("🔄 Chapitres racines mis à NULL")

                # Supprimer l'ancienne colonne parent_path
                cursor.execute("ALTER TABLE chapter DROP COLUMN parent_path")
                print("✅ Ancienne colonne parent_path supprimée")
        else:
            print("ℹ️ Colonne parent_path n'existe plus, migration déjà effectuée")

        # Valider les changements
        conn.commit()
        print("")
        print("🎉 Toutes les corrections terminées avec succès!")

        # Afficher un résumé
        print("")
        print("📊 Résumé des corrections:")
        print(f"   - Corrections d'encodage: {encoding_fixes_count}")

        # Statistiques finales
        cursor.execute("SELECT COUNT(*) as total FROM chapter")
        total_chapters = cursor.fetchone()['total']

        cursor.execute("SELECT COUNT(*) as with_parent FROM chapter WHERE parent_chapter IS NOT NULL")
        chapters_with_parent = cursor.fetchone()['with_parent']

        cursor.execute("SELECT COUNT(*) as root_chapters FROM chapter WHERE parent_chapter IS NULL")
        root_chapters = cursor.fetchone()['root_chapters']

        print(f"   - Total chapitres: {total_chapters}")
        print(f"   - Chapitres avec parent: {chapters_with_parent}")
        print(f"   - Chapitres racines: {root_chapters}")

except Exception as e:
    print(f"❌ Erreur lors des corrections: {e}")
    conn.rollback()
finally:
    conn.close()
