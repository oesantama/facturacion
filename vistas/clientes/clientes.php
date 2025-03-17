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
    document.addEventListener('DOMContentLoaded', function() {  // Asegurarse de que el DOM esté cargado
        const form = document.getElementById('agregarClienteForm');

        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const formData = new FormData(form);
            console.log("Datos del formulario (FormData):");
			for (let pair of formData.entries()) {
				console.log(pair[0]+ ', ' + pair[1]);
			}

            $.ajax({
                url: "../../controladores/ClienteController.php",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    console.log("Enviando formulario..."); // Mensaje de depuración
                },
                success: function(datos) {
                    console.log("Datos recibidos:", datos); // Mensaje de depuración
                    bootbox.alert(datos);
                    actualizarTablaClientes(); // Actualizar la tabla
                    var modal = bootstrap.Modal.getInstance(document.getElementById('agregarClienteModal')); //Obtener la instancia del modal
                    modal.hide()//Esconderlo
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error en la solicitud AJAX:", textStatus, errorThrown);
                    alert("Error al agregar cliente.");
                }
            });
        });

        function actualizarTablaClientes() {
            fetch('tabla_clientes.php')
                .then(response => response.text())
                .then(data => {
                    document.querySelector('.table').outerHTML = data; // Reemplaza la tabla
                })
                .catch(error => {
                    console.error("Error al actualizar la tabla:", error);
                });
        }
    });
</script>