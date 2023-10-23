<?php
// Obtener información del cliente
$ip = $_SERVER['REMOTE_ADDR']; // Dirección IP del cliente
$user_agent = $_SERVER['HTTP_USER_AGENT']; // Agente de usuario del navegador

// Registrar información en un archivo (registra la dirección IP y el agente de usuario)
$archivo = fopen('informacion.txt', 'a');
fwrite($archivo, "IP: " . $ip . " - User Agent: " . $user_agent . "\n");
fclose($archivo);

// Redirigir a una imagen aparentemente inofensiva
header('Location: https://ruta_a_tu_imagen.com/foto.jpg');
?>
