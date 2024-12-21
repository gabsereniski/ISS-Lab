<?php
session_start();
require 'db.php';

// Verificar se o usuário está logado
if (!isset($_SESSION['user_id'])) {
    echo "<!DOCTYPE html>
    <html>
    <head>
        <title>Acesso Negado</title>
        <link rel='stylesheet' href='style.css'>
    </head>
    <body>
    <div class='container'>
        <h1>Acesso Negado</h1>
        <p>Você não tem permissão para acessar esta página. Faça login primeiro.</p>
        <a href='index.php'>Voltar ao Início</a>
    </div>
    </body>
    </html>";
    exit; // Impede o carregamento do restante da página
}

// Verificar se o botão de logout foi clicado
if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit;
}

// Obter informações do usuário logado
$user_id = $_SESSION['user_id'];
$stmt = $pdo->prepare("SELECT full_name, is_admin FROM users WHERE id = :user_id");
$stmt->bindParam(':user_id', $user_id);
$stmt->execute();
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Variáveis do usuário
$full_name = $user['full_name'];
$is_admin = $user['is_admin'];
$search = isset($_GET['search']) ? $_GET['search'] : '';

// Consultar Pokémon com base no tipo de usuário e termo de busca
$query = $is_admin ? "SELECT * FROM pokemon" : "
    SELECT p.*
    FROM pokemon p
    JOIN user_pokemon up ON p.pokedex_number = up.pokemon_id
    WHERE up.user_id = :user_id";

if (!empty($search)) {
    $query .= $is_admin ? " WHERE " : " AND ";

    // Verifica se o termo de busca é "legendary"
    if (strtolower($search) === "legendary") {
        $query .= "is_legendary = 1";
    } else {
        $query .= "
            (pokedex_number LIKE :search OR
            name LIKE :search OR
            attack LIKE :search OR
            defense LIKE :search OR
            hp LIKE :search OR
            speed LIKE :search OR
            sp_attack LIKE :search OR
            sp_defense LIKE :search OR
            type1 LIKE :search OR
            type2 LIKE :search OR
            abilities LIKE :search OR
            capture_rate LIKE :search OR
            weight_kg LIKE :search OR
            height_m LIKE :search OR
            classfication LIKE :search OR
            generation LIKE :search OR
            is_legendary LIKE :search)";
    }
}

$stmt = $pdo->prepare($query);
if (!empty($search) && strtolower($search) !== "legendary") {
    $searchTerm = "%$search%";
    $stmt->bindParam(':search', $searchTerm);
}
if (!$is_admin) {
    $stmt->bindParam(':user_id', $user_id);
}
$stmt->execute();
$pokemons = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Página HTML com estilização
echo "<!DOCTYPE html>
<html>
<head>
    <title>Bem-vindo</title>
    <link rel='stylesheet' href='style.css'>
</head>
<body>
<div class='container'>
    <h1>Bem-vindo, $full_name!</h1>
    <form method='GET' action=''>
        <input type='text' name='search' placeholder='Buscar...' value='" . htmlspecialchars($search) . "'>
        <button type='submit'>Pesquisar</button>
    </form>
    <a href='?logout=true'>Logout</a>
    <h2>Seus Pokémon:</h2>";

// Verificar se existem Pokémon
if (count($pokemons) > 0) {
    echo "<div class='table-wrapper'>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Attack</th>
                        <th>Defense</th>
                        <th>HP</th>
                        <th>Speed</th>
                        <th>Sp. Attack</th>
                        <th>Sp. Defense</th>
                        <th>Type</th>
                        <th>Abilities</th>
                        <th>Capture Rate</th>
                        <th>Weight (kg)</th>
                        <th>Height (m)</th>
                        <th>Classification</th>
                        <th>Generation</th>
                        <th>Legendary</th>
                    </tr>
                </thead>
                <tbody>";
    foreach ($pokemons as $pokemon) {
        echo "<tr>
                <td>{$pokemon['pokedex_number']}</td>
                <td>{$pokemon['name']}</td>
                <td>{$pokemon['attack']}</td>
                <td>{$pokemon['defense']}</td>
                <td>{$pokemon['hp']}</td>
                <td>{$pokemon['speed']}</td>
                <td>{$pokemon['sp_attack']}</td>
                <td>{$pokemon['sp_defense']}</td>
                <td>{$pokemon['type1']}" . (!empty($pokemon['type2']) ? ", {$pokemon['type2']}" : "") . "</td>
                <td>{$pokemon['abilities']}</td>
                <td>{$pokemon['capture_rate']}</td>
                <td>{$pokemon['weight_kg']}</td>
                <td>{$pokemon['height_m']}</td>
                <td>{$pokemon['classfication']}</td>
                <td>{$pokemon['generation']}</td>
                <td>" . ($pokemon['is_legendary'] ? "Yes" : "No") . "</td>
              </tr>";
    }
    echo "</tbody></table>
          </div>";
} else {
    echo "<p>Você não possui nenhum Pokémon relacionado.</p>";
}
echo "</div>
</body>
</html>";
?>
