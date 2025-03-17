<?php

include_once '../modelos/Cliente.php';
include_once '../config/connection.php';

class ClienteController {
    public function index() {
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

        // Incluir la vista para mostrar la tabla
        include '../vistas/clientes/tabla_clientes.php';
    }

    public function create() {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Obtener conexión a la base de datos
            $database = new Database();
            $db = $database->getConnection();

            // Crear instancia del modelo Cliente
            $cliente = new Cliente($db);

            // Asignar valores a las propiedades del cliente
            $cliente->Nit_Cedula = $_POST['Nit_Cedula'];
            $cliente->Nombre = $_POST['Nombre'];
            $cliente->Direccion = $_POST['Direccion'];
            $cliente->Telefono = $_POST['Telefono'];

            // Crear el cliente
            if ($cliente->create()) {
                echo "Cliente creado correctamente.";
            } else {
                echo "Error al crear el cliente.";
            }
            exit;
        }

    }
}
?>