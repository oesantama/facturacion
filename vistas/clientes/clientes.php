<div class="container">
    <h2>Lista de Clientes</h2>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregarClienteModal">
        Agregar Cliente
    </button>

    <?php include 'tabla_clientes.php'; ?>

    <!-- Modal para agregar cliente -->
    <div class="modal fade" id="agregarClienteModal" tabindex="-1" aria-labelledby="agregarClienteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="agregarClienteModalLabel">Agregar Nuevo Cliente</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <?php include 'formulario_cliente.php'; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('agregarClienteForm').addEventListener('submit', function (e) {
        e.preventDefault();

        var formData = new FormData(this);

        console.log("Datos del formulario:", Object.fromEntries(formData)); // Imprime los datos del formulario en la consola

        fetch('../controladores/ClienteController.php', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            console.log("Respuesta del servidor:", response); // Imprime la respuesta del servidor
            return response.text();
        })
        .then(data => {
            console.log("Datos recibidos:", data); // Imprime los datos recibidos del servidor
            // Cerrar el modal
            var modal = bootstrap.Modal.getInstance(document.getElementById('agregarClienteModal'));
            modal.hide();

            // Actualizar la tabla
            actualizarTablaClientes();

            // Mostrar mensaje (puedes usar una alerta de Bootstrap)
            alert(data); // O usar una alerta de Bootstrap más estilizada
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al agregar cliente.');
        });
    });

    function actualizarTablaClientes() {
        fetch('tabla_clientes.php')
            .then(response => response.text())
            .then(data => {
                document.querySelector('.table').outerHTML = data; // Reemplaza la tabla
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>