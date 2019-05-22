-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 22, 2019 at 07:15 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstoreeng`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `authName` varchar(120) NOT NULL,
  `bDay` date DEFAULT NULL,
  `dDay` date DEFAULT NULL,
  `authBIO` varchar(4000) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `Telephone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`authName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`authName`, `bDay`, `dDay`, `authBIO`, `email`, `Telephone`) VALUES
('Alexandr Duma', '1802-07-24', '1870-12-05', 'French Writer. The author of the World Famous \"Three Musketeers\" And Other Romanov, Alive and Several Freely Drawing the History of France.', NULL, NULL),
('Ayn Rand', '1905-02-02', '1982-03-06', 'Born in St. Petersburg (nee Alisa Zinovyevna Rosenbaum). She studied philosophy and literature in Petrograd State University. In 1925 she received a visa to travel to the United States. In Russia, despite several translations of her novels, \"still remains a little-known author.\" In the West, its name should be well known, both the founders of philosophy, based on the principles of differences, individualism, rational egoism, and rational justification of capitalist values as opposed to the then popular socialism.', NULL, NULL),
('George Orwell', '1903-06-25', '1950-01-21', 'Born in Motihari (India) in the family of a British sales agent. He graduated from Eton College in 1921. Until 1927, he served in the colonial police in Burma, then lived in Great Britain and Europe for a long time, working out odd jobs, at the same time he began to write artistic prose and journalism. Since 1935 it has been published under the pseudonym \"George Orwell\". In 1937, he fought in Spain against Franco, where he was closely confronted with manifestations of factional struggle among the \"left\". He wrote many essays and articles of socio-critical and cultural nature. During the Second World War led the anti-fascist program on the BBC. The pinnacle of his work is the satirical novel \"Animal Farm\" (1945) and the anti-utopia novel \"1984\" (1949), which became the generally accepted classic of the literature of the 20th century. He died in London from tuberculosis.', NULL, NULL),
('Ray Douglas Bradbury', '1920-08-22', '2012-06-05', 'Ray Bradbury was born in Waukegan, Illinois. The full name of Ray Bradbury is Ray (Ray), not Raymond (Raymond), as many believe. This name is recorded in his birth certificate.\r\n\r\nAt twelve years old, Bradbury realized that he wanted to become a writer, and he was seriously engaged only in this one thing. In his early experiences, he copied Edgar Poe’s pompous Victorian prose style, while Henry Kuttner, one of the writers Bradbury besieged in an effort to show off his work, told him: “You write another such story - and I will kill you.”\r\n\r\nLittle by little, his stories began to be sold in “palp” magazines — cheap paperback editions that printed a huge amount of fantastic and fantasy prose of very different quality. Against the general background, Bradbury\'s stories stood out for their lyricism and psychological depth, for which he was nicknamed \"the poet of soft covers.\"\r\n\r\nHis collection of \"Martian\" stories, which was published under the guise of the story \"The Martian Chronicles\" Bradbury took across the whole country - from Los Angeles to New York to litagent Don Congdon by bus, because there was no money on the train. This was his first great commercial success. Having received money for publication, he went to New York for the second time and, staying in Chicago, he met a crowd of young people with books in their hands - these were his first fans who wanted to get his autograph on the first edition of Martian Chronicles.\r\n\r\nMany of these American writers are known for their dystopia “451 degrees Fahrenheit”, the cycle of stories “The Martian Chronicles” and partly the autobiographical novel “The Wine of Dandelions”. But in his lifetime, Bradbury created more than eight hundred different literary works, including several novels and short stories, hundreds of short stories, dozens of plays, a number of articles, notes, and poems. His stories formed the basis of several screenings, theatrical productions and musical compositions. Bradbury is traditionally considered a classic of science fiction, although much of his work is rooted to the genre of fantasy, parables or fairy tales. Bradbury\'s plays were well received by the public, but his poems were not very successful.\r\n\r\nBradbury\'s main achievement is that he managed to arouse readers interest in the science fiction and fantasy genres, which before him were on the periphery of modern culture.', NULL, NULL),
('test', '1951-12-22', '2015-12-22', 'test', 'test', 'test'),
('Victor O. Pelevin', '1962-11-22', NULL, 'Victor O. Pelevin (born November 22, 1962, Moscow) - Russian writer, author of cult novels of the 1990s: \"Omon Ra\", \"Chapaev and the Void\" and \"Generation P\". Winner of numerous literary awards, including the “Little Booker” (1993), “National Bestseller” (2004) and the Andrei Bely Prize (2017).', 'vopelevin@rambler.ru', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `ISBN` varchar(17) NOT NULL,
  `bookTitle` varchar(50) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `authName` varchar(120) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `numOfPages` int(5) NOT NULL,
  `language` varchar(15) NOT NULL,
  `publYear` int(4) DEFAULT NULL,
  `wrYear` int(4) DEFAULT NULL,
  `publHouse` varchar(120) NOT NULL,
  `sellingPrice` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `authID` (`authName`),
  KEY `publHouseID` (`publHouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `bookTitle`, `genre`, `authName`, `description`, `numOfPages`, `language`, `publYear`, `wrYear`, `publHouse`, `sellingPrice`) VALUES
