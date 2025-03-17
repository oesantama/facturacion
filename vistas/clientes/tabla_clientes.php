<?php
   include_once '../../modelos/Cliente.php';
   include_once '../../config/connection.php';

   // Obtener conexión a la base de datos
   $database = new Database();
   $db = $database->getConnection();

   // Crear instancia del modelo Cliente
   $cliente = new Cliente($db);

   // Obtener todos los clientes
   $stmt = $cliente->read();
   $num = $stmt->rowCount();

   $clientes = array();

   if ($num > 0) {
       while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
           extract($row);
           $cliente_item = array(
               "ID_Cliente" => $ID_Cliente,
               "Nit_Cedula" => $Nit_Cedula,
               "Nombre" => $Nombre,
               "Direccion" => $Direccion,
               "Telefono" => $Telefono
           );
           array_push($clientes, $cliente_item);
       }
   }
   ?>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nit/Cédula</th>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($clientes as $cliente): ?>
            <tr>
                <td><?php echo $cliente["ID_Cliente"]; ?></td>
                <td><?php echo $cliente["Nit_Cedula"]; ?></td>
                <td><?php echo $cliente["Nombre"]; ?></td>
                <td><?php echo $cliente["Direccion"]; ?></td>
                <td><?php echo $cliente["Telefono"]; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>