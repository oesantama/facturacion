<?php
$error = isset($_GET['error']) ? "Usuario o contraseña incorrectos" : "";
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet" type="text/css">


</head>
<body>
<section class="gradient-custom">

    <div class="card-custom">

        <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
        <p class="text  -white-50 mb-4">
            <img src="images/logo.png" alt="Icono" width="170"> 
        </p>


               <?php if ($error): ?>
            <div class="alert alert-danger text-center" role="alert">
                <?php echo $error; ?>
            </div>
        <?php endif; ?>

        <!--Formulario q envia los datos a login-->
        <form action="controladores/LoginController.php" method="POST">
            <input type="text" name="user" class="form-control mb-3" placeholder="Usuario" required>
            <input type="password" name="password" class="form-control mb-3" placeholder="Contraseña" required>

            <button type="submit" class="btn btn-outline-light w-100">Iniciar Sesion</button>
        </form>

    </div>
</section>
</body>
</html>
