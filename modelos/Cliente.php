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

    // Crear un cliente
    public function create() {
        $query = "INSERT INTO " . $this->table_name . " (Nit_Cedula, Nombre, Direccion, Telefono) VALUES (:Nit_Cedula, :Nombre, :Direccion, :Telefono)";
        $stmt = $this->conn->prepare($query);

        // Limpiar datos
        $this->Nit_Cedula=htmlspecialchars(strip_tags($this->Nit_Cedula));
        $this->Nombre=htmlspecialchars(strip_tags($this->Nombre));
        $this->Direccion=htmlspecialchars(strip_tags($this->Direccion));
        $this->Telefono=htmlspecialchars(strip_tags($this->Telefono));

        // Bind data
        $stmt->bindParam(":Nit_Cedula", $this->Nit_Cedula);
        $stmt->bindParam(":Nombre", $this->Nombre);
        $stmt->bindParam(":Direccion", $this->Direccion);
        $stmt->bindParam(":Telefono", $this->Telefono);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }
}
?>