# lamp-stack - Stack Docker avec Fat-Free Framework (F3), MariaDB, Redis, et Apache

## Description

Ce projet est une stack de développement basée sur Docker, comprenant les éléments suivants :
- **PHP 8.2 avec Apache** : Serveur web pour l'exécution des scripts PHP.
- **Fat-Free Framework (F3)** : Framework PHP léger pour la création d'applications web.
- **MariaDB** : Base de données relationnelle.
- **Redis** : Cache en mémoire pour améliorer les performances.
- **Apache avec SSL** : Serveur web avec gestion des certificats SSL.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les logiciels suivants :

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/)
- [mkcert](https://github.com/FiloSottile/mkcert?tab=readme-ov-file)
 
## Structure

```
.
├── www/                       # Dossier racine du serveur (HTML/PHP)
├── conf/                      # Configuration Apache et PHP
│   ├── apache2/
│   │   └── default-ssl.conf   # Fichier de configuration Apache SSL
│   └── certs/                 # Emplacement des certificats
│   └── php/
│   │   └── php.ini            # Configuration PHP
│   └── gen_certs.bat          # Génération des certificats
├── Dockerfile                 # Image Docker pour le serveur web
├── docker-compose.yml         # Configuration Docker Compose
└── .env                       # Variables d'environnement
```

## Installation

### 1. Clonez le dépôt

```
git clone https://github.com/votreutilisateur/nom-du-repo.git
cd nom-du-repo
```

### 2. Configuration du fichier .env
Créez un fichier .env à la racine du projet (si ce n'est pas déjà fait). Utilisez les variables d'environnement suivantes :

```
# Chemins
WWW_PATH=./www
CERTS_PATH=./conf/certs

# Configuration MariaDB
MARIADB_DATABASE=bddName
MARIADB_USER=userName
MARIADB_PASSWORD=password
MARIADB_HOST=mariadb
MARIADB_PORT=3306

# Redis
REDIS_PASSWORD=redisPassword
```

### 3. Commandes Utiles
- Lancer la stack : ```docker-compose up --build```
- Arrêter la stack : ```docker-compose down```
- Redémarrer les services :```docker-compose restart```
- Accéder à un conteneur en bash : ```docker exec -it nom-du-conteneur bash```