('978-5-17-112604-8', '1984', 'dystopian fiction', 'George Orwell', 'A kind of antipode of the second great anti-utopia of the 20th century - “O brave new world” by Aldous Huxley. What, in essence, is more frightening: the \"consumer society\" brought to an absurdity - or the \"society of an idea\" brought to an absolute?\r\n\r\nAccording to Orwell, there is not and there can be nothing more terrible than total non-freedom ...', 320, 'russian', 2018, 1945, 'ACT', 7.30),
('978-5-17-112604-9', 'Barnyard', 'classic, dystopian, satyr, parable', 'George Orwell', 'Parable, full of humor and sarcasm. Can a modest farm become a symbol of a totalitarian society? Of course yes. But ... what kind of society will its “citizens” see - animals doomed to slaughter?', 256, 'russian', 2018, 1845, 'ACT', 7.10),
('978-5-38-912741-8', 'Count of Monte Cristo', 'historical novel', 'Alexandr Duma', 'The plot of the \"Count of Monte-Cristo\" was drawn by Alexander Dumas from the archives of the Paris police. The real life of Francois Picot under the pen of a brilliant master of historical adventure genre has become a fascinating story about Edmond Danthes, a prisoner of the castle of If. Having made a daring escape, he returns to his hometown to accomplish justice - to avenge those who ruined his life.\r\n\r\nThe thick novel, which does not let go until the last page, \"The Count of Monte Cristo\" is a classic that is really re-read.', 1264, 'russian', 2018, 1845, 'Azbuka', 12.74),
('978-5-69-983323-8', 'Generation \"Pi\"', 'postmodern romance', 'Victor O. Pelevin', 'The novel Generation P, which has become a cult in the youth environment, is devoted to the phenomenon that has penetrated into all the pores of our daily life - advertising. Many people tend to disdainfully dismiss it as an annoying fly, considering something frivolous. But perhaps the advertising slogans did not fit in tightly. in our speech? Doesn’t the “ragged style” of the advertising clips affect our mind?\r\n\r\nThe hero of the novel Babilen Tatarsky believes that he knows the true price of advertising - after all, he creates it. But he and in a nightmare can not see the true power of the genie, released from the bottle ...', 352, 'russian', 2018, 1999, 'Eksmo', 11.85),
('978-5-69-992359-5', '451 degrees Fahrenheit', 'dystopian fiction', 'Ray Douglas Bradbury', '\"451 ° Fahrenheit\" - a novel that brought world-famous writer. 451 ° Fahrenheit - the temperature at which the paper ignites and burns. Ray Bradbury’s philosophical dystopia paints a hopeless picture of the development of a post-industrial society; this is the world of the future, in which all written publications are ruthlessly destroyed by a special firefighters detachment, and the storage of books is prosecuted, interactive television successfully serves everyone’s foolishness, punitive psychiatry decisively deals with rare dissenters, and an electric dog goes to hunt for irreparable dissidents ...', 256, 'russian', 2017, 1953, 'Eksmo', 8.90),
('978-5-96-146742-0', 'Atlant straightened his shoulders (set of 3 books)', 'dystopia, novel', 'Ayn Rand', 'How hard is the fate of businessmen forced to exist in the era of socialism in chaos disguised as the prosperity of the people and the equal opportunities of all people? This will tell the magnificent novel Ain Rand, the writing of which she spent twelve years!\r\n\r\nIt uniquely combines realism and fantasy, dystopia and utopia, sizzling grotesque and romantic heroics. Here, the well-known literary “damned questions” about the meaning of life are reflected in a very new way, and paradoxical, sharp and often controversial answers are offered. No wonder that in 1991 the Americans claimed that the Bible and Atlas Shrugged are two books that made their lives change.', 1408, 'russian', 2018, 1957, 'Alpina Publisher', 47.10),
('test', 'test', 'test', 'test', 'test', 123, 'test', 2000, 2000, 'test', 0.00),
('test25', 'test25', 'test', 'test', 'test', 123, 'test', 2000, 2000, 'test', 1.00),
('test26', 'test26', 'test', 'test', 'test', 123, 'test', 2000, 2000, 'test', 13.00),
('test31', 'test', 'test', 'test', 'test', 100, 'test', 2000, 2000, 'test', 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `publhouse`
--

DROP TABLE IF EXISTS `publhouse`;
CREATE TABLE IF NOT EXISTS `publhouse` (
  `publHouseName` varchar(100) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `Telephone` varchar(40) DEFAULT NULL,
  `Description` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`publHouseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publhouse`
--

INSERT INTO `publhouse` (`publHouseName`, `email`, `Telephone`, `Description`) VALUES
('ACT', 'support@ast.ru', '(499)951-6-000', 'The Russian publishing group AST was founded in 1990 as a trade organization, started publishing in 1992. Today it is one of the largest and most recognizable publishers in Russia, boasting many literary prizes.'),
('Alpina Publisher', 'shop@alpinabook.ru', '+7(495)120-07-04  ', 'Alpina Pablisher is one of the largest Russian publishing houses specializing in publishing business literature, psychology, pedagogy, history, philosophy, personal effectiveness and the natural sciences. Each month, the publishing house publishes up to 40 book titles with a total circulation of about 150 thousand copies. Alpina Pablisher publishes 47 book series, among which “Reuters for financiers”, “Harvard Business Review Classic”, “Ideas that Work”, “Pepeliaev, Goltsblat and Partners Law Firm” and Skolkovo Lawyers are especially famous.'),
('Azbuka', 'info@atticus-group.ru ', '+7 (495) 933 76 01', 'The ABC-Atticus Publishing Group consists of four publishers. Each specializes in certain niches in the book market and strives to achieve excellence in them:\r\n\r\n\"ABC\" - Russian and foreign classics, modern fiction, fantasy and fiction, cultural studies, art, books for children, comics and manga.\r\n\r\n\"Foreign\" - reference translation prose and fiction.\r\n\r\n“Colibri” - biographies, memoirs, historical monographs, cooking, psychology, business, creativity.\r\n\r\n\"Swallowtail\" - books for children of all ages: from the first poems and fairy tales to Harry Potter, as well as colorful atlases and encyclopedias of knowledge.'),
('Eksmo', 'info@eksmo.ru ', '+7(495)411-68-86', '\"Eksmo\" - the largest Russian publishing house, annually publishes more than 90 million copies of books in Russian. Founded in 1991 by Oleg Novikov and Andrey Gredasov as a company distributing printed materials. Independent publishing house since 1993. The central office is located in Moscow.\r\nIn 2005, the company received the honorary title “Leader of the Russian Economy”, and two years later it was recognized as the “Best Publisher” by the version of Eurocon. Since 2012, Eksmo has been controlling the activities of the AST publishing group. In fact, now the two largest Russian publishing houses are merging.'),
('test', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
CREATE TABLE IF NOT EXISTS `seller` (
  `sellerID` int(11) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(120) NOT NULL,
  `sellerInfo` varchar(1000) NOT NULL,
  `email` varchar(30) NOT NULL,
  `Telephone` varchar(30) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`sellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`sellerID`, `sellerName`, `sellerInfo`, `email`, `Telephone`, `password`) VALUES
(1, 'Ivanova Maria Pavlovna', 'shop assistant', 'mpivanova@gmail.com', '+375(29)1289503', NULL),
(2, 'Petrov Ivan Sergeevich', 'shop assistant', 'ispetrov@mail.ru', '+375(29)1239503', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `transID` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `custID` int(11) DEFAULT NULL,
  `ISBN` varchar(17) NOT NULL,
  `orderDate` date NOT NULL,
  `amount` int(11) NOT NULL,
  `sellerID` int(11) NOT NULL,
  `sellingPrice` double(4,2) DEFAULT NULL,
  `cardNum` varchar(16) NOT NULL,
  PRIMARY KEY (`transID`),
  KEY `ISBN_books_from_trans` (`ISBN`),
  KEY `to_cust` (`custID`),
  KEY `sellerID` (`sellerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transID`, `custID`, `ISBN`, `orderDate`, `amount`, `sellerID`, `sellingPrice`, `cardNum`) VALUES
(1, 1, '978-5-96-146742-0', '2018-11-13', 1, 1, 47.10, '1234000075861925'),
(4, 1, '978-5-38-912741-8', '2018-11-17', 1, 2, 12.74, '1234000075861925'),
(5, 2, '978-5-17-112604-9', '2018-11-08', 1, 2, 7.10, '1415000048571028'),
(6, 6, '978-5-17-112604-8', '2018-11-21', 1, 2, 7.30, '1892471247120001'),
(7, 6, '978-5-38-912741-8', '2018-11-21', 1, 1, 12.74, '1892471247120001'),
(18, 6, '978-5-69-992359-5', '2018-12-10', 4, 2, 44.40, '1581000035326752');

--
-- Triggers `transaction`
--
DROP TRIGGER IF EXISTS `trans_ins`;
DELIMITER $$
CREATE TRIGGER `trans_ins` BEFORE INSERT ON `transaction` FOR EACH ROW BEGIN
        	DECLARE vTmp_amm INT;
            SELECT amount INTO vTmp_amm FROM warehouse WHERE isbn=NEW.isbn;
            IF NEW.amount<vTmp_amm THEN
            	update warehouse set amount=amount-NEW.amount where isbn=NEW.isbn; 
            END IF;
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `wareOrderID` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(17) NOT NULL,
  `publHouseName` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `wareOrderDay` date NOT NULL,
  `purchasePrice` double(4,2) NOT NULL,
  PRIMARY KEY (`wareOrderID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `ware_to_publ` (`publHouseName`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`wareOrderID`, `ISBN`, `publHouseName`, `amount`, `wareOrderDay`, `purchasePrice`) VALUES
(1, '978-5-17-112604-8', 'ACT', 3, '2018-11-01', 8.94),
(14, '978-5-17-112604-9', 'ACT', 4, '2018-11-01', 5.00),
(15, '978-5-38-912741-8', 'Azbuka', 3, '2018-11-01', 10.27),
(16, '978-5-69-992359-5', 'Eksmo', 1, '2018-11-07', 7.14),
(17, '978-5-96-146742-0', 'Alpina Publisher', 3, '2018-11-08', 43.50),
(18, '978-5-69-983323-8', 'Eksmo', 5, '2018-12-05', 9.70);

-- --------------------------------------------------------

--
-- Table structure for table `сustomers`
--

DROP TABLE IF EXISTS `сustomers`;
CREATE TABLE IF NOT EXISTS `сustomers` (
  `custName` varchar(120) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `Telephone` varchar(15) DEFAULT NULL,
  `cardNum` varchar(16) NOT NULL,
  `custID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `сustomers`
--

INSERT INTO `сustomers` (`custName`, `email`, `Telephone`, `cardNum`, `custID`) VALUES
('Barskih Irina Leonidovna', 'iabarsk@mail.ru', '+375(29)9308192', '1234000075861925', 1),
('Drobovich Yevgeny Mikhailovich', 'emdrob@mail.ru', '+375(29)1589124', '1415000048571028', 2),
('Konstantin Ivanovich Kulikov', 'kikulikov@mail.ru', '+375(29)8301867', '1892471247120001', 6);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `to_authors` FOREIGN KEY (`authName`) REFERENCES `authors` (`authName`),
  ADD CONSTRAINT `to_publHouses` FOREIGN KEY (`publHouse`) REFERENCES `publhouse` (`publHouseName`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `to_books` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `to_customers` FOREIGN KEY (`custID`) REFERENCES `сustomers` (`custID`),
  ADD CONSTRAINT `to_sellers` FOREIGN KEY (`sellerID`) REFERENCES `seller` (`sellerID`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `ware_to_books` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`),
  ADD CONSTRAINT `ware_to_publ` FOREIGN KEY (`publHouseName`) REFERENCES `publhouse` (`publHouseName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
