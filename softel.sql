-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2019 a las 15:10:22
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
-- Base de datos: `softel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(10) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `user` varchar(25) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `cod_hotelfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `codigo`, `nombre`, `telefono`, `user`, `pass`, `cargo`, `cod_hotelfk`) VALUES
(1, 111, 'David Guzman', 234234, 'david.guzman', '123456', 'administrador', 1),
(2, 111, 'Arbey Castro', 345678, 'arbey.castro', '123456', 'administrador', 1),
(3, 111, 'Andres Ayala', 654987, 'andres.ayala', '123456', 'administrador', 1),
(4, 33, 'Adan', 999999, '', '', 'Botones', 1),
(5, 33, 'Mariela', 555555, '', '', 'Recepcionita', 1),
(6, 33, 'Wilson', 7889, '', '', 'Vigilante', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL,
  `precio` int(25) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo_habitacion` varchar(25) NOT NULL,
  `tipo_cama` varchar(25) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `iden_huesped` int(11) NOT NULL,
  `id_hotel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_habitacion`, `precio`, `descripcion`, `tipo_habitacion`, `tipo_cama`, `estado`, `iden_huesped`, `id_hotel`) VALUES
(4, 200000, 'confortable', 'Superior Room', 'Single', 'reservado', 6666666, 1),
(5, 200000, 'confortable', 'Superior Room', 'Double', 'reservado', 18758598, 1),
(6, 200000, 'confortable', 'Superior Room', 'Double', 'reservado', 8975987, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion_huesped`
--

CREATE TABLE `habitacion_huesped` (
  `cod_habitacionfk` int(11) NOT NULL,
  `cod_huespedfk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitacion_huesped`
--

INSERT INTO `habitacion_huesped` (`cod_habitacionfk`, `cod_huespedfk`) VALUES
(4, 5),
(4, 5),
(5, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id_hotel` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id_hotel`, `nombre`, `direccion`, `telefono`, `categoria`, `descripcion`) VALUES
(1, 'Softel', 'calle 120-32', 7777777, '3 estrellas', 'confortable y familiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE `huesped` (
  `id_huesped` int(10) NOT NULL,
  `trato` varchar(25) NOT NULL,
  `identificacion` int(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `huesped`
--

INSERT INTO `huesped` (`id_huesped`, `trato`, `identificacion`, `nombre`, `apellido`, `correo`, `telefono`) VALUES
(5, 'sr.', 6666666, 'Roberto', 'Gomez', 'roberto@mail.com', 555666777),
(6, 'sr.', 18758598, 'Richar', 'Arcos', 'richar.arcos@uniminuto.edu', 76576987),
(7, 'sr.', 8975987, 'prueba 1', 'PRUEBA 1', 'prueba1@prueba1.com', 123456);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped_servicios`
--

CREATE TABLE `huesped_servicios` (
  `cod_huespedfk` int(10) NOT NULL,
  `cod_serviciosfk` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `cod_pago` int(10) NOT NULL,
  `concepto` varchar(30) NOT NULL,
  `total pago` int(30) NOT NULL,
  `metodo_de_pago` varchar(30) NOT NULL,
  `precio` int(30) NOT NULL,
  `cod_huespedfk` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `cod_reserva` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `cod_huespedfk` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`cod_reserva`, `fecha_ingreso`, `fecha_salida`, `cod_huespedfk`) VALUES
(1, '0000-00-00', '0000-00-00', 5),
(2, '0000-00-00', '0000-00-00', 5),
(3, '2018-10-10', '2018-10-31', 5),
(4, '2018-11-29', '2018-11-30', 5),
(5, '2019-04-09', '2019-04-12', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(10) NOT NULL,
  `precio` int(30) NOT NULL,
  `tipo de servicio` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cod_pago` int(11) NOT NULL,
  `id_habitacion` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `cod_hotelfk` (`cod_hotelfk`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indices de la tabla `habitacion_huesped`
--
ALTER TABLE `habitacion_huesped`
  ADD KEY `cod_habitacionfk` (`cod_habitacionfk`),
  ADD KEY `cod_huespedfk` (`cod_huespedfk`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD PRIMARY KEY (`id_huesped`);

--
-- Indices de la tabla `huesped_servicios`
--
ALTER TABLE `huesped_servicios`
  ADD KEY `cod_huespedfk` (`cod_huespedfk`),
  ADD KEY `cod_serviciosfk` (`cod_serviciosfk`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`cod_pago`),
  ADD KEY `n_identificacion` (`cod_huespedfk`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`cod_reserva`),
  ADD KEY `n_identificacion` (`cod_huespedfk`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `cod_pago` (`cod_pago`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `huesped`
--
ALTER TABLE `huesped`
  MODIFY `id_huesped` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `cod_pago` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `cod_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`cod_hotelfk`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `hotel` (`id_hotel`);

--
-- Filtros para la tabla `habitacion_huesped`
--
ALTER TABLE `habitacion_huesped`
  ADD CONSTRAINT `habitacion_huesped_ibfk_1` FOREIGN KEY (`cod_habitacionfk`) REFERENCES `habitaciones` (`id_habitacion`),
  ADD CONSTRAINT `habitacion_huesped_ibfk_2` FOREIGN KEY (`cod_huespedfk`) REFERENCES `huesped` (`id_huesped`);

--
-- Filtros para la tabla `huesped_servicios`
--
ALTER TABLE `huesped_servicios`
  ADD CONSTRAINT `huesped_servicios_ibfk_1` FOREIGN KEY (`cod_huespedfk`) REFERENCES `huesped` (`id_huesped`),
  ADD CONSTRAINT `huesped_servicios_ibfk_2` FOREIGN KEY (`cod_serviciosfk`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`cod_huespedfk`) REFERENCES `huesped` (`id_huesped`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`cod_huespedfk`) REFERENCES `huesped` (`id_huesped`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
