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
    echo '<h3> Voici la liste de tout les joueus de la saison 2019-2020</h3><br>';

    echo "<table class ='joueurs'>
        <thead>
        <tr>
            <th>id_joueur</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Poste</th>
            <th>Numéro</th>
            <th>id_equipe</th>
        </tr></thead>
        <tbody>";

    foreach($db->query('SELECT * from joueur') as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);
        $id_joueur = $row['id_joueur'];
        $nom = $row['nom_joueur'];
        $prenom = $row['prenom_joueur'];
        $poste = $row['poste_joueur'];
        $numero = $row['numero_joueur'];
        $id_equipe = $row['id_equipe'];
        echo "<tr>
            <td>$id_joueur</td>
            <td>$nom</td>
            <td>$prenom</td>
            <td>$poste</td>
            <td>$numero</td>    
            <td>$id_equipe</td>
        </tr>";
    }
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
    die;
}
echo '</tbody></table>';
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



