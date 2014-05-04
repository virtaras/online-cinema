-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Трв 03 2014 р., 16:15
-- Версія сервера: 5.1.73-1
-- Версія PHP: 5.2.6-1+lenny13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `caribou_ppa`
--

-- --------------------------------------------------------

--
-- Структура таблиці `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `email` varchar(200) NOT NULL,
  `passw` varchar(200) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `discount_group` bigint(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_ip` varchar(200) NOT NULL,
  `confirmstr` varchar(500) NOT NULL,
  `confirmed` int(1) NOT NULL,
  `get_news` int(1) NOT NULL,
  `r1201` varchar(500) DEFAULT NULL,
  `bonus` decimal(10,0) NOT NULL,
  `r1202` varchar(500) DEFAULT NULL,
  `r1203` varchar(500) DEFAULT NULL,
  `r1204` varchar(500) DEFAULT NULL,
  `r1205` varchar(500) DEFAULT NULL,
  `r1206` varchar(500) DEFAULT NULL,
  `r1207` varchar(500) DEFAULT NULL,
  `r1208` varchar(500) DEFAULT NULL,
  `r1209` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Дамп даних таблиці `clients`
--

INSERT INTO `clients` (`id`, `create_date`, `email`, `passw`, `discount`, `discount_group`, `last_login`, `last_ip`, `confirmstr`, `confirmed`, `get_news`, `r1201`, `bonus`, `r1202`, `r1203`, `r1204`, `r1205`, `r1206`, `r1207`, `r1208`, `r1209`) VALUES
(1, '2014-02-10 19:49:36', 'virtaras@ppa.kiev.ua', '827ccb0eea8a706c4c34a16891f84e7b', '0.00', -1, '2014-04-29 17:06:38', '46.174.162.119', 'd3d9446802a44259755d38e6d163e820', 1, 0, 'Тарас', '0', 'ППП', '+5555555555', 'Женский', 'адрес 1', 'адрес 2', 'Город родной', '999', 'Гондор'),
(9, '2014-03-14 03:27:28', 's_prokhudin@mail.ru', 'f9e4bb301f551f47f8882abbd3ba3abf', '0.00', 0, '2014-04-29 16:16:43', '138.38.250.161', '8613985ec49eb8f757ae6439e879bb2a', 1, 1, '', '0', '', '', 'Мужской', '', '', '', '', ''),
(5, '2014-03-11 14:13:47', 'test@test.com', '827ccb0eea8a706c4c34a16891f84e7b', '0.00', -1, '2014-03-11 15:08:56', '46.174.162.119', 'c0c7c76d30bd3dcaefc96f40275bdc0a', 1, 1, 'Тарас', '0', 'ППП', '+5555555555', 'Мужской', 'адрес 1', 'адрес 2', 'Город родной', '999', 'Гондурас'),
(8, '2014-03-11 19:29:07', 'pofesor@gmail.com', '384ed2f61306ae4363e6f7446a061c9b', '0.00', 0, '2014-04-02 18:33:06', '178.151.234.85', 'f033ab37c30201f73f142449d037028d', 1, 1, '', '0', '', '', 'Мужской', '', '', '', '', ''),
(10, '2014-03-19 12:02:06', 'droopy2006@rambler.ru', '827ccb0eea8a706c4c34a16891f84e7b', '0.00', 0, '2014-03-19 12:02:06', '46.174.162.119', 'f899139df5e1059396431415e770c6dd', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(11, '2014-03-19 13:41:59', 'easy-e@mail.ru', '0e2705f4105d877b44d437f8f1192555', '0.00', 0, '2014-03-19 13:41:59', '95.24.2.217', '5f93f983524def3dca464469d2cf9f3e', 0, 0, 'Павел', '0', 'Каргин', '+79602807633', 'Мужской', 'Фрунзе 16', '', '', '', ''),
(12, '2014-03-24 12:18:45', 'info@po.net.ua', '827ccb0eea8a706c4c34a16891f84e7b', '0.00', 0, '2014-03-24 12:18:45', '178.151.234.85', 'da4fb5c6e93e74d3df8527599fa62642', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(16, '2014-04-04 15:23:02', 'natasha.kurikalova@ppa.kiev.ua', 'e10adc3949ba59abbe56e057f20f883e', '0.00', -1, '2014-04-18 17:46:21', '46.174.162.119', 'b73ce398c39f506af761d2277d853a92', 1, 0, '', '150', '', '', 'Женский', '', '', '', '', ''),
(14, '2014-03-25 11:36:04', 'changer.slava@gmail.com', '4520c7b482b9d951284f008e224580b4', '0.00', 0, '2014-03-25 11:36:04', '194.44.246.242', '1385974ed5904a438616ff7bdb3f7439', 1, 1, 'Ярослав', '0', '', '380976080529', 'Мужской', 'вул. Стрийська, 106/46', '', 'Львів', '79026', 'Україна'),
(17, '2014-04-04 20:08:33', 'anton.evtihov@gmail.com', 'd8a160c3b34db48d3e8b1fb92c282f64', '0.00', 0, '2014-04-04 20:08:33', '109.254.133.120', '149e9677a5989fd342ae44213df68868', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(18, '2014-04-04 20:10:18', 'antonio4455@mail.ru', 'd8a160c3b34db48d3e8b1fb92c282f64', '0.00', 0, '2014-04-04 20:10:18', '109.254.133.120', '045117b0e0a11a242b9765e79cbf113f', 0, 1, 'Антон', '0', 'Евтихов', '+380951783882', 'Мужской', 'ул. Петровского 189 квартира 27', '', 'Артёмовск', '84500', 'Украина'),
(19, '2014-04-04 21:34:46', 'yan.kleaka@gmail.com', 'adb17145dacfa789b839c401fd9c9d62', '0.00', 0, '2014-04-04 21:34:46', '95.135.14.169', 'cfecdb276f634854f3ef915e2e980c31', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(21, '2014-04-05 16:10:49', 'dmitrydir@gmail.com', 'b7f177f4902486c7f2494034ac833ee0', '0.00', 0, '2014-04-05 16:10:49', '93.73.36.172', '6f3ef77ac0e3619e98159e9b6febf557', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(22, '2014-04-05 16:10:57', 'annapl_84@mail.ru', '5263c09d460efbca2abf9187402f014c', '0.00', 0, '2014-04-05 16:10:57', '178.151.195.105', 'ec8ce6abb3e952a85b8551ba726a1227', 0, 0, NULL, '0', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(23, '2014-04-05 16:12:16', 'denzeldin@gmail.com', 'dc18f84182ab0a8d3e37544b67f5e459', '0.00', 0, '2014-04-05 16:12:16', '93.72.114.189', '6da9003b743b65f4c0ccd295cc484e57', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(24, '2014-04-05 16:13:51', 'mgmtmax@combxcomb.com', '7a47add9a9255361db3e623d147662a0', '0.00', 0, '2014-04-05 16:13:51', '92.113.19.249', '335f5352088d7d9bf74191e006d8e24c', 0, 1, 'Максим ', '0', 'Лебедев', '050 77 52 553 ', 'Мужской', 'пр Ленина 167 кв 15 ', '', 'Запорожье', '69037', 'Украина'),
(25, '2014-04-05 16:15:27', 'protsenko.volodymyr@gmail.com', 'feaf4bb1df111ab5e436962858917efd', '0.00', 0, '2014-04-05 16:15:27', '46.30.167.102', '6c9882bbac1c7093bd25041881277658', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(26, '2014-04-05 16:17:28', 'midborn@gmail.com', '6d01da81eea43f754569e5111aef9e47', '0.00', 0, '2014-04-05 16:17:28', '81.200.81.2', 'a4f23670e1833f3fdb077ca70bbd5d66', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(27, '2014-04-05 16:20:34', 'krivolap@i.ua', '82e23b8428eac3636374ddaf5fa6c33d', '0.00', 0, '2014-04-05 16:20:34', '212.22.223.18', '39059724f73a9969845dfe4146c5660e', 0, 1, 'Dima', '0', '', '0676581209', 'Мужской', 'kiev', '', '', '', ''),
(28, '2014-04-05 16:30:49', 'serg.kule@gmail.com', '4f321695f7721619314b39a3032bfc05', '0.00', 0, '2014-04-05 16:30:49', '95.153.193.66', '92c8c96e4c37100777c7190b76d28233', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(29, '2014-04-05 16:33:06', 'rsokolovski@me.com', 'aec1c3e18cb97ab5e7c4ec4a03ead0f7', '0.00', 0, '2014-04-05 16:33:06', '109.201.249.211', 'f90f2aca5c640289d0a29417bcb63a37', 0, 1, 'Ростислав', '0', 'Соколовский', '0931261417', 'Мужской', 'Насыпная 1/11', '', 'Львов', '79000', 'Украина'),
(30, '2014-04-05 16:41:52', 'nabash2@gmail.com', 'b7b8afc1528849ae43ec0e21a57d1c0e', '0.00', 0, '2014-04-05 16:41:52', '180.183.37.82', '94f6d7e04a4d452035300f18b984988c', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(31, '2014-04-05 16:47:05', 'wuart77@gmail.com', 'de48c478ea79bb6a08d969ee3f26f9bb', '0.00', 0, '2014-04-05 16:47:05', '93.73.49.150', '06eb61b839a0cefee4967c67ccb099dc', 0, 1, 'Роман', '0', 'Скрипченко', '0977315979', 'Мужской', 'Лысенка, 3, кв. 22', '', 'Киев', '01030', 'Украина'),
(32, '2014-04-05 16:48:54', 'inboxsev@gmail.com', 'f253c394d782f1dfd8df59ec3e8bf3e9', '0.00', 0, '2014-04-05 16:48:54', '185.28.236.135', '320722549d1751cf3f247855f937b982', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(33, '2014-04-05 17:02:18', 'tolstoyalexei@gmail.com', '9cbf8a4dcb8e30682b927f352d6559a0', '0.00', 0, '2014-04-05 17:02:18', '213.111.121.137', 'fe73f687e5bc5280214e0486b273a5f9', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(34, '2014-04-05 17:30:23', 'kimiskrich@gmail.com', 'f00bbb7747929fafa9d1afd071dba78e', '0.00', 0, '2014-04-05 17:30:23', '91.197.50.114', '40008b9a5380fcacce3976bf7c08af5b', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(35, '2014-04-05 17:50:17', '4ivek@mail.ru', 'fb36bcdff2b27dc2b64f2e42cf84bdc7', '0.00', 0, '2014-04-05 17:50:17', '92.113.37.94', '9de6d14fff9806d4bcd1ef555be766cd', 1, 0, 'Никита', '0', 'Трунов', '380505405200', 'Мужской', 'Глиноцементная 27', '', 'Запорожье', '69095', 'Украина '),
(36, '2014-04-05 18:16:10', 'yuri.makarychev@gmail.com', 'f8dcadee3dddf47376ad25417330e588', '0.00', 0, '2014-04-05 18:16:10', '46.39.36.62', 'e7b24b112a44fdd9ee93bdf998c6ca0e', 0, 1, 'Юра', '0', 'Макарычев', '79267920048', 'Мужской', 'Заречная 5, корп. 2, кв. 62', '', 'Москва', '121087', 'Россия'),
(37, '2014-04-05 18:19:33', 'dimaakononenko@gmail.com', '80ff156b95801b64d85fde626a733311', '0.00', 0, '2014-04-05 18:19:33', '82.193.99.118', 'd709f38ef758b5066ef31b18039b8ce5', 0, 1, 'Дима', '0', 'Кононенко', '380938143257', 'Мужской', 'Гавро Лайоша 2', 'Гавро Лайоша 2', 'Киев', '', 'Украина'),
(38, '2014-04-05 18:29:33', 'amirovdamir@hotmail.com', '995a88874cd566808a24068dda5ee7b0', '0.00', 0, '2014-04-05 18:29:33', '31.169.8.146', 'bca82e41ee7b0833588399b1fcd177c7', 1, 1, 'Дамир', '0', 'Амиров', '87182553936', 'Мужской', 'ул.Мира 43 кв.17', '', 'Павлодар', '140002', 'Казахстан'),
(39, '2014-04-05 19:38:31', 'sasha.dyatel@gmail.com', '980ed53aacf9d481b92032b99e70b1d9', '0.00', 0, '2014-04-05 19:38:31', '213.111.82.106', 'a01a0380ca3c61428c26a231f0e49a09', 0, 1, 'Александр', '0', 'Дятел', '', 'Мужской', 'ул. Леваневского 6, кв.63 ', '', 'Киев', '03058', 'Ураина'),
(40, '2014-04-05 20:11:26', 'vverkelis@gmail.com', 'be7928d7a2ea3edc65b275afb96f3b62', '0.00', 0, '2014-04-05 20:11:26', '78.62.116.131', '18d8042386b79e2c279fd162df0205c8', 0, 1, 'vytautas', '0', 'verkelis', '+37061590291', 'Мужской', 'gedimino g. 52-9', '', 'kaunas', '44242', 'lithuania'),
(41, '2014-04-05 20:34:27', 'cheekas@gmail.com', '562e85b68ad536db17eb693c6f7a2c4d', '0.00', 0, '2014-04-05 20:34:27', '213.133.160.215', '1068c6e4c8051cfd4e9ea8072e3189e2', 0, 1, 'Kasik', '0', '', '', 'Мужской', 'ул. Зодчих, 18, к. 90', '', 'Киев', '', ''),
(42, '2014-04-05 20:46:56', 'bashkireff@yandex.ru', 'ef6e65efc188e7dffd7335b646a85a21', '0.00', 0, '2014-04-05 20:51:25', '31.28.232.75', 'b6f0479ae87d244975439c6124592772', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(43, '2014-04-05 21:10:23', 'scarabeus@i.ua', '49bcd00ad23ce21425d7ae5ec9971b50', '0.00', 0, '2014-04-05 21:10:23', '46.219.242.172', 'f74909ace68e51891440e4da0b65a70c', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(44, '2014-04-05 23:00:22', 'yuliya_plaksitskaya@ukr.net', 'fb44505ce00ce1137e3eea600dfd3e95', '0.00', 0, '2014-04-05 23:00:22', '109.207.206.10', 'a8abb4bb284b5b27aa7cb790dc20f80b', 1, 0, 'Юлия', '0', 'Плаксицкая', '+380667580588', 'Женский', 'ул. 50 лет Октября, 77', '', 'Боярка', '08150', 'Украина'),
(45, '2014-04-06 00:23:11', 'ymakcim@yandex.ru', 'd4b469b4525e1dc4c0f60bf100e38e68', '0.00', 0, '2014-04-06 00:23:11', '37.55.7.231', 'f5f8590cd58a54e94377e6ae2eded4d9', 1, 1, '', '0', '', '', 'Мужской', 'ул. Короленко, д14, кв.13', '', 'Днепропетровск', '', 'Украина'),
(46, '2014-04-06 02:10:13', 'dominikspire@mail.ru', 'd3241e536bfd452901567ba7a9ed9490', '0.00', 0, '2014-04-06 02:10:13', '5.1.7.11', '98b297950041a42470269d56260243a1', 0, 1, 'Карина', '0', 'Самойлова', '0931690440', 'Женский', 'Петра Чаадаева 2', '', 'Киев', '03148', 'Украина'),
(47, '2014-04-06 02:55:15', 'igor.stefanyuk@gmail.com', '59bc15a25cf210b4e2e89352ff3436c9', '0.00', 0, '2014-04-06 02:55:15', '95.135.194.110', '26337353b7962f533d78c762373b3318', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(48, '2014-04-06 09:21:32', 'sid_drums@mail.ru', '189cbc8366dd7b798f9697884f9e06e3', '0.00', 0, '2014-04-06 09:21:32', '94.244.184.200', '6ea2ef7311b482724a9b7b0bc0dd85c6', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(49, '2014-04-06 14:22:27', 'makdoc89@rambler.ru', 'c82f5faefd9b667047f052d865604834', '0.00', 0, '2014-04-24 14:01:23', '46.30.167.137', 'c410003ef13d451727aeff9082c29a5c', 1, 1, 'Алексей', '0', 'Макаренко', '+380634685916', 'Мужской', '', '', '', '', ''),
(50, '2014-04-06 18:30:50', 'v.lyubarskiy@gmail.com', '1686bbca5064695a38827fa9b4506c67', '0.00', 0, '2014-04-06 18:30:50', '37.53.53.143', 'cee631121c2ec9232f3a2f028ad5c89b', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(51, '2014-04-06 19:06:40', 'bodys_777@i.ua', '9346dce83b80f3a2f90cfdfdef324b68', '0.00', 0, '2014-04-06 19:06:40', '37.53.128.55', '087408522c31eeb1f982bc0eaf81d35f', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(52, '2014-04-07 00:10:31', 'tsv.69@mail.ru', '9057ff93f4fe6f2676b1de783fb7864d', '0.00', 0, '2014-04-07 00:10:31', '89.209.82.246', 'cf67355a3333e6e143439161adc2d82e', 0, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(53, '2014-04-07 01:20:52', 'kornej.loboda@gmail.com', '940089cbbb48bb8fcfd4372233b0da50', '0.00', 0, '2014-04-07 01:20:52', '37.54.29.78', 'd64a340bcb633f536d56e51874281454', 1, 0, NULL, '0', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(65, '2014-04-08 15:57:50', 'vlad.ostapchuk@gmail.com', '7e33bf809929fdd04a020df0a2022b42', '0.00', 0, '2014-04-08 15:57:50', '77.90.193.218', '884d247c6f65a96a7da4d1105d584ddd', 1, 1, 'Владислав', '150', '', '+380506813886', 'Мужской', 'Киев', '', '', '', ''),
(56, '2014-04-07 12:41:28', 'spektor.artur@me.com', '346049dd46f48cb7df21384ec6037917', '0.00', 0, '2014-04-07 12:41:28', '46.164.153.55', 'a9a6653e48976138166de32772b1bf40', 0, 0, 'Артур', '150', '', '+380930513925', 'Мужской', 'Киев, Бассейная 9', '', '', '', ''),
(57, '2014-04-07 15:36:07', 'Steeld27@gmail.com', 'a670e8f127228af822470a1de7af2af1', '0.00', 0, '2014-04-07 15:36:07', '91.209.51.122', 'a86c450b76fb8c371afead6410d55534', 0, 0, 'Дмитрий ', '150', 'Особский', '0679035569', 'Мужской', 'Харьковское шоссе 58 Б кВ 4', '', 'Киев', '', 'Украина'),
(58, '2014-04-07 16:07:06', 'ventura_92@mail.ru', '34352ddf1329c4b3b844f92e5f98e9f6', '0.00', 0, '2014-04-07 16:09:52', '94.181.188.122', '069d3bb002acd8d7dd095917f9efe4cb', 1, 1, 'Парвиз', '150', '', '89273800808', 'Мужской', '', '', '', '', ''),
(59, '2014-04-07 16:07:26', 'dimasgangobas@ukr.net', 'a670e8f127228af822470a1de7af2af1', '0.00', 0, '2014-04-07 16:07:26', '91.209.51.122', '08b255a5d42b89b0585260b6f2360bdd', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(60, '2014-04-07 16:17:20', 'savedphantom@gmail.com', '16e3392c96ab9963c37cce215ade22de', '0.00', 0, '2014-04-07 16:17:20', '217.66.158.34', 'd490d7b4576290fa60eb31b5fc917ad1', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(61, '2014-04-07 16:30:07', 'viktormanchul@mail.ru', 'c35d9669cb0b81ee9b5c7d98c1106c03', '0.00', 0, '2014-04-07 16:30:07', '77.52.102.133', '00ac8ed3b4327bdd4ebbebcb2ba10a00', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(62, '2014-04-07 16:30:51', 'viktormanchul@yandex.ru', 'c35d9669cb0b81ee9b5c7d98c1106c03', '0.00', 0, '2014-04-07 16:30:51', '77.52.102.133', 'b73dfe25b4b8714c029b37a6ad3006fa', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(63, '2014-04-08 09:16:52', 'keepmysoulawake@gmail.com', '6888b48405b1d86175380b14c7af4787', '0.00', 0, '2014-04-08 09:16:52', '95.132.43.115', '9cc138f8dc04cbf16240daa92d8d50e2', 0, 0, 'Ольга', '150', '', '+380635265663', 'Женский', 'ул. Моршинская, дом 2, кв.32', '', 'Львов', '79044', 'Украина'),
(64, '2014-04-08 15:53:24', 'star-tosha@bk.ru', 'b64303ed8732b6e89b88f6503f3186c4', '0.00', 0, '2014-04-08 15:53:24', '77.90.193.218', '4ffce04d92a4d6cb21c1494cdfcd6dc1', 0, 0, 'Viki', '150', '', '+38050', 'Женский', 'u rbtd', '', '', '', ''),
(66, '2014-04-08 17:44:53', 'nastyakulak@e-mail.ua', '3dfce61af625b639b280ab90e8678027', '0.00', 0, '2014-04-08 17:44:53', '77.120.242.149', '68264bdb65b97eeae6788aa3348e553c', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(67, '2014-04-08 22:57:51', 'KOKOKOKATTYKO@GMAIL.COM', '7868e3849d88f101b41922cf10ab2272', '0.00', 0, '2014-04-08 22:57:51', '195.182.194.111', '17c276c8e723eb46aef576537e9d56d0', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(68, '2014-04-11 23:23:16', 'vegasrabbitt@gmail.com', '399eba5927b5a0fa8617468ead06fba8', '0.00', 0, '2014-04-11 23:23:16', '213.109.91.196', 'fccb3cdc9acc14a6e70a12f74560c026', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(69, '2014-04-12 11:15:47', 'kissmysale@mail.ru', 'fb36bcdff2b27dc2b64f2e42cf84bdc7', '0.00', 0, '2014-04-12 11:15:47', '92.113.146.147', 'c06d06da9666a219db15cf575aff2824', 1, 0, '', '150', '', '', 'Мужской', 'Глиноцементная 27', 'Glinotsementnaya 27', 'Zaporozhye', '69095', 'Украина'),
(70, '2014-04-12 17:18:39', 'sergey_dylev@mail.ru', 'b827ac53397af4d52093b6c40180425b', '0.00', 0, '2014-04-12 17:18:39', '176.105.213.92', 'e5841df2166dd424a57127423d276bbe', 0, 1, 'Сергей', '150', 'Дылёв', '380967880759', 'Мужской', 'ул. Постышева дом 7 кв.3', '', 'Кривой Рог', '50006', 'Украина'),
(71, '2014-04-12 19:21:47', 'anna.syrodoi@gmail.com', 'be121740bf988b2225a313fa1f107ca1', '0.00', 0, '2014-04-12 19:21:47', '176.37.32.31', 'e70611883d2760c8bbafb4acb29e3446', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(72, '2014-04-13 21:56:56', 'Three-k@ukr.net', 'b2a24988e87161cbc8d2d5998c2298c8', '0.00', 0, '2014-04-13 21:56:56', '93.74.32.103', '5f2c22cb4a5380af7ca75622a6426917', 0, 1, 'Влад', '150', 'Новицкий', '093 599 52 03', 'Мужской', 'бул. Перова 42б', '', 'Киев', '', 'Украина'),
(73, '2014-04-14 11:37:43', 'bezverkhaya@inbox.ru', 'bdece84759396c9dd545f6b52faa5288', '0.00', 0, '2014-04-14 11:37:43', '193.108.122.234', 'd5cfead94f5350c12c322b5b664544c1', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(74, '2014-04-14 11:39:08', 'rus.dob@gmail.com', '676350b6ae073d36585ed022148c25bd', '0.00', 0, '2014-04-14 11:39:08', '193.93.78.194', 'edfbe1afcf9246bb0d40eb4d8027d90f', 1, 0, 'Руслан', '150', 'Добжинский', '', 'Мужской', '', '', '', '', ''),
(75, '2014-04-14 12:10:03', 'cdf-400@mail.ru', 'a50a5abfcb81cb774bcf7090d94612f8', '0.00', 0, '2014-04-14 12:10:03', '95.132.133.178', 'b137fdd1f79d56c7edf3365fea7520f2', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(76, '2014-04-14 12:10:13', 'masssha7@gmail.com', '0924005d582019f75e1daa195a2edc54', '0.00', 0, '2014-04-14 12:10:13', '88.81.252.114', '2ca65f58e35d9ad45bf7f3ae5cfd08f1', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(77, '2014-04-14 12:40:14', 'horoshui@gmail.com', '0a5126241c060245c0ac794d4aedefd9', '0.00', 0, '2014-04-14 12:40:14', '93.74.253.207', '4ea06fbc83cdd0a06020c35d50e1e89a', 0, 1, 'Илай', '150', 'Демьяненко', '0954855580', 'Мужской', 'улица Павла Тычины 3а кв. 53', '', 'Киев', '02152', 'Украина'),
(78, '2014-04-14 13:06:34', 'max.deranged@gmail.com', 'b4ec4e2c996fb7b2f93a09467e4fdc73', '0.00', 0, '2014-04-14 13:06:34', '92.60.188.162', 'a8e864d04c95572d1aece099af852d0a', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(79, '2014-04-14 14:55:39', 'Taras.sukharnyk@gmail.com', 'b6821854776f65ba04d5fa39c6ae8da5', '0.00', 0, '2014-04-14 14:55:39', '93.74.132.34', '2dace78f80bc92e6d7493423d729448e', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(80, '2014-04-14 15:46:06', 'dzroman@i.ua', '081ad6ea36b2b11eb421434f572426b7', '0.00', 0, '2014-04-14 15:46:06', '37.53.87.43', '7a53928fa4dd31e82c6ef826f341daec', 1, 0, '', '150', '', '', 'Мужской', '', '', '', '', ''),
(81, '2014-04-14 20:40:07', 'rostbmx@gmail.com', 'e226466f12c46378b3332a14cf3160a6', '0.00', 0, '2014-04-14 20:40:07', '109.201.249.211', 'b6edc1cd1f36e45daf6d7824d7bb2283', 0, 0, 'Ростислав', '150', 'Соколовский', '0931261417', 'Мужской', 'Насыпная 1/11', '', 'Львов', '79000', 'Украина'),
(82, '2014-04-14 20:43:37', 'cynepalisa@gmail.com', 'fe0169ae5517bf72c42a6054ee7777e1', '0.00', 0, '2014-04-14 20:43:37', '109.86.123.250', 'e2a2dcc36a08a345332c751b2f2e476c', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(83, '2014-04-14 21:09:56', 'lyubaaa@gmail.com', '0b542fac3b90d470180be3500ee55b32', '0.00', 0, '2014-04-14 21:09:56', '93.72.164.175', '8e82ab7243b7c66d768f1b8ce1c967eb', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(84, '2014-04-14 21:31:17', 'denisserd79@yahoo.com', 'd75d4d6f1691eff36e5b8bbaac7e7a07', '0.00', 0, '2014-04-14 21:31:17', '79.140.15.6', 'fa83a11a198d5a7f0bf77a1987bcd006', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(85, '2014-04-14 22:06:37', 'velikayakrasota@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0.00', 0, '2014-04-14 22:06:37', '81.95.177.38', '1efa39bcaec6f3900149160693694536', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(86, '2014-04-14 23:38:53', 'edik2501@gmail.com', '4afc7387f361f2046112be16853ed63c', '0.00', 0, '2014-04-14 23:38:53', '46.38.37.95', 'fc49306d97602c8ed1be1dfbf0835ead', 0, 0, 'Эдуард', '150', 'Ковтун', '89852599222', 'Мужской', 'Кочановский пр. 4', '', '', '', ''),
(87, '2014-04-15 02:08:08', 'nadijka13@ukr.net', 'c6b954c3e4f9bb7d71162723f9bb2ba6', '0.00', 0, '2014-04-15 02:08:08', '82.193.98.68', '22fb0cee7e1f3bde58293de743871417', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(88, '2014-04-15 10:11:01', 'vitaliy1969@list.ru', '841a4116b9b9aeb29736248591b22067', '0.00', 0, '2014-04-15 10:11:01', '81.25.229.105', '1f50893f80d6830d62765ffad7721742', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(89, '2014-04-15 10:15:28', 'nadia.beregova@ukr.net', 'e16c457f8ba0e28e9762326b289a65a6', '0.00', 0, '2014-04-15 10:15:28', '217.147.160.146', '024d7f84fff11dd7e8d9c510137a2381', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(90, '2014-04-15 14:53:53', 'victordacoff@gmail.com', '9364b3b8059c553965c3021b2506139f', '0.00', 0, '2014-04-15 14:53:53', '82.193.99.117', 'acf4b89d3d503d8252c9c4ba75ddbf6d', 0, 0, 'Віктор', '150', 'Грудаков', '0930515591', 'Мужской', 'Київ вул.лятошинського 18 а', '', 'Київ', '', ''),
(91, '2014-04-15 15:41:41', 'ptutch@meta.ua', '16d24224ca0df3bfa8b3cb129775a635', '0.00', 0, '2014-04-15 15:41:41', '93.72.213.184', 'e205ee2a5de471a70c1fd1b46033a75f', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(92, '2014-04-15 15:47:35', 'leranielera@gmail.com', 'c51cd8e64b0aeb778364765013df9ebe', '0.00', 0, '2014-04-15 15:47:35', '109.254.49.35', '6d0f846348a856321729a2f36734d1a7', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(93, '2014-04-15 17:39:17', 'tanyamfaya@yahoo.com', '8c0a55516c5bb4d7a3eec408f10dcbac', '0.00', 0, '2014-04-15 17:39:17', '93.74.75.134', '1cc3633c579a90cfdd895e64021e2163', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(94, '2014-04-15 18:36:35', 'fialkakvitka@gmail.com', '39b86f2f31be1ac869019caa396fed71', '0.00', 0, '2014-04-15 18:36:35', '95.135.56.131', '8d6dc35e506fc23349dd10ee68dabb64', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(95, '2014-04-15 20:52:27', 'agavascream@mail.ru', '6b65e1f7b5869d0f33408d323c2113d2', '0.00', 0, '2014-04-15 20:52:27', '46.211.254.130', 'a3d68b461bd9d3533ee1dd3ce4628ed4', 0, 1, 'Никита', '150', 'Северин', '+380959007454', 'Мужской', 'ул.Карла Маркса №2', '', '', '', ''),
(96, '2014-04-15 21:08:31', 'tulimova@gmail.com', '202d0b76d38a5a0da6df42d901560a9c', '0.00', 0, '2014-04-15 21:08:31', '46.203.22.220', '437d7d1d97917cd627a34a6a0fb41136', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(97, '2014-04-16 09:48:18', 'craxys@yandex.ru', '6f11033e729137ac5df2e71a8dbb500a', '0.00', 0, '2014-04-16 09:48:18', '194.85.103.249', '89fcd07f20b6785b92134bd6c1d0fa42', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(98, '2014-04-16 13:41:57', 'anton.abo@gmail.com', '1c7b65780950d2188adc5ca2f8edae77', '0.00', 0, '2014-04-16 13:41:57', '188.231.193.52', 'd79aac075930c83c2f1e369a511148fe', 1, 1, '', '150', '', '', 'Мужской', '', '', '', '', ''),
(99, '2014-04-16 20:36:49', 'andrewhuk13@gmail.com', '2678d2fbdd0bfd727eebe1d0304db2aa', '0.00', 0, '2014-04-16 20:36:49', '178.210.153.64', '4fac9ba115140ac4f1c22da82aa0bc7f', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(100, '2014-04-16 20:54:05', 'mishurovskayaolga@mail.ru', 'f27ed8f266f4d2d4ab90f617922d7723', '0.00', 0, '2014-04-16 20:54:05', '176.100.185.50', 'a9b7ba70783b617e9998dc4dd82eb3c5', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(101, '2014-04-17 00:28:27', 'stafonestaf@gmail.com', 'a930d7f32bbc76aa4b6db17e60a56c00', '0.00', 0, '2014-04-17 00:28:27', '176.105.20.62', '1e48c4420b7073bc11916c6c1de226bb', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(102, '2014-04-17 12:28:16', 'milkcat67@gmail.com', '773b664ed1919212c7f9f8190bae789a', '0.00', 0, '2014-04-17 12:28:16', '80.245.114.233', '65cc2c8205a05d7379fa3a6386f710e1', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(103, '2014-04-18 11:53:47', 'Katarina_Semenova@hotail.com', '66772f678e8979c316d8e4deceac1e2e', '0.00', 0, '2014-04-18 11:53:47', '93.72.51.92', 'e515df0d202ae52fcebb14295743063b', 0, 1, 'Екатерина', '150', '', '+380966899942', 'Женский', '', '', '', '', ''),
(104, '2014-04-18 13:12:45', 'maybesomaybeno.kiev@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0.00', 0, '2014-04-18 13:12:45', '194.187.108.242', '537d9b6c927223c796cac288cced29df', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(105, '2014-04-18 17:54:56', 'igor@stefanyuk.info', '3afff1471f3707dd109640a8d9a927c2', '0.00', 0, '2014-04-18 17:54:56', '46.211.63.104', '5055cbf43fac3f7e2336b27310f0b9ef', 0, 0, 'Игорь', '150', 'Стефанюк', '0971787430', 'Мужской', 'Старицкого 6', '', 'Чайки (Киев)', '08130', 'Украина'),
(106, '2014-04-18 20:34:38', 'pa.berezan@gmail.com', '3d6ac9f32b45de6dc3706174c9a24f02', '0.00', 0, '2014-04-18 20:34:38', '37.78.206.63', '299a23a2291e2126b91d54f3601ec162', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(107, '2014-04-18 23:50:46', 'dafna.sosnovska@gmail.com', '5a690d842935c51f26f473e025c1b97a', '0.00', 0, '2014-04-18 23:50:46', '93.73.32.247', 'dc58e3a306451c9d670adcd37004f48f', 0, 1, 'Dafna', '150', '', '0930118217', 'Женский', 'Юрия Коцюбинского 14, кв 27', '', 'Киев', '', ''),
(108, '2014-04-19 13:05:39', 'Westofgame@gmail.com', 'cc4abd3b5cb72de93f1c6f07e689df39', '0.00', 0, '2014-04-19 13:05:39', '109.108.253.181', '731c83db8d2ff01bdc000083fd3c3740', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(109, '2014-04-21 18:20:26', '1Rabbit1@bigmir.net', 'fcea920f7412b5da7be0cf42b8c93759', '0.00', 0, '2014-04-21 18:20:26', '93.74.32.103', '8b4066554730ddfaa0266346bdc1b202', 0, 1, 'Влад', '150', 'Новицкий', '093 599 52 03', 'Мужской', 'бул. Перова 42б', '', '', '', ''),
(110, '2014-04-21 19:56:30', 'mascha_my@mail.ru', '7696d30b6bce2e4be0610c06efd9d3ea', '0.00', 0, '2014-04-21 19:56:30', '213.111.192.16', '1e6e0a04d20f50967c64dac2d639a577', 0, 1, 'Юлия', '150', 'Чубко', '380953363885', 'Женский', 'Трубников 10, кв.7', 'Трубников 10, кв.7', 'Украина, Никополь (Днепропетровская область)', '53213', 'Украина'),
(111, '2014-04-22 14:18:08', 'espumizan@ukr.net', '519db90a6ef86903fbb789ed26c0c919', '0.00', 0, '2014-04-22 14:18:08', '93.74.84.238', '2cbca44843a864533ec05b321ae1f9d1', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(112, '2014-04-22 14:36:42', 'melelnick.jul@gmail.com', '7c909ca5e7691af611c70f3129052179', '0.00', 0, '2014-04-22 14:36:42', '46.164.128.106', 'c6036a69be21cb660499b75718a3ef24', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(113, '2014-04-22 18:37:55', 'ivan.volca@gmail.com', '7d336107ff9f42363043f0ea5da96f63', '0.00', 0, '2014-04-22 18:37:55', '62.216.42.245', '4a213d37242bdcad8e7300e202e7caa4', 1, 0, 'Ivan', '150', '', '0661429769', 'Мужской', 'Красноармейская', '', '', '', ''),
(114, '2014-04-22 20:14:04', 'blwnlettres@gmail.com', '88a824853c6c0e0715ce306b18a55fe5', '0.00', 0, '2014-04-22 20:14:04', '37.79.249.185', '8248a99e81e752cb9b41da3fc43fbe7f', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(115, '2014-04-22 22:09:16', 'yulyalka@ukr.net', 'c06407e0287bed85eca472290039eae9', '0.00', 0, '2014-04-22 22:09:16', '93.72.26.231', '2b38c2df6a49b97f706ec9148ce48d86', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(116, '2014-04-23 11:59:36', 's.lykhvar@gmail.com', '173f7114a54054c604f35715d8d369a3', '0.00', 0, '2014-04-23 11:59:36', '91.200.3.236', '884d79963bd8bc0ae9b13a1aa71add73', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(117, '2014-04-23 14:32:10', '4331195@gmail.com', '3efd1bdc9601a15683c370f8f6f15cb3', '0.00', 0, '2014-04-23 14:32:10', '193.93.78.205', '3eb71f6293a2a31f3569e10af6552658', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(118, '2014-04-23 14:42:08', 'kostianetskyi@gmail.com', '4bcd81a44380f7c99d472c5c50c33aba', '0.00', 0, '2014-04-23 14:42:08', '82.207.26.234', '6eb6e75fddec0218351dc5c0c8464104', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(119, '2014-04-23 16:43:30', 'antonina.ryzhuk@gmail.com', '5edf22ebc75de01296b30840881d5843', '0.00', 0, '2014-04-23 16:43:30', '37.53.79.89', '160c88652d47d0be60bfbfed25111412', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(120, '2014-04-23 17:05:44', 'vdehtyarov@gmail.com', '233e4244031c887ccf18a33e9dede35e', '0.00', 0, '2014-04-23 17:05:44', '78.111.187.87', 'fe2d010308a6b3799a3d9c728ee74244', 0, 0, 'Владимир', '150', 'Дегтярев', '+380504165457', 'Мужской', 'Гайдара 58/10, 3й этаж', '', 'Киев', '', 'Украина'),
(121, '2014-04-23 22:12:19', 'th2006@ukr.net', 'ac062477414e7f73d5ba1c5ebe47d8b6', '0.00', 0, '2014-04-23 22:12:19', '178.151.5.104', 'f7cade80b7cc92b991cf4d2806d6bd78', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(122, '2014-04-23 22:30:15', 'golub.alina@gmail.com', 'f30135834016abe361b95df78d1331f5', '0.00', 0, '2014-04-23 22:30:15', '46.150.97.74', 'b24d516bb65a5a58079f0f3526c87c57', 0, 0, 'Алина', '150', 'Голуб', '0509300031', 'Женский', 'Новая Почта г. Донецк Склад №9', '', 'Донецк', '', ''),
(123, '2014-04-24 02:45:45', 'sasha.sattarov@gmail.com', 'f4a75e19d6b2083592358e9f3d33ed83', '0.00', 0, '2014-04-24 02:45:45', '89.252.51.86', '4122cb13c7a474c1976c9706ae36521d', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(124, '2014-04-24 11:07:15', 'solovey.den@gmail.com', '4500c7a675c3a75ead2d854ddc64f63c', '0.00', 0, '2014-04-24 11:07:15', '85.114.206.174', 'a9078e8653368c9c291ae2f8b74012e7', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(125, '2014-04-24 23:02:06', 'alesapiskun@gmail.com', '064d7cca7b25d3676e9244256df720ec', '0.00', 0, '2014-04-24 23:02:06', '93.72.28.196', '81e5f81db77c596492e6f1a5a792ed53', 1, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(126, '2014-04-25 00:45:27', 'trushler@mail.ru', 'cbce932a80afe0b858a6b72320a00ccd', '0.00', 0, '2014-04-25 00:45:27', '176.100.30.243', 'f4573fc71c731d5c362f0d7860945b88', 0, 0, 'Евгений', '150', '', '063 637 65 41 ', 'Мужской', 'ул. нежинская 29б', '', 'Киев ', '', ''),
(127, '2014-04-25 16:48:38', 'eugen.georgiev@gmail.com', '4be68ff042d087eeea4cabd7e275128a', '0.00', 0, '2014-04-25 16:48:38', '89.19.113.95', 'c850371fda6892fbfd1c5a5b457e5777', 0, 1, '', '150', '', '', 'Мужской', 'пр-т. П. Григоренко, 28б, 2', '', 'Киев', '02095', 'ЮА'),
(128, '2014-04-25 16:49:51', 'upfire@ya.ru', 'a095d7022766a77c8ebc4efdd1dcf681', '0.00', 0, '2014-04-25 16:49:51', '217.27.152.26', 'da11e8cd1811acb79ccf0fd62cd58f86', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(129, '2014-04-25 19:31:53', 'provenedikt@gmail.com', 'abe97923160788203021271539d48203', '0.00', 0, '2014-04-25 19:31:53', '93.73.58.229', '70222949cc0db89ab32c9969754d4758', 0, 1, 'Алексей', '150', 'Венедиктов', '+380676217393', 'Мужской', 'БОГДАНА ХМЕЛЬНИЦКОГО 26 В/1', '', 'КИЕВ', '01032', 'УКРАИНА'),
(130, '2014-04-26 21:20:10', 'steshdarina@gmail.com', 'fe81253a569e1199309ee8a06e0874b2', '0.00', 0, '2014-04-26 21:20:10', '93.78.86.178', '6f3e29a35278d71c7f65495871231324', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(131, '2014-04-27 01:49:50', 'nguyenduyanhuk@gmail.com', 'b13571d6616d603f79904f6b43519ef5', '0.00', 0, '2014-04-27 01:49:50', '194.44.244.142', '535ab76633d94208236a2e829ea6d888', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(132, '2014-04-27 08:01:46', 'andrii.adamchuk@gmail.com', '5a690d842935c51f26f473e025c1b97a', '0.00', 0, '2014-04-27 08:01:46', '213.111.86.111', '2a50e9c2d6b89b95bcb416d6857f8b45', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(133, '2014-04-27 09:44:32', 'jura_masljanka@mail.ru', '27da04e5079dfd4c2c908c2fb0bcb0a2', '0.00', 0, '2014-04-27 09:44:32', '178.159.237.13', 'fe51510c80bfd6e5d78a164cd5b1f688', 1, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(134, '2014-04-27 16:04:26', 'chester898@ukr.net', '303247e4cf46a249b3909e1e6cf26569', '0.00', 0, '2014-04-27 16:04:26', '91.221.154.66', '4f87658ef0de194413056248a00ce009', 0, 1, 'Саша', '150', 'Черниенко', '0980200100', 'Мужской', 'г. Харьков, ул. Академика Филиппова 42', 'г. Новоукраинка , Кировоградской обл. ул. Мокряка 14', 'Харкьов', '', 'Украина'),
(135, '2014-04-27 18:04:00', 'iknovv@mail.ru', 'bd9b23306ab802765a63870b29d1239b', '0.00', 0, '2014-04-27 18:04:00', '93.73.122.255', '861dc9bd7f4e7dd3cccd534d0ae2a2e9', 0, 0, NULL, '150', NULL, NULL, 'Женский', NULL, NULL, NULL, NULL, NULL),
(136, '2014-04-28 01:53:44', 'Kosinov9018@gmail.com', '89218f66d8b2e5f7ec7ae66f10d8b61f', '0.00', 0, '2014-04-28 01:53:44', '109.254.39.35', 'fb508ef074ee78a0e58c68be06d8a2eb', 0, 0, 'Егор', '150', 'Косинов', '0500719172', 'Мужской', 'Донецк. Отделение 12', '', '', '', ''),
(137, '2014-04-28 10:06:51', 'V.zhdanov@bigmir.net', 'a813d3deda07b06e32528b74dc74a91b', '0.00', 0, '2014-04-28 10:06:51', '95.67.75.118', 'd1ee59e20ad01cedc15f5118a7626099', 0, 0, NULL, '150', NULL, NULL, 'Мужской', NULL, NULL, NULL, NULL, NULL),
(138, '2014-04-28 11:33:07', 'dikunov@i.ua', 'd32a22b6933181266a0cc69a557801a3', '0.00', 0, '2014-04-28 11:33:07', '37.46.242.82', 'ea8fcd92d59581717e06eb187f10666d', 0, 0, '', '150', '', '', 'Мужской', 'Отделение N 23 (до 30 кг): просп. Кирова, 76', '', 'Днепропетровск', '49000', 'Украина'),
(139, '2014-04-28 11:41:21', 'annapolsh@gmail.com', 'f31772412e5e60ec003f505c7e2a507d', '0.00', 0, '2014-04-28 11:41:21', '212.26.144.114', '359f38463d487e9e29bd20e24f0c050a', 0, 1, 'Anna', '150', '', '380968817079', 'Женский', 'ул. Петра Григоренка 22/20', 'ул. Петра Григоренка', 'Киев', '02081', ''),
(140, '2014-04-28 12:07:55', 'lytvynov.philipp@gmail.com', 'ceffb2ceb7973de63b699bdc79f2cdca', '0.00', 0, '2014-04-28 12:07:55', '109.251.234.102', 'f0dd4a99fba6075a9494772b58f95280', 0, 1, 'Филипп', '150', 'Литвинов', '0950942942', 'Мужской', '', '', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;