-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2017 at 04:42 
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `casostpi`
--

-- --------------------------------------------------------

--
-- Table structure for table `caso`
--

CREATE TABLE `caso` (
  `IdCaso` int(5) NOT NULL,
  `idSolicitud` int(10) DEFAULT NULL,
  `idProceso` int(5) NOT NULL,
  `carnet` char(7) DEFAULT NULL,
  `nit` int(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caso`
--

INSERT INTO `caso` (`IdCaso`, `idSolicitud`, `idProceso`, `carnet`, `nit`) VALUES
(11, 1, 1, 'RC14005', 2100908971),
(20, 3, 2, 'CB14001', 2323242),
(21, 2, 4, 'HC14003', 1212),
(22, 1, 1, 'RC14005', 2100908971),
(23, 3, 2, 'CB14001', 2323242);

-- --------------------------------------------------------

--
-- Table structure for table `caso_detalle`
--

CREATE TABLE `caso_detalle` (
  `idCasoDetalle` int(5) NOT NULL,
  `IdCaso` int(5) NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `idProcesDetalle` int(5) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caso_detalle`
--

INSERT INTO `caso_detalle` (`idCasoDetalle`, `IdCaso`, `Estado`, `idProcesDetalle`, `Fecha`) VALUES
(4, 23, 'inactivo', 3, '2017-05-10'),
(5, 23, 'inactivo', 2, '2017-05-18');

-- --------------------------------------------------------

--
-- Table structure for table `caso_detalle_requisito`
--

CREATE TABLE `caso_detalle_requisito` (
  `idCDR` int(5) NOT NULL,
  `idCasoDetalle` int(5) NOT NULL,
  `idPasoRequisito` int(5) NOT NULL,
  `EstadoRequisito` varchar(10) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caso_detalle_requisito`
--

INSERT INTO `caso_detalle_requisito` (`idCDR`, `idCasoDetalle`, `idPasoRequisito`, `EstadoRequisito`, `Fecha`) VALUES
(124, 5, 2, 'activo', '2017-05-10'),
(125, 5, 4, 'activo', '2017-05-10'),
(126, 5, 32, 'activo', '2017-05-10'),
(127, 5, 4, 'activo', '2017-05-10'),
(128, 5, 32, 'activo', '2017-05-10'),
(129, 4, 2, 'activo', '2017-05-10'),
(130, 4, 1, 'activo', '2017-05-10'),
(131, 4, 3, 'activo', '2017-05-10'),
(132, 4, 4, 'activo', '2017-05-10'),
(133, 4, 9, 'activo', '2017-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `db_cdra`
--

CREATE TABLE `db_cdra` (
  `idCDRA` int(5) NOT NULL,
  `IdCDR` int(5) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paso`
--

CREATE TABLE `paso` (
  `idPaso` int(5) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `idTipoPaso` int(5) NOT NULL,
  `Descripcion` text NOT NULL,
  `Tiempo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paso`
--

INSERT INTO `paso` (`idPaso`, `Nombre`, `idTipoPaso`, `Descripcion`, `Tiempo`) VALUES
(1, 'Sofia', 1, 'retrs', 'jjhj'),
(2, 'Leonel', 1, 'kjb', 'kjbbk'),
(3, 'Javier', 2, 'wedfsd', 'lkasda'),
(4, 'Castillo', 3, 'asdas', 'lasdas'),
(5, 'Ernesto', 1, 'amsas', 'lksadas'),
(6, 'Andrea', 1, 'klsmasd', 'KASDA'),
(7, 'Walter', 3, 'aesdfsdfs', '12'),
(8, 'Kevin', 4, 'sdsdsd', 'asa'),
(9, 'Yovany', 4, 'sdsds', 'asas'),
(10, 'Henri', 2, 'Hoy si funciona', 'MADA'),
(11, 'Ramirez', 2, 'Andrea ', 'Pelo Rojo');

-- --------------------------------------------------------

--
-- Table structure for table `paso_requisito`
--

CREATE TABLE `paso_requisito` (
  `idPasoRequisito` int(5) NOT NULL,
  `idRequisito` int(5) NOT NULL,
  `idPaso` int(5) NOT NULL,
  `indice` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paso_requisito`
--

INSERT INTO `paso_requisito` (`idPasoRequisito`, `idRequisito`, `idPaso`, `indice`) VALUES
(19, 3, 7, 1),
(21, 4, 7, 2),
(22, 7, 7, 3),
(23, 2, 7, 4),
(24, 6, 7, 5),
(25, 2, 2, 1),
(26, 4, 2, 2),
(27, 32, 2, 3),
(28, 27, 4, 1),
(29, 2, 3, 1),
(30, 3, 3, 2),
(31, 1, 3, 3),
(32, 4, 3, 4),
(33, 9, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `proceso`
--

CREATE TABLE `proceso` (
  `idProceso` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proceso`
--

INSERT INTO `proceso` (`idProceso`, `Nombre`, `Descripcion`) VALUES
(1, 'wALRWE', 'asdasda'),
(2, 'Walter', 'Wadad'),
(3, 'sdlcjsdcljsdljc', 'sldkucbsljdcn;akshc;aknbc;aksbnclkzhgsxc'),
(4, 'zxkcjbzxkcjbsdkjc', 'ckj bxkjcvzkjxcbgzxkj');

-- --------------------------------------------------------

--
-- Table structure for table `proceso_detalle`
--

CREATE TABLE `proceso_detalle` (
  `idProcesoDetalle` int(10) NOT NULL,
  `idProceso` int(5) NOT NULL,
  `idPaso` int(5) NOT NULL,
  `indice` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proceso_detalle`
--

INSERT INTO `proceso_detalle` (`idProcesoDetalle`, `idProceso`, `idPaso`, `indice`) VALUES
(1, 4, 2, 1),
(2, 4, 3, 2),
(3, 4, 7, 3),
(4, 4, 1, 4),
(6, 4, 5, 6),
(9, 2, 3, 1),
(11, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `requisito`
--

CREATE TABLE `requisito` (
  `idRequisito` int(5) NOT NULL,
  `idTipoRequisito` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` text NOT NULL,
  `Prioridad` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requisito`
--

INSERT INTO `requisito` (`idRequisito`, `idTipoRequisito`, `Nombre`, `Descripcion`, `Prioridad`) VALUES
(1, 37, 'wALRWE', 'ASFSFDASF', 'SI'),
(2, 52, 'dasda', 'asdasd', 'ass'),
(3, 42, '2dsa', 'dasd', 'asa'),
(4, 87, 'dasda', 'asdasd', 'ass'),
(6, 37, 'wALRWE', 'ASFSFDASF', 'NO'),
(7, 44, 'dasda', 'asdasd', 'ass'),
(8, 45, 'dasdads', 'asdasd', 'ass'),
(9, 40, '2dsa', 'dasd', 'asa'),
(10, 45, '2dsa', 'dasd', 'SI'),
(11, 45, 'sasasdasda', 'asdasd', 'ass'),
(12, 44, 'sdf', 'dfscdde', 'dfs'),
(13, 37, 'sdc', 'asds', 'asd'),
(14, 78, 'Walter', 'MADAFACA!', 'nula'),
(15, 41, 'de', 'aeda', 'aed'),
(16, 41, 'sdf', 'sdf', 'sdf'),
(17, 37, 'sdf', 'sdf', 'sdf'),
(18, 37, 'sdf', 'sdf', 'sdd'),
(19, 37, 'sdf', 'sdf', 'sdf'),
(20, 37, 'sdf', 'sdf', 'sdf'),
(21, 120, 'sdf', 'sdf', 'sdf'),
(22, 120, 'de', 'aeda', 'aed'),
(23, 120, 'sdf', 'sdf', 'sdd'),
(24, 120, 'Walter', 'MADAFACA!', 'ALTA'),
(25, 37, 'sdc', 'dvdsd', 'sdv'),
(26, 37, 'dfsd', 'sdfs', 'sdf'),
(27, 37, 'asd', 'asda', 'asda'),
(28, 37, 'sda', 'asda', 'asd'),
(29, 37, 'sdfsd', 'sdfs', 'asd'),
(30, 37, 'Walter', 'sdfsdf', 'adfa'),
(31, 37, 'sdas', 'asxa', 'asxa'),
(32, 37, 'asd', 'asd', 'asd'),
(33, 37, 'asd', 'asd', 'asd'),
(34, 37, 'dfsdf', 'asd', 'as'),
(35, 37, 'adas', 'asd', 'as'),
(36, 37, 'saasd', 'asda', 'zszd'),
(37, 37, 'asdas', 'asda', 'sasd'),
(38, 37, 'sadas', 'asda', 'as'),
(39, 37, 'lkm', 'lkn', 'lkn'),
(40, 37, 'sdfs', 'sdsdf', 'sd');

-- --------------------------------------------------------

--
-- Table structure for table `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idSolicitud` int(10) NOT NULL,
  `carnet` varchar(7) DEFAULT NULL,
  `NIT` int(14) NOT NULL,
  `FechaRecibida` date NOT NULL,
  `idProceso` int(5) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `solicitudes`
--

INSERT INTO `solicitudes` (`idSolicitud`, `carnet`, `NIT`, `FechaRecibida`, `idProceso`, `estado`) VALUES
(1, 'RC14005', 2100908971, '2017-05-10', 1, 0),
(2, 'HC14003', 1212, '2017-05-12', 3, 0),
(3, 'CB14001', 2323242, '2017-05-02', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_paso`
--

CREATE TABLE `tipo_paso` (
  `idTipoPaso` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_paso`
--

INSERT INTO `tipo_paso` (`idTipoPaso`, `Nombre`, `activo`, `Descripcion`) VALUES
(1, 'hffdhd', 0, 'ifjhf'),
(2, 'yo o vany ', 0, 'cristian o cosita '),
(3, 'Walter', 0, 'sfdfs'),
(4, 'sdfs', 0, 'sdfsdfs');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_requisito`
--

CREATE TABLE `tipo_requisito` (
  `idTipoRequisito` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `observaciones` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_requisito`
--

INSERT INTO `tipo_requisito` (`idTipoRequisito`, `Nombre`, `activo`, `observaciones`) VALUES
(37, 'Walter', 0, 'Funciono madafaca!jghjghj'),
(39, 'Walter Castillo', 1, 'gggggggg'),
(40, 'HenriA', 0, 'Funciono madafaca!jghjghj'),
(41, 'Henri', 0, 'Funciono madafaca!jghjghj'),
(42, 'dcszdcs', 1, 'Funciono madafaca!jghjghj'),
(44, 'Walter Castillo', 0, 'Probando nueva funcionalidad....'),
(45, 'Chente', 1, 'Se la come'),
(48, 'wALTER', 0, 'SDFSDFSEDF'),
(50, 'wALTER', 1, 'SDASDASASFASFADF'),
(52, 'hello', 1, 'its me!!!!'),
(53, 'wawaasd', 1, 'ascsdcsdcs'),
(57, 'sdfsdf', 0, 'sdfsdfsdfsdfsdfsdfsdf'),
(58, 'sdasdasda', 0, 'sdfsdfsdfs'),
(59, 'kugiuugiygi', 0, ';ougiygiy'),
(60, 'sdasda', 0, 'sdfsdfsdf'),
(61, 'waasfsaf', 0, 'wewefsedf'),
(64, 'wa', 0, 'dfsdfsdfsd'),
(67, 'jhvuyc', 0, 'jhcluyc'),
(74, 'jhvuyc', 0, 'jhcluyc'),
(75, 'Henri', 0, 'Funciono madafaca!jghjghj'),
(76, 'wawawa', 0, 'afasfadsfsa'),
(77, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(78, 'HenriSelaCOme', 0, 'Funciono madafaca!jghjghj'),
(79, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(80, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(81, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(82, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(83, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(84, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(85, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(86, 'Henri', 1, 'Funciono madafaca!jghjghj'),
(87, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(88, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(89, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(90, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(91, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(92, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(94, 'Henri Leonel', 1, 'Funciono madafaca!jghjghj'),
(98, 'ddsfsdf', 0, 'sdf'),
(99, 'fa', 0, 'f'),
(100, 'primefaces', 0, 'asdasd'),
(101, 'Walter', 1, 'Funciona!!!'),
(102, 'walter', 0, 'asdasdasd'),
(103, ' ', 0, ' '),
(104, ' ', 0, ' '),
(105, ' ', 0, ' '),
(106, 'walter', 0, 'walter'),
(107, 'walrt', 1, 'fsdefse'),
(108, 'wALTERdfds', 1, 'SDFSDFSEDF'),
(110, 'fgdr', 0, 'hrt'),
(111, 'fgdr', 0, 'hrt'),
(112, 'fgdr', 0, 'hrt'),
(113, 'efse', 0, 'asdas'),
(114, 'efse', 1, 'asdas'),
(115, 'efse', 1, 'asdas'),
(116, 'efse', 1, 'asdas'),
(117, 'feef', 0, 'wsdfs'),
(118, 'wefwe', 0, 'wefwef'),
(119, 'fwefwwfwe', 0, 'fwefw'),
(120, 'Henri', 0, 'Funciono madafaca!jghjghj'),
(121, 'efse', 1, 'asdas'),
(122, 'Walter', 1, 'asdasdfas'),
(123, '23232323', 0, 'asdasdasdassd'),
(124, 'asdas', 1, 'aasda'),
(125, 'prueba xdxd', 0, 'dfs'),
(126, 'sedfsdfs', 1, 'sdfsdfsd se la come');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`IdCaso`),
  ADD KEY `idSolicitud` (`idSolicitud`),
  ADD KEY `idProceso` (`idProceso`);

--
-- Indexes for table `caso_detalle`
--
ALTER TABLE `caso_detalle`
  ADD PRIMARY KEY (`idCasoDetalle`),
  ADD KEY `IdCaso` (`IdCaso`);

--
-- Indexes for table `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  ADD PRIMARY KEY (`idCDR`),
  ADD KEY `idCasoDetalle` (`idCasoDetalle`),
  ADD KEY `idPasoRequisito` (`idPasoRequisito`);

--
-- Indexes for table `db_cdra`
--
ALTER TABLE `db_cdra`
  ADD PRIMARY KEY (`idCDRA`),
  ADD KEY `IdCDR` (`IdCDR`);

--
-- Indexes for table `paso`
--
ALTER TABLE `paso`
  ADD PRIMARY KEY (`idPaso`),
  ADD KEY `idTipoPaso` (`idTipoPaso`);

--
-- Indexes for table `paso_requisito`
--
ALTER TABLE `paso_requisito`
  ADD PRIMARY KEY (`idPasoRequisito`),
  ADD KEY `idRequisito` (`idRequisito`),
  ADD KEY `idPaso` (`idPaso`);

--
-- Indexes for table `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`idProceso`),
  ADD KEY `idProceso` (`idProceso`);

--
-- Indexes for table `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  ADD PRIMARY KEY (`idProcesoDetalle`),
  ADD KEY `idProceso` (`idProceso`),
  ADD KEY `idPaso` (`idPaso`);

--
-- Indexes for table `requisito`
--
ALTER TABLE `requisito`
  ADD PRIMARY KEY (`idRequisito`),
  ADD KEY `idTipoRequisito` (`idTipoRequisito`);

--
-- Indexes for table `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idProceso` (`idProceso`),
  ADD KEY `idSolicitud` (`idSolicitud`);

--
-- Indexes for table `tipo_paso`
--
ALTER TABLE `tipo_paso`
  ADD PRIMARY KEY (`idTipoPaso`);

--
-- Indexes for table `tipo_requisito`
--
ALTER TABLE `tipo_requisito`
  ADD PRIMARY KEY (`idTipoRequisito`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caso`
--
ALTER TABLE `caso`
  MODIFY `IdCaso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `caso_detalle`
--
ALTER TABLE `caso_detalle`
  MODIFY `idCasoDetalle` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  MODIFY `idCDR` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `db_cdra`
--
ALTER TABLE `db_cdra`
  MODIFY `idCDRA` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paso`
--
ALTER TABLE `paso`
  MODIFY `idPaso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `paso_requisito`
--
ALTER TABLE `paso_requisito`
  MODIFY `idPasoRequisito` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `proceso`
--
ALTER TABLE `proceso`
  MODIFY `idProceso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  MODIFY `idProcesoDetalle` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `requisito`
--
ALTER TABLE `requisito`
  MODIFY `idRequisito` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idSolicitud` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_paso`
--
ALTER TABLE `tipo_paso`
  MODIFY `idTipoPaso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_requisito`
--
ALTER TABLE `tipo_requisito`
  MODIFY `idTipoRequisito` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `Caso_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitudes` (`idSolicitud`),
  ADD CONSTRAINT `Caso_ibfk_2` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`);

--
-- Constraints for table `caso_detalle`
--
ALTER TABLE `caso_detalle`
  ADD CONSTRAINT `Caso_detalle_ibfk_1` FOREIGN KEY (`IdCaso`) REFERENCES `caso` (`IdCaso`);

--
-- Constraints for table `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  ADD CONSTRAINT `Caso_detalle_requisito_ibfk_1` FOREIGN KEY (`idCasoDetalle`) REFERENCES `caso_detalle` (`idCasoDetalle`);

--
-- Constraints for table `db_cdra`
--
ALTER TABLE `db_cdra`
  ADD CONSTRAINT `DB_CDRA_ibfk_1` FOREIGN KEY (`IdCDR`) REFERENCES `caso_detalle_requisito` (`idCDR`);

--
-- Constraints for table `paso`
--
ALTER TABLE `paso`
  ADD CONSTRAINT `Paso_ibfk_1` FOREIGN KEY (`idTipoPaso`) REFERENCES `tipo_paso` (`idTipoPaso`);

--
-- Constraints for table `paso_requisito`
--
ALTER TABLE `paso_requisito`
  ADD CONSTRAINT `Paso_requisito_ibfk_1` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`),
  ADD CONSTRAINT `Paso_requisito_ibfk_2` FOREIGN KEY (`idRequisito`) REFERENCES `requisito` (`idRequisito`);

--
-- Constraints for table `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  ADD CONSTRAINT `Proceso_detalle_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`),
  ADD CONSTRAINT `Proceso_detalle_ibfk_2` FOREIGN KEY (`idPaso`) REFERENCES `paso` (`idPaso`);

--
-- Constraints for table `requisito`
--
ALTER TABLE `requisito`
  ADD CONSTRAINT `Requisito_ibfk_1` FOREIGN KEY (`idTipoRequisito`) REFERENCES `tipo_requisito` (`idTipoRequisito`);

--
-- Constraints for table `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`idProceso`) REFERENCES `proceso` (`idProceso`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
