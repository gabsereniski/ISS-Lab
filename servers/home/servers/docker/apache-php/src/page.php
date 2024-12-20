<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    die("Acesso negado. Faça login primeiro.");
}

echo "Bem-vindo! Esta é uma página segura.";
?>
<a href="logout.php">Logout</a>
