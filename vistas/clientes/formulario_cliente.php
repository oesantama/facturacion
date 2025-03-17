<?php $mensaje = ""; ?>
<form id="agregarClienteForm" method="POST">
    <div class="mb-3">
        <label for="Nit_Cedula" class="form-label">Nit/Cédula:</label>
        <input type="text" class="form-control" id="Nit_Cedula" name="Nit_Cedula" required>
    </div>
    <div class="mb-3">
        <label for="Nombre" class="form-label">Nombre:</label>
        <input type="text" class="form-control" id="Nombre" name="Nombre" required>
    </div>
    <div class="mb-3">
        <label for="Direccion" class="form-label">Dirección:</label>
        <input type="text" class="form-control" id="Direccion" name="Direccion">
    </div>
    <div class="mb-3">
        <label for="Telefono" class="form-label">Teléfono:</label>
        <input type="text" class="form-control" id="Telefono" name="Telefono">
    </div>
    <button type="submit" class="btn btn-primary">Agregar Cliente</button>
    <div class="alert <?php echo (strpos($mensaje, 'creado') !== false) ? 'alert-success' : 'alert-danger'; ?>">
            <?php echo $mensaje; ?>
        </div>
       
       
</form>