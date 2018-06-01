-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2018 a las 00:44:29
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_base_development`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `options`
--

CREATE TABLE `options` (
  `id` bigint(20) NOT NULL,
  `idpadre` int(11) DEFAULT NULL,
  `opcion` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `estadoopcion` varchar(1) DEFAULT 'A',
  `orden` varchar(5) DEFAULT NULL,
  `eshoja` tinyint(1) DEFAULT NULL,
  `controller` varchar(100) DEFAULT NULL,
  `eliminado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `options`
--

INSERT INTO `options` (`id`, `idpadre`, `opcion`, `url`, `estadoopcion`, `orden`, `eshoja`, `controller`, `eliminado`) VALUES
(1, NULL, 'Tareas Basicas ', NULL, 'A', '01', 0, NULL, 0),
(2, NULL, 'Configuracion', NULL, 'A', '02', 0, NULL, 0),
(3, 1, 'Clientes', NULL, 'A', '01', 1, 'cliente', 0),
(4, 1, 'Productos', NULL, 'A', '02', 1, 'producto', 0),
(5, 1, 'Facturas', NULL, 'A', '03', 1, 'factura', 0),
(6, 1, 'Empleados', NULL, 'A', '05', 1, 'empleado', 0),
(7, 2, 'Parametros', NULL, 'A', '01', 1, 'parametros', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
