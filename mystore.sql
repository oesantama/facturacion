-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2025 a las 16:56:17
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mystore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID_Cargo` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`ID_Cargo`, `Nombre`) VALUES
(1, 'Gerente'),
(2, 'Administrador'),
(3, 'Vendedor'),
(4, 'Conductor'),
(5, 'Asistente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`ID_Categoria`, `Nombre_Categoria`) VALUES
(1, 'Verduras'),
(2, 'Frutas'),
(3, 'Granos'),
(4, 'Panes'),
(5, 'Carnes'),
(6, 'Lácteos'),
(7, 'Condimentos'),
(8, 'Golosinas'),
(9, 'Frituras'),
(10, 'Bebidas'),
(11, 'Jugos'),
(12, 'Aceites'),
(13, 'Aceites');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nit_Cedula` bigint(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `Nit_Cedula`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 79976336, 'David Alfonso Parra Gutierrez', 'Bogotá', '3183907236'),
(2, 80724382, 'Yeferson Ferney Mora Rodríguez', 'Bogotá', '3124795229'),
(3, 123456788, 'Jhon Jairo Riaño', 'Bogotá', '3138467736'),
(4, 1121839935, 'Edgar Leandro Baquero Peña', 'Villavicencio', '3137840166');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_entrada`
--

CREATE TABLE `detalle_entrada` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Entrada` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Unitario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_entrada`
--

INSERT INTO `detalle_entrada` (`ID_Detalle`, `ID_Entrada`, `ID_Producto`, `Cantidad`, `Precio_Unitario`) VALUES
(1, 7, 9, 74, 3500),
(2, 3, 7, 37, 1800),
(3, 10, 20, 82, 2500),
(4, 2, 15, 30, 5800),
(5, 8, 5, 65, 1500),
(6, 5, 20, 9, 2500),
(7, 1, 13, 20, 3200),
(8, 1, 10, 48, 2800),
(9, 9, 6, 56, 2000),
(10, 6, 8, 14, 5200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Factura` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Unitario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `ID_Cargo` int(11) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `user` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0 = Inactivo 1 = Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `Nombre`, `Apellido`, `ID_Cargo`, `Telefono`, `Direccion`, `user`, `password`, `status`) VALUES
(0, 'Juan David', 'Ramírez Gómez', 1, '31155500', 'Calle 100 # 15A-32, Bogotá D.C.', '', '', 0),
(2, 'Santiago', 'Martínez Silva', 2, '3102223333', 'Calle 5 # 12-34, Bogotá', '', '', 0),
(3, 'Laura', 'Pérez Castro', 2, '3116665555', 'Carrera 50 # 100-123, Bogotá', '', '', 0),
(4, 'Daniel', 'Rojas Moreno', 2, '3127778888', 'Calle 3A # 15-20, Bogotá', '', '', 0),
(6, 'Carlos Alberto', 'Osorio Zapata', 2, '3128887777', 'Calle 8 # 20-30, Bogotá', '', '', 0),
(7, 'Juliana', 'Restrepo Pineda', 2, '3105554444', 'Carrera 4 # 16-28, Bogotá', '', '', 0),
(8, 'Jorge Enrique', 'Zuluaga Bedoya', 2, '3113332222', 'Carrera 15 # 30-50, Bogotá', '', '', 0),
(9, 'Andrés Felipe', 'Cardona Arango', 2, '3121110000', 'Calle 6 # 18-22, Bogotá', '', '', 0),
(123456788, 'Leandro', 'Baquero', 2, '3137840166', 'Carrera 7 # 34-56, Bogotá', '123456788', '123456788', 1),
(123456789, 'Ana María', 'Duque Vargas', 5, '3119990000', 'Carrera 10 # 25-45, Bogotá', '123456789', '123456789', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_inventario`
--

CREATE TABLE `entrada_inventario` (
  `ID_Entrada` int(11) NOT NULL,
  `Fecha_Entrada` date NOT NULL,
  `Numero_Factura_Compra` varchar(50) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `entrada_inventario`
--

INSERT INTO `entrada_inventario` (`ID_Entrada`, `Fecha_Entrada`, `Numero_Factura_Compra`, `ID_Proveedor`) VALUES
(1, '2024-11-08', 'FAC-3627', 4),
(2, '2024-06-20', 'FAC-9717', 4),
(3, '2023-12-30', 'FAC-6995', 1),
(4, '2024-11-19', 'FAC-2405', 3),
(5, '2024-10-08', 'FAC-6585', 2),
(6, '2024-12-18', 'FAC-7066', 1),
(7, '2024-05-04', 'FAC-2381', 2),
(8, '2024-07-03', 'FAC-6936', 4),
(9, '2024-06-10', 'FAC-7904', 5),
(10, '2024-11-21', 'FAC-2382', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `ID_Metodo_Pago` int(11) DEFAULT NULL,
  `Estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ventas`
--

CREATE TABLE `historial_ventas` (
  `ID_Venta` int(11) NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `Total_Venta` float NOT NULL,
  `ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `ID_Metodo_Pago` int(11) NOT NULL,
  `Nombre_Metodo_Pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`ID_Metodo_Pago`, `Nombre_Metodo_Pago`) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de crédito'),
(3, 'Tarjeta de débito'),
(4, 'Transferencias electrónicas'),
(6, 'Pse');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` float NOT NULL,
  `Stock_Minimo` int(11) NOT NULL,
  `ID_Categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `Nombre`, `Precio`, `Stock_Minimo`, `ID_Categoria`) VALUES
(1, 'Arroz 1kg', 2500, 20, 3),
(2, 'Frijoles 500g', 1800, 15, 3),
(3, 'Harina de Trigo', 3000, 25, 3),
(4, 'Aceite Vegetal', 4500, 10, 13),
(5, 'Leche Entera', 1500, 30, 6),
(6, 'Azúcar Refinada', 2000, 40, 3),
(7, 'Sal de Mesa', 1800, 50, 3),
(8, 'Café Molido', 5200, 12, 3),
(9, 'Té Verde', 3500, 18, 10),
(10, 'Pan Integral', 2800, 20, 4),
(11, 'Mermelada de Fresa', 4000, 15, 8),
(12, 'Queso Fresco', 6500, 10, 6),
(13, 'Yogur Natural', 3200, 25, 6),
(14, 'Pollo Congelado', 7000, 8, 5),
(15, 'Carne Molida', 5800, 12, 5),
(16, 'Pescado Fresco', 8000, 5, 5),
(17, 'Manzanas Rojas', 3000, 30, 2),
(18, 'Plátanos', 1800, 35, 1),
(19, 'Uvas Verdes', 4000, 15, 2),
(20, 'Naranjas', 2500, 25, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nit_Cedula` bigint(20) NOT NULL,
  `Nombre_Proveedor` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_Proveedor`, `Nit_Cedula`, `Nombre_Proveedor`, `Telefono`, `Direccion`, `Email`) VALUES
(1, 123456789, 'Distribuidora Central', '555-1234', 'Av. Principal 123, Ciudad A', 'contacto@central.com'),
(2, 987654321, 'Alimentos del Norte', '555-2345', 'Calle Norte 45, Ciudad B', 'info@norte.com'),
(3, 567890123, 'Importadora Sur', '555-3456', 'Carrera Sur 78, Ciudad C', 'ventas@sur.com'),
(4, 345678901, 'Proveedor Express', '555-4567', 'Boulevard Express 56, Ciudad D', 'express@proveedor.com'),
(5, 234567890, 'Abastecimientos Rápidos', '555-5678', 'Av. Rapida 12, Ciudad E', 'rapidos@abastecimientos.com'),
(6, 876543210, 'Comercializadora Global', '555-6789', 'Calle Comercio 90, Ciudad F', 'global@comercial.com'),
(7, 765432109, 'Suministros Seguros', '555-7890', 'Plaza Suministros 33, Ciudad G', 'seguros@suministros.com'),
(8, 654321098, 'Productos Frescos Ltda.', '555-8901', 'Avenida Fresca 21, Ciudad H', 'frescos@productos.com'),
(9, 543210987, 'Distribuciones Nacionales', '555-9012', 'Carrera Nacional 87, Ciudad I', 'nacionales@distribuciones.com'),
(10, 432109876, 'Proveedor del Este', '555-0123', 'Calle Este 99, Ciudad J', 'este@proveedor.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_inventario`
--

CREATE TABLE `stock_inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Unitario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID_Cargo`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `Nit_Cedula` (`Nit_Cedula`);

--
-- Indices de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Entrada` (`ID_Entrada`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Factura` (`ID_Factura`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD UNIQUE KEY `ID_Empleado` (`ID_Empleado`),
  ADD KEY `ID_Cargo` (`ID_Cargo`);

--
-- Indices de la tabla `entrada_inventario`
--
ALTER TABLE `entrada_inventario`
  ADD PRIMARY KEY (`ID_Entrada`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Empleado` (`ID_Empleado`),
  ADD KEY `ID_Metodo_Pago` (`ID_Metodo_Pago`);

--
-- Indices de la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `ID_Empleado` (`ID_Empleado`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`ID_Metodo_Pago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Categoria` (`ID_Categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`),
  ADD UNIQUE KEY `Nit_Cedula` (`Nit_Cedula`);

--
-- Indices de la tabla `stock_inventario`
--
ALTER TABLE `stock_inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrada_inventario`
--
ALTER TABLE `entrada_inventario`
  MODIFY `ID_Entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  MODIFY `ID_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `ID_Metodo_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `stock_inventario`
--
ALTER TABLE `stock_inventario`
  MODIFY `ID_Inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_entrada`
--
ALTER TABLE `detalle_entrada`
  ADD CONSTRAINT `detalle_entrada_ibfk_1` FOREIGN KEY (`ID_Entrada`) REFERENCES `entrada_inventario` (`ID_Entrada`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_entrada_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`ID_Factura`) REFERENCES `factura` (`ID_Factura`) ON DELETE CASCADE,
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargos` (`ID_Cargo`) ON DELETE SET NULL;

--
-- Filtros para la tabla `entrada_inventario`
--
ALTER TABLE `entrada_inventario`
  ADD CONSTRAINT `entrada_inventario_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`) ON DELETE SET NULL;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE SET NULL,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE SET NULL,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`ID_Metodo_Pago`) REFERENCES `metodo_pago` (`ID_Metodo_Pago`) ON DELETE SET NULL;

--
-- Filtros para la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD CONSTRAINT `historial_ventas_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE SET NULL;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categoria_producto` (`ID_Categoria`) ON DELETE SET NULL;

--
-- Filtros para la tabla `stock_inventario`
--
ALTER TABLE `stock_inventario`
  ADD CONSTRAINT `stock_inventario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
