-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 04-Jul-2020 às 03:52
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dnd_en`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `backgrounds`
--

CREATE TABLE `backgrounds` (
  `idbackground` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featurename` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proficiencies` json NOT NULL,
  `languages` json NOT NULL,
  `equipments` json NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featuredescription` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `characters`
--

CREATE TABLE `characters` (
  `idcharacter` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `raceid` int(11) NOT NULL,
  `backgroundid` int(11) NOT NULL,
  `strength` int(11) NOT NULL,
  `dexterity` int(11) NOT NULL,
  `constitution` int(11) NOT NULL,
  `intelligence` int(11) NOT NULL,
  `wisdom` int(11) NOT NULL,
  `charisma` int(11) NOT NULL,
  `proeficiencies` json NOT NULL,
  `appearence` json DEFAULT NULL,
  `personality` json DEFAULT NULL,
  `backstory` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `characters-classes`
--

CREATE TABLE `characters-classes` (
  `id` int(11) NOT NULL,
  `idcharacter` int(11) NOT NULL,
  `idclass` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `choices` json NOT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `characters-items`
--

CREATE TABLE `characters-items` (
  `id` int(11) NOT NULL,
  `idcharacter` int(11) NOT NULL,
  `iditem` int(11) NOT NULL,
  `qnt` int(11) NOT NULL,
  `equiped` tinyint(1) NOT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `characters-spells`
--

CREATE TABLE `characters-spells` (
  `id` int(11) NOT NULL,
  `idcharacter` int(11) NOT NULL,
  `idspell` int(11) NOT NULL,
  `prepared` int(11) NOT NULL,
  `source` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `classes`
--

CREATE TABLE `classes` (
  `idclass` int(11) NOT NULL,
  `hit_die` int(11) NOT NULL,
  `pro_skill_option` json NOT NULL,
  `pro_items` json NOT NULL,
  `pro_saving_throws` json NOT NULL,
  `equipment` json NOT NULL,
  `table` json NOT NULL,
  `features` json NOT NULL,
  `casting_ability` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subclasses` json NOT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `items`
--

CREATE TABLE `items` (
  `iditem` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rarity` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ac` tinyint(4) DEFAULT NULL,
  `hp` smallint(6) DEFAULT NULL,
  `speed` smallint(6) DEFAULT NULL,
  `atk_bonus` tinyint(4) DEFAULT NULL,
  `dmg` smallint(6) DEFAULT NULL,
  `table` json DEFAULT NULL,
  `metadata` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `races`
--

CREATE TABLE `races` (
  `idrace` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speed` smallint(6) NOT NULL,
  `ability_bonus` json NOT NULL,
  `alignment` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `languages` json NOT NULL,
  `traits` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `spells`
--

CREATE TABLE `spells` (
  `idspell` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `range` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verbal` tinyint(1) NOT NULL,
  `somatic` tinyint(1) NOT NULL,
  `material` tinyint(1) NOT NULL,
  `material_items` json NOT NULL,
  `ritual` tinyint(1) NOT NULL,
  `duration` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `concentration` tinyint(1) NOT NULL,
  `casting_time` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` mediumint(9) NOT NULL,
  `school` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classes` json NOT NULL,
  `subclasses` json NOT NULL,
  `guilds` json NOT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `iduser` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users-characters`
--

CREATE TABLE `users-characters` (
  `id` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idcharacter` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `metadata` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `backgrounds`
--
ALTER TABLE `backgrounds`
  ADD PRIMARY KEY (`idbackground`);

--
-- Índices para tabela `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`idcharacter`);

--
-- Índices para tabela `characters-classes`
--
ALTER TABLE `characters-classes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `characters-items`
--
ALTER TABLE `characters-items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `characters-spells`
--
ALTER TABLE `characters-spells`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`idclass`);

--
-- Índices para tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`iditem`);

--
-- Índices para tabela `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`idrace`);

--
-- Índices para tabela `spells`
--
ALTER TABLE `spells`
  ADD PRIMARY KEY (`idspell`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`iduser`);

--
-- Índices para tabela `users-characters`
--
ALTER TABLE `users-characters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `backgrounds`
--
ALTER TABLE `backgrounds`
  MODIFY `idbackground` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `characters`
--
ALTER TABLE `characters`
  MODIFY `idcharacter` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `characters-classes`
--
ALTER TABLE `characters-classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `characters-items`
--
ALTER TABLE `characters-items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `characters-spells`
--
ALTER TABLE `characters-spells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `idclass` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `iditem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `races`
--
ALTER TABLE `races`
  MODIFY `idrace` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `spells`
--
ALTER TABLE `spells`
  MODIFY `idspell` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users-characters`
--
ALTER TABLE `users-characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
