import re
import sys
from pathlib import Path

def process_file(input_path: Path,
                 modified_path: Path,
                 extraction_path: Path):
    # Regex pour capturer id, name, parent_path
    line_re = re.compile(
        r"""INSERT\s+INTO\s+chapter\s*\(\s*id\s*,\s*name\s*,\s*parent_path\s*\)
            \s*VALUES\s*\(\s*(\d+)\s*,\s*'(.+?)'\s*,\s*'(.+?)'\s*\)\s*;""",
        re.IGNORECASE | re.VERBOSE
    )

    records = []  # tuples (id:int, raw_name:str, parent_path:str)
    with input_path.open(encoding='utf-8') as f:
        for lineno, line in enumerate(f, 1):
            m = line_re.match(line.strip())
            if not m:
                print(f"⚠ Ligne ignorée ({lineno}): {line.strip()}", file=sys.stderr)
                continue
            rec_id = int(m.group(1))
            raw_name = m.group(2)         # ex: "\"FINALIZE()\""  ou "CH 1 Java Building Blocks"
            parent_path = m.group(3)      # ex: "/OCA/.../"
            records.append((rec_id, raw_name, parent_path))

    # Étape 1 : écriture de modified.sql
    with modified_path.open('w', encoding='utf-8') as out_mod:
        for rec_id, raw_name, _ in records:
            # retirer éventuelles guillemets internes et corriger FINALIZE→FINALISE
            name = raw_name.strip('"')
            name = name.replace('FINALIZE()', 'FINALISE()')
            # ré-encadrer avec doubles‑guillemets
            safe_name = f'"{name}"'
            out_mod.write(
                f'INSERT INTO chapter (id, name) VALUES ({rec_id}, {safe_name});\n'
            )

    # Construire le mapping name→id
    name2id = {}
    for rec_id, raw_name, _ in records:
        name = raw_name.strip('"').replace('FINALIZE()', 'FINALISE()')
        name2id[name] = rec_id

    # Étapes 2–4 : extraction des relations
    with extraction_path.open('w', encoding='utf-8') as out_ext:
        for rec_id, raw_name, parent_path in records:
            # découpe par '/', on enlève les segments vides
            segments = [seg for seg in parent_path.split('/') if seg]
            # corriger spelling si nécessaire
            segments = [seg.replace('FINALIZE()', 'FINALISE()') for seg in segments]
            # lookup id pour chacun
            for seg in segments:
                parent_id = name2id.get(seg)
                if parent_id is None:
                    print(f"⚠ Aucune correspondance trouvée pour « {seg} » (parent de {rec_id})", file=sys.stderr)
                    continue
                out_ext.write(
                    f'INSERT INTO XX (id, parent_id) VALUES ({rec_id}, {parent_id});\n'
                )

if __name__ == "__main__":
    # chemins – adapter si besoin
    INPUT_FILE = Path("before.sql")
    MODIFIED_FILE = Path("modified.sql")
    EXTRACTION_FILE = Path("extraction.sql")

    process_file(INPUT_FILE, MODIFIED_FILE, EXTRACTION_FILE)
    print(f"→ Écrit {MODIFIED_FILE} et {EXTRACTION_FILE}")
