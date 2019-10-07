-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2017 at 04:01 PMtipo_requisitotipo_requisito
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

DROP DATABASE IF EXISTS casostpi;
CREATE DATABASE casostpi;
USE casostpi;

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
  `idSolicitud` int(10) NOT NULL,
  `idProceso` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `idTipoPaso` int(5) NOT NULL,
  `Descripcion` text NOT NULL,
  `Tiempo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `proceso`
--

CREATE TABLE `proceso` (
  `idProceso` int(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `solicitudes`
--

CREATE TABLE `solicitudes` (
  `idSolicitud` int(10) NOT NULL,
  `carnet` varchar(7) DEFAULT NULL,
  `NIT` int(14) NOT NULL,
  `FechaRecibida` date NOT NULL,
  `Usuario` int(5) NOT NULL,
  `DescripcionSolicitud` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_paso`
--

CREATE TABLE `tipo_paso` (
  `idTipoPaso` int(5) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD PRIMARY KEY (`idProceso`);

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
  ADD PRIMARY KEY (`idSolicitud`);

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
  MODIFY `IdCaso` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `caso_detalle`
--
ALTER TABLE `caso_detalle`
  MODIFY `idCasoDetalle` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  MODIFY `idCDR` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `db_cdra`
--
ALTER TABLE `db_cdra`
  MODIFY `idCDRA` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paso`
--
ALTER TABLE `paso`
  MODIFY `idPaso` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paso_requisito`
--
ALTER TABLE `paso_requisito`
  MODIFY `idPasoRequisito` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proceso`
--
ALTER TABLE `proceso`
  MODIFY `idProceso` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  MODIFY `idProcesoDetalle` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requisito`
--
ALTER TABLE `requisito`
  MODIFY `idRequisito` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `idSolicitud` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_paso`
--
ALTER TABLE `tipo_paso`
  MODIFY `idTipoPaso` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_requisito`
--
ALTER TABLE `tipo_requisito`
  MODIFY `idTipoRequisito` int(5) NOT NULL AUTO_INCREMENT;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
