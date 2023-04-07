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
    echo '<h3>Voici les matchs de la saison 2019-2020</h3><br>';

    echo "<table class ='matchs'>
        <thead>
        <tr>
            <th>id_match</th>
            <th>Equipe domicile</th>
            <th>Equipe exterieur</th>
            <th>Score domicile</th>
            <th>Score exterieur</th>
            <th>Date</th>
        </tr></thead>
        <tbody>";

    foreach($db->query('SELECT * from matchs') as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);

        $id_match = $row['id_match'];
        $equipe_domicile = $row['id_equipe_domicile'];
        $equipe_exterieur = $row['id_equipe_exterieur'];
        $score_domicile = $row['score_equipe_domicile'];
        $score_exterieur = $row['score_equipe_exterieur'];
        $date = $row['date_match'];

            echo "<tbody>
            <tr>
                <td>$id_match</td>
                <td>$equipe_domicile</td>
                <td>$equipe_exterieur</td>
                <td>$score_domicile</td>
                <td>$score_exterieur</td>
                <td>$date</td>
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



