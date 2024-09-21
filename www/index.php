<?php
// Charger F3
require 'vendor/autoload.php';

// Instancier F3
$f3 = \Base::instance();


// Définir une route pour tester les connexions à MariaDB et Redis
$f3->route('GET /', function ($f3) {

    // Tester la connexion à MariaDB
    try {
        $db_name = getenv('MARIADB_DATABASE');
        $db_user = getenv('MARIADB_USER');
        $db_password = getenv('MARIADB_PASSWORD');

        $db = new \DB\SQL("mysql:host=mariadb;port=3306;dbname=$db_name", $db_user, $db_password);
        echo nl2br("La connexion est réussie.\n");
    } catch (PDOException $e) {
        echo nl2br("Erreur de connexion : " . $e->getMessage() . PHP_EOL);
    }

    // Tester l'utlisation de Redis
    try {
        $f3->set('CACHE', true);
        $cache = \Cache::instance();
        $cache->set("test_key", nl2br("Hello, Redis!\n"));
        echo "Redis test value: " . $cache->get("test_key");
    } catch (Exception $e) {
        echo nl2br("Erreur de connection: " . $e->getMessage() . PHP_EOL);
    }
});

// Exécuter l'application
$f3->run();
