-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 18, 2023 at 01:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BD2`
--

-- --------------------------------------------------------

--
-- Table structure for table `carros`
--

CREATE TABLE `carros` (
  `car_id` bigint(20) NOT NULL,
  `car_modelo` varchar(255) NOT NULL,
  `car_ano` varchar(255) NOT NULL,
  `car_km` double NOT NULL,
  `car_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OS`
--

CREATE TABLE `OS` (
  `os_id` bigint(20) NOT NULL,
  `os_user` bigint(20) NOT NULL,
  `os_carro` bigint(20) NOT NULL,
  `os_preco` double NOT NULL,
  `os_status` int(11) NOT NULL,
  `os_data_inicio` date NOT NULL,
  `os_data_fim` date NOT NULL,
  `pre_idadeCondutor` int(11) NOT NULL,
  `pre_KmInicial` double NOT NULL,
  `pre_KmFinal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pessoa`
--

CREATE TABLE `pessoa` (
  `pes_id` bigint(20) NOT NULL,
  `pes_nome` varchar(40) NOT NULL,
  `pes_sobrenome` varchar(100) NOT NULL,
  `pes_cpf` varchar(15) NOT NULL,
  `pes_cnh` varchar(20) NOT NULL,
  `pes_nascimento` date NOT NULL,
  `pes_telefone` varchar(15) NOT NULL,
  `pes_endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabela_preco_dia`
--

CREATE TABLE `tabela_preco_dia` (
  `tpd_id` bigint(20) NOT NULL,
  `tpd_carro` bigint(20) NOT NULL,
  `tpd_precoMenorVinteQuatro` double NOT NULL,
  `tpd_precoPadrao` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `use_id` bigint(20) NOT NULL,
  `use_user` bigint(20) NOT NULL,
  `use_email` varchar(255) NOT NULL,
  `use_senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `OS`
--
ALTER TABLE `OS`
  ADD PRIMARY KEY (`os_id`),
  ADD UNIQUE KEY `os_user` (`os_user`),
  ADD UNIQUE KEY `os_carro` (`os_carro`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`pes_id`);

--
-- Indexes for table `tabela_preco_dia`
--
ALTER TABLE `tabela_preco_dia`
  ADD PRIMARY KEY (`tpd_id`),
  ADD KEY `tpd_carro` (`tpd_carro`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`use_id`),
  ADD KEY `use_user` (`use_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carros`
--
ALTER TABLE `carros`
  MODIFY `car_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OS`
--
ALTER TABLE `OS`
  MODIFY `os_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `pes_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabela_preco_dia`
--
ALTER TABLE `tabela_preco_dia`
  MODIFY `tpd_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `use_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OS`
--
ALTER TABLE `OS`
  ADD CONSTRAINT `os_ibfk_1` FOREIGN KEY (`os_user`) REFERENCES `user` (`use_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `os_ibfk_2` FOREIGN KEY (`os_carro`) REFERENCES `carros` (`car_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tabela_preco_dia`
--
ALTER TABLE `tabela_preco_dia`
  ADD CONSTRAINT `tabela_preco_dia_ibfk_1` FOREIGN KEY (`tpd_carro`) REFERENCES `carros` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`use_user`) REFERENCES `pessoa` (`pes_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
