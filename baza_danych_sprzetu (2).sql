-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Sty 2020, 17:05
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `baza_danych_sprzetu`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `histroia_napraw`
--

CREATE TABLE `histroia_napraw` (
  `idhist_napra` int(11) NOT NULL,
  `Idsprzetu` int(11) NOT NULL,
  `Opis` text COLLATE utf8_polish_ci NOT NULL,
  `Koszt` int(11) NOT NULL,
  `Data_wydania` date NOT NULL,
  `Data_zwrotu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `naprawy`
--

CREATE TABLE `naprawy` (
  `idNaprawy` int(11) NOT NULL,
  `Idsprzetu` int(11) NOT NULL,
  `Opis` text COLLATE utf8_polish_ci NOT NULL,
  `Koszt` int(11) NOT NULL,
  `Data_wydania` date NOT NULL,
  `Data_zwrotu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `naprawy`
--
DELIMITER $$
CREATE TRIGGER `odswiezanie_his_nap` BEFORE DELETE ON `naprawy` FOR EACH ROW INSERT INTO `histroia_napraw`(idhist_napra,Idsprzetu,Opis,Koszt,Data_wydania,Data_zwrotu) VALUES (OLD.idNaprawy,OLD.Idsprzetu,OLD.Opis,OLD.Koszt,OLD.Data_wydania,OLD.Data_zwrotu)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `operator`
--

CREATE TABLE `operator` (
  `idOperator` int(11) NOT NULL,
  `Godnosc` text COLLATE utf8_polish_ci NOT NULL,
  `Rola` int(1) NOT NULL,
  `Telefon` int(9) NOT NULL,
  `czy_pracuje` tinyint(1) NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `operator`
--

INSERT INTO `operator` (`idOperator`, `Godnosc`, `Rola`, `Telefon`, `czy_pracuje`, `haslo`, `email`) VALUES
(1, 'Franek Kimono', 1, 52452533, 1, 'qwerty', 'franek@firma.pl'),
(2, 'Kamil Wcześniak', 2, 553663112, 1, 'qwerty', 'wczesniak@firma.pl'),
(3, 'Mati Tykiero', 1, 522442625, 0, 'qwerty', 'mati@op.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `idPracownik` int(11) NOT NULL,
  `Godnosc` text COLLATE utf8_polish_ci NOT NULL,
  `Stanowisko` int(1) NOT NULL,
  `Telefon` int(9) NOT NULL,
  `czy_pracuje` tinyint(1) NOT NULL,
  `email` text COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`idPracownik`, `Godnosc`, `Stanowisko`, `Telefon`, `czy_pracuje`, `email`, `haslo`) VALUES
(1, 'Jan Kowalski', 1, 510276295, 1, 'kowalski@firma.pl', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(3, 'Zbyszek Janicki', 2, 535724772, 1, 'zbychu@firma.pl', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(4, 'Waldek Kaczyński', 3, 787346443, 1, 'waldi69@firma.pl', 'd8578edf8458ce06fbc5bb76a58c5ca4'),
(5, 'Jan Kwiatkowski', 2, 515122112, 0, 'kwiatkowski@firma.pl', 'd8578edf8458ce06fbc5bb76a58c5ca4');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `idRezerwacje` int(11) NOT NULL,
  `Idsprzetu` int(11) NOT NULL,
  `Idpracownika` int(11) NOT NULL,
  `data_rezerwacji` date NOT NULL,
  `Stan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzet`
--

CREATE TABLE `sprzet` (
  `idSprzet` int(11) NOT NULL,
  `Nazwa_urzadzenia` text COLLATE utf8_polish_ci NOT NULL,
  `Typ_urzadzenia` text COLLATE utf8_polish_ci NOT NULL,
  `Lokalizacja` text COLLATE utf8_polish_ci NOT NULL,
  `Wartosc` float NOT NULL,
  `dostepnosc` tinyint(1) NOT NULL,
  `Stan` tinyint(1) NOT NULL,
  `Stanowiska` text COLLATE utf8_polish_ci NOT NULL,
  `wyrzucony` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `sprzet`
--

INSERT INTO `sprzet` (`idSprzet`, `Nazwa_urzadzenia`, `Typ_urzadzenia`, `Lokalizacja`, `Wartosc`, `dostepnosc`, `Stan`, `Stanowiska`, `wyrzucony`) VALUES
(1, 'Samsung S8', 'telefon', 'Budynek 1 sala 12', 1990, 1, 1, '3', 0),
(2, 'Samsung S8', 'telefon', 'Budynek 1 sala 12', 1990, 1, 1, '3', 0),
(3, 'iPhone 8', 'telefon', 'budynek 1 sala 12', 2499, 1, 1, '2', 0),
(4, 'Mercedes S ', 'samochód', 'Garaż 1', 200000, 0, 1, '1', 0),
(5, 'Dell 27\"', 'monitor', 'Budynek 2 sala 23', 1500, 0, 0, '3', 0),
(6, 'Stół bez nóg', 'meble', 'Budynek 2 sala 52', 99, 0, 0, '3', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `idWypozyczenia` int(11) NOT NULL,
  `idPracownika` int(11) NOT NULL,
  `idSprzetu` int(11) NOT NULL,
  `Data_wyp` date NOT NULL,
  `kiedy_zwrot` date NOT NULL,
  `Data_zwrotu` date NOT NULL,
  `Stan_zwrotu` tinyint(1) NOT NULL,
  `dyspozytor_wyd` int(11) NOT NULL,
  `dyspozytor_zwr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczone`
--

CREATE TABLE `wypozyczone` (
  `idWypozyczone` int(11) NOT NULL,
  `idPracownika` int(11) NOT NULL,
  `idSprzetu` int(11) NOT NULL,
  `Data_wyp` date NOT NULL,
  `kiedy_zwrot` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zepsucia`
--

CREATE TABLE `zepsucia` (
  `idZepsucia` int(11) NOT NULL,
  `Idsprzetu` int(11) NOT NULL,
  `Opis` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zwroty`
--

CREATE TABLE `zwroty` (
  `idZwrotu` int(11) NOT NULL,
  `idPracownika` int(11) NOT NULL,
  `idSprzetu` int(11) NOT NULL,
  `kiedy_zwrot` date NOT NULL,
  `Data_zwrotu` date NOT NULL,
  `Stan_zwrotu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `histroia_napraw`
--
ALTER TABLE `histroia_napraw`
  ADD PRIMARY KEY (`idhist_napra`);

--
-- Indeksy dla tabeli `naprawy`
--
ALTER TABLE `naprawy`
  ADD PRIMARY KEY (`idNaprawy`);

--
-- Indeksy dla tabeli `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`idOperator`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`idPracownik`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`idRezerwacje`);

--
-- Indeksy dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  ADD PRIMARY KEY (`idSprzet`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`idWypozyczenia`);

--
-- Indeksy dla tabeli `wypozyczone`
--
ALTER TABLE `wypozyczone`
  ADD PRIMARY KEY (`idWypozyczone`);

--
-- Indeksy dla tabeli `zepsucia`
--
ALTER TABLE `zepsucia`
  ADD PRIMARY KEY (`idZepsucia`);

--
-- Indeksy dla tabeli `zwroty`
--
ALTER TABLE `zwroty`
  ADD PRIMARY KEY (`idZwrotu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `naprawy`
--
ALTER TABLE `naprawy`
  MODIFY `idNaprawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `operator`
--
ALTER TABLE `operator`
  MODIFY `idOperator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `idPracownik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  MODIFY `idRezerwacje` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT dla tabeli `sprzet`
--
ALTER TABLE `sprzet`
  MODIFY `idSprzet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `idWypozyczenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT dla tabeli `wypozyczone`
--
ALTER TABLE `wypozyczone`
  MODIFY `idWypozyczone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `zepsucia`
--
ALTER TABLE `zepsucia`
  MODIFY `idZepsucia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `zwroty`
--
ALTER TABLE `zwroty`
  MODIFY `idZwrotu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
