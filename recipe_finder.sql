-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 12:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_finder`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingrediente`
--

INSERT INTO `ingrediente` (`id`, `nume`) VALUES
(1, 'faina'),
(2, 'lapte'),
(3, 'oua'),
(4, 'zahar'),
(5, 'ciocolata'),
(6, 'sare'),
(7, 'miere'),
(8, 'ulei'),
(9, 'apa'),
(10, 'branza'),
(11, 'cascaval'),
(12, 'ardei'),
(13, 'rosii'),
(14, 'castraveti'),
(15, 'ceapa'),
(16, 'unt'),
(17, 'drojdie uscata'),
(18, 'cartofi'),
(19, 'morcovi'),
(20, 'telina'),
(21, 'smantana'),
(22, 'parmezan'),
(23, 'sunca prosciuto'),
(24, 'usturoi'),
(25, 'patrunjel'),
(26, 'mere'),
(27, 'scortisoara'),
(28, 'stafide'),
(29, 'masline negre'),
(30, 'ulei de masline'),
(31, 'otet balsamic'),
(32, 'pulpe pui'),
(33, 'gris'),
(34, 'coaja lamaie rasa'),
(35, 'capsuni'),
(36, 'inghetata vanilie'),
(37, 'spaghete'),
(38, 'piper'),
(39, 'carne tocata vita'),
(40, 'pesmet'),
(41, 'pulpe porc'),
(42, 'vinete'),
(43, 'ardei gras'),
(44, 'orez'),
(45, 'bicarbonat'),
(46, 'sirop apă-zahăr'),
(47, 'naut conserva'),
(48, 'tahini'),
(49, 'zeama lamaie'),
(50, 'gem'),
(51, 'banana'),
(52, 'mango'),
(53, 'iaurt grecesc'),
(54, 'capsuni'),
(55, 'somon'),
(56, 'morcov'),
(57, 'telina'),
(58, 'dovlecel'),
(59, 'ciuperci'),
(60, 'curry pulbere'),
(61, 'tortilla'),
(63, 'conserva porumb'),
(64, 'avocado'),
(65, 'lamaie'),
(66, 'orez risotto'),
(67, 'pasta de trufe'),
(68, 'vin alb'),
(69, 'bulion legume'),
(70, 'aluat de foietaj'),
(71, 'spanac '),
(72, 'praf de copt'),
(73, 'visine');

-- --------------------------------------------------------

--
-- Table structure for table `ingrediente_retete`
--

