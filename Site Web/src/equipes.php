<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style1.css">
    <link rel="stylesheet" href="../css/Style3.css">
    <title>Equipes</title>
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
    echo '<h3> Voici les équipes de la saison 2019-2020 : </h3>';

    echo "<table class ='equipes'>
        <thead>
        <tr>
            <th>id_equipe</th>
            <th>Nom</th>
            <th>Ville</th>
            <th>Stade</th>
            <th>Capacité</th>;
        </tr></thead>
        <tbody>";
        
    foreach($db->query('SELECT * from equipe') as $row) {
        
        $id_squad = $row['id_equipe'];
        $name = $row['nom'];
        $city = $row['ville'];
        $stadium = $row['stade'];
        $capacity = $row['capacite'];

        echo "<tbody>
        <tr>
            <td>$id_squad</td>
            <td>$name</td>
            <td>$city</td>
            <td>$stadium</td>
            <td>$capacity</td>
        </tr>";
        
        // Afficher un tableau en 2D
        //printf("<pre>%s</pre>", print_r($row, true));
        // Affiche le tableau en ligne
        //print_r($row);
        // Affiche l'id de l'équipe
        //echo $row['id_equipe'];
        // Affiche le nom de l'équipe
        //echo $row['nom'];
        // Affiche la ville de l'équipe
        //echo $row['ville'];
        // Affiche le nom du stade
        //echo $row['stade'];
        // Affiche la capacité du stade
        //echo $row['capacite'];

    }
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
    die;
}
    echo "</tbody>
</table>";
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



