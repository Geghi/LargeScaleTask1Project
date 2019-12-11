-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 11, 2019 alle 12:31
-- Versione del server: 10.4.8-MariaDB
-- Versione PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentsratings`
--
DROP DATABASE IF EXISTS `studentsratings`;
CREATE DATABASE `studentsratings` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `studentsratings`;

-- --------------------------------------------------------

--
-- Struttura della tabella `degree_programmes`
--

CREATE TABLE `degree_programmes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `degree_programmes`
--

INSERT INTO `degree_programmes` (`id`, `name`) VALUES
(3, 'Artificial Intelligence and Data Engineering'),
(6, 'Bionics Engineering'),
(2, 'Computer Engineering'),
(5, 'Ingegneria Gestionale'),
(1, 'Ingegneria Informatica'),
(4, 'Ingegneria Meccanica');

-- --------------------------------------------------------

--
-- Struttura della tabella `professors`
--

CREATE TABLE `professors` (
  `id` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `professors`
--

INSERT INTO `professors` (`id`, `info`, `name`, `surname`) VALUES
(1, 'Professore associato presso l\'Università di Pisa. Il 22.7.1998 ha conseguito la laurea in Ingegneria Informatica, con lode, presso l’Università degli studi di Pisa. Il 14.3.2002 ha ricevuto il titolo di Dottore di Ricerca in Ingegneria dell’Informazione, discutendo la Tesi “Progetto e Realizzazione di un Sistema Distribuito a Spazio Singolo”. ', 'Giuseppe', 'Lettieri'),
(2, 'Professore di analisi matematica presso il dipartimento di Matematica dell\'Università di Pisa. Lareato con lode in Matematica presso la scuola normale superiore nel 1995, consegue la laurea magistrale presso la scuola normale superiore di Pisa nel 1997. Dal 2016 è professore ordinario presso l\'Università di Pisa.', 'Luigi', 'Berselli'),
(3, 'Professore associato presso il Dipartimento di Ingegneria dell\'Informazione (Università di Pisa) e membro del laboratorio del laboratorio del Data Science and Engineering. ', 'Marco', 'Cococcioni'),
(4, 'Professore del Dipartimento di Ingegneria dell\'Informazione dell\'Università di Pisa. Nel 1990 ha conseguito la laurea in Ingegneria Elettronica e nel 1995 ha ottenuto il dottorato in Ingegneria Informatica. Si occupa di ricerca nell\'ambito di Internet delle cose e Sustainable Computing', 'Giuseppe', 'Anastasi'),
(5, 'Francesco Marcelloni received the Laurea degree in Electronics Engineering and the Ph.D. degree in Computer Engineering from the University of Pisa in 1991 and 1996, respectively. He is currently a full professor at the Department of Information Engineering of the University of Pisa and Vice Rector for International Cooperation and Relations. He has been a member of the Academic Senate of the University of Pisa. He has co-founded the Computational Intelligence Group at the Department of Information Engineering of the University of Pisa in 2002. Further, he is the founder and head of the Competence Centre on MObile Value Added Services (MOVAS). ', 'Francesco', 'Marcelloni'),
(6, 'Giovanni Stea received the Laurea degree (summa cum laude) and the PhD degree in Computer Systems Engineering from the University of Pisa, Italy, in 1999 and 2003 respectively. Starting from January 2004, he has been with the Department of Information Engineering, where he is now Associate Professor and responsible for the research activities of the Networking and Cloud Computing Lab. ', 'Giovanni', 'Stea'),
(7, ' Mario G.C.A. Cimino is an Associate Professor at the Department of Information Engineering of the University of Pisa (Italy). He received the Ph.D. degree in Information Engineering from the University of Pisa in 2007. From 2003 to 2006, as a Ph.D. student he joined the Department of Information Engineering of the University of Pisa, working on computational intelligence and information systems. Since April 2006, he spent six months as a visiting scholar at the Electrical & Computer Engineering Department of the University of Alberta, Edmonton (Canada), under the supervision of Prof. W. Pedrycz, for a research activity on neurocomputing and granular computing.', 'Mario G.C.A.', 'Cimino'),
(8, 'Professore Associato presso il Dipartimento di Ingegneria Civile e Industriale\r\nSettore scientifico disciplinare: Disegno e Metodi dell\'Ingegneria Industriale ING-IND/15', 'Alessandro', 'Paoli'),
(9, 'Nato a Pisa nel 1954, il professore Leonardo Bertini si è laureato in Ingegneria nucleare presso l’Università di Pisa nel 1980. Dopo tre anni di lavoro in aziende nazionali operanti nel settore meccanico, nel 1986 ha conseguito il dottorato in Meccanica dei Materiali. Dal 1988 si è quindi inserito nel personale di ruolo dell’Ateneo, diventando professore associato in Progettazione meccanica e Costruzione di Macchine e poi professore ordinario nel 2000.', 'Leonardo', 'Bertini');

-- --------------------------------------------------------

--
-- Struttura della tabella `prof_comments`
--

CREATE TABLE `prof_comments` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `profId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prof_comments`
--

INSERT INTO `prof_comments` (`id`, `date`, `text`, `profId`, `userId`) VALUES
(1, '2019-10-09 13:44:41', 'Il professore non è molto disponibile', 4, 1),
(2, '2019-12-01 12:36:03', 'Molto interessante ma spiegazioni veloci', 2, 6),
(3, '2019-11-23 18:11:45', 'I really like his lessons', 4, 6),
(4, '2019-12-05 17:31:29', 'He\'s a bit slow in the talking', 4, 2),
(5, '2019-12-05 21:25:09', 'In my opinion, he\'s one of the best professors of the school', 5, 4),
(6, '2019-11-19 20:58:17', 'I don\'t know if I really like him or really hate him', 5, 2),
(7, '2019-12-10 12:14:20', 'Severo ma giusto', 6, 1),
(8, '2019-12-01 08:46:12', 'He\'s ok', 5, 1),
(9, '2019-11-19 14:34:41', 'He\'s pretty good', 5, 7),
(10, '2019-12-11 17:36:07', 'Too serious', 6, 4),
(11, '2019-11-30 11:04:28', 'Spiega bene ma va troppo veloce a mio parere', 2, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `degreeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `subjects`
--

INSERT INTO `subjects` (`id`, `credits`, `info`, `name`, `degreeId`) VALUES
(1, 12, 'Fornire conoscenze di base sulla teoria delle funzioni di una variabile reale: struttura dei numeri reali, continuità, limiti, calcolo differenziale ed integrale, sull\'algebra dei numeri complessi, sulla teoria elementare delle equazioni differenziali e delle serie numeriche e di potenze.', 'Analisi Matematica I', 1),
(2, 12, 'Fornire le basi della rappresentazione dell’informazione e della programmazione (a livello macchina, strutturata ed ad oggetti), per passare da un problema ad un procedimento risolutivo ed al successivo programma. I linguaggi utilizzati sono: GNU Assembler, C e C++.', 'Fondamenti di informatica I', 1),
(3, 9, 'L\'insegnamento ha lo scopo di fornire le conoscenze di base sulle reti di calcolatori , sulla programmazione di applicazioni distribuite e sull\'amministrazione di un sistema informatico in rete.', 'Reti informatiche', 1),
(4, 9, 'L’insegnamento ha l’obiettivo di fornire conoscenze sull’architettura dei moderni calcolatori, sulla organizzazione delle interfacce comunemente utilizzate e sul nucleo di sistema operativo.', 'Calcolatori elettronici', 1),
(5, 12, 'Il corso fornisce agli studenti le conoscenze e di strumenti operativi necessari per eseguire la progettazione meccanica avanzata di un sistema meccanico (meccanico o macchina completa). Al termine del corso l\'allievo sarà in grado di eseguire, con procedimento manuale o con l\'ausilio del calcolatore, l\'analisi del comportamento di un sistema meccanico nelle varie condizioni operative nelle quali tale sistema dovrà funzionare.', 'Costruzine di Macchine', 4),
(6, 6, 'Il corso si propone di fornire conoscenze e competenze nell’ambito della programmazione a oggetti, con particolare riferimento a sistemi concorrenti e distribuiti. I problemi fondamentali derivanti da una esecuzione parallela vengono affrontati in modo pratico usando il linguaggio Java. I principali aspetti progettuali e realizzativi legati ad applicazioni software composte da più sottosistemi vengono sperimentati attraverso la realizzazione di un progetto didattico usando il linguaggio Java.', 'Programmazione Avanzata', 1),
(7, 9, 'L’insegnamento ha l’obiettivo di fornire le conoscenze di base sulle reti logiche e sulla architettura dei calcolatori.', 'Reti Logiche', 1),
(8, 9, 'La padronanza del calcolo delle probabilita\' e delle tecniche analitiche di modellazione sara\' verificata attraverso esercizi scritti, che richiedono che uno studente modelli in modo appropriato una situzione descritta, che ricavi misure di prestazioni dai dati di ingresso, e che spieghi i risultati. \r\nLa padronanza nella simulazione sara\' verificata analizzando il codice ed i risultati di un progetto di gruppo, che consiste nella modellazione e simulazione di un sistema semplice, e nell\'analisi delle prestazioni di quest\'ultimo. \r\nLa padronanza delle tecniche di analisi statistica verra\' verificata attraverso esercizi individuali dati agli studenti durante le ore di esercitazione. ', 'Performance Evaluation of Computer Systems and Networks', 2),
(9, 6, 'L\'insegnamento ha l\'obiettivo di introdurre alle metodologie per lo sviluppo di applicazioni Web con particolare riferimento a protocolli, linguaggi e tecnologie allo stato dell’arte.', 'Progettazione Web', 1),
(10, 12, 'Il corso si propone di introdurre i concetti e le tecniche principali usate in data mining e machine learning per estrarre conoscenza dai dati. In particolare, il corso si concentrerà sugli aspetti seguenti: pre-processazione dei dati, estrazione dei pattern frequenti, estrazione dei pattern sequenziali, classificazione, predizione, clustering di oggetti e grafi, rilevazione di anomalie, analisi di flussi di dati, data mining distribuito. Il corso tratterà in sequenza gli aspetti seguenti relativi a data mining e machine learning. Analisi preliminare e visualizzazione dei dati. Pre-processazione dei dati. Estrazione dei pattern frequenti e regole associative. Classificazione. Clustering. Rilevazione di anomalie. Clustering di grafi. Estrazione di pattern sequenziali frequenti. Data mining di flussi di dati. Framework per data mining distribuito.', 'Data Mining and Machine Learning', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `subject_comments`
--

CREATE TABLE `subject_comments` (
  `id` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `subjectId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `subject_comments`
--

INSERT INTO `subject_comments` (`id`, `date`, `text`, `userId`, `subjectId`) VALUES
(1, '2019-10-09 13:25:57', 'Spiegata bene a lezione', 1, 1),
(2, '2019-10-09 13:27:13', 'L\'esame è molto difficile ma le spiegazioni sono molto precise. Da migliorare forse la preparazione in laboratiori.', 1, 4),
(3, '2019-11-28 10:50:46', 'Fornisce basi adeguate per i corsi successivi', 2, 2),
(4, '2019-11-28 10:46:46', 'Non molto chiara la parte sui puntatori', 6, 2),
(5, '2019-12-02 10:12:41', 'Very difficult examination', 6, 4),
(6, '2019-12-06 10:50:13', 'Interesting subject', 2, 10),
(7, '2019-11-28 18:07:49', 'I don\'t like it', 1, 10),
(8, '2019-11-08 17:55:32', 'wow, amazing', 4, 10),
(9, '2019-11-28 11:02:40', 'It\'s good', 6, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `teaching`
--

CREATE TABLE `teaching` (
  `subjectId` int(11) NOT NULL,
  `profId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `teaching`
--

INSERT INTO `teaching` (`subjectId`, `profId`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 1),
(5, 9),
(6, 7),
(7, 6),
(9, 5),
(10, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `degreeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `admin`, `password`, `username`, `degreeId`) VALUES
(1, b'1', 'Geghi', 'Geghi', 3),
(2, b'0', 'alice', 'alice', 3),
(4, b'0', 'stefano', 'stefano', 3),
(6, b'0', 'marco', 'marco', 3),
(7, b'0', 'jack', 'jack', 6);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `degree_programmes`
--
ALTER TABLE `degree_programmes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_8n0lejh6qr0rofdky1cqju07u` (`name`);

--
-- Indici per le tabelle `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `prof_comments`
--
ALTER TABLE `prof_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6v05rtcorbc6c5fnunb061s4u` (`profId`),
  ADD KEY `FKcd46jbo4lqjilt3ikhhstedqt` (`userId`);

--
-- Indici per le tabelle `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkt8kqqxrc4y98j2hunwq4i9lo` (`degreeId`);

--
-- Indici per le tabelle `subject_comments`
--
ALTER TABLE `subject_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5pde6t3ujeujnf2sm9vx4neut` (`userId`),
  ADD KEY `FKt3l2e9aphmme7lf141q80m5qr` (`subjectId`);

--
-- Indici per le tabelle `teaching`
--
ALTER TABLE `teaching`
  ADD PRIMARY KEY (`subjectId`,`profId`),
  ADD KEY `FKgyhmrj4xrjv965wf0a9thg3ht` (`profId`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  ADD KEY `FKy35kc992h9ec1clk6vdiddsc` (`degreeId`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `degree_programmes`
--
ALTER TABLE `degree_programmes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `professors`
--
ALTER TABLE `professors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `prof_comments`
--
ALTER TABLE `prof_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT per la tabella `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `subject_comments`
--
ALTER TABLE `subject_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `prof_comments`
--
ALTER TABLE `prof_comments`
  ADD CONSTRAINT `FK6v05rtcorbc6c5fnunb061s4u` FOREIGN KEY (`profId`) REFERENCES `professors` (`id`),
  ADD CONSTRAINT `FKcd46jbo4lqjilt3ikhhstedqt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Limiti per la tabella `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `FKkt8kqqxrc4y98j2hunwq4i9lo` FOREIGN KEY (`degreeId`) REFERENCES `degree_programmes` (`id`);

--
-- Limiti per la tabella `subject_comments`
--
ALTER TABLE `subject_comments`
  ADD CONSTRAINT `FK5pde6t3ujeujnf2sm9vx4neut` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt3l2e9aphmme7lf141q80m5qr` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`);

--
-- Limiti per la tabella `teaching`
--
ALTER TABLE `teaching`
  ADD CONSTRAINT `FK8r885vblohanc7yu56tmjjlk4` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `FKgyhmrj4xrjv965wf0a9thg3ht` FOREIGN KEY (`profId`) REFERENCES `professors` (`id`);

--
-- Limiti per la tabella `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKy35kc992h9ec1clk6vdiddsc` FOREIGN KEY (`degreeId`) REFERENCES `degree_programmes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
