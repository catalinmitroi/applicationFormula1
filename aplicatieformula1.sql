-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: ian. 29, 2021 la 02:21 PM
-- Versiune server: 10.4.14-MariaDB
-- Versiune PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `aplicatieformula1`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `circuit`
--

CREATE TABLE `circuit` (
  `Id_Circuit` int(4) NOT NULL,
  `Nume_Circuit` varchar(50) NOT NULL DEFAULT 'Circuit',
  `Tip_Circuit` varchar(20) DEFAULT NULL,
  `Loc_Circuit` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `circuit`
--

INSERT INTO `circuit` (`Id_Circuit`, `Nume_Circuit`, `Tip_Circuit`, `Loc_Circuit`) VALUES
(1, 'Circuitul Adelaide', 'Strada', 'Adelaide,Australia'),
(2, 'Circuitul Ain-Diab', 'Drum', 'Casablanca, Maroc'),
(3, 'Circuitul AVUS', 'Strada', 'Berlin,Germania'),
(4, 'Circuit de Catalunya', 'Pista', 'Montmelo, Spania'),
(5, 'Circuitul Dijon-Prenois', 'Pista', 'Dijon,Franta'),
(6, 'Circuitul Hungaroring', 'Pista', 'Budapesta,Ungaria'),
(7, 'Circuitul Indianapolis Motor Speedway', 'Pista', 'Speedway, Statele Unite'),
(38, 'x', 'Drum', 'x');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `cursa`
--

CREATE TABLE `cursa` (
  `Id_Cursa` int(4) NOT NULL,
  `Id_Circuit` int(4) NOT NULL,
  `Tip_Cursa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `cursa`
--

INSERT INTO `cursa` (`Id_Cursa`, `Id_Circuit`, `Tip_Cursa`) VALUES
(1, 5, 'Dubla'),
(2, 3, 'Simpla'),
(3, 7, 'Simpla'),
(4, 4, 'Dubla'),
(5, 1, 'Tripla'),
(6, 2, 'Simpla'),
(7, 6, 'Dubla'),
(8, 3, 'Tripla'),
(9, 4, 'Simpla');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `echipa_pilot`
--

CREATE TABLE `echipa_pilot` (
  `Id_Echipa` int(4) NOT NULL,
  `Id_Pilot` int(4) NOT NULL,
  `Ora_Start` time NOT NULL,
  `Ora_Finish` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `echipa_pilot`
--

INSERT INTO `echipa_pilot` (`Id_Echipa`, `Id_Pilot`, `Ora_Start`, `Ora_Finish`) VALUES
(1, 2, '11:00:00', '11:30:00'),
(1, 5, '11:00:00', '11:30:00'),
(1, 7, '11:00:00', '11:30:00'),
(2, 1, '08:30:00', '08:45:00'),
(2, 3, '08:30:00', '08:45:00'),
(2, 6, '08:30:00', '08:45:00'),
(2, 8, '08:30:00', '08:45:00'),
(3, 11, '10:15:00', '11:15:00'),
(3, 13, '10:15:00', '11:15:00'),
(4, 4, '09:20:00', '09:50:00'),
(4, 12, '09:20:00', '09:50:00');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `echipe`
--

CREATE TABLE `echipe` (
  `Id_Echipa` int(11) NOT NULL,
  `Nume_Echipa` varchar(50) NOT NULL,
  `Numar_piloti` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `echipe`
--

INSERT INTO `echipe` (`Id_Echipa`, `Nume_Echipa`, `Numar_piloti`) VALUES
(1, 'Lotus', 3),
(2, 'Minardi F1', 4),
(3, 'MF, Racing', 2),
(4, 'Motor Racing Developments', 2);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `piloti`
--

CREATE TABLE `piloti` (
  `Id_Pilot` int(4) NOT NULL,
  `Nume` varchar(50) NOT NULL,
  `Prenume` varchar(50) NOT NULL,
  `Nationalitate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `piloti`
--

INSERT INTO `piloti` (`Id_Pilot`, `Nume`, `Prenume`, `Nationalitate`) VALUES
(1, 'Schumacher', 'Michael', 'Germania'),
(2, 'Hamilton', 'Lewis Carl ', 'Marea Britanie'),
(3, 'Vettel', 'Sebastian ', 'Germania'),
(4, 'Prost', 'Alain Marie Pascal ', 'Franta'),
(5, 'Adams', 'Philippe ', 'Belgia'),
(6, 'Ader', 'Walt ', 'Statele Unite ale Americii'),
(7, 'Amati', 'Giovanna ', 'Italia'),
(8, 'Albers', 'Christijan ', 'Olanda'),
(11, 'Alesi', 'Jean ', 'Franta'),
(12, 'Bellof', 'Stefan ', 'Germania'),
(13, 'Beretta', 'Olivier', 'Monaco');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `pilot_cursa`
--

CREATE TABLE `pilot_cursa` (
  `Id_Pilot` int(4) NOT NULL,
  `Id_Cursa` int(4) NOT NULL,
  `Ora_Cursa` time NOT NULL,
  `Pozitie_Finala` int(4) DEFAULT NULL,
  `Punctaj` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `pilot_cursa`
--

INSERT INTO `pilot_cursa` (`Id_Pilot`, `Id_Cursa`, `Ora_Cursa`, `Pozitie_Finala`, `Punctaj`) VALUES
(1, 3, '08:30:00', 3, 24),
(2, 8, '11:00:00', 1, 24),
(3, 3, '08:30:00', 2, 12),
(4, 5, '09:20:00', 1, 14),
(5, 2, '11:00:00', 4, 6),
(6, 9, '08:30:00', 1, 12),
(7, 5, '11:00:00', 5, 15),
(8, 1, '08:30:00', 5, 22),
(11, 4, '10:15:00', 1, 21),
(12, 6, '09:20:00', 3, 18),
(13, 7, '10:15:00', 2, 24);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `User` varchar(100) NOT NULL,
  `Pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`Id`, `User`, `Pass`) VALUES
(13, 'admin1', '$2y$10$tGkBTGuXgmAnZll3aRV70uJwu0ndhO48lhNFnVYY5CnGCD1ULWHSO'),
(17, 'usernou', '$2y$10$aGpRjJj.1IeRKcnetCbh.OHMd60XkSVgkGfT/9xGUZW0p.Yjdgfza');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`Id_Circuit`);

--
-- Indexuri pentru tabele `cursa`
--
ALTER TABLE `cursa`
  ADD PRIMARY KEY (`Id_Cursa`),
  ADD KEY `Id_Circuit` (`Id_Circuit`);

--
-- Indexuri pentru tabele `echipa_pilot`
--
ALTER TABLE `echipa_pilot`
  ADD PRIMARY KEY (`Id_Echipa`,`Id_Pilot`),
  ADD KEY `Id_Pilot` (`Id_Pilot`) USING BTREE;

--
-- Indexuri pentru tabele `echipe`
--
ALTER TABLE `echipe`
  ADD PRIMARY KEY (`Id_Echipa`);

--
-- Indexuri pentru tabele `piloti`
--
ALTER TABLE `piloti`
  ADD PRIMARY KEY (`Id_Pilot`);

--
-- Indexuri pentru tabele `pilot_cursa`
--
ALTER TABLE `pilot_cursa`
  ADD PRIMARY KEY (`Id_Pilot`,`Id_Cursa`),
  ADD KEY `Id_Cursa` (`Id_Cursa`);

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `circuit`
--
ALTER TABLE `circuit`
  MODIFY `Id_Circuit` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pentru tabele `cursa`
--
ALTER TABLE `cursa`
  MODIFY `Id_Cursa` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `echipe`
--
ALTER TABLE `echipe`
  MODIFY `Id_Echipa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pentru tabele `piloti`
--
ALTER TABLE `piloti`
  MODIFY `Id_Pilot` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `cursa`
--
ALTER TABLE `cursa`
  ADD CONSTRAINT `cursa_ibfk_1` FOREIGN KEY (`Id_Circuit`) REFERENCES `circuit` (`Id_Circuit`);

--
-- Constrângeri pentru tabele `echipa_pilot`
--
ALTER TABLE `echipa_pilot`
  ADD CONSTRAINT `echipa_pilot_ibfk_1` FOREIGN KEY (`Id_Echipa`) REFERENCES `echipe` (`Id_Echipa`),
  ADD CONSTRAINT `echipa_pilot_ibfk_2` FOREIGN KEY (`Id_Pilot`) REFERENCES `piloti` (`Id_Pilot`);

--
-- Constrângeri pentru tabele `pilot_cursa`
--
ALTER TABLE `pilot_cursa`
  ADD CONSTRAINT `pilot_cursa_ibfk_1` FOREIGN KEY (`Id_Cursa`) REFERENCES `cursa` (`Id_Cursa`),
  ADD CONSTRAINT `pilot_cursa_ibfk_2` FOREIGN KEY (`Id_Pilot`) REFERENCES `piloti` (`Id_Pilot`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
