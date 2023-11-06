-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2023 a las 18:08:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursos2023`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumnos` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `dni` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `mayor_edad` tinyint(1) NOT NULL,
  `cursos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumnos`, `nombre`, `apellido`, `dni`, `correo`, `mayor_edad`, `cursos_id`) VALUES
(1, 'Juan', 'Conese', 8976543, 'jacc12@gmail.com', 2, 1),
(2, 'Peter', 'Capusotto', 15439726, 'peterc@gmail.com', 1, 2),
(3, 'Eusebio', 'Patinho', 5467832, 'patinho@hotmail.com', 2, 3),
(4, 'Pablo', 'Fognini', 30425679, 'pablitobetti@hotmail.com', 1, 5),
(5, 'Mariano', 'Vettini', 30425679, 'marian_fog@gmail.com', 1, 4),
(6, 'Daniel', 'Stransjreiber', 35467832, 'danistr@yahoo.com.ar', 1, 2),
(7, 'Luciano', 'Bortolotti', 43721900, 'lauchab@gmail.com', 2, 4),
(8, 'Laura', 'Sánchez', 38976481, 'sanchez_laura@yahoo.com.ar', 2, 1),
(9, 'Mirta', 'Roma', 4716198, 'romami@hotmail.com', 1, 4),
(10, 'Ana', 'Andrade', 31425879, 'anandra@gmail.com', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_cursos` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `duracion` int(11) NOT NULL,
  `profesores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `nombre`, `duracion`, `profesores_id`) VALUES
(1, 'java', 3, 1),
(2, 'php', 2, 1),
(3, 'react', 4, 1),
(4, 'node', 3, 2),
(5, 'angular', 3, 3),
(6, 'python', 2, 4),
(7, 'javascript', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id_profesores` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id_profesores`, `nombre`, `apellido`, `dni`) VALUES
(1, 'Paolo', 'Velmondo', 5436784),
(2, 'Darío', 'Stransjreiber', 3548721),
(3, 'Javier', 'Castrilli', 5439726),
(4, 'Patricio', 'Suarez', 14432721),
(5, 'Marcos', 'Zéliga', 8765418);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumnos`),
  ADD KEY `cursos_id` (`cursos_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_cursos`),
  ADD KEY `profesores_id` (`profesores_id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id_profesores`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumnos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id_profesores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`id_cursos`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`profesores_id`) REFERENCES `profesores` (`id_profesores`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