CREATE TABLE `ingrediente_retete` (
  `reteta_id` int(11) DEFAULT NULL,
  `ingredient_id` int(11) DEFAULT NULL,
  `cantitate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingrediente_retete`
--

INSERT INTO `ingrediente_retete` (`reteta_id`, `ingredient_id`, `cantitate`) VALUES
(1, 1, '250 g'),
(1, 2, '500 ml'),
(1, 3, '2 buc'),
(1, 4, '2 linguri'),
(1, 6, '1 praf'),
(2, 10, '200 g'),
(2, 5, '150 g'),
(2, 4, '100 g'),
(2, 3, '3 buc'),
(2, 16, '50 g'),
(2, 1, '75 g'),
(3, 14, '2 buc'),
(3, 10, '150 g'),
(3, 8, '50 ml'),
(3, 6, '1 praf'),
(3, 15, '1 buc'),
(4, 1, '500 g'),
(4, 9, '300 ml'),
(4, 7, '100 ml'),
(4, 6, '5 g'),
(4, 8, '50 ml'),
(5, 3, '3 buc'),
(5, 12, '1 buc'),
(5, 15, '1 buc'),
(5, 8, '50 ml'),
(5, 6, '1 praf'),
(6, 1, '200 g'),
(6, 4, '200 g'),
(6, 3, '3 buc'),
(6, 5, '150 g'),
(6, 7, '100 g'),
(6, 16, '100 g'),
(7, 1, '500 g'),
(7, 9, '300 ml'),
(7, 8, '50 ml'),
(7, 6, '5 g'),
(7, 13, '200 g'),
(7, 10, '200 g'),
(7, 11, '50 g'),
(8, 1, '300 g'),
(8, 4, '200 g'),
(8, 3, '2 buc'),
(8, 5, '150 g'),
(8, 16, '100 g'),
(8, 6, '1 praf'),
(9, 1, '500 g'),
(9, 2, '250 ml'),
(9, 17, '7 g'),
(9, 4, '5 g'),
(9, 6, '5 g'),
(9, 16, '50 g'),
(10, 18, '3 buc'),
(10, 15, '1 buc'),
(10, 19, '2 buc'),
(10, 20, '1 tulpina'),
(10, 16, '30 g'),
(10, 21, '100 ml'),
(11, 37, '400 g'),
(11, 3, '4 buc'),
(11, 21, '200 ml'),
(11, 22, '100 g'),
(11, 23, '150 g'),
(11, 24, '2 catei'),
(11, 25, '2 linguri'),
(12, 1, '500 g'),
(12, 16, '200 g'),
(12, 4, '150 g'),
(12, 6, '1/2 lingurita'),
(12, 26, '6 buc'),
(12, 27, '1 lingurita'),
(12, 28, '100 g'),
(13, 13, '4 buc'),
(13, 14, '2 buc'),
(13, 15, '1 buc'),
(13, 29, '100 g'),
(13, 10, '200 g'),
(13, 30, '4 linguri'),
(13, 31, '2 linguri'),
(14, 32, '6 buc'),
(14, 18, '8 buc'),
(14, 24, '4 catei'),
(14, 25, '1 legatura'),
(14, 30, '4 linguri'),
(14, 6, 'dupa gust'),
(14, 38, 'dupa gust'),
(15, 2, '1 litru'),
(15, 33, '200 g'),
(15, 4, '100 g'),
(15, 34, '1 buc'),
(15, 3, '2 buc'),
(15, 16, '50 g'),
(15, 28, '50 g'),
(16, 35, '250 g'),
(16, 2, '300 ml'),
(16, 36, '2 cupe'),
(16, 7, '2 linguri'),
(17, 39, '500 g'),
(17, 15, '1 buc'),
(17, 3, '2 buc'),
(17, 40, '50 g'),
(17, 6, 'dupa gust'),
(17, 38, 'dupa gust'),
(17, 18, '1 kg'),
(17, 2, '100 ml'),
(17, 16, '50 g'),
(18, 41, '4 buc'),
(18, 24, '4 catei'),
(18, 25, '1 legatura'),
(18, 30, '4 linguri'),
(18, 6, 'dupa gust'),
(18, 38, 'dupa gust'),
(19, 42, '4 buc'),
(19, 39, '300 g'),
(19, 15, '1 buc'),
(19, 43, '1 buc'),
(19, 13, '2 buc'),
(19, 44, '100 g'),
(19, 6, 'dupa gust'),
(20, 1, '250 g'),
(20, 4, '150 g'),
(20, 3, '4 buc'),
(20, 21, '200 ml'),
(20, 45, '1 lingurita'),
(20, 27, '1 lingurita'),
(20, 46, '500 ml'),
(21, 47, '400 g'),
(21, 48, '4 linguri'),
(21, 49, '2 linguri'),
(21, 24, '2 catei'),
(21, 30, '4 linguri'),
(21, 6, 'dupa gust'),
(21, 38, 'dupa gust'),
(22, 11, '500 g'),
(22, 3, '2 buc'),
(22, 40, '200 g'),
(22, 8, 'dupa gust'),
(22, 38, 'dupa gust'),
(22, 6, 'dupa gust'),
(23, 1, '500 g'),
(23, 2, '250 ml'),
(23, 3, '2 buc'),
(23, 17, '25 g'),
(23, 4, '100 g'),
(23, 50, 'dupa gust'),
(24, 51, '2 buc'),
(24, 54, '150 g'),
(24, 52, '1 buc'),
(24, 53, '200 g'),
(24, 7, '2 linguri'),
(25, 55, '4 buc'),
(25, 56, '2 buc'),
(25, 57, '1 buc'),
(25, 12, '1 buc'),
(25, 24, '1 catel'),
(25, 30, '4 linguri'),
(25, 38, 'dupa gust'),
(25, 6, 'dupa gust'),
(26, 58, '1 buc'),
(26, 43, '1 buc'),
(26, 59, '200 g'),
(26, 47, '1 buc'),
(26, 53, '400 ml'),
(26, 60, '2-3 linguri'),
(26, 24, '2 catei'),
(26, 6, 'dupa gust'),
(27, 61, '4 buc'),
(27, 63, '1 buc'),
(27, 43, '1 buc'),
(27, 10, '100 g'),
(27, 64, '1 buc'),
(27, 13, '1 buc'),
(27, 65, '1 buc'),
(28, 66, '300 g'),
(28, 15, '1 buc'),
(28, 24, '2 catei'),
(28, 59, '200 g'),
(28, 67, '50 g'),
(28, 68, '100 ml'),
(28, 69, '1 L'),
(28, 22, '50 g'),
(28, 30, '2 linguri'),
(28, 25, 'dupa gust'),
(28, 6, 'dupa gust'),
(28, 38, 'dupa gust'),
(29, 70, '1 buc'),
(29, 71, '400 g'),
(29, 10, '150 g'),
(29, 3, '3 buc'),
(29, 21, '200 ml'),
(29, 24, '1 catel'),
(29, 6, 'dupa gust'),
(29, 38, 'dupa gust'),
(30, 1, '200 g'),
(30, 3, '3 buc'),
(30, 4, '180 g'),
(30, 8, '180 ml'),
(30, 34, '1 buc'),
(30, 72, '1 buc'),
(30, 73, '150 g'),
(30, 4, 'pentru decor');

-- --------------------------------------------------------

--
-- Table structure for table `recenzii`
--

CREATE TABLE `recenzii` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL,
  `comentariu` text NOT NULL,
  `reteta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retete`
--

CREATE TABLE `retete` (
  `id` int(11) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `instructiuni` text DEFAULT NULL,
  `imagine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retete`
--

INSERT INTO `retete` (`id`, `titlu`, `instructiuni`, `imagine`) VALUES
(1, 'Clătite', 'Combinați toate ingredientele până obțineți un aluat omogen. Coaceți pe o tigaie antiaderentă, puțin unsă cu ulei, până când fiecare parte a clătitei este aurie.', 'images/clatite.jpg'),
(2, 'Cheesecake cu ciocolată', 'Topiți ciocolata împreună cu untul. Amestecați brânza cremă cu zahărul, adăugați ouăle unul câte unul, apoi făina și ciocolata topită. Coaceți în cuptor preîncălzit la 160°C timp de aproximativ 40 de minute.', 'images/cheesecake_ciocolata.jpg'),
(3, 'Salată de castraveți cu brânză', 'Tăiați castraveții și ceapa în felii subțiri, adăugați brânza tăiată cubulețe, condimentați cu sare și adăugați uleiul. Amestecați bine.', 'images/salata_castraveti.jpg'),
(4, 'Pâine cu miere', 'Amestecați toate ingredientele și frământați până la obținerea unui aluat elastic. Lăsați să crească până își dublează volumul, apoi coaceți la 180°C timp de 30 de minute.', 'images/paine_miere.jpg'),
(5, 'Omletă cu ardei și ceapă', 'Bateți ouăle cu sare, adăugați ardeiul și ceapa tăiate. Turnați amestecul într-o tigaie cu ulei încins și gătiți până se întărește.', 'images/omleta.jpg'),
(6, 'Tort cu ciocolată și miere', 'Topiți ciocolata și untul. Amestecați ouăle cu zahărul și mierea, adăugați ciocolata topită și făina. Coaceți la 180°C timp de 35 de minute.', 'images/tort_ciocolata.jpg'),
(7, 'Pizza Margherita', 'Amestecați făina cu apa, uleiul și sarea pentru a forma aluatul. Lăsați să crească 1 oră, apoi întindeți și adăugați roșiile, mozzarella și cașcavalul. Coaceți la 220°C timp de 15-20 de minute.', 'images/pizza_margherita.jpg'),
(8, 'Biscuiți cu ciocolată', 'Amestecați ingredientele uscate, adăugați untul și ciocolata, apoi formați biscuiții. Coaceți în cuptorul preîncălzit la 180°C timp de 15 minute.', 'images/biscuiti_ciocolata.jpg'),
(9, 'Chifle', 'Încălziți laptele până devine călduț. Adăugați drojdia și zahărul și lăsați 10 minute. Adăugați făina, sarea și untura și frământați până obțineți un aluat elastic. Acoperiți și lăsați la dospit 1 oră. Formați chiflele, acoperiți și lăsați la dospit încă 30 min. Coaceți la 200C pentru 20 min.', 'images/chifle.jpg'),
(10, 'Supă cremă de legume', 'Curățați și tăiați legumele cubulețe. Călițiîn unt ceapa. Adăugați legumele și acoperițicu apă. Adăugați sare și piper după gust. Fierbeți până când legumele sunt moi. Pasați sau blendați până obțineți o cremă fină. Adăugați smântâna înainte de servire.', 'images/supa_crema.jpg'),
(11, 'Paste carbonara', 'Fierbeți pastele în apă sărată conform instrucțiunilor de pe ambalaj. Într-un bol, amestecați ouăle cu smântâna, parmezanul, sarea, piperul și usturoiul zdrobit. Adăugați șunca felii subțiri. Scurgeți pastele și adăugați-le în sosul pregătit. Amestecați rapid și serviți cu pătrunjel proaspăt.', 'images/paste_carbonara.jpg'),
(12, 'Placinte cu mere', 'Frecați untura cu făina, zahărul și sarea până obțineți o frământătură drojdie. Lăsați la rece 30 min. Curățați și tăiați merele felii subțiri. Întindeți aluatul și acoperiți cu merele și condimentele. Rulați strâns și coaceți la 180C aprox. 50 min până se rumenește frumos.', 'images/placinte_mere.jpg'),
(13, 'Salată grecească', 'Tăiați roșiile, castraveții și ceapa cubulețe. Adăugați măslinele și brânza feta sfărâmată. Stropițicu ulei de măsline și oțet balsamic. Presărați menta/pătrunjel tocat. Amestecați ușor și serviți.', 'images/salata_greceasca.jpg'),
(14, 'Pui la cuptor cu cartofi', 'Curățați și tăiați cartofii felii groase. Așterneți-i într-o tavă de copt. Presărați usturoi zdrobit, pătrunjel tocat, sare și piper. Adăugați pulpele de pui deasupra cartofilor. Stropiți tot cu ulei de măsline. Coaceți la 200C pentru aprox 1 oră, până pui și cartofi sunt aurii și fragedzi.', 'images/pui_cuptor.jpg'),
(15, 'Budincă de gris', 'Fierbeți laptele cu coaja de lămâie. Adăugați grișul și zahărul și fierbeți, amestecând, până se îngroașă. Luați de pe foc și adăugați untul și ouăle batute, amestecând rapid. Adăugați stafidele. Turnați într-o formă unsă și coaceți la 180C pentru 25 min. Serviți caldă sau rece.', 'images/budinca_gris.jpg'),
(16, 'Milkshake de căpșuni', 'Puneți toate ingredientele într-un blender și amestecați până obțineți o compoziție cremoasă. Puteți adăuga miere pentru un plus de dulceață. Serviți rece, cuo paițică și fructe proaspete.', 'images/milkshake_capsuni.jpg'),
(17, 'Chiftelute lângă piure de cartofi', 'Pentru chiftelute, amestecați carnea cu ceapa rasă, ouăle, pesmetul, sarea și piperul. Formați biluțe și frigeti în puțin ulei. Pentru piure, fierbeți cartofii curățați, zdrobiți-i și amestecați cu lapte și unt cald.', 'images/chiftelute.jpg'),
(18, 'Friptură de porc la cuptor', 'Faceți câteva găurele în pulpele de porc și introduceți usturoiul tocat și pătrunjel. Ungeți cu ulei, presărați sare și piper. Coaceți la 180C timp de 1 oră și jumătate sau până la rumenire, stropind din când în când cu zeama din tavă.', 'images/friptura_porc.jpg'),
(19, 'Vinete umplute cu carne și legume', 'Tăiați vârful vinetelor, scoateți miezul lăsând o coajă de aprox 1 cm grosime. Călițiceapa, ardeiul, roșiile și carnea. Adăugați orezul și miezul de vinete și lăsați să se răcorească puțin. Umpleți vinetele și coaceți la 180C aprox. 40 min.', 'images/vinete_umplute.jpg'),
(20, 'Prăjitură însiropată (revani)', 'Bateți ouăle cu zahărul. Adăugați smântâna, făina și bicarbonatul amestecate cu scorțișoara. Coaceți la 180C aprox. 30 min. Lăsați să se răcorească puțin, înțepați cu un băț și turnați siropul cald încet peste prăjitură până îl absoarbe tot.', 'images/prajitura_insiropata.jpg'),
(21, 'Humus', 'Pasați năutul cu restul ingredientelor, adăugând apă până obțineți o pastă cremă. Puneți într-un bol, nivelatî și decorați cu ulei de măsline, sumac și pătrunjel tocat.', 'images/hummus.jpg'),
(22, 'Rulou de cașcaval pane', 'Tăiați cașcavalul felii groase, lungi. Băteți ouăle într-un bol. Introduceți cașcavalul în ouă, apoi în pesmet, presând bine. Prăjiți în ulei încins până se rumenesc frumos pe ambele părți. Scurgeți pe hârtie absorbantă și presărați cu sare și piper.', 'images/rulou_cascaval.jpg'),
(23, 'Brioșe cu gem', 'Încălziți laptele cu untul și dizolvați drojdia și 1 lingură de zahăr. Adăugați făina, ouăle și restul de zahăr. Frământați bine și lăsați la dospit 1 oră. Formați brioselee și coaceți la 180C aprox 20 min. Răciți și umpleți cu gem sau cremă.', 'images/briose_gem.jpg'),
(24, 'Smoothie de fructe', 'Puneți toate ingredientele într-un blender și amestecați până obțineți o compoziție cremoasă și fină. Puteți adăuga miere sau sirop de arțar pentru a îndulci după gust. Se servește imediat, rece.', 'images/smoothie_fructe.jpg'),
(25, 'Somon la Cuptor cu Legume', 'Pregătește legumele curate și tăiate cubulețe.Într-o tavă de copt, amestecă legumele cu uleiul, sarea, piperul și ierburile.Așază fileurile de somon deasupra legumelor.Coace la 200°C pentru aprox. 20 de minute, până când somonul este gătit și crocant la suprafață.', 'images/somon_cuptor.jpg'),
(26, 'Curry de Legume', 'Taie legumele cubulețe.Călește usturoiul tocat în puțin ulei, apoi adaugă legumele și prăjește 2-3 minute.Toarnă iaurtul/smântâna, adaugă nautul scurs, condimentele și amestecă bine.Lasă la fiert mic, aprox. 15 minute.Servește cu orez alb sau pâine prăjită.', 'images/curry_de_legume.jpg'),
(27, 'Quesadilla Vegetariană', 'Taie ardeiul și roșia cubulețe. Curăță și taie avocado felii.Așază pe o jumătate de tortilla porumb, ardei, brânză și ierburi.Acoperă cu cealaltă jumătate de tortilla și prăjește în tigaie sau la grill până se rumenește.Servește cu avocado și câteva picături de lămâie proaspătă.', 'images/quesadilla.jpg'),
(28, 'Risotto cu Ciuperci și Trufe', 'Călește ceapa și usturoiul tăiate mărunt în ulei.Adaugă ciupercile curățate și feliate și călește 2-3 minute.Toarnă orezul și prăjește puțin, apoi adaugă vinul și amestecă până se evaporă.Adaugă câte puțin bulion cald, amestecând continuu, până orezul se înmoaie.La final, adaugă parmezan, pasta de trufe, pătrunjel și condimentează după gust.', 'images/risotto.jpg'),
(29, 'Tartă cu Spanac și Brânză', 'Întinde aluatul în forme de tartă unse.Călește spanacul tocat cu usturoiul în puțin ulei. Lasă-l să se răcească ușor.Amestecă spanacul cu brânza de capră, ouăle bătute și smântâna. Condimentează.Toarnă compoziția în forme și coace la 180°C aprox. 30 min.Servește caldă sau rece, cu salată proaspătă.', 'images/tarta_spanac.jpg'),
(30, 'Chec cu Lămâie și Vișine', 'Bate ouăle cu zahărul până se dublează în volum.Adaugă uleiul în băiță continuând să amesteci.Încorporează făina cu praful de copt și coaja de lămâie rasă.Adaugă vișinele și amestecă ușor cu o spatulă.Toarnă compoziția într-o formă unsă și coace la 180°C aprox. 40 min.Pudrează cu zahăr pudră când s-a răcit.', 'images/chec_lamaie.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingrediente_retete`
--
ALTER TABLE `ingrediente_retete`
  ADD KEY `recipe_id` (`reteta_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `recenzii`
--
ALTER TABLE `recenzii`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reteta_id` (`reteta_id`);

--
-- Indexes for table `retete`
--
ALTER TABLE `retete`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `recenzii`
--
ALTER TABLE `recenzii`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `retete`
--
ALTER TABLE `retete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingrediente_retete`
--
ALTER TABLE `ingrediente_retete`
  ADD CONSTRAINT `ingrediente_retete_ibfk_1` FOREIGN KEY (`reteta_id`) REFERENCES `retete` (`id`),
  ADD CONSTRAINT `ingrediente_retete_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingrediente` (`id`);

--
-- Constraints for table `recenzii`
--
ALTER TABLE `recenzii`
  ADD CONSTRAINT `recenzii_ibfk_1` FOREIGN KEY (`reteta_id`) REFERENCES `retete` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
