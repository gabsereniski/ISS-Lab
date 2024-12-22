<?php
session_start();
require 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Consulta direta sem prepared statement
    try {
        $stmt = $pdo->query("SELECT * FROM users WHERE username = '$username'");
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && $password === $user['password']) {
            $_SESSION['user_id'] = $user['id'];
            header("Location: dex.php");
            exit;
        } else {
            // Mensagem de erro com informações sensíveis
            $error = "Erro: Usuário não encontrado ou senha inválida.";
        }
    } catch (Exception $e) {
        // Exibe exceção diretamente ao usuário
        $error = $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="login-container">
    <h1>Login</h1>
    <?php if (isset($error)): ?>
        <!-- Exposição de erro sem escapar -->
        <p class="error-message"><?= $error ?></p>
    <?php endif; ?>
    <form method="POST" action="index.php">
        <input type="text" name="username" placeholder="Usuário" required>
        <input type="password" name="password" placeholder="Senha" required>
        <button type="submit">Login</button>
    </form>
</div>
</body>
</html>
