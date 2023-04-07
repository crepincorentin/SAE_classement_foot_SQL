<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style1.css">
    <link rel="stylesheet" href="../css/Style3.css">
    <title>Classement</title>
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
    echo '<h3> Voici le classement de la saison 2019-2020 : </h3>';
    echo "<table class ='classement'>
        <thead>
        <tr>
            <th>N°</th>
            <th>Nom</th>
            <th>Match_joués</th>
            <th>Points</th>
            <th>Diff_but</th>;
            <th>Cartons_jaunes</th>;
            <th>Cartons_rouges</th>;
            <th>Buts_marqués</th>;
            <th>Buts_encaissés</th>;
            <th>Victoires</th>;
            <th>Nuls</th>;
            <th>Défaites</th>;
            <th>Forme</th>;
        </tr></thead>
        <tbody>";

        
    foreach($db->query('select ROW_NUMBER() OVER(ORDER BY points DESC, diff_but 
    desc, carton_jaune desc, carton_rouge desc) As N° , nom_equipe,nb_matchs, 
    points, diff_but, carton_jaune, carton_rouge, but_marque, but_encaisse,
    nb_victoire, nb_defaite, nb_match_nul, forme from classement;')  as $row) {
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);
        $N° = $row['N°'];
        $nom_equipe = $row['nom_equipe'];
        $nb_matchs = $row['nb_matchs'];
        $points = $row['points'];
        $diff_but = $row['diff_but'];
        $carton_jaune = $row['carton_jaune'];
        $carton_rouge = $row['carton_rouge'];
        $but_marque = $row['but_marque'];
        $but_encaisse = $row['but_encaisse'];
        $nb_victoire = $row['nb_victoire'];
        $nb_defaite = $row['nb_defaite'];
        $nb_match_nul = $row['nb_match_nul'];
        $forme = $row['forme'];

        echo "
        <tbody>
        <tr>
            <td>$N°</td>
            <td>$nom_equipe</td>
            <td>$nb_matchs</td>
            <td>$points</td>
            <td>$diff_but</td>
            <td>$carton_jaune</td>
            <td>$carton_rouge</td>
            <td>$but_marque</td>
            <td>$but_encaisse</td>
            <td>$nb_victoire</td>
            <td>$nb_defaite</td>
            <td>$nb_match_nul</td>
            <td>$forme</td>
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



