<?php
class Cliente {
    private $conn;
    private $table_name = "cliente";

    // Propiedades del cliente
    public $ID_Cliente;
    public $Nit_Cedula;
    public $Nombre;
    public $Direccion;
    public $Telefono;

    public function __construct($db) {
        $this->conn = $db;
    }


    // Leer todos los clientes
    public function read() {
        $query = "SELECT ID_Cliente, Nit_Cedula, Nombre, Direccion, Telefono FROM " . $this->table_name;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

}
?>