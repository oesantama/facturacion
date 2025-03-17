<?php
session_start();
include_once '../config/connection.php';
include_once '../modelos/Login.php';

class LoginController {
    public function login() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $user = $_POST['user'];
            $password = $_POST['password'];

            $database = new Database();
            $db = $database->getConnection();

            $loginModel = new Login($db);
            $employeeData = $loginModel->authenticate($user, $password);

            if ($employeeData) {
                // Autenticación exitosa
                $_SESSION['id_empleado'] = $employeeData['ID_Empleado'];
                $_SESSION['cargo'] = $employeeData['Cargo'];

                header("Location: ../vistas/menu.php");
                exit();
            } else {
                // Autenticación fallida
                header("Location: ../index.php?error=1");
                exit();
            }
        } else {
            // Si no es un POST, redirigir al formulario de login (index.php)
            header("Location: ../index.php");
            exit();
        }
    }
}

// Crear una instancia del controlador y ejecutar la acción de login
$loginController = new LoginController();
$loginController->login();
?>