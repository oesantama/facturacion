# Sistema de Facturación (PHP MVC)

## Descripción

Este es un sistema de facturación desarrollado en PHP con una arquitectura MVC. Permite gestionar clientes y generar facturas.  Este proyecto se está desarrollando con fines de aprendizaje y experimentación.

## Características Principales

*   Gestión de clientes (agregar, editar, eliminar, ver).  El formulario de agregar cliente usa un modal de Bootstrap y AJAX.
*   Autenticación de usuarios (login y logout) con control de acceso basado en roles (administrador, empleado).

## Tecnologías Utilizadas

*   PHP 7.4+
*   MySQL
*   HTML
*   CSS
*   Bootstrap 5
*   JavaScript
*   Git

## Dependencias

*   PHP 7.4 o superior
*   MySQL

## Instalación

1.  Clonar el repositorio:
    ```bash
    git clone git@github.com:oesantama/facturacion.git
    ```
2.  Importar la base de datos:
    *   Crear una base de datos MySQL.
    *   Ejecutar el script `database.sql` para crear las tablas (este archivo se encuentra en la raiz).
3.  Configurar la conexión:
    *   Editar el archivo `config/connection.php` con los datos de tu base de datos.

## Ejecución

1.  Configurar un servidor web (Apache o Nginx) para que apunte a la carpeta raíz del proyecto (donde está el `index.php`).
2.  Acceder al proyecto desde el navegador:  `http://localhost/facturacion/`

## Problemas Conocidos

*   Actualmente, al agregar un cliente, no se muestra una confirmación visual inmediata (aparte de la alerta de JavaScript).  Se planea agregar una notificación más elegante con Bootstrap o SweetAlert.

## Ayuda Necesaria

*   Completar la funcionalidad de edición y eliminación de clientes.
*   Implementar validaciones más robustas en el formulario de agregar cliente.
*   Mejorar la seguridad del sistema de login (usar `password_hash()` y `password_verify()`).

## Contacto

Oscar Santamaria - oesantama@example.com (reemplaza con tu correo real)