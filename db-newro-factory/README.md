# 🗄️ Base de Données Newro Factory

## 🚀 Démarrer

```bash
# Option 1: Script automatique
./start.sh

# Option 2: Manuel
docker-compose up db -d && sleep 30 && docker-compose up app
```

## 🔄 Redémarrer

```bash
docker-compose down -v
docker-compose up db -d && sleep 30 && docker-compose up app
```

## 🔍 Tester

```bash
docker exec mysql-newro mysql -u adminnewro -pQwerty1234 newro-factory-db -e "SELECT COUNT(*) FROM chapter;"
```

## 📋 Connexion

- **Host**: localhost:33006
- **User**: adminnewro  
- **Password**: Qwerty1234
- **Database**: newro-factory-db
