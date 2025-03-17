<?php
class Login {
    private $conn;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function authenticate($user, $password) {
        $query = "SELECT e.ID_Empleado, c.Nombre AS Cargo
                  FROM empleado e
                  INNER JOIN cargos c ON e.ID_Cargo = c.ID_Cargo
                  WHERE e.user = :user AND e.password = :password AND e.status = 1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':user', $user);
        $stmt->bindParam(':password', $password);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            return $stmt->fetch(PDO::FETCH_ASSOC); // Devuelve los datos del empleado
        } else {
            return false; // Autenticación fallida
        }
    }
}
?>