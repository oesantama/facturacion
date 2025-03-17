function cambiarContenido(titulo) {
    document.getElementById("titulo").textContent = titulo;
    let contenidoDiv = document.getElementById("contenido");
    contenidoDiv.innerHTML = ""; // Limpiar el contenido anterior

    let mensaje = "Seleccione una opción del menú.";

    switch (titulo) {
        case "Clientes":
            // Lógica específica para cargar clientes.php
            fetch('clientes/clientes.php')
                .then(response => response.text())
                .then(data => {
                    contenidoDiv.innerHTML = data;
                });
            break;

        case "Categorías":
            // Lógica específica para cargar categorías.php
            fetch('categorias.php')
                .then(response => response.text())
                .then(data => {
                    contenidoDiv.innerHTML = data;
                });
            break;

        case "Historial ventas":
            contenidoDiv.textContent = "Ver el historial de Ventas (implementar)";
            break;

        case "Ventas":
            contenidoDiv.textContent = "Agregar una venta (implementar)";
            break;

        case "Empleados":
            contenidoDiv.textContent = "Ver la lista de Empleados (implementar)";
            break;

        case "Inventario":
            contenidoDiv.textContent = "Ver la lista del inventario (implementar)";
            break;

        default:
            contenidoDiv.textContent = mensaje;
            break;
    }
}