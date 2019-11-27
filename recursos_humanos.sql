-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2019 a las 15:11:03
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recursos_humanos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `nombre_a` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `nombre_a`) VALUES
(1, 'produccion'),
(2, 'finanzas'),
(3, 'seguridad'),
(4, 'administracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `benefiios`
--

CREATE TABLE `benefiios` (
  `id_beneficios` int(11) NOT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `duracion` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion`
--

CREATE TABLE `capacitacion` (
  `id_capacitacion` int(11) NOT NULL,
  `nombre_curso` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `hora` time(6) NOT NULL,
  `fecha` date NOT NULL,
  `lugar` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `duracion` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `cod_instructorfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_beneficios`
--

CREATE TABLE `empleados_beneficios` (
  `cod_empleadosfk` int(11) NOT NULL,
  `cod_beneficiosfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_capacitacion`
--

CREATE TABLE `empleados_capacitacion` (
  `cod_empleadosfk` int(11) NOT NULL,
  `cod_capacitacionfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_eventos`
--

CREATE TABLE `empleados_eventos` (
  `cod_empleadosfk` int(11) NOT NULL,
  `cod_eventosfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_eventos`
--

INSERT INTO `empleados_eventos` (`cod_empleadosfk`, `cod_eventosfk`) VALUES
(6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_r`
--

CREATE TABLE `empleados_r` (
  `id_empleados` int(11) NOT NULL,
  `cod_empleados` int(11) NOT NULL,
  `num_documento` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `cargo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `niv_desarrollo` int(11) NOT NULL,
  `cod_areasfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleados_r`
--

INSERT INTO `empleados_r` (`id_empleados`, `cod_empleados`, `num_documento`, `nombre`, `cargo`, `niv_desarrollo`, `cod_areasfk`) VALUES
(1, 111, 0, 'David Guzman', 'administrador', 5, 4),
(2, 111, 0, 'Arbey Castro', 'administrador', 5, 4),
(3, 111, 0, 'Andres Ayala', 'administrador', 5, 4),
(4, 33, 2034, 'Adan', 'Botones', 3, 1),
(5, 33, 2035, 'Mariela', 'Recepcionita', 3, 2),
(6, 33, 2036, 'Wilson', 'Vigilante', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id_evento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `nombre_e` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `duracion` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `ubicacion` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id_evento`, `id_empleado`, `nombre_e`, `tipo`, `descripcion`, `fecha`, `duracion`, `ubicacion`) VALUES
(1, 6, 'seguridad', 'seguridad', 'grande', '2018-11-01', 'semana', 'Soacha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `id_instructor` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `contacto` int(11) NOT NULL,
  `especialidad` varchar(25) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`id_instructor`, `codigo`, `nombre`, `contacto`, `especialidad`) VALUES
(1, 44, 'Mario', 567876, 'consejero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_areas` int(11) NOT NULL,
  `titulo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `asunto` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci NOT NULL,
  `cod_areasfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `benefiios`
--
ALTER TABLE `benefiios`
  ADD PRIMARY KEY (`id_beneficios`);

--
-- Indices de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`id_capacitacion`),
  ADD KEY `cod_instructorfk` (`cod_instructorfk`);

--
-- Indices de la tabla `empleados_beneficios`
--
ALTER TABLE `empleados_beneficios`
  ADD KEY `cod_empleadosfk` (`cod_empleadosfk`),
  ADD KEY `cod_beneficiosfk` (`cod_beneficiosfk`);

--
-- Indices de la tabla `empleados_capacitacion`
--
ALTER TABLE `empleados_capacitacion`
  ADD KEY `cod_empleadosfk` (`cod_empleadosfk`),
  ADD KEY `cod_capacitacionfk` (`cod_capacitacionfk`);

--
-- Indices de la tabla `empleados_eventos`
--
ALTER TABLE `empleados_eventos`
  ADD KEY `cod_empleadosfk` (`cod_empleadosfk`),
  ADD KEY `cod_eventosfk` (`cod_eventosfk`);

--
-- Indices de la tabla `empleados_r`
--
ALTER TABLE `empleados_r`
  ADD PRIMARY KEY (`id_empleados`),
  ADD KEY `cod_areasfk` (`cod_areasfk`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id_instructor`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_areas`),
  ADD KEY `cod_areasfk` (`cod_areasfk`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `benefiios`
--
ALTER TABLE `benefiios`
  MODIFY `id_beneficios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  MODIFY `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados_r`
--
ALTER TABLE `empleados_r`
  MODIFY `id_empleados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id_instructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_areas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD CONSTRAINT `capacitacion_ibfk_1` FOREIGN KEY (`cod_instructorfk`) REFERENCES `instructor` (`id_instructor`);

--
-- Filtros para la tabla `empleados_beneficios`
--
ALTER TABLE `empleados_beneficios`
  ADD CONSTRAINT `empleados_beneficios_ibfk_1` FOREIGN KEY (`cod_empleadosfk`) REFERENCES `empleados_r` (`id_empleados`),
  ADD CONSTRAINT `empleados_beneficios_ibfk_2` FOREIGN KEY (`cod_beneficiosfk`) REFERENCES `benefiios` (`id_beneficios`);

--
-- Filtros para la tabla `empleados_capacitacion`
--
ALTER TABLE `empleados_capacitacion`
  ADD CONSTRAINT `empleados_capacitacion_ibfk_1` FOREIGN KEY (`cod_empleadosfk`) REFERENCES `empleados_r` (`id_empleados`),
  ADD CONSTRAINT `empleados_capacitacion_ibfk_2` FOREIGN KEY (`cod_capacitacionfk`) REFERENCES `capacitacion` (`id_capacitacion`);

--
-- Filtros para la tabla `empleados_eventos`
--
ALTER TABLE `empleados_eventos`
  ADD CONSTRAINT `empleados_eventos_ibfk_1` FOREIGN KEY (`cod_empleadosfk`) REFERENCES `empleados_r` (`id_empleados`),
  ADD CONSTRAINT `empleados_eventos_ibfk_2` FOREIGN KEY (`cod_eventosfk`) REFERENCES `eventos` (`id_evento`);

--
-- Filtros para la tabla `empleados_r`
--
ALTER TABLE `empleados_r`
  ADD CONSTRAINT `empleados_r_ibfk_1` FOREIGN KEY (`cod_areasfk`) REFERENCES `areas` (`id_area`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`cod_areasfk`) REFERENCES `areas` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
