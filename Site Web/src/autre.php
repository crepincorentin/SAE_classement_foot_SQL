<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style1.css">
    <link rel="stylesheet" href="../css/Style3.css">
    <title>PREMIERE LEAGUE</title>
</head>
<body>
    <header>
        <div class="centre">
            <div class="head">
                <a href="#"><img src= "../img/pllogo.png" alt="Logo"></a>
                <h1>PREMIERE LEAGUE</h1>
                <p>Site officiel</p>
            </div> 
        </div>
    
    </header>
    <nav>
        <ul>
            <<li><a href="index.php">Accueil</a></li>
            <li><a href="equipes.php">Equipes</a></li>
            <li><a href="classement.php">Classements</a></li>
            <li><a href="joueurs.php">Joueurs</a></li>
            <li><a href="matchs.php">Matchs</a></li>
            <li><a href="autre.php">Autre...</a></li>
        </ul>
    </nav> 

    <?php

// Connexion à la base de données :

// User 
$user = 'root';

// Password (dans notre cas c'est vite car l'utilisateur root n'a pas de mot de passe)
$pass = '';

// Exception
try{
    // Connexion à la base de données
    $db = new PDO ('mysql:host=localhost;dbname=sae_bdd_test', $user, $pass);
    echo '<h3>Voici les meilleurs buteurs de la saison</h3><br>';

    echo "<table class ='buteurs'>
        <thead>
        <tr>
            <th>N°</th>
            <th>Nom</th>
            <th>Nb_but</th>
        </tr></thead>
        <tbody>";


    foreach($db->query('select ROW_NUMBER() OVER(ORDER BY but_marqué DESC) 
    As N° , nom_joueur, but_marqué from classement_buteur limit 15;') as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);

        $N° = $row['N°'];
        $nom_joueur = $row['nom_joueur'];
        $but_marque = $row['but_marqué'];

            echo "<tbody>
            <tr>
                <td>$N°</td>
                <td>$nom_joueur</td>
                <td>$but_marque</td>
            </tr>";
        
    }
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
    die;
}
echo "</tbody></table>";
?>


<?php

// Connexion à la base de données :

// User 
$user = 'root';

// Password (dans notre cas c'est vite car l'utilisateur root n'a pas de mot de passe)
$pass = '';

// Exception
try{
    // Connexion à la base de données
    $db = new PDO ('mysql:host=localhost;dbname=sae_bdd_test', $user, $pass);

    echo '<h3>Voici les différents buts de la saison</h3><br>';
    echo "<table class ='buteurs'>
        <thead>
        <tr>
            <th>id_but</th>
            <th>id_match</th>
            <th>id_joueur</th>
            <th>type_but</th>
            <th>id_equipe</th>
        </tr></thead>
        <tbody>";

    foreach($db->query('select * from buts') as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);
        
        $id_but = $row['id_but'];
        $id_match = $row['id_match'];
        $id_joueur = $row['id_joueur'];
        $type_but = $row['type_but'];
        $id_equipe = $row['id_equipe'];

            echo "<tbody>
            <tr>
                <td>$id_but</td>
                <td>$id_match</td>
                <td>$id_joueur</td>
                <td>$type_but</td>
                <td>$id_equipe</td>
            </tr>";
    }
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
    die;
}
echo "</tbody></table>";
?>

<?php

// Connexion à la base de données :

// User 
$user = 'root';

// Password (dans notre cas c'est vite car l'utilisateur root n'a pas de mot de passe)
$pass = '';

// Exception
try{
    // Connexion à la base de données
    $db = new PDO ('mysql:host=localhost;dbname=sae_bdd_test', $user, $pass);

    echo '<h3>Voici les différents joueurs qui ont reçu des avertissements au cours de la saison</h3><br>';
    echo "<table class ='buteurs'>
        <thead>
        <tr>
            <th>id_avertir</th>
            <th>id_joueur</th>
            <th>id_carton</th>
            <th>id_match</th>
            <th>min</th>
            <th>id_equipe</th>
        </tr></thead>
        <tbody>";

    foreach($db->query('select * from avertir') as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);
        
        $id_avertir = $row['id_avertir'];
        $id_joueur = $row['id_joueur'];
        $id_carton = $row['id_carton'];
        $id_match = $row['id_match'];
        $min = $row['min'];
        $id_equipe = $row['id_equipe'];

            echo "<tbody>
            <tr>
                <td>$id_avertir</td>
                <td>$id_joueur</td>
                <td>$id_carton</td>
                <td>$id_match</td>
                <td>$min</td>
                <td>$id_equipe</td>
            </tr>";
    }
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
    die;
}
echo "</tbody></table>";
?>

<footer class="footer">
        <a href="../src/mention.html" class="mention">Mentions légales</a>
        <div class="reseaux">
        <img src="../img/discordlogo.jpg" alt="Discord"></a>
        <img src="../img/logogmail.png" alt="Gmail"></a>
        </div>
    </footer>
</body>
</html>



