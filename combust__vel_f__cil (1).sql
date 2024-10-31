-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/10/2024 às 03:49
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `combustível_fácil`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bandeira_de_posto`
--

CREATE TABLE `bandeira_de_posto` (
  `id_bandeira` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bandeira_de_posto`
--

INSERT INTO `bandeira_de_posto` (`id_bandeira`, `nome`) VALUES
(1, 'petrobras'),
(2, 'ipiranga'),
(3, 'raizen'),
(4, 'ale'),
(5, 'shell'),
(6, 'habibs');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_uf` int(11) DEFAULT NULL,
  `id_geograficos` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `id_uf`, `id_geograficos`) VALUES
(4, 'macapa', 3, 0),
(5, 'santana', 3, NULL),
(6, 'Oiapoque', 3, NULL),
(7, 'laranja do jari', 3, NULL),
(8, 'mazagão', 3, NULL),
(9, 'calçoene', 3, NULL),
(10, 'cutias', 3, NULL),
(11, 'ferreira gomes', 3, NULL),
(12, 'itaubal', 3, NULL),
(13, 'vitoria do jari', 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereço`
--

CREATE TABLE `endereço` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_cidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`id`, `Nome`) VALUES
(3, 'amapa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hotorico_de_preço`
--

CREATE TABLE `hotorico_de_preço` (
  `id_posto` int(11) DEFAULT NULL,
  `id_combustivel` int(11) DEFAULT NULL,
  `preço` float DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `postos`
--

CREATE TABLE `postos` (
  `id_posto` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `id_endereço` int(11) DEFAULT NULL,
  `id_bandeira_posto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_combustivel`
--

CREATE TABLE `tipo_combustivel` (
  `id_combustivel` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `subtipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_combustivel`
--

INSERT INTO `tipo_combustivel` (`id_combustivel`, `nome`, `subtipo`) VALUES
(1, 'gasolina', 'comum'),
(2, 'gasolina', 'adtivada'),
(3, 'gasolina', 'premium'),
(4, 'etanol', 'comum'),
(5, 'etanol', 'adtivado'),
(6, 'disel', 'comum s500'),
(7, 'disel', 's10'),
(8, 'disel', 'adtivado'),
(9, 'disel', 'biodisel'),
(10, 'gas natural', 'comun');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bandeira_de_posto`
--
ALTER TABLE `bandeira_de_posto`
  ADD PRIMARY KEY (`id_bandeira`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_uf` (`id_uf`);

--
-- Índices de tabela `endereço`
--
ALTER TABLE `endereço`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cidade` (`id_cidade`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `hotorico_de_preço`
--
ALTER TABLE `hotorico_de_preço`
  ADD KEY `id_posto` (`id_posto`),
  ADD KEY `id_combustivel` (`id_combustivel`);

--
-- Índices de tabela `postos`
--
ALTER TABLE `postos`
  ADD PRIMARY KEY (`id_posto`),
  ADD KEY `id_endereço` (`id_endereço`),
  ADD KEY `id_bandeira_posto` (`id_bandeira_posto`);

--
-- Índices de tabela `tipo_combustivel`
--
ALTER TABLE `tipo_combustivel`
  ADD PRIMARY KEY (`id_combustivel`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bandeira_de_posto`
--
ALTER TABLE `bandeira_de_posto`
  MODIFY `id_bandeira` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `endereço`
--
ALTER TABLE `endereço`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `postos`
--
ALTER TABLE `postos`
  MODIFY `id_posto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_combustivel`
--
ALTER TABLE `tipo_combustivel`
  MODIFY `id_combustivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`id_uf`) REFERENCES `estado` (`id`);

--
-- Restrições para tabelas `endereço`
--
ALTER TABLE `endereço`
  ADD CONSTRAINT `endereço_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`);

--
-- Restrições para tabelas `hotorico_de_preço`
--
ALTER TABLE `hotorico_de_preço`
  ADD CONSTRAINT `hotorico_de_preço_ibfk_1` FOREIGN KEY (`id_posto`) REFERENCES `postos` (`id_posto`),
  ADD CONSTRAINT `hotorico_de_preço_ibfk_2` FOREIGN KEY (`id_combustivel`) REFERENCES `tipo_combustivel` (`id_combustivel`);

--
-- Restrições para tabelas `postos`
--
ALTER TABLE `postos`
  ADD CONSTRAINT `postos_ibfk_1` FOREIGN KEY (`id_endereço`) REFERENCES `endereço` (`id`),
  ADD CONSTRAINT `postos_ibfk_2` FOREIGN KEY (`id_bandeira_posto`) REFERENCES `bandeira_de_posto` (`id_bandeira`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
