-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 29, 2024 alle 23:12
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watersurvey`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `survey_Id` int(10) UNSIGNED DEFAULT NULL,
  `question_Id` int(10) UNSIGNED DEFAULT NULL,
  `selectedOption` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `answers`
--

INSERT INTO `answers` (`id`, `survey_Id`, `question_Id`, `selectedOption`, `user_id`) VALUES
(1, 1, 7, 'Torbole Casaglia', 12),
(2, 1, 1, 'Poor', 12),
(3, 1, 2, 'Unusual taste,Unusual odor', 12),
(4, 1, 3, 'Always', 12),
(5, 1, 4, 'Yes', 12),
(6, 1, 5, 'Mechanical', 12),
(7, 1, 6, 'The colour of the water is brown', 12),
(23, 2, 24, 'Extremely important', 13),
(24, 2, 25, 'Yes', 13),
(25, 2, 26, 'Clean-up drives', 13),
(26, 2, 27, 'Strongly agree', 13),
(27, 2, 23, 'Never', 13),
(28, 2, 24, 'Extremely important', 13),
(29, 2, 25, 'Yes', 13),
(30, 2, 26, 'Clean-up drives', 13),
(31, 2, 27, 'Strongly agree', 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `surveyId` int(10) UNSIGNED DEFAULT NULL,
  `questionId` int(10) UNSIGNED DEFAULT NULL,
  `optionText` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `options`
--

INSERT INTO `options` (`id`, `surveyId`, `questionId`, `optionText`) VALUES
(15, 1, 1, 'Excellent'),
(16, 1, 1, 'Good'),
(17, 1, 1, 'Fair'),
(18, 1, 1, 'Poor'),
(19, 1, 2, 'Unusual taste'),
(20, 1, 2, 'Unusual odor'),
(21, 1, 2, 'No issues'),
(22, 1, 3, 'Always'),
(23, 1, 3, 'Often'),
(24, 1, 3, 'Sometimes'),
(25, 1, 3, 'Rarely'),
(26, 1, 3, 'Never'),
(27, 1, 4, 'Yes'),
(28, 1, 4, 'No'),
(29, 2, 23, 'Never'),
(30, 2, 23, 'Rarely'),
(31, 2, 23, 'Sometimes'),
(32, 2, 23, 'Often'),
(33, 2, 23, 'Very often'),
(34, 2, 24, 'Extremely important'),
(35, 2, 24, 'Very important'),
(36, 2, 24, 'Moderately important'),
(37, 2, 24, 'Slightly important'),
(38, 2, 24, 'Not important at all'),
(39, 2, 25, 'Yes'),
(40, 2, 25, 'No'),
(41, 2, 26, 'Clean-up drives'),
(42, 2, 26, 'Tree planting'),
(43, 2, 26, 'Advocacy campaigns'),
(44, 2, 26, 'Water monitoring'),
(45, 2, 26, 'Other'),
(46, 2, 27, 'Strongly agree'),
(47, 2, 27, 'Agree'),
(48, 2, 27, 'Neutral'),
(49, 2, 27, 'Disagree'),
(50, 2, 27, 'Strongly disagree');

-- --------------------------------------------------------

--
-- Struttura della tabella `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `surveyId` int(10) UNSIGNED DEFAULT NULL,
  `questionText` varchar(100) DEFAULT NULL,
  `questionType` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `questions`
--

INSERT INTO `questions` (`id`, `surveyId`, `questionText`, `questionType`) VALUES
(1, 1, 'How would you rate the overall quality of the tap water in your area?', 1),
(2, 1, 'Have you noticed any unusual taste or odor in the tap water?', 2),
(3, 1, 'How frequently do you use tap water for drinking?', 3),
(4, 1, 'Do you use any water filtration systems at home?', 1),
(5, 1, 'If yes, what type of filtration system do you use?', 4),
(6, 1, 'Do you have any additional comments or suggestions?', 4),
(7, 1, 'Location', 5),
(23, 2, 'How often do you visit natural water bodies (e.g., lakes, rivers, oceans)?', 1),
(24, 2, 'How important do you think it is to conserve natural water bodies?', 1),
(25, 2, 'Have you participated in any water conservation activities?', 1),
(26, 2, 'If yes, what type of activities have you participated in?', 1),
(27, 2, 'Do you think pollution is a major problem for our water bodies?', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `survey`
--

CREATE TABLE `survey` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `survey`
--

INSERT INTO `survey` (`id`, `title`, `description`, `creationDate`) VALUES
(1, 'Water Quality Survey', 'Survey on the quality of tap water in your area', '2024-05-20'),
(2, 'Water Conservation and Natural Bodies', 'Survey on water conservation practices and opinions on natural water bodies', '2024-05-29');

-- --------------------------------------------------------

--
-- Struttura della tabella `temporany_code`
--

CREATE TABLE `temporany_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `typeofquestion`
--

CREATE TABLE `typeofquestion` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `typeofquestion`
--

INSERT INTO `typeofquestion` (`id`, `type`) VALUES
(1, 'radio'),
(2, 'checkbox'),
(3, 'select'),
(4, 'textarea'),
(5, 'text');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`name`, `surname`, `username`, `email`, `dateOfBirth`, `id`, `password`) VALUES
('riccardo', 'poli', 'poli', 'blazycube24@gmail.com', '2024-05-22', 12, '$2y$10$wJyf0Cq0Tet2xxsvHbkXR.RVSQWUH3s8DPXR.f6fzkLEfZpyS140S'),
('pollo', 'Riccardo', 'pollo', 'blazycube@gmail.com', '2024-05-16', 13, '$2y$10$Jz6fx399cAgTNnfviUHpAOEQodMR2rdFWq1vNEjEjNuvvuZ1Ruaay');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_Id` (`question_Id`),
  ADD KEY `survey_Id` (`survey_Id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionId` (`questionId`),
  ADD KEY `surveyId` (`surveyId`);

--
-- Indici per le tabelle `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionType_id` (`questionType`),
  ADD KEY `surveyId` (`surveyId`);

--
-- Indici per le tabelle `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `temporany_code`
--
ALTER TABLE `temporany_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indici per le tabelle `typeofquestion`
--
ALTER TABLE `typeofquestion`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT per la tabella `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `temporany_code`
--
ALTER TABLE `temporany_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `typeofquestion`
--
ALTER TABLE `typeofquestion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `question_Id` FOREIGN KEY (`question_Id`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `survey_Id` FOREIGN KEY (`survey_Id`) REFERENCES `survey` (`id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Limiti per la tabella `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `questionId_fk` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`),
  ADD CONSTRAINT `surveyId_fk` FOREIGN KEY (`surveyId`) REFERENCES `survey` (`id`);

--
-- Limiti per la tabella `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questionType_id` FOREIGN KEY (`questionType`) REFERENCES `typeofquestion` (`id`),
  ADD CONSTRAINT `surveyId` FOREIGN KEY (`surveyId`) REFERENCES `survey` (`id`);

--
-- Limiti per la tabella `temporany_code`
--
ALTER TABLE `temporany_code`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
