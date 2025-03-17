<?php
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['id_empleado'])) {
    header("Location: index.php"); 
    exit();
}

// Obtener el cargo del usuario desde la sesión
$cargo = $_SESSION['cargo'];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Ventas</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
    <!-- Estilos -->
    <link href="css/styles2.css" rel="stylesheet" type="text/css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="javascript/menu.js"></script>
</head>
<body>

    <!-- Encabezado superior -->
    <div class="header d-flex justify-content-between align-items-center p-3 bg-primary text-white">
        <div class="d-flex align-items-center">
            <img src="images/login.png" alt="Usuario" class="rounded-circle" width="40">
            <span class="ms-2"><?php echo $cargo; ?></span>
        </div>
        <h1>SISTEMA DE FACTURACIÓN</h1>
        <div class="bg-warning p-2 rounded">
            <a href="logout.php" class="text-danger"><i class="bi bi-power"></i> Cerrar sesión</a>
        </div>
    </div>

    <!-- Contenedor principal -->
    <div class="d-flex">
        
        <!-- barra lateral -->
        <div id="sidebar" class="sidebar bg-dark p-3">
            <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuHistorial" aria-expanded="false">
                <i class="bi bi-people"></i> Historial ventas
            </a>
            <div class="collapse" id="submenuHistorial">
                <a href="#" class="sub-item" onclick="cambiarContenido('Historial ventas', 'ver_lista')">Ver lista</a>
            </div>

            <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuVentas" aria-expanded="false">
                <i class="bi bi-person"></i> Ventas
            </a>
            <div class="collapse" id="submenuVentas">
                <a href="#" class="sub-item" onclick="cambiarContenido('Ventas', 'agregar')">Agregar</a>
                <a href="#" class="sub-item" onclick="cambiarContenido('Ventas', 'actualizar')">Actualizar</a>
            </div>

            <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuCategorias" aria-expanded="false">
                <i class="bi bi-tags"></i> Categorías
            </a>
            <div class="collapse" id="submenuCategorias">
                <a href="#" class="sub-item" onclick="cambiarContenido('Categorías', 'ver_lista')">Ver lista</a>
               
            </div>

            <?php if (strtolower($cargo) == 'administrador'): ?> <!--muestra si es admin-->
            <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuEmpleados" aria-expanded="false">
                <i class="bi bi-box-seam"></i> Empleados
            </a>
            <div class="collapse" id="submenuEmpleados">
                <a href="#" class="sub-item" onclick="cambiarContenido('Empleados', 'ver_lista')">Ver lista</a>
                <a href="#" class="sub-item" onclick="cambiarContenido('Empleados', 'agregar')">Agregar</a>
                <a href="#" class="sub-item" onclick="cambiarContenido('Empleados', 'borrar')">Borrar</a>
                <a href="#" class="sub-item" onclick="cambiarContenido('Empleados', 'actualizar')">Actualizar</a>
            </div>
            <?php endif; ?>

            <a href="#" onclick="cambiarContenido('Clientes')">
            <i class="bi bi-cart"></i> Clientes
            </a>

            <?php if (strtolower($cargo) == 'administrador'): ?> <!--muestra si es admin-->
            <a href="#" data-bs-toggle="collapse" data-bs-target="#submenuInventario" aria-expanded="false">
                <i class="bi bi-gear"></i> Inventario
            </a>
            <div class="collapse" id="submenuInventario">
                <a href="#" class="sub-item" onclick="cambiarContenido('Inventario', 'ver_lista')">Ver lista</a>
            </div>
            <?php endif; ?>

        </div>

   
        <!--Muestra contenido de la barra lateral-->
        <div class="main-content flex-grow-1 p-4">
            <h2 id="titulo">Bienvenido</h2>
            <div id="contenido">
                <p>Seleccione una opción del menú.</p>
            </div>
        </div>
    </div>
</body>
</html>