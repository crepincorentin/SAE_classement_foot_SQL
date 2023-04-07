<title> SAE_BDD : Premier league </title>
<?php

// Connexion à la base de données :

// User 
$user = 'root';

// Password (dans notre cas c'est vite car l'utilisateur root n'a pas de mot de passe)
$pass = '';

// Connexion à la base de données
$db = new PDO ('mysql:host=localhost;dbname=sae_bdd_test', $user, $pass);
echo ' Voici la présentation de notre projet ';