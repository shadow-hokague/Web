<?php
// Connexion à la base de données (valeurs en dur)
define( 'YOURLS_DB_USER', 'hokague' );
define( 'YOURLS_DB_PASS', '@Motdepasse0000' );
define( 'YOURLS_DB_NAME', 'hokague_db' );
define( 'YOURLS_DB_HOST', 'mysql-hokague.alwaysdata.net' ); // souvent 'localhost' ou 'mysql' si docker-compose

// URL de base du site YOURLS (à adapter à ton domaine Render)
define( 'YOURLS_SITE', 'https://web-4h8e.onrender.com' );

// Fuseau horaire (UTC+0 ici)
define( 'YOURLS_HOURS_OFFSET', 0 );

// Langue (par exemple 'fr' si tu veux activer le français)
define( 'YOURLS_LANGUAGE', 'en' );

// Options
define( 'YOURLS_UNIQUE_URLS', true ); // chaque URL est unique
define( 'YOURLS_PRIVATE', true );     // accès privé, nécessite login

// Identifiants d’administration
$yourls_user_passwords = array(
  'admin' => '@Motdepasse0000'
);

// Mode debug (désactivé par défaut)
define( 'YOURLS_DEBUG', false );
