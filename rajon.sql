-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 19 2012 г., 11:42
-- Версия сервера: 5.0.51a-24+lenny5
-- Версия PHP: 5.2.6-1+lenny13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `rajon`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blogs`
--

CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint(20) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `ndate` date NOT NULL default '0000-00-00',
  `title` text NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL auto_increment,
  `parent_comment` int(11) NOT NULL default '0',
  `parentid` int(11) NOT NULL default '0',
  `source` int(11) NOT NULL default '0',
  `userid` int(11) NOT NULL default '0',
  `create_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `info` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(20) NOT NULL auto_increment,
  `parentid` bigint(20) NOT NULL default '0',
  `name` varchar(200) default NULL,
  `sdate` date NOT NULL default '0000-00-00',
  `urlname` varchar(255) default NULL,
  `create_date` date NOT NULL default '0000-00-00',
  `pagesize` int(11) NOT NULL default '0',
  `preview` text NOT NULL,
  `info` text NOT NULL,
  `showorder` int(11) NOT NULL default '1000',
  `formid` bigint(20) NOT NULL default '0',
  `showtype` int(11) NOT NULL default '0',
  `script` bigint(20) NOT NULL default '0',
  `price` varchar(200) NOT NULL default '0.00',
  `title` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `keywords` varchar(255) default NULL,
  `siteuser` int(11) NOT NULL default '0',
  `ispublish` int(11) NOT NULL default '1',
  `url` varchar(500) NOT NULL,
  `hide_content` int(11) NOT NULL default '0',
  `in_index` int(11) NOT NULL,
  `additional` text NOT NULL,
  `is_map` int(11) NOT NULL,
  `top_menu` int(11) NOT NULL,
  `bottom_menu` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154 ;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`id`, `parentid`, `name`, `sdate`, `urlname`, `create_date`, `pagesize`, `preview`, `info`, `showorder`, `formid`, `showtype`, `script`, `price`, `title`, `description`, `keywords`, `siteuser`, `ispublish`, `url`, `hide_content`, `in_index`, `additional`, `is_map`, `top_menu`, `bottom_menu`) VALUES
(1, 0, 'РайON', '2011-10-04', 'index', '2012-12-17', 0, '', '&lt;div class=&quot;main-promos&quot;&gt;\r\n	&lt;div class=&quot;item-col&quot;&gt;\r\n		&lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo1.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;конкурс!&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;соверши любую покупку на 300 грн&lt;br /&gt;\r\n		&lt;b&gt;и выиграй автомобиль!&lt;/b&gt;&lt;/span&gt; &lt;/span&gt; &lt;/a&gt; &lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo2.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;intertop&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;&lt;b&gt;1 + 1 = 3&lt;/b&gt;&lt;br /&gt;\r\n		третья пара обуви - в подарок!&lt;/span&gt; &lt;/span&gt; &lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;item-col&quot;&gt;\r\n		&lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo3.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;zara&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;&lt;b&gt;Финальная&lt;/b&gt;&lt;br /&gt;\r\n		распродажа&lt;/span&gt; &lt;/span&gt; &lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;item-col&quot;&gt;\r\n		&lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo4.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;конкурс!&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;соверши любую покупку на 300 грн&lt;br /&gt;\r\n		&lt;b&gt;и выиграй автомобиль!&lt;/b&gt;&lt;/span&gt; &lt;/span&gt; &lt;/a&gt; &lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo2.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;intertop&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;&lt;b&gt;1 + 1 = 3&lt;/b&gt;&lt;br /&gt;\r\n		третья пара обуви - в подарок!&lt;/span&gt; &lt;/span&gt; &lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;item-col&quot;&gt;\r\n		&lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo3.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;zara&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;&lt;b&gt;Финальная&lt;/b&gt;&lt;br /&gt;\r\n		распродажа&lt;/span&gt; &lt;/span&gt; &lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;item-col&quot;&gt;\r\n		&lt;a class=&quot;item&quot; href=&quot;#&quot;&gt; &lt;img alt=&quot;&quot; src=&quot;/userfiles/images/mainpromo3.jpg&quot; /&gt; &lt;span class=&quot;item-caption&quot;&gt; &lt;span class=&quot;title&quot;&gt;zara&lt;/span&gt; &lt;span class=&quot;text&quot;&gt;&lt;b&gt;Финальная&lt;/b&gt;&lt;br /&gt;\r\n		распродажа&lt;/span&gt; &lt;/span&gt; &lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, 11, '0.00', '', '', '', 0, 1, 'index', 1, 0, '', 0, 0, 0),
(2, 0, '404', '2012-11-29', '404', '2012-12-17', 0, '', '&lt;div class=&quot;mainblock&quot;&gt;\r\n&lt;p&gt;\r\n	Страница не найдена. Перейдите на &lt;a href=&quot;/&quot;&gt;главнцю страницу&lt;/a&gt;&lt;/p&gt;&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 0, '404', 0, 0, '', 0, 0, 0),
(33, 0, 'Магазины', '2012-11-29', 'magaziny', '2012-12-17', 0, '', '', 4, -1, -1, 17, '0.00', '', '', '', 0, 1, 'magaziny', 0, 0, '', 1, 1, 0),
(34, 0, 'Схема', '2012-11-29', 'shema', '2012-12-17', 0, '', '', 7, -1, -1, 22, '0.00', '', '', '', 0, 1, 'shema', 0, 0, '', 1, 1, 0),
(35, 0, 'Рестораны', '2012-11-29', 'restorany', '2012-12-19', 0, '', '', 5, -1, -1, 14, '0.00', '', '', '', 0, 1, 'restorany', 0, 0, '', 1, 1, 0),
(36, 0, 'Партнерам', '2012-11-29', 'partneram', '2012-12-17', 0, '', '', 8, -1, -1, 16, '0.00', '', '', '', 0, 1, 'partneram', 0, 0, '', 1, 1, 0),
(37, 0, 'Новости', '2012-11-29', 'novosti', '2012-12-17', 0, '', '', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'novosti', 0, 0, '', 1, 1, 0),
(38, 0, 'Галерея', '2012-11-29', 'galereja', '2012-12-17', 0, '', '', 10, -1, -1, 15, '0.00', '', '', '', 0, 1, 'galereja', 0, 0, '', 1, 1, 0),
(39, 0, 'Online-Конкурсы', '2012-11-29', 'online-konkursy', '2012-12-17', 0, '', '', 11, -1, -1, -1, '0.00', '', '', '', 0, 1, 'online-konkursy', 0, 0, '', 1, 0, 0),
(41, 35, 'Сушия', '2012-11-29', 'sushija', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;a alt=&quot;&quot; class=&quot;fancybox&quot; href=&quot;/userfiles/images/t_rest1.jpg&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/userfiles/images/t_rest1.jpg&quot; /&gt;&lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&lt;span class=&quot;ititle&quot;&gt;Время работы:&lt;/span&gt;&lt;span class=&quot;ivalue&quot;&gt;Пн-Пт: 10:00-23:00 &lt;br /&gt;\r\n		Cб-Bс: 11:00-23:00&lt;/span&gt; &lt;span class=&quot;ititle&quot;&gt;Веб-сайт:&lt;/span&gt;&lt;span class=&quot;ivalue&quot;&gt;&lt;a href=&quot;#&quot;&gt;www.sushiya.ua&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		ОНекоторые приходят сюда, чтобы побыть наедине со своими мыслями. Некоторые &amp;ndash; чтобы пообщаться с друзьями, отдохнуть в приятной атмосфере, послушать особенную музыку. Есть множество причин, чтобы посетить СушиЯ. Но в любом случае каждый приходит в наш ресторан, чтобы попробовать самые вкусные суши и роллы, а также другие прекрасные блюда современной японской кухни.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		СушиЯ &amp;ndash; это особенное место, но прежде всего &amp;ndash; это место для ТебЯ.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, 14, '0.00', '', '', '', 0, 1, 'restorany/sushija', 1, 0, '', 1, 0, 1),
(144, 35, 'Пивная дума', '2012-12-12', 'pivnaja-duma', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;263&quot; src=&quot;/userfiles/images/logo_pivna-duma1.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Рестораны &amp;quot;Пивная Дума&amp;quot; - территория живого пива. У ресторанов &amp;laquo;Пивная Дума&amp;raquo; есть собственная пивоварня. В наличии всегда живое - светлое, пшеничное и темное пиво. Здесь варят классические сорта пива по авторской рецептуре под руководством уважаемого, а главное, знающего пивовара Сергея Гойко.&lt;br /&gt;\r\n		На особые праздники технологи пивоварни варят отменные сорта по бельгийским, немецким рецептурам - янтарное, мюнхенское, ирландский стаут, октябрьское, рождественское, амбер эль, золотой бельгийский эль!&lt;br /&gt;\r\n		Это идеальное место не только для пивных гурманов, но и для любителей вкусно поесть.&lt;br /&gt;\r\n		Ресторан &amp;quot;Пивная Дума&amp;quot; можно назвать уникальным для Киева проектом, сочетающим в себе одновременно и классические тенденции традиционных европейских пивоварен, отличную кухню, демократичную атмосферу, и европейское качество обслуживания.&lt;br /&gt;\r\n		Кухня ресторанов &amp;ndash; это соединение творческого начала талантливого шеф-повара с лучшими мировыми кулинарными традициями. Европейское меню, оригинальные закуски к пиву, приготовленные здесь же &amp;ndash; Гриссини &amp;ndash; хлебные палочки, мойва собственного копчения, по немецкой рецептуре домашние колбаски из лучших сортов мяса.&lt;br /&gt;\r\n		Ресторан &amp;quot;Пивная Дума&amp;quot; предлагает не только пиво, собственного приготовления, а и вкуснейший хлеб из собственной пекарни. Специально для гостей пекут чиабатту, злаковый или солодовый хлеб. А теперь ресторан Пивная Дума есть и на Троещине, адрес ул. Н. Лаврухина 4. тел. 044 384 01 38. Как и в каждом ресторане этой сети здесь есть свои особенности: это открытая кухня и огромная парковка при ТРЦ. Кол-во посадочных мест в ресторане - 120 человек, так же есть зал для курящих и некурящих. Здесь вас ждут: Пн-чт с 11.00-23.00, Пт-Вс с 11.00-00.00&lt;br /&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, 14, '0.00', '', '', '', 0, 1, 'restorany/pivnaja-duma', 1, 0, '', 1, 0, 1),
(51, 36, 'Арендаторам', '2012-11-30', 'arendatoram', '2012-12-14', 0, '', '&lt;h2&gt;\r\n	Уважаемые господа!&lt;/h2&gt;\r\n&lt;p&gt;\r\n	Торгово-развлекательный центр &amp;laquo;РайОN&amp;raquo; предлагает торговые площади в аренду и размещение рекламы на медиа-носителях в торгово-развлекательном центре.&lt;/p&gt;\r\n&lt;h2&gt;\r\n	Преимущества ТРЦ &amp;laquo;РайОN&amp;raquo;&lt;/h2&gt;\r\n&lt;ol&gt;\r\n	&lt;li&gt;\r\n		Единственный торговый центр на Троещине европейского уровня.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Бесплатная двухуровневая парковка для посетителей торгового центра.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Правильно подобраны арендаторы (хороший микс брендов и ресторанов).&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Хорошее месторасположение, население &amp;ndash; более 500 тыс. человек.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Отсутствие конкурентов.&lt;/li&gt;\r\n&lt;/ol&gt;\r\n&lt;h2&gt;\r\n	Наши арендаторы:&lt;/h2&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Первый продуктовый гипермаркет &amp;laquo;СИЛЬПО&amp;raquo; в новом формате, реализующий политику низких цен при большом ассортименте и высоком качестве продуктов и товаров для дома. &amp;laquo;Власний рахунок&amp;raquo; - одна из наиболее эффективных и привлекательных систем лояльности.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Гипермаркет электроники &amp;laquo;Comfy&amp;raquo;&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Гипермаркет спортивной одежды и товаров для спорта &amp;laquo;Спортмастер&amp;raquo;&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Более 100 магазинов, представляющих лучшие бренды Украины и Европы.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Рестораны, кафе и пивоварня.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Двухуровневый паркинг на 860 мест.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		&amp;nbsp;Количество посетителей &amp;mdash; более 14 тысяч в будние дни, более 20 тысяч в выходные и праздничные дни.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 1, -1, -1, 16, '0.00', '', '', '', 0, 1, 'partneram/arendatoram', 1, 0, '', 1, 0, 0),
(52, 36, 'Рекламное предложение', '2012-11-30', 'reklamnoe-predlozhenie', '2012-12-18', 0, '', '&lt;h2&gt;\r\n	Почему Вам нужна реклама на фасаде:&lt;/h2&gt;\r\n&lt;p&gt;\r\n	1. Ваши потенциальные покупатели могут еще не знать, что Ваш товар можно приобрести именно здесь&lt;br /&gt;\r\n	2. Большой поток потенциальных покупателей возле торгового центра&lt;br /&gt;\r\n	3. Торговый центр стал местом шоппинга и отдыха для жителей окрестных&lt;br /&gt;\r\n	районов и всего Левого Берега столицы.&lt;br /&gt;\r\n	4. Вы еще раз напомните о себе своим клиентам&lt;br /&gt;\r\n	5. Рекламные площади на фасаде ограничены и там представлен именно Ваш бренд&lt;/p&gt;\r\n&lt;div&gt;\r\n	Подробнее о размещении на фасаде торгово-развлекательного центра &amp;quot;РайON&amp;quot; Вы можете узнать в нашем &lt;a href=&quot;/userfiles/files/Rayon_facade.pdf&quot; target=&quot;_blank&quot;&gt;коммерческом предложении &lt;/a&gt;&lt;/div&gt;\r\n', 2, -1, -1, 16, '0.00', '', '', '', 0, 1, 'partneram/reklamnoe-predlozhenie', 1, 0, '', 1, 0, 0),
(147, 38, 'Праздник «День Бешкетника»', '2012-12-13', 'prazdnik-den-beshketnika-', '2012-12-14', 0, '', '', 1, -1, -1, 15, '0.00', '', '', '', 0, 1, 'galereja/prazdnik-den-beshketnika-', 0, 0, '', 1, 0, 0),
(149, 37, 'Подарки – дело техники! Поможем выбрать лучшее!', '2012-12-13', 'podarki-–-delo-tehniki-pomozhem-vybrat-luchshee-', '2012-12-14', 0, '', '&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;\r\n	&lt;i&gt;&lt;span style=&quot;font-family:&quot;&gt;Предложение действует с 10 декабря 2012 г. до 16 января 2013 г.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/i&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;\r\n	&lt;i&gt;&lt;span style=&quot;font-family:&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/i&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;При выборе подарка родным, друзьям или коллегам часто возникает вопрос &amp;ndash; что дарить? Иногда не под силу угадать желание даже близкого человека, а так хочется, чтобы подарок был оригинальным, нужным и незабываемым&amp;hellip;.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;\r\n	&lt;span style=&quot;font-family:&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;Для того чтобы этот выбор стал для вас наиприятнейшим, мы приготовили множество идей новогодних подарков! Мировые бренды цифровой техники, купленные &lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif;&quot;&gt;в магазинах сети MOYO, - безусловно, понравятся каждому!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;strong&gt;&lt;span style=&quot;font-family:&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family: Arial, sans-serif; text-align: center;&quot;&gt;Предлагаем вашему вниманию наши лучшие предложения!&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;strong&gt;Новинки&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; height=&quot;839&quot; src=&quot;/userfiles/images/Новинки.jpg&quot; width=&quot;577&quot; /&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;strong&gt;Хиты продаж&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; height=&quot;839&quot; src=&quot;/userfiles/images/Хіт продаж (1).jpg&quot; width=&quot;577&quot; /&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; height=&quot;839&quot; src=&quot;/userfiles/images/Хіт продаж (2).jpg&quot; width=&quot;582&quot; /&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;strong&gt;На подарунок&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&lt;img alt=&quot;&quot; height=&quot;643&quot; src=&quot;/userfiles/images/На подарунок.jpg&quot; width=&quot;577&quot; /&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align: center;&quot;&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p align=&quot;center&quot; class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span style=&quot;font-family:&quot;&gt;Узнайте больше у наших консультантов! Ждем вас во всех магазинах сети&lt;/span&gt;&lt;span style=&quot;font-family:\r\n&quot;&gt; &lt;/span&gt;&lt;span lang=&quot;EN-US&quot; style=&quot;font-family:&quot;&gt;MOYO&lt;/span&gt;&lt;span style=&quot;font-family:&quot;&gt;!&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;\r\n	&lt;span lang=&quot;EN-US&quot; style=&quot;font-family:&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:justify&quot;&gt;\r\n	&lt;span style=&quot;font-size:10.0pt;\r\nfont-family:&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: black; font-family: Arial, sans-serif; font-size: 10pt;&quot;&gt;Предложение действует с 10 декабря 2012 г. до 16 января 2013 (включительно) во всех магазинах сети MOYO. Цены указаны в гривнах. Количество товара по данному предложению ограничено. Цены и условия предложения могут быть изменены в течение действия предложения. Под &amp;laquo;скидка 25% на все беспроводные мышки Logitech&amp;raquo;, &amp;laquo;-25%&amp;raquo; подразумевается снижение цены на 25% от цены, которая была действительной в магазинах MOYO до начала действия предложения. Под &amp;laquo;рассрочка до 24 платежей на все DUOS смартфоны&amp;raquo;, &amp;laquo;0%&amp;raquo; подразумевается потребительское кредитование по ставке 0,01% годовых, которое предоставляется ПАО &amp;laquo;Альфа-Банк&amp;raquo;, лицензия НБУ № 61 от 05.10.2011 г. Перечень товаров, на которые распространяются кредитные предложения и условия приобретения товара в кредит спрашивайте у специалиста по кредитованию (в магазине MOYO). Указанный платеж является округленным и приблизительным и не учитывает обязательную минимальную процентную ставку 0,01%. Изображение товара может отличаться от товара представленного в сети &amp;laquo;MOYO&amp;raquo;. Под &amp;laquo;от 349 гривен&amp;raquo; подразумевается стоимость исключительно модема Интертелеком CDMA-модем Huawei EC156 CK EC306 и CK без стоимости телекоммуникационных услуг. Под &amp;laquo;сумка в подарок&amp;raquo; подразумевается сумка, которая идет в комплекте с фотокамерой Nikon Coolpix S01 или фотокамерой DSLR Nikon D3200 18-55 VR KIT, ноутбука НР 655 (С1M22ES) в случае приобретения соответствующих товаров. Подробные условия в магазинах сети MOYO, на сайте www.moyo.ua, по телефону горячей линии 0 800 507 800 (звонки со стационарных телефонов в пределах Украины бесплатные).&amp;nbsp;&lt;/span&gt;&lt;/p&gt;\r\n', 3, -1, 7, -1, '0.00', '', '', '', 0, 1, 'novosti/podarki-–-delo-tehniki-pomozhem-vybrat-luchshee-', 0, 1, '', 1, 0, 0),
(148, 37, 'Скидки в магазине «Монарх»!', '2012-12-13', 'skidki-v-magazine-monarh-', '2012-12-14', 0, '', '&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	В магазине &amp;laquo;Монарх&amp;raquo; скидки на обувь до 50%!&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	Акция действует с 04.12 по 31.12.2012 г.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	Детальные условия акции спрашивайте у продавцов в магазине &amp;laquo;Монарх&amp;raquo;.&lt;span lang=&quot;UK&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	&lt;span lang=&quot;UK&quot;&gt;Воспользуйтесь возможность и порадуйте себя покупкой!&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot;&gt;\r\n	Приятных покупок!&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;\r\n', 1, -1, 7, -1, '0.00', '', '', '', 0, 1, 'novosti/skidki-v-magazine-monarh-', 0, 1, '', 1, 0, 0),
(57, 33, 'Активный отдых и спорт', '2012-11-30', 'aktivnyi-otdyh-i-sport', '2012-12-18', 0, '', '', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aktivnyi-otdyh-i-sport', 0, 0, '', 1, 0, 0),
(56, 33, 'Аксессуары', '2012-11-30', 'aksessuary', '2012-12-18', 0, '', '', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary', 0, 0, '', 1, 0, 0),
(58, 33, 'Белье', '2012-11-30', 'bele', '2012-12-18', 0, '', '', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/bele', 0, 0, '', 1, 0, 0),
(59, 33, 'Обувь и сумки', '2012-11-30', 'obuv-i-sumki', '2012-12-18', 0, '', '', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki', 0, 0, '', 1, 0, 0),
(60, 33, 'Одежда', '2012-11-30', 'odezhda', '2012-12-18', 0, '', '', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda', 0, 0, '', 1, 0, 0),
(61, 33, 'Парфюмерия и косметика', '2012-11-30', 'parfyumerija', '2012-12-18', 0, '', '', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija', 0, 0, '', 1, 0, 0),
(62, 33, 'Продукты питания', '2012-11-30', 'produkty-pitanija', '2012-12-18', 0, '', '', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/produkty-pitanija', 0, 0, '', 1, 0, 0),
(63, 33, 'Товары для детей и будущих мам', '2012-11-30', 'tovary-dlja-detei-i-budushih-mam', '2012-12-18', 0, '', '', 8, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-detei-i-budushih-mam', 0, 0, '', 1, 0, 0),
(64, 33, 'Товары для дома', '2012-11-30', 'tovary-dlja-doma', '2012-12-18', 0, '', '', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-doma', 0, 0, '', 1, 0, 0),
(65, 33, 'Электроника и телефония', '2012-11-30', 'yelektronika', '2012-12-18', 0, '', '', 10, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika', 0, 0, '', 1, 0, 0),
(66, 33, 'Услуги и подарки', '2012-11-30', 'uslugi-i-podarki', '2012-12-18', 0, '', '', 11, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki', 0, 0, '', 1, 0, 0),
(67, 58, 'Atlantic', '2012-11-30', 'atlantic', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;a alt=&quot;&quot; class=&quot;fancybox&quot; href=&quot;/images/t_rest1.jpg&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;48&quot; src=&quot;/userfiles/images/image.jpg&quot; width=&quot;222&quot; /&gt;&lt;/a&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&lt;span class=&quot;ititle&quot;&gt;Время работы:&lt;/span&gt;&lt;span class=&quot;ivalue&quot;&gt;Пн-Пт: 10:00-23:00 &lt;br /&gt;\r\n		Cб-Bс: 11:00-23:00&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Уже несколько сезонов фирма Atlantic направлена в сторону чувственной женственности, становясь брендом современных и уверенных в себе женщин, которые не поддаются внешнему влиянию и не склонны оправдывать ожидания других. Подобным образом в мужской коллекции мир бренда принадлежит активным, уверенным в себе, независимым мужчинам.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/bele/atlantic', 0, 0, '', 1, 0, 0),
(77, 59, 'Julia Сумки та аксесуари', '2012-12-06', 'julia-sumki-ta-aksesuari', '2012-12-06', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;162&quot; src=&quot;/userfiles/images/Julia.jpg&quot; width=&quot;256&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Время работы:&amp;nbsp;10:00 &amp;ndash; 22:00&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Сеть магазинов женской кожгалантереи , аксессуаров, обуви и одежды&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Чего хочет женщина?.. Думаю, никто не будет спорить, что каждая из нас хочет быть единственной и неповторимой, самой обаятельной и привлекательной! Мы стремимся удивлять: легко создаем образ и легко прощаемся с ним!&lt;br /&gt;\r\n		Что же такое - наш образ? - Макияж, прическа, одежда, обувь и &amp;hellip;АКСЕССУАРЫ! Да... именно эти детали создают акценты: эффектно дополняют шикарный наряд и преображают самое невыразительное платье!&lt;br /&gt;\r\n		А такой аксессуар, как женская сумочка, является не только эстетическим элементом нашего образа, но и жизненно важным! В любой ситуации она хранит наши самые необходимые и любимые мелочи и может многое рассказать о своей хозяйке! Она задаст настроение любому образу: поможет быть яркой в ночном клубе, элегантной в ресторане, деловой на работе!&lt;br /&gt;\r\n		Искусство расставлять акценты &amp;ndash; залог успешного образа!&lt;br /&gt;\r\n		Зачастую сделать правильный выбор не так-то просто: потерялись в веренице модных показов, ассортимент многих бутиков не блещет, хотите найти интересный товар по интересной цене, необходимо мнение со стороны либо же просто помощь профессионала. Сэкономить Ваше время, силы и деньги помогут в Сети магазинов &amp;ldquo;Julia Сумки та аксесуари&amp;ldquo;.&lt;br /&gt;\r\n		Сеть магазинов &amp;ldquo;Julia Сумки та аксесуари &amp;ldquo; - это всегда большой ассортимент, еженедельное обновление товара, профессиональная помощь продавца-консультанта, гуманные цены и постоянно действующая система скидок. Пользуясь дисконтной картой сети, Вы сможете получить скидку на любой товар! К тому же дисконтная карта не персонифицирована, а это значит, что ее можно передавать Вашим близким и знакомым.&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/julia-sumki-ta-aksesuari', 0, 0, '', 1, 0, 0),
(69, 0, 'О НАС', '2012-12-05', 'o-nas', '2012-12-17', 0, '', '&lt;div class=&quot;company-about&quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;span class=&quot;icon icon-clock&quot;&gt;График работы: 10:00-22:00, сильпо 8:30-22:00&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;span class=&quot;icon icon-loc&quot;&gt;Расположение: Киев, улица Лаврухина, 4&lt;/span&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;hr /&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Торгово-развлекательный центр РайON является новым и уникальным местом комфортного шопинга и отдыха для всей семьи, расположен в сердце самого населенного микро-района столицы &amp;ndash; Троещина. &amp;laquo;РайON&amp;raquo; предлагает своим посетителям подборку бутиков мировых брендов с широким ассортиментом товаров и оптимальными ценовыми предложениями. На двух этажах торгово-развлекательного центра представлены огромный супермаркет Сильпо, магазин Спортмастер, гипермаркет электроники COMFY, магазин электроники MOYO, магазин парфюмерии и косметики Л&amp;rsquo;Этуаль, хорошо известные бренды Reserved, Kira Plastinina, House, Mohito, Cropp Town, Colins, Ostin, Gloria Jeans, In City, Jennyfer, Город, магазины обуви Respect, Centro, Chester, Plato, Monarch, KARI, одежда и товары для детей &amp;ndash; Детский Мир, Mothercare, Ostin Kids, ювелирный магазин Золотой Век. Помимо увлекательного шопинга, посетители могут отдохнуть и приятно провести время в уютных кафе и ресторанах Сушия, L&amp;#39;Kafa, Pizza Aroma, Пивная дума, Hot Caf&amp;eacute;. На первом этаже в прикассовой зоне супермаркета Сильпо расположились магазины связи, химчистка, аптека, зоотовары, тур. оператор, магазин оптики, ателье и многие другие услуги. В &amp;laquo;РайON&amp;raquo; легко добраться как общественным транспортом, так и на своем авто. Удобный крытый паркинг рассчитан на 850 мест. Благодаря широкому выбору, комфортным условиям семейного шопинга и отдыха, а также различным акциям, мероприятиям и развлекательным программам для детей, которые регулярно проходят в торгово-развлекательном центре, &amp;laquo;РайON&amp;raquo; быстро становится любимым местом жителей Левого берега столицы, ведь в нем можно не только сделать покупки, но и просто отдохнуть и провести время с семьей и друзьями.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, 18, '0.00', '', '', '', 0, 1, 'o-nas', 1, 0, '', 1, 1, 0),
(70, 0, 'Обратная связь', '2012-12-05', 'obratnaja-svjaz', '2012-12-17', 0, '', '', 12, -1, -1, 19, '0.00', '', '', '', 0, 1, 'obratnaja-svjaz', 0, 0, '', 1, 0, 0),
(71, 0, 'Карта проезда', '2012-12-05', 'karta-proezda', '2012-12-17', 0, '&lt;iframe width=&quot;100%&quot; height=&quot;425&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot; marginheight=&quot;0&quot; marginwidth=&quot;0&quot;\r\n                            src=&quot;https://maps.google.com/maps?f=q&amp;amp;source=s_q&amp;amp;hl=en&amp;amp;geocode=&amp;amp;q=%D0%B2%D1%83%D0%BB%D0%B8%D1%86%D1%8F+%D0%9C%D0%B8%D0%BA%D0%BE%D0%BB%D0%B8+%D0%9B%D0%B0%D0%B2%D1%80%D1%83%D1%85%D1%96%D0%BD%D0%B0,+%D0%9A%D0%B8%D1%97%D0%B2,+%D0%BC%D1%96%D1%81%D1%82%D0%BE+%D0%9A%D0%B8%D1%97%D0%B2,+%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D0%B0+4&amp;amp;aq=&amp;amp;sll=50.516896,30.598659&amp;amp;sspn=0.008118,0.01929&amp;amp;ie=UTF8&amp;amp;hq=&amp;amp;hnear=ulitsa+Nikolaya+Lavrukhina,+4,+Kiyev,+gorod+Kiyev,+Ukraine&amp;amp;ll=50.516892,30.598662&amp;amp;spn=0.008118,0.01929&amp;amp;t=m&amp;amp;z=14&amp;amp;output=embed&quot;&gt;&lt;/iframe&gt;', '&lt;p&gt;\r\n	Добраться к торгово-развлекательному центру &amp;laquo;РайON&amp;raquo; можно:&lt;/p&gt;\r\n&lt;div class=&quot;icon-barr&quot;&gt;\r\n	Маршрутки:&lt;br /&gt;\r\n	№ 191 метро &amp;laquo;Лесная&amp;raquo; - ул. Милославская, &lt;br /&gt;\r\n	№ 504 метро &amp;laquo;Дарница&amp;raquo; - ул. Милославская,&lt;br /&gt;\r\n	№ 150 Индустриальный мост &amp;ndash; ул. Милославская&lt;br /&gt;\r\n	№ 573 пр. Космонавта Комарова &amp;ndash; ул. Будищанская&lt;br /&gt;\r\n	528 (28) метро &amp;laquo;Черниговская&amp;raquo; - ул. Лесковская&lt;/div&gt;\r\n&lt;div class=&quot;icon-barr&quot;&gt;\r\n	Автобусы: &lt;br /&gt;\r\n	№ 61 ж/д остановка &amp;laquo;Троещина&amp;raquo; - ул. Милославская&lt;br /&gt;\r\n	№ 73 метро &amp;laquo;Оболонь&amp;raquo; - ул. Милославская&lt;br /&gt;\r\n	№ 6 Ленинградская площадь &amp;ndash; ул.Карла Маркса&lt;/div&gt;', 13, -1, -1, 20, '0.00', '', '', '', 0, 1, 'karta-proezda', 1, 0, '', 1, 0, 0),
(72, 0, 'Контакты', '2012-12-05', 'kontakty', '2012-12-17', 0, '', '&lt;div class=&quot;col&quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;span class=&quot;icon icon-loc&quot;&gt;Киев, улица Николая Лаврухина, 4&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;span class=&quot;icon icon-clock&quot;&gt;10:00 &amp;ndash; 22:00&lt;br /&gt;\r\n		Сильпо 8:30 &amp;ndash; 22:00&lt;/span&gt;&lt;/div&gt;\r\n	&lt;div&gt;\r\n		&lt;span class=&quot;icon icon-phone&quot;&gt;(044) 371-15-15&lt;/span&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n', 14, -1, -1, 21, '0.00', '', '', '', 0, 1, 'kontakty', 1, 0, '', 1, 0, 0),
(143, 35, 'L&#039;Kaffa', '2012-12-12', 'l-kaffa', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(31).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, 14, '0.00', '', '', '', 0, 1, 'restorany/l-kaffa', 1, 0, '', 1, 0, 1),
(92, 59, 'anyBag', '2012-12-12', 'anybag', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(1).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/anybag', 0, 0, '', 1, 0, 0),
(74, 66, '5àSec, Хімчистка', '2012-12-06', '5asec-himchistka', '2012-12-06', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;53&quot; src=&quot;/userfiles/images/LOG5ASEC.jpg&quot; width=&quot;150&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Часи роботи: з 10.00-22.00, без вихідних&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;5&amp;agrave;Sec, світовий лідер пральних послуг &lt;/strong&gt;&lt;br /&gt;\r\n		Мережа хімчисток &amp;laquo;5&amp;agrave;Sec&amp;raquo; існує вже понад 40 років, метою якої з початку існування було надання послуг на найвищому рівні і завжди за прийнятною ціною. Мережа хімчисток &amp;laquo;5&amp;agrave;Sec&amp;raquo; присутня сьогодні в 30 країнах світу, кожні три дні відкриває нову хімчистку. Розташування на великий території сприяє впровадженню сучасних технологій відразу, як тільки вони з&amp;#39;являються на ринку. Завдяки постійному співробітництву з провідними виробниками тканин, ми вживаємо миючі засоби, які не нищать сучасних тканин. Ми дбаємо про охорону навколишнього середовища, що є важливим елементом наших дій. &lt;br /&gt;\r\n		&lt;strong&gt;5&amp;agrave;Sec на Україні &lt;/strong&gt;&lt;br /&gt;\r\n		Мережа хімчисток 5&amp;agrave;Sec розпочала надавати послуги на території України на початку 2009 року і за цей час вже відкрила 6 хімчисток, локалізованих саме в сучасних Торгівельно-розважальних центрах. Все більше наших Клієнтів поєднують торгівельну марку хімчисток &amp;laquo;5&amp;agrave;Sec&amp;raquo; з високою якістю, сучасними послугами в галузі чищення одягу. На території України ми реалізуємо місію цілої фірми &amp;quot;Швидко, професійно, з найвищою якістю, тут і тепер&amp;quot;. &lt;br /&gt;\r\n		&lt;strong&gt;Наші послуги:&lt;/strong&gt;&lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Виведення плям: &lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		∙ При використанні спеціальних засобів, розроблених найкращими експертами світу; &lt;br /&gt;\r\n		∙ У повній мірі професійне завдяки ретельній підготовці працівників. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Суха хімічна чистка : &lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		∙ При використанні сучасного устаткування, нешкідливого для навколишнього середовища; &lt;br /&gt;\r\n		∙ Із застосуванням відповідних методів для кожного виду волокон, згідно з сучасними технологіями. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Водне прання : &lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		∙ При використанні безпечних методів прання для одягу; &lt;br /&gt;\r\n		∙ Дійове видалення плям завдяки застосуванню сучасної техніки; &lt;br /&gt;\r\n		∙ Охорона делікатних волокон при використанні спеціальних засобів; &lt;br /&gt;\r\n		∙ Одяг пахне свіжістю завдяки найкращим ополіскувачам. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Прасування: &lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		∙ Ручне прасування при застосуванні найсучасніших методів; &lt;br /&gt;\r\n		∙ Старанне виконання робіт; &lt;br /&gt;\r\n		∙ Інноваційне устаткування; &lt;br /&gt;\r\n		∙ Безперервне удосконалення техніки прасування. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Пакування: &lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		∙ Упаковки з поліетилену, придатні до подальшого використання та утилізації;&lt;br /&gt;\r\n		∙ Пакування в практичні і ергономічні мішки з плівки, пристосовані для захисту одягу з метою як найкращої охорони під час зберігання та транспортування. &lt;br /&gt;\r\n		&lt;strong&gt;Додаткові послуги &lt;/strong&gt;&lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;АПРЕТУРА.&lt;/strong&gt;&lt;/em&gt; Експерти рекомендують застосування послуги Апретура, щоб зміцнити стійкість волокна тканини та зберегти її як найдовше. Додатково послуга Апретура оживляє колір, зменшує збирання бруду, пилків, а також тканина менше мнеться. &lt;br /&gt;\r\n		Апретура може бути застосовувана на нижню білизну, спідниці, піджаки, брюки, блузки. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;ІМПРЕГНАЦІЯ.&lt;/strong&gt;&lt;/em&gt; Її головною перевагою є охорона нашого одягу від дощу, вогкістю, а також надмірним забрудненням. Імпрегнація являє собою вид охоронного екрану від дії зовнішніх чинників. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;АНТИКЛІЩ&lt;/strong&gt;&lt;/em&gt; - інноваційна послуга, яка здійснюється виключно з використанням натуральних компонентів, які протидіють пиловим кліщам. Захист, який надає послуга Антикліщ , тримається на тканині до 6 місяців, або п&amp;rsquo;ять прань. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;АНТИМІЛЬ&lt;/strong&gt;&lt;/em&gt; - послуга, яка захищає наш одяг від молі. Застосування цієї послуги відлякує шкідників і наш одяг зможе безпечно висіти в шафі і служити нам довше. &lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;КРОХМАЛЬ. &lt;/strong&gt;&lt;/em&gt;Скатерті, постільна білизна, та навіть сорочки ідеально крохмалені в пральні 5&amp;agrave;Sec, стають приємними на дотик, краще прасуються, а також тканина довше виглядає свіжою.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/5asec-himchistka', 0, 0, '', 1, 0, 0);
INSERT INTO `content` (`id`, `parentid`, `name`, `sdate`, `urlname`, `create_date`, `pagesize`, `preview`, `info`, `showorder`, `formid`, `showtype`, `script`, `price`, `title`, `description`, `keywords`, `siteuser`, `ispublish`, `url`, `hide_content`, `in_index`, `additional`, `is_map`, `top_menu`, `bottom_menu`) VALUES
(75, 64, 'Dia&amp;Noche OUTLET', '2012-12-06', 'dia-noche-outlet', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;124&quot; src=&quot;/userfiles/images/logo_dia_noche.jpg&quot; width=&quot;239&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Ждем Вас ежедневно с 10:00 до 22:00!&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Родина бренда &lt;strong&gt;Dia&amp;amp;Noche&lt;/strong&gt; &amp;ndash; Испания, один из лучших производителей текстиля в Европе.&lt;br /&gt;\r\n		Первый бутик &lt;strong&gt;Dia&amp;amp;Noche&lt;/strong&gt; в Украине был открыт в 2008 году.&lt;br /&gt;\r\n		На сегодняшний день сеть состоит из 10 магазинов, расположенных в лучших торговых центрах Киева, Харькова, Днепропетровска, Житомира и Одессы.&lt;br /&gt;\r\n		&lt;strong&gt;DIA&amp;amp;NOCHE&lt;/strong&gt; &amp;ndash; это:&lt;br /&gt;\r\n		&amp;bull; ПЕРВАЯ КОНЦЕПТУАЛЬНАЯ СЕТЬ ДОМАШНЕГО ТЕКСТИЛЯ В УКРАИНЕ&lt;br /&gt;\r\n		&amp;bull; ЗАКОНОДАТЕЛЬ МОДЫ И ПРОВОДНИК ТРЕНДОВ &lt;br /&gt;\r\n		&amp;bull; ВОПЛОЩЕНИЕ МЕЧТЫ ОБ ИДЕАЛЬНОМ ДОМЕ &lt;br /&gt;\r\n		&lt;strong&gt;МЫ СТРЕМИМСЯ:&lt;/strong&gt;&lt;br /&gt;\r\n		Сделать жизнь наших клиентов лучше и ярче путем предложения множества вариантов стильных и высококачественных товаров для дома. &lt;br /&gt;\r\n		Подарить позитивные эмоции от посещения наших магазинов, восхищение от дизайна и приятные ощущения от использования наших товаров.&lt;br /&gt;\r\n		Стать брендом, которому доверяют клиенты и который воплощает мечты об идеальном доме.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-doma/dia-noche-outlet', 0, 0, '', 1, 0, 0),
(76, 60, 'Gloria Jeans', '2012-12-06', 'gloria-jeans', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;56&quot; src=&quot;/userfiles/images/Gloria_Jeans_Logo_on_blue.png&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;laquo;Глория Джинс&amp;raquo; &amp;ndash; самый крупный и известный производитель одежды в России и Украине. Компания самостоятельно разрабатывает, производит и реализует модную, высококачественную одежду, обувь и аксессуары под брендами Gloria Jeans и Gee Jay.&lt;br /&gt;\r\n		Ежегодно &amp;laquo;Глория Джинс&amp;raquo; делает только лучшие предложения своим покупателям, проводит в магазинах различные акции и распродажи со скидками до 70 процентов. &lt;br /&gt;\r\n		Розничная сеть компании постоянно растёт. Сейчас на территории России и Украины работают более 600 фирменных магазинов &amp;laquo;Глория Джинс&amp;raquo;, и их количество постоянно растет.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 0, 'magaziny/odezhda/gloria-jeans', 0, 0, '', 1, 0, 0),
(78, 56, 'Maltina', '2012-12-06', 'maltina', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;104&quot; src=&quot;/userfiles/images/малтина.jpg&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Время работы:&amp;nbsp;10.00-22.00 , без выходных&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Мальтина &amp;ndash; это фирменный магазин модных аксессуаров.&lt;br /&gt;\r\n		Maltina &amp;ndash; это стиль Вашей красоты! &lt;br /&gt;\r\n		Разнообразие ассортимента просто потрясает воображение!&lt;br /&gt;\r\n		В Maltina очень большой выбор женских украшений и аксессуаров , который постоянно обновляется.&lt;br /&gt;\r\n		Это шейные украшения, серьги , браслеты, кольца, кулоны, бусы, колье, платки , шали и многое другое .&lt;br /&gt;\r\n		Вас порадует коллекция солнцезащитных очков Maltina! &lt;br /&gt;\r\n		Мы думаем о Вас!&lt;br /&gt;\r\n		Для Вас лояльная дисконтная программа и постоянно действующие скидки!&lt;br /&gt;\r\n		Жизнь прекрасна ... если Вы живете в стиле Maltina !!!&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary/maltina', 0, 0, '', 1, 0, 0),
(79, 58, 'MILAVITSA', '2012-12-06', 'milavitsa', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;74&quot; src=&quot;/userfiles/images/logo_red.png&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Магазин женского нижнего белья производства Беларусь.&lt;br /&gt;\r\n		Сегодня компанию МИЛАВИЦА знают во всем мире как крупнейшую фабрику в Европе по производству и продаже корсетных изделий. &lt;br /&gt;\r\n		Торговая марка МИЛАВИЦА&amp;reg; получила признание миллионов женщин всего мира благодаря современному подходу в моделировании белья, применению креативных дизайнерских решений, использованию трендовых полотен и огромной любви, вложенной в производства каждой единицы товара.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Милавица с огромной радостью предлагает широчайший выбор женского нижнего белья, отвечающего самым модным тенденциям. Основные направления &amp;ndash; классическая коллекция, модная коллекция, коллекция бесшовного белья и коллекция купальников и купальных костюмов.&lt;br /&gt;\r\n		В магазине также представлено белье французской марки Alisee и прибалтийской марки Lauma. &lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Магазин в ТРЦ РайOn является частью сети фирменных магазинов Милавица, насчитывающей около 60-ти магазинов по Украине.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Контакты: тел. (044) 371-15-33 , сайт www.milavitsa.com.ua&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		При покупке на сумму от 300 грн выдается дисконтная карточка 5%, а на сумму от 700 грн &amp;mdash; накопительная дисконтная карточка 7-30%.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		В продаже имеются подарочные сертификаты номиналом 100, 250, 500 и 1000 грн.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/bele/milavitsa', 0, 0, '', 1, 0, 0),
(80, 63, 'ЕКО іграшки «Sonechko»', '2012-12-06', 'eko-igrashki-sonechko-', '2012-12-06', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;201&quot; src=&quot;/userfiles/images/logo_sonechko(1).jpg&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Мережа магазинів розвиваючої ЕКО іграшки &amp;laquo;Sonechko&amp;raquo; - презентує високоякісну, екологічно чисту , розвиваючу дерев&amp;rsquo;яну іграшку, в яку сама Природа вдихнула свою силу і мудрість, виховуючи не користувача, а цілісну і гармонійну особистість. &lt;br /&gt;\r\n		Наші іграшки створені із розумінням потреб дітей, відповідно до їх віку. Ми усвідомлюємо яку відповідальність покладено на нас в плані формування у дитини правильного світосприйняття і розвитку її, як особистості.&lt;br /&gt;\r\n		Саме тому ми пропонуємо екологічно чисті дерев&amp;rsquo;яні іграшки, розмальовані фарбами на водній основі, які сприяють всебічному розвитку дитини.&lt;br /&gt;\r\n		Ми прагнемо донести принципи гармонійного розвитку дитини за допомогою наших іграшок, що роблять її фізично і духовно багатою. У кожній родині батьки бажають щоб їх дитина була найрозумнішою, найвправнішою та зацікавленою в навчанні.&lt;br /&gt;\r\n		Саме для цього ми і працюємо!&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-detei-i-budushih-mam/eko-igrashki-sonechko-', 0, 0, '', 1, 0, 0),
(81, 60, 'Kira Plastinina', '2012-12-06', 'kira-plastinina', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;109&quot; src=&quot;/userfiles/images/Kira Plastinina.jpg&quot; width=&quot;362&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Режим работы: С 10:00 до 22:00&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Кира Пластинина - молодой талантливый fashion-дизайнер. На сегодняшний день среди ее почитателей модницы самых разных уголков земного шара! Помимо России, одежда дизайнера успешно продается в Украине, Европе, на Филиппинах, в Китае, Казахстане и США.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Коллекции Киры Пластининой &amp;ndash; это яркий дизайнерский микс модных направлений и трендов. Стильная обладательница нарядов и аксессуаров марки Kira Plastinina может ежедневно создавать новые образы, подчеркивая свой неповторимый стиль. По собственному признанию Киры, она создает именно такую одежду, которую хотела бы носить сама.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/kira-plastinina', 0, 0, '', 1, 0, 0),
(82, 64, 'КОСМО', '2012-12-06', 'kosmo', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;270&quot; src=&quot;/userfiles/images/Logo_Cosmo.jpg.jpg&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Розклад роботи: пн-нд 9:30 - 22:00&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		Тел. магазину: 0 (44) 594-92-44&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;quot;КОСМО&amp;quot; - це національна мережа магазинів краси та здоров&amp;#39;я, заснована в 2000 р. ТОВ &amp;quot;Суматра-ЛТД&amp;quot;. На даний момент в Україні функціонують 84 магазини та 29 аптек мережі, більше 1 000 000 чоловік з 27 міст в 13 областях України є постійними клієнтами &amp;quot;КОСМО&amp;quot;. Місія &amp;quot;КОСМО&amp;quot; - стати національною мережею краси та здоров&amp;#39;я № 1 в Україні до 2014 року. &lt;br /&gt;\r\n		Магазини ТМ &amp;quot;КОСМО&amp;quot; відповідають європейському формату drogerie. Покупцям представлено широкий асортимент косметики, парфумерії, товарів для догляду за тілом, товарів категорії wellness (ароматичні олії, солі, спа), продукції для здорового способу життя і сімейного затишку, товарів для мам та дітей, побутової хімії, а також багато іншої корисної продукції від найкращих світових брендів і провідних українських виробників.Також, починаючи з 2010 року, магазини &amp;quot;КОСМО&amp;quot; пропонують своїм покупцям високоякісні товари власних торгових марок RINO, Mari-e-Monti, Odri, Шоша.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-doma/kosmo', 0, 0, '', 1, 0, 0),
(83, 66, 'MasterZoo', '2012-12-06', 'masterzoo', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;130&quot; src=&quot;/userfiles/images/logo_masterZoo.jpg&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Время работы: с 10.00 до 22.00&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		тел. (044) 371 15 25&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Друзья, как известно, бывают разные, но нет дружбы более бескорыстной, чем та, которую дарят нам братья наши меньшие. Все мечтают о верных друзьях, ведь друзья &amp;ndash; отрада и утешение жизни. Кто-то грезит о красавце попугае Ара или Жако, кто-то собирается оживить интерьер дома или офиса необычно оформленным аквариумом&amp;hellip; А Ваш ребенок на день рождения ждет в подарок маленького грызуна? Вот и получается, что все дороги ведут в хороший зоомагазин. &lt;br /&gt;\r\n		&lt;strong&gt;Сеть зоомаркетов Master Zoo&lt;/strong&gt; предлагает начать поиск домашнего животного совместно, ведь мы способны удивить даже самых требовательных любителей животных. Просторный зоомагазин становится местом клубного общения и профессиональных консультаций для владельцев всевозможных домашних животных. Сегодня мы можем ответить на преданность и любовь домашних питомцев не только взаимными чувствами, но и более конкретным, определенным образом - обеспечить им здоровую, счастливую жизнь рядом с собой. Для заботливого хозяина уже не составляет особого труда обеспечить полноценный рацион своему любимцу, угостить любимым лакомством, предоставить собственное место в доме, разнообразные игрушки и аксессуары. Но кроме стандартного набора из корма, специализированных витаминов, и аксессуаров в сети зоомаркетов &lt;strong&gt;Master Zoo&lt;/strong&gt; можно выбрать и модную одежку, и косметику и даже ошейник со стразами &amp;ndash; все возможно в современном зоомагазине. &lt;br /&gt;\r\n		Безусловной изюминкой магазинов стала постоянно действующая выставка-продажа экзотических животных. Хамелеоны, полозы, ящерицы, квакши, игуаны и другие представители холоднокровных поселились в красиво оформленных террариумах. &lt;br /&gt;\r\n		Если вы решились на покупку маленького друга, будьте уверены, что все животные проходят карантин и вакцинацию, а некоторые имеют даже собственный паспорт.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		&lt;em&gt;Правильно выбранный и воспитанный представитель фауны становиться любимцем семьи, а его жилье - живописной частью интерьера. Придя хоть раз в любой из зоомаркетов &amp;laquo;Master Zoo&amp;raquo;, Вы и ваш питомец становитесь любимым клиентом.&lt;/em&gt;&lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;Вид деятельности: Продажа товаров для домашних животных (от кормов, мебели, косметики, амуниции, витаминов до ветеринарных препаратов, посуды, одежды для собак и оборудования для груминга);&lt;br /&gt;\r\n		- товары для аквариумистики (аквариумы, оборудование к ним, мебельные тумбы под аквариум и другое);&lt;br /&gt;\r\n		-товары для террариумистики (террариумы, оборудование к ним, мебельные тумбы под террариум и другое);&lt;br /&gt;\r\n		- товары для прудоводства (от пленок для создания пруда, техники, фильтров, фонтанов, кормов до средств по уходу и борьбой с нежелательными водорослями).&lt;/strong&gt;&lt;/em&gt;&lt;br /&gt;\r\n		&lt;em&gt;&lt;strong&gt;У нас вы можете получить консультации специалистов зоологов, ветеринарных врачей, биологов. &lt;br /&gt;\r\n		В магазине открыта выставка &amp;ndash; продажа домашних животных: у нас есть грызуны, птицы, аквариумные рыбы, рептилии, декоративные кошки и собаки!&lt;/strong&gt;&lt;/em&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/masterzoo', 0, 0, '', 1, 0, 0),
(84, 59, 'Plato', '2012-12-06', 'plato', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;100&quot; src=&quot;/userfiles/images/plato_new.gif&quot; width=&quot;100&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		PLATO &amp;mdash; магазин для всей семьи, здесь представлен широкий ассортимент обуви и аксессуаров для детей и взрослых, разного возраста.&lt;br /&gt;\r\n		Сеть магазинов создана в 2006 году. В соответствие с последними мировыми трендами, в 2011 году создан новый дизайн и формат магазина. Концепция разработана ведущими английскими специалистами в области дизайна.&lt;br /&gt;\r\n		В новых магазинах PLATO новый не только интерьер, а и предложения, которые значительно облегчают выбор подходящей пары обуви и аксессуаров. &lt;br /&gt;\r\n		Новый PLATO разделен на залы: женский, мужской и детский, где вы найдете зоны, соответствующие вашему стилю: city, casual и moda. Детский зал разделен на: baby, junior и teens, это позволяет клиенту легко ориентироваться в магазине. &lt;br /&gt;\r\n		Преимущество нового магазина - обувь выставлена по размеру, от меньшего к большему, подойдя к стеллажу, вы сразу сможете найти необходимый размер. Широкий ассортимент аксессуаров, представленный в зоне accessories, поможет подчеркнуть индивидуальность каждого клиента.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Особенностью нового PLATO является ЗОНА ПАДАЮЩИХ ЦЕН. Теперь найти самое выгодное предложение предельно просто: товар, который участвует в акции, выделен специальными ярлыками ПЛАТОЦЕНА или ЭКОНОМИЯ. Обувь с биркой ПЛАТОЦЕНА дает возможность клиентам купить товар по сниженной фиксированной цене (например, 99 или 199 грн), а вот на обувь с биркой ЭКОНОМИЯ предоставляется скидка от 10 до 90%. Какие именно условия распространяются на полюбившуюся вам пару, можно увидеть на ДОСКЕ ВЫГОДНЫХ ПРЕДЛОЖЕНИЙ. На ней для удобства клиентов размещены сменные таблички с названием брендов, категориями товаров, размером скидки и ценой, так что сразу ясно, во сколько обойдется обновка.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/plato', 0, 0, '', 1, 0, 0),
(85, 59, 'WITTCHEN', '2012-12-06', 'wittchen', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;123&quot; src=&quot;/userfiles/images/Logo_Wittchen_braz_2007.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Время работы: с 10:00 до 22:00&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Бренд WITTCHEN отличают особая изысканность и неповторимый стиль. Его появлением индустрия предметов роскоши обязана Анджею Виттхену, который в 1990 году основал компанию по производству кожаных аксессуаров. Сегодня империя Анджея Виттхена занимает лидирующие позиции в области дизайна и производства элитной кожгалантерейной продукции.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Элитная кожгалантерея WITTCHEN это:&lt;br /&gt;\r\n		Элегантные высококачественные аксессуары, изготовленные из итальянских кож;&lt;br /&gt;\r\n		Широкий ассортимент изысканных и практичных изделий;&lt;br /&gt;\r\n		Респектабельный и безупречный внешний вид;&lt;br /&gt;\r\n		Исключительный блеск и аромат материалов;&lt;br /&gt;\r\n		Индивидуальность каждого изделия;&lt;br /&gt;\r\n		Естественные цветовые оттенки.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Изделия WITTCHEN представлены тремя основными коллекциями: Da Vinci, Arizona, Italy, которые отличаются типами кожи и фурнитурой. Это классические линии мужских и женских кожаных аксессуаров, таких как портфель, сумка, деловая папка, портмоне, кошелек, визитница, ключница и различных футляров. Кроме того, WITTCHEN - это коллекции женских сумок Venus и Young, линии ремней, перчаток, багажа, дорожных сумок и прочих полезных вещей. Все изделия имеют соответствующую фирменную упаковку, специально разработанную для каждой коллекции.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Элитная кожгалантерея WITTCHEN изготавливается вручную из отборной итальянской телячьей кожи. Ее исключительный блеск и аромат достигаются при длительном процессе выделки. В результате дубления хромовыми солями получается мягкая, тонкая кожа с натуральной рельефностью, которая подчеркивает индивидуальность каждого изделия. Естественные цветовые оттенки обеспечивает тонирование натуральными красителями на растительной основе.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Клиенты ценят бренд WITTCHEN за элегантный стиль, высочайшее качество и отличную отделку. Изделия WITTCHEN неоднократно получали высокую оценку на престижных конкурсах, что подтверждают многочисленные награды и призы. Все товары WITTCHEN обозначены характерным логотипом, который гарантирует подлинность каждого продукта. WITTCHEN имеет более 100 фирменных салонов и точек продаж элитной кожгалантереи на территории Украины, России, Белоруссии и Польши. Ведутся активные продажи через Интернет-магазины, а также оптовые продажи корпоративным клиентам. Стремительное развитие привело к открытию собственного логистического центра в Бронишах (Польша), где находится склад и департамент качества компании. Количество сотрудников превышает 450 человек.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Узнать об особенностях каждой линейки продуктов Вы сможете в разделе Коллекции. Также в нашем Интернет-магазине Вы сможете с легкостью выбрать и приобрести респектабельный аксессуар или беспроигрышный подарок! В этом вам помогут разделы Сделай подарок и Для корпоративных клиентов.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/wittchen', 0, 0, '', 1, 0, 0),
(86, 57, 'Спортмастер', '2012-12-06', 'sportmaster', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/logo_sportmaster.jpg&quot; width=&quot;200&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Мы &amp;ndash; спортивный магазин для всей семьи! Все для спорта и активного отдыха &amp;ndash; от самых простых спорттоваров до технологичного снаряжения последнего поколения.&lt;br /&gt;\r\n		На данный момент компания насчитывает уже 17 магазинов СПОРТМАСТЕР, 3 магазина нового современного формата ГИПЕР площадью от 3 тыс. кв.м. и 1 магазин формата ДИСКОНТ.&lt;br /&gt;\r\n		Мы представлены в 7 крупнейших городах Украины. В планах нашей Компании активное развитие в областных центрах и крупных городах Украины. &lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Мы &amp;ndash; дружная команда профессионалов. Каждый из нас &amp;ndash; будь то эксперт по разработке нового спортивного оборудования или консультант в торговом зале &amp;ndash; работает для того, чтобы как можно больше людей получали удовольствие от спорта и активного отдыха.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		На протяжении многих лет мы делаем все для того, чтобы люди могли по-настоящему наслаждаться активным образом жизни. Наша цель &amp;ndash; обеспечить наших покупателей снаряжением и оборудованием отменного качества по доступным ценам.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Мы напрямую работаем с крупнейшими мировыми брендами, а для многих из них являемся единственными представителями на украинском рынке.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Мы &amp;ndash; стабильный и надежный партнер для тех, кто готов развивать свой бизнес вместе с нами. Сеть франчайзинговых магазинов COLUMBIA и СПОРТЛАНДИЯ покрывает всю Украину и поддерживает наше стремление нести спорт и отдых всем, кто ценит активный образ жизни. &lt;br /&gt;\r\n		СПОРТ&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Для кого-то спорт &amp;ndash; это серьезное восхождение на пик, для кого-то &amp;ndash; легкая прогулка на велосипеде. И то и другое &amp;ndash; активный образ жизни, и мы учитываем это в нашей ассортиментной политике. &lt;br /&gt;\r\n		Мы поддерживаем детские спортивные увлечения, школьные программы, традиционные и развивающиеся виды спорта. Каждый наш покупатель &amp;ndash; спортсмен, каждая покупка &amp;ndash; шаг к здоровой нации. Мы несем спорт каждому &amp;ndash; в национальном масштабе!&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Мы знаем: современные технологии позволяют значительно улучшить результативность и безопасность занятий спортом, получать от движения максимум удовольствия. А на полумеры не согласны ни мы, ни наши покупатели! &lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Товары высокого качества по разумным ценам &amp;ndash; так можно описать наш подход к формированию товарной политики, который мы реализуем на протяжении многих лет. Мы тщательно отбираем поставщиков, отсеивая неоправданно дорогих и поддерживая тех, кто разделяет нашу точку зрения. Консультанты подскажут оптимальное решение каждому покупателю, исходя из его потребностей и уровня спортивной подготовки.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Интересы клиентов всегда были и остаются на первом месте. Для постоянных покупателей у нас действует система привилегий &amp;ndash; долгосрочная Клубная программа &amp;laquo;Спортмастер&amp;raquo; позволяет получать бонусы за каждую покупку и расплачиваться ими в дальнейшем. Кроме того, участники программ регулярно получают специальные предложения и скидки на сервисные услуги.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Экономить на здоровом образе жизни больше нет необходимости: теперь спорт действительно доступен всем!&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aktivnyi-otdyh-i-sport/sportmaster', 0, 0, '', 1, 0, 1),
(87, 39, 'Конкурс1', '2012-12-07', 'konkurs1', '2012-12-07', 0, ' Условия акции &quot;Месяц шопоголика - деньги в подарок!&quot; Акция проходит с 01 ноября по 25 ноября 2012 года включительно. В Акции принимают участие только совершеннолетние граждане Украины, за исключением сотрудников Заказчика, Организатора и их члены семьи. Условия акции: 1. Сделайте покупку в ТРК &quot;CITY MALL&quot; на сумму от 200 грн з\r\n', '&lt;div class=&quot;itext&quot;&gt;\r\n	Условия акции &amp;quot;Месяц шопоголика - деньги в подарок!&amp;quot; Акция проходит с 01 ноября по 25 ноября 2012 года включительно. В Акции принимают участие только совершеннолетние граждане Украины, за исключением сотрудников Заказчика, Организатора и их члены семьи. Условия акции: 1. Сделайте покупку в ТРК &amp;quot;CITY MALL&amp;quot; на сумму от 200 грн з&lt;/div&gt;', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'online-konkursy/konkurs1', 0, 0, '', 1, 0, 0),
(88, 0, 'Акции', '2012-12-07', 'akcii', '2012-12-17', 0, '', '', 15, -1, -1, 23, '0.00', '', '', '', 0, 1, 'akcii', 0, 0, '', 1, 0, 0),
(89, 0, 'Мероприятия', '2012-12-07', 'meroprijatija', '2012-12-17', 0, '', '', 16, -1, -1, 23, '0.00', '', '', '', 0, 1, 'meroprijatija', 0, 0, '', 1, 0, 0),
(90, 37, 'С 19 по 30 декабря в &quot;РайON&quot; тебя ждет Дед Мороз!', '2012-12-11', 's-19-po-30-dekabrja-v-raion-tebja-zhdet-ded-moroz-', '2012-12-14', 0, 'С 19 по 30 декабря, ежедневно с 12:00 до 19:00, в торгово-развлекательном центре &quot;РайON&quot; тебя ждет Дед Мороз!', '&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;С 19 по 30 декабря, ежедневно с 12:00 до 19:00, в торгово-развлекательном центре &amp;quot;РайON&amp;quot; тебя ждет Дед Мороз!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;Сделай три шага к своему новогоднему желанию:&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;1.Приходи в &amp;quot;РайON&amp;quot;!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;2.Расскажи Дедушке хорошо ли ты себя вел весь год&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;3.Получи волшебный Свиток, который исполняет желания!&lt;/span&gt;&lt;/p&gt;\r\n', 2, -1, 6, -1, '0.00', '', '', '', 0, 1, 'novosti/s-19-po-30-dekabrja-v-raion-tebja-zhdet-ded-moroz-', 0, 1, '', 1, 0, 0),
(91, 65, 'Алло', '2012-12-12', 'allo', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/allo', 0, 0, '', 1, 0, 0),
(93, 66, 'АТМА', '2012-12-12', 'atma', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(2).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/atma', 0, 0, '', 1, 0, 0),
(94, 59, 'Centro', '2012-12-12', 'centro', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(3).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/centro', 0, 0, '', 1, 0, 0),
(95, 59, 'Chester', '2012-12-12', 'chester', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(4).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/chester', 0, 0, '', 1, 0, 0),
(96, 60, 'Colin&#039;s', '2012-12-12', 'colin-s', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main (2).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/colin-s', 0, 0, '', 1, 0, 1),
(97, 65, 'Comfy', '2012-12-12', 'comfy', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(5).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/comfy', 0, 0, '', 1, 0, 1),
(98, 60, 'Cropp Town', '2012-12-12', 'cropp-town', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main (2)(1).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/cropp-town', 0, 0, '', 1, 0, 0),
(99, 64, 'Fissman', '2012-12-12', 'fissman', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7282.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-doma/fissman', 0, 0, '', 1, 0, 0),
(100, 60, 'House', '2012-12-12', 'house', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(6).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/house', 0, 0, '', 1, 0, 0),
(101, 65, 'iCity', '2012-12-12', 'icity', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(7).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/icity', 0, 0, '', 1, 0, 0);
INSERT INTO `content` (`id`, `parentid`, `name`, `sdate`, `urlname`, `create_date`, `pagesize`, `preview`, `info`, `showorder`, `formid`, `showtype`, `script`, `price`, `title`, `description`, `keywords`, `siteuser`, `ispublish`, `url`, `hide_content`, `in_index`, `additional`, `is_map`, `top_menu`, `bottom_menu`) VALUES
(102, 60, 'inCity', '2012-12-12', 'incity', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(8).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/incity', 0, 0, '', 1, 0, 0),
(103, 59, 'Kari', '2012-12-12', 'kari', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7197.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/kari', 0, 0, '', 1, 0, 0),
(104, 65, 'Київстар', '2012-12-12', 'kijivstar', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(9).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/kijivstar', 0, 0, '', 1, 0, 0),
(105, 58, 'L&#039;etude', '2012-12-12', 'l-etude', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(10).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/bele/l-etude', 0, 0, '', 1, 0, 0),
(106, 65, 'Life', '2012-12-12', 'life', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(11).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/life', 0, 0, '', 1, 0, 0),
(107, 62, 'Malataya Pazari', '2012-12-12', 'malataya-pazari', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(12).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/produkty-pitanija/malataya-pazari', 0, 0, '', 1, 0, 0),
(108, 60, 'Mohito', '2012-12-12', 'mohito', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(13).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 8, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/mohito', 0, 0, '', 1, 0, 0),
(109, 63, 'Mothercare', '2012-12-12', 'mothercare', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(14).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-detei-i-budushih-mam/mothercare', 0, 0, '', 1, 0, 0),
(110, 65, 'Moyo', '2012-12-12', 'moyo', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(15).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/moyo', 0, 0, '', 1, 0, 0),
(111, 66, 'Nail Care', '2012-12-12', 'nail-care', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7100.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/nail-care', 0, 0, '', 1, 0, 0),
(112, 60, 'Ostin', '2012-12-12', 'ostin', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7045.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/ostin', 0, 0, '', 1, 0, 0),
(113, 66, 'Островок', '2012-12-12', 'ostrovok', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7141.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/ostrovok', 0, 0, '', 1, 0, 0),
(114, 56, 'Островок', '2012-12-12', 'ostrovok', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7142.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary/ostrovok', 0, 0, '', 1, 0, 0),
(115, 66, 'Островок', '2012-12-12', 'ostrovok-2', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7099.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/ostrovok-2', 0, 0, '', 1, 0, 0),
(116, 65, 'Островок', '2012-12-12', 'ostrovok', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7210.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/ostrovok', 0, 0, '', 1, 0, 0),
(117, 61, 'Paggy Sage', '2012-12-12', 'paggy-sage', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7110.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 1, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija/paggy-sage', 0, 0, '', 1, 0, 0),
(118, 59, 'Paoleti', '2012-12-12', 'paoleti', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(16).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 8, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/paoleti', 0, 0, '', 1, 0, 0),
(119, 62, 'Paradise', '2012-12-12', 'paradise', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7152.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/produkty-pitanija/paradise', 0, 0, '', 1, 0, 0),
(120, 66, 'Platinum Bank', '2012-12-12', 'platinum-bank', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7189.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/platinum-bank', 0, 0, '', 1, 0, 0),
(121, 60, 'Reserved', '2012-12-12', 'reserved', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(17).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 10, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/reserved', 0, 0, '', 1, 0, 1),
(122, 65, 'Ringoo', '2012-12-12', 'ringoo', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(18).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 8, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/ringoo', 0, 0, '', 1, 0, 0),
(123, 61, 'Sea of Spa', '2012-12-12', 'sea-of-spa', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7262.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 2, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija/sea-of-spa', 0, 0, '', 1, 0, 0),
(124, 66, 'SunStory', '2012-12-12', 'sunstory', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7277.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/sunstory', 0, 0, '', 1, 0, 0),
(125, 59, 'uStyle', '2012-12-12', 'ustyle', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(19).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/obuv-i-sumki/ustyle', 0, 0, '', 1, 0, 0),
(126, 60, 'Widas', '2012-12-12', 'widas', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(20).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 11, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/odezhda/widas', 0, 0, '', 1, 0, 0),
(127, 61, 'Yves Rocher', '2012-12-12', 'yves-rocher', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(21).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija/yves-rocher', 0, 0, '', 1, 0, 0),
(128, 66, 'Аптекарь', '2012-12-12', 'aptekar', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/аптекарь.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/aptekar', 0, 0, '', 1, 0, 0),
(129, 66, 'Ателье', '2012-12-12', 'atele', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7278.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 8, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/atele', 0, 0, '', 1, 0, 0),
(130, 58, 'Білизна.Street', '2012-12-12', 'bilizna-street', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7287.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/bele/bilizna-street', 0, 0, '', 1, 0, 0),
(131, 56, 'Дека', '2012-12-12', 'deka', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(22).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary/deka', 0, 0, '', 1, 0, 0),
(132, 63, 'Детский Мир', '2012-12-12', 'detskii-mir', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(23).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/tovary-dlja-detei-i-budushih-mam/detskii-mir', 0, 0, '', 1, 0, 0),
(133, 151, 'Золота Скринька', '2012-12-12', 'zolota-skrinka', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7281.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yuvelirnye-izdelija/zolota-skrinka', 0, 0, '', 1, 0, 0),
(134, 151, 'Золотой Век', '2012-12-12', 'zolotoi-vek', '2012-12-14', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(24).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yuvelirnye-izdelija/zolotoi-vek', 0, 0, '', 1, 0, 0),
(136, 61, 'Індустрія Краси', '2012-12-12', 'industrija-krasi', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/LIPK7280(1).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija/industrija-krasi', 0, 0, '', 1, 0, 0),
(137, 61, 'Л&#039;Этуаль', '2012-12-12', 'l-yetual', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(25).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 5, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/parfyumerija/l-yetual', 0, 0, '', 1, 0, 0),
(138, 56, 'Люксоптика', '2012-12-12', 'lyuksoptika', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(26).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 6, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary/lyuksoptika', 0, 0, '', 1, 0, 0),
(139, 56, 'ОптикМастер', '2012-12-12', 'optikmaster', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(27).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 7, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/aksessuary/optikmaster', 0, 0, '', 1, 0, 0),
(140, 66, 'Медуна', '2012-12-12', 'meduna', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(28).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/uslugi-i-podarki/meduna', 0, 0, '', 1, 0, 0),
(141, 65, 'Мобільні Фішки', '2012-12-12', 'mobilni-fishki', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(29).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 9, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yelektronika/mobilni-fishki', 0, 0, '', 1, 0, 0),
(142, 62, 'Чайна Країна', '2012-12-12', 'chaina-krajina', '2012-12-12', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;200&quot; src=&quot;/userfiles/images/main(30).jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 3, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/produkty-pitanija/chaina-krajina', 0, 0, '', 1, 0, 0),
(145, 35, 'Пицца Арома', '2012-12-12', 'picca-aroma', '2012-12-19', 0, '', '&lt;div class=&quot;restouran-about&quot;&gt;\r\n	&lt;div class=&quot;img&quot;&gt;\r\n		&lt;img alt=&quot;&quot; height=&quot;82&quot; src=&quot;/userfiles/images/1.jpg&quot; width=&quot;300&quot; /&gt;&lt;/div&gt;\r\n	&lt;div class=&quot;desc&quot;&gt;\r\n		Режим работы кафе &amp;quot;PizzAroma&amp;quot; с понедельника по воскресенье, с 10:00 до 23:00&amp;nbsp;&lt;/div&gt;\r\n	&lt;div class=&quot;bot-line&quot;&gt;\r\n		тел.: 067-669-60-60&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;ctext f13&quot;&gt;\r\n	&lt;p&gt;\r\n		Кафе &amp;ldquo;PizzAroma&amp;rdquo;- это уютное семейное заведение, частичка солнечной Италии, которая всегда радо приветствует Вас в ТЦ &amp;laquo;РаЙон&amp;raquo;.&lt;br /&gt;\r\n		У нас вы можете насладиться авторскими блюдами итальянской кухни, изумительной пиццей на основе живого теста, приготовленной исключительно вручную, а также побаловать себя и своего ребенка вкуснейшими десертами от шеф-повара.&lt;br /&gt;\r\n		Предлагаем проведение детских Дней Рождений. Сделайте детский праздник вкусным, веселым и незабываемым!!!&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		С понедельника по четверг с 10:00 до 17:00 скидка на всю пиццу 20%.&lt;br /&gt;\r\n		А также:&lt;br /&gt;\r\n		-трансляция футбольных матчей&lt;br /&gt;\r\n		-кино-показ детских фильмов по выходным с 11:00 до 16:00&lt;br /&gt;\r\n		-специальные предложения к праздникам&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&amp;nbsp;&lt;/p&gt;\r\n&lt;/div&gt;\r\n', 4, -1, -1, 14, '0.00', '', '', '', 0, 1, 'restorany/picca-aroma', 1, 0, '', 1, 0, 1),
(146, 37, '5 января 2013 года в ТРЦ «РайON» - Рождественская Сказка!', '2012-12-12', '5-janvarja-2013-goda-v-trc-raion--rozhdestvenskaja-skazka-', '2012-12-14', 0, '5 января 2013 года приходи в торгово-развлекательный центр «РайON»', '&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin: 0px; font-family: arial, sans-serif; font-size: 13px;&quot;&gt;\r\n	5 января 2013 года приходи в торгово-развлекательный центр &amp;laquo;РайON&amp;raquo; на неповторимое праздничное представление &amp;laquo;Рождественская Сказка&amp;raquo;!&lt;/p&gt;\r\n&lt;p class=&quot;MsoNormal&quot; style=&quot;margin: 0px; font-family: arial, sans-serif; font-size: 13px;&quot;&gt;\r\n	Тебя ждут сказочные герои, интересные приключения и много веселья!&lt;/p&gt;\r\n', 4, -1, 6, -1, '0.00', '', '', '', 0, 1, 'novosti/5-janvarja-2013-goda-v-trc-raion--rozhdestvenskaja-skazka-', 0, 1, '', 1, 0, 0),
(151, 33, 'Ювелирные изделия', '2012-12-14', 'yuvelirnye-izdelija', '2012-12-18', 0, '', '', 12, -1, -1, -1, '0.00', '', '', '', 0, 1, 'magaziny/yuvelirnye-izdelija', 0, 0, '', 1, 0, 0),
(152, 0, 'Развлечения', '2012-12-17', 'razvlechenija', '2012-12-19', 0, '', '', 6, -1, -1, 14, '0.00', '', '', '', 0, 1, 'razvlechenija', 0, 0, '', 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `contentarea`
--

CREATE TABLE IF NOT EXISTS `contentarea` (
  `id` bigint(20) NOT NULL auto_increment,
  `strongname` varchar(50) NOT NULL default '',
  `title` varchar(200) NOT NULL default '',
  `plaintext` int(11) NOT NULL default '0',
  `html` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `contentarea`
--

INSERT INTO `contentarea` (`id`, `strongname`, `title`, `plaintext`, `html`) VALUES
(6, 'partners_info', 'Контактная информация для партнеров', 1, '&lt;div class=&quot;icon-phone&quot;&gt;(044) 90-40-90&lt;/div&gt;\r\n&lt;div class=&quot;icon-email&quot;&gt;&lt;a href=&quot;mailto:partners@rayon.com.ua&quot;&gt;partners@rayon.com.ua&lt;/a&gt;&lt;/div&gt;'),
(7, 'social', 'Соц. сети', 0, '&lt;p&gt;\r\n	&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;33&quot; src=&quot;/userfiles/images/fb.png&quot; width=&quot;33&quot; /&gt;&lt;/a&gt; &lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;33&quot; src=&quot;/userfiles/images/vk.png&quot; width=&quot;33&quot; /&gt;&lt;/a&gt; &lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;33&quot; src=&quot;/userfiles/images/tw.png&quot; width=&quot;33&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n'),
(8, 'flogo', 'Лого-футер', 0, '&lt;p&gt;\r\n	&lt;a href=&quot;#&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;109&quot; src=&quot;/userfiles/images/flogo.png&quot; width=&quot;155&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `create_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `actual_date` date NOT NULL default '0000-00-00',
  `title` text NOT NULL,
  `info` text NOT NULL,
  `contenttype` int(11) NOT NULL default '0',
  `in_index` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `content_url`
--

CREATE TABLE IF NOT EXISTS `content_url` (
  `id` int(11) NOT NULL,
  `url` varchar(1000) character set utf8 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `start_date` date NOT NULL default '0000-00-00',
  `finish_date` date NOT NULL default '0000-00-00',
  `title` text NOT NULL,
  `info` text NOT NULL,
  `report` text NOT NULL,
  `eventtype` int(11) NOT NULL default '0',
  `ispublish` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `eventsin`
--

CREATE TABLE IF NOT EXISTS `eventsin` (
  `id` bigint(20) NOT NULL auto_increment,
  `eventid` int(11) NOT NULL default '0',
  `fio` text NOT NULL,
  `email` varchar(100) NOT NULL default '',
  `company` text NOT NULL,
  `instatus` varchar(100) NOT NULL default '',
  `accept` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `parentid` bigint(20) NOT NULL default '0',
  `is_main` int(11) NOT NULL default '0',
  `image` varchar(250) NOT NULL default '',
  `title` text NOT NULL,
  `source` int(11) NOT NULL default '0',
  `showorder` int(11) NOT NULL default '1000',
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `format` varchar(50) NOT NULL default '',
  `link` varchar(500) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=665 ;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `userid`, `parentid`, `is_main`, `image`, `title`, `source`, `showorder`, `width`, `height`, `format`, `link`) VALUES
(386, 0, 41, 0, '1_41_12122012151205_2.jpg', 'LIPK7167', 1, 4, 840, 560, 'jpeg', ''),
(385, 0, 41, 0, '1_41_12122012151205_1.jpg', 'LIPK7166', 1, 4, 840, 560, 'jpeg', ''),
(384, 0, 41, 0, '1_41_12122012151157_1.jpg', 'main', 1, 3, 840, 560, 'jpeg', ''),
(662, 0, 1, 0, '1_1_14122012175052_1.jpg', '', 1, 2, 1600, 496, 'jpeg', 'galereja/prazdnik-den-beshketnika-'),
(99, 0, 53, 1, '1_53_30112012120043_1.jpg', 't_iel1', 1, 1, 239, 119, 'jpeg', ''),
(100, 0, 54, 1, '1_54_30112012120120_1.jpg', 't_iel2', 1, 1, 240, 77, 'jpeg', ''),
(101, 0, 56, 1, '1_56_30112012182615_1.jpg', 'shop-cat-1', 1, 1, 111, 71, 'png', ''),
(102, 0, 57, 1, '1_57_30112012182627_1.jpg', 'shop-cat-2', 1, 1, 77, 77, 'png', ''),
(103, 0, 58, 1, '1_58_30112012182641_1.jpg', 'shop-cat-3', 1, 1, 92, 67, 'png', ''),
(104, 0, 59, 1, '1_59_30112012182653_1.jpg', 'shop-cat-4', 1, 1, 110, 78, 'png', ''),
(105, 0, 60, 1, '1_60_30112012182707_1.jpg', 'shop-cat-5', 1, 1, 67, 90, 'png', ''),
(106, 0, 61, 1, '1_61_30112012182720_1.jpg', 'shop-cat-6', 1, 1, 50, 90, 'png', ''),
(107, 0, 62, 1, '1_62_30112012182734_1.jpg', 'shop-cat-7', 1, 1, 82, 86, 'png', ''),
(108, 0, 63, 1, '1_63_30112012182750_1.jpg', 'shop-cat-8', 1, 1, 95, 86, 'png', ''),
(109, 0, 64, 1, '1_64_30112012182808_1.jpg', 'shop-cat-9', 1, 1, 82, 85, 'png', ''),
(110, 0, 65, 1, '1_65_30112012182821_1.jpg', 'shop-cat-10', 1, 1, 56, 79, 'png', ''),
(111, 0, 66, 1, '1_66_30112012182833_1.jpg', 'shop-cat-11', 1, 1, 64, 73, 'png', ''),
(112, 0, 67, 1, '1_67_04122012154206_1.jpg', 'image', 1, 1, 222, 48, 'jpeg', ''),
(113, 0, 41, 1, '1_41_04122012164022_1.jpg', 't_rest1', 1, 2, 200, 179, 'jpeg', ''),
(157, 0, 69, 0, '1_69_12122012115000_1.jpg', 'LIPK7406', 1, 6, 840, 560, 'jpeg', ''),
(158, 0, 69, 0, '1_69_12122012115003_1.jpg', 'LIPK7423', 1, 7, 560, 840, 'jpeg', ''),
(159, 0, 69, 0, '1_69_12122012115006_1.jpg', 'LIPK7430', 1, 8, 560, 840, 'jpeg', ''),
(121, 0, 75, 1, '1_75_06122012142500_1.jpg', 'logo_dia_noche', 1, 1, 239, 124, 'jpeg', ''),
(120, 0, 74, 1, '1_74_06122012135638_1.jpg', 'LOG5ASEC', 1, 1, 150, 53, 'jpeg', ''),
(122, 0, 76, 1, '1_76_06122012144335_1.jpg', 'Gloria_Jeans_Logo_on_blue', 1, 1, 4383, 1225, 'png', ''),
(123, 0, 77, 1, '1_77_06122012145022_1.jpg', 'Julia', 1, 1, 256, 162, 'jpeg', ''),
(124, 0, 78, 1, '1_78_06122012150523_1.jpg', 'малтина', 1, 1, 1501, 781, 'jpeg', ''),
(125, 0, 79, 1, '1_79_06122012150901_1.jpg', 'logo_red', 1, 1, 1114, 412, 'png', ''),
(126, 0, 80, 1, '1_80_06122012153725_1.jpg', 'logo_sonechko', 1, 1, 431, 433, 'jpeg', ''),
(127, 0, 81, 1, '1_81_06122012161617_1.jpg', 'Kira Plastinina', 1, 1, 362, 109, 'jpeg', ''),
(128, 0, 82, 1, '1_82_06122012161914_1.jpg', 'Logo_Cosmo.jpg', 1, 1, 380, 513, 'jpeg', ''),
(129, 0, 83, 1, '1_83_06122012162454_1.jpg', 'logo_masterZoo', 1, 1, 1502, 976, 'jpeg', ''),
(130, 0, 84, 1, '1_84_06122012162736_1.jpg', 'plato_new', 1, 1, 100, 100, 'gif', ''),
(131, 0, 85, 1, '1_85_06122012163010_1.jpg', 'Logo_Wittchen_braz_2007', 1, 1, 624, 255, 'jpeg', ''),
(132, 0, 86, 1, '1_86_06122012163547_1.jpg', 'logo_sportmaster', 1, 1, 250, 250, 'jpeg', ''),
(133, 0, 87, 1, '1_87_07122012153136_1.jpg', 'mainpromo3', 1, 1, 320, 460, 'jpeg', ''),
(402, 0, 1, 1, '1_1_12122012153005_1.jpg', 'RayonPreview', 1, 1, 1280, 640, 'jpeg', ''),
(403, 0, 146, 1, '1_146_12122012153240_1.jpg', 'Xmas_Rayon', 1, 1, 905, 1280, 'jpeg', ''),
(139, 0, 4, 1, '20_4_11122012160801_1.jpg', 'RayonPreview', 20, 1, 1280, 640, 'jpeg', ''),
(140, 0, 4, 0, '20_4_11122012160805_1.jpg', 'AfishaRayon_preview', 20, 2, 724, 1024, 'jpeg', ''),
(141, 0, 90, 0, '1_90_11122012161142_1.jpg', 'AfishaRayon_preview', 1, 2, 724, 1024, 'jpeg', ''),
(142, 0, 90, 1, '1_90_11122012161142_2.jpg', 'RayonPreview', 1, 1, 1280, 640, 'jpeg', ''),
(160, 0, 91, 1, '1_91_12122012125028_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(156, 0, 69, 0, '1_69_12122012114956_1.jpg', '5', 1, 5, 840, 560, 'jpeg', ''),
(155, 0, 69, 0, '1_69_12122012114952_1.jpg', '4', 1, 4, 840, 560, 'jpeg', ''),
(154, 0, 69, 0, '1_69_12122012114948_1.jpg', '3', 1, 3, 840, 560, 'jpeg', ''),
(153, 0, 69, 0, '1_69_12122012114945_1.jpg', '2', 1, 2, 840, 560, 'jpeg', ''),
(152, 0, 69, 1, '1_69_12122012114921_1.jpg', '1', 1, 1, 840, 560, 'jpeg', ''),
(161, 0, 92, 0, '1_92_12122012125342_1.jpg', 'LIPK7014', 1, 2, 840, 560, 'jpeg', ''),
(162, 0, 92, 0, '1_92_12122012125342_2.jpg', 'LIPK7018', 1, 3, 840, 560, 'jpeg', ''),
(163, 0, 92, 0, '1_92_12122012125342_3.jpg', 'LIPK7019', 1, 4, 840, 560, 'jpeg', ''),
(164, 0, 92, 1, '1_92_12122012125347_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(165, 0, 91, 0, '1_91_12122012125443_1.jpg', 'LIPK7307', 1, 2, 840, 560, 'jpeg', ''),
(166, 0, 91, 0, '1_91_12122012125443_2.jpg', 'LIPK7309', 1, 3, 840, 560, 'jpeg', ''),
(167, 0, 91, 0, '1_91_12122012125443_3.jpg', 'LIPK7310', 1, 4, 840, 560, 'jpeg', ''),
(168, 0, 67, 0, '1_67_12122012125532_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(169, 0, 67, 0, '1_67_12122012125539_1.jpg', 'LIPK7092', 1, 3, 840, 560, 'jpeg', ''),
(170, 0, 67, 0, '1_67_12122012125539_2.jpg', 'LIPK7093', 1, 4, 840, 560, 'jpeg', ''),
(171, 0, 67, 0, '1_67_12122012125539_3.jpg', 'LIPK7094', 1, 5, 840, 560, 'jpeg', ''),
(172, 0, 67, 0, '1_67_12122012125539_4.jpg', 'LIPK7095', 1, 6, 840, 560, 'jpeg', ''),
(173, 0, 79, 0, '1_79_12122012125722_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(174, 0, 79, 0, '1_79_12122012125728_1.jpg', 'LIPK7112', 1, 3, 840, 560, 'jpeg', ''),
(175, 0, 79, 0, '1_79_12122012125728_2.jpg', 'LIPK7116', 1, 4, 840, 560, 'jpeg', ''),
(176, 0, 79, 0, '1_79_12122012125728_3.jpg', 'LIPK7119', 1, 5, 840, 560, 'jpeg', ''),
(177, 0, 79, 0, '1_79_12122012125728_4.jpg', 'LIPK7120', 1, 6, 840, 560, 'jpeg', ''),
(178, 0, 93, 1, '1_93_12122012125912_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(179, 0, 75, 0, '1_75_12122012125935_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(180, 0, 75, 0, '1_75_12122012125941_1.jpg', 'LIPK7069', 1, 3, 840, 560, 'jpeg', ''),
(181, 0, 75, 0, '1_75_12122012125941_2.jpg', 'LIPK7072', 1, 4, 840, 560, 'jpeg', ''),
(182, 0, 75, 0, '1_75_12122012125941_3.jpg', 'LIPK7073', 1, 5, 840, 560, 'jpeg', ''),
(183, 0, 75, 0, '1_75_12122012125941_4.jpg', 'LIPK7074', 1, 6, 840, 560, 'jpeg', ''),
(184, 0, 75, 0, '1_75_12122012125941_5.jpg', 'LIPK7076', 1, 7, 840, 560, 'jpeg', ''),
(185, 0, 75, 0, '1_75_12122012125941_6.jpg', 'LIPK7077', 1, 8, 840, 560, 'jpeg', ''),
(186, 0, 82, 0, '1_82_12122012130000_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(187, 0, 82, 0, '1_82_12122012130003_1.jpg', 'LIPK7259', 1, 3, 840, 560, 'jpeg', ''),
(188, 0, 83, 0, '1_83_12122012130018_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(189, 0, 83, 0, '1_83_12122012130021_1.jpg', 'LIPK7264', 1, 3, 840, 560, 'jpeg', ''),
(190, 0, 94, 1, '1_94_12122012130242_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(191, 0, 94, 0, '1_94_12122012130247_1.jpg', 'LIPK7079', 1, 2, 840, 560, 'jpeg', ''),
(192, 0, 94, 0, '1_94_12122012130247_2.jpg', 'LIPK7081', 1, 3, 840, 560, 'jpeg', ''),
(193, 0, 95, 1, '1_95_12122012130407_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(194, 0, 95, 0, '1_95_12122012130412_1.jpg', 'LIPK7254', 1, 2, 840, 560, 'jpeg', ''),
(195, 0, 95, 0, '1_95_12122012130412_2.jpg', 'LIPK7256', 1, 3, 840, 560, 'jpeg', ''),
(196, 0, 95, 0, '1_95_12122012130412_3.jpg', 'LIPK7258', 1, 4, 840, 560, 'jpeg', ''),
(197, 0, 96, 1, '1_96_12122012130526_1.jpg', 'main (2)', 1, 1, 840, 560, 'jpeg', ''),
(198, 0, 96, 0, '1_96_12122012130529_1.jpg', 'LIPK7336', 1, 2, 840, 560, 'jpeg', ''),
(199, 0, 96, 0, '1_96_12122012130536_1.jpg', 'LIPK7329', 1, 3, 840, 560, 'jpeg', ''),
(200, 0, 96, 0, '1_96_12122012130536_2.jpg', 'LIPK7331', 1, 4, 840, 560, 'jpeg', ''),
(201, 0, 96, 0, '1_96_12122012130536_3.jpg', 'LIPK7332', 1, 5, 840, 560, 'jpeg', ''),
(202, 0, 96, 0, '1_96_12122012130536_4.jpg', 'LIPK7334', 1, 6, 840, 560, 'jpeg', ''),
(203, 0, 81, 0, '1_81_12122012130622_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(204, 0, 81, 0, '1_81_12122012130626_1.jpg', 'LIPK7135', 1, 3, 840, 560, 'jpeg', ''),
(205, 0, 81, 0, '1_81_12122012130629_1.jpg', 'LIPK7133', 1, 4, 840, 560, 'jpeg', ''),
(206, 0, 81, 0, '1_81_12122012130636_1.jpg', 'LIPK7136', 1, 5, 840, 560, 'jpeg', ''),
(207, 0, 81, 0, '1_81_12122012130636_2.jpg', 'LIPK7137', 1, 6, 840, 560, 'jpeg', ''),
(208, 0, 81, 0, '1_81_12122012130636_3.jpg', 'LIPK7139', 1, 7, 840, 560, 'jpeg', ''),
(209, 0, 86, 0, '1_86_12122012130651_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(210, 0, 86, 0, '1_86_12122012130655_1.jpg', 'LIPK7340', 1, 3, 840, 560, 'jpeg', ''),
(211, 0, 97, 0, '1_97_12122012131207_1.jpg', 'LIPK7083', 1, 2, 840, 560, 'jpeg', ''),
(212, 0, 97, 0, '1_97_12122012131207_2.jpg', 'LIPK7086', 1, 3, 840, 560, 'jpeg', ''),
(213, 0, 97, 1, '1_97_12122012131213_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(214, 0, 98, 1, '1_98_12122012131344_1.jpg', 'main (2)', 1, 1, 840, 560, 'jpeg', ''),
(215, 0, 98, 0, '1_98_12122012131351_1.jpg', 'LIPK7181', 1, 2, 840, 560, 'jpeg', ''),
(216, 0, 98, 0, '1_98_12122012131351_2.jpg', 'LIPK7184', 1, 3, 840, 560, 'jpeg', ''),
(217, 0, 98, 0, '1_98_12122012131351_3.jpg', 'LIPK7185', 1, 4, 840, 560, 'jpeg', ''),
(218, 0, 98, 0, '1_98_12122012131351_4.jpg', 'LIPK7186', 1, 5, 840, 560, 'jpeg', ''),
(219, 0, 98, 0, '1_98_12122012131351_5.jpg', 'LIPK7187', 1, 6, 840, 560, 'jpeg', ''),
(220, 0, 98, 0, '1_98_12122012131351_6.jpg', 'LIPK7188', 1, 7, 840, 560, 'jpeg', ''),
(221, 0, 99, 1, '1_99_12122012131526_1.jpg', 'LIPK7282', 1, 1, 840, 560, 'jpeg', ''),
(222, 0, 100, 1, '1_100_12122012131648_1.jpg', 'LIPK7241', 1, 1, 840, 560, 'jpeg', ''),
(223, 0, 100, 0, '1_100_12122012131648_2.jpg', 'LIPK7243', 1, 2, 840, 560, 'jpeg', ''),
(224, 0, 100, 0, '1_100_12122012131648_3.jpg', 'LIPK7244', 1, 3, 840, 560, 'jpeg', ''),
(225, 0, 100, 0, '1_100_12122012131648_4.jpg', 'LIPK7246', 1, 4, 840, 560, 'jpeg', ''),
(226, 0, 100, 0, '1_100_12122012131648_5.jpg', 'LIPK7247', 1, 5, 840, 560, 'jpeg', ''),
(227, 0, 101, 1, '1_101_12122012132645_1.jpg', 'LIPK7321', 1, 2, 840, 560, 'jpeg', ''),
(228, 0, 101, 0, '1_101_12122012132645_2.jpg', 'LIPK7322', 1, 3, 840, 560, 'jpeg', ''),
(229, 0, 101, 0, '1_101_12122012132645_3.jpg', 'LIPK7324', 1, 4, 840, 560, 'jpeg', ''),
(230, 0, 101, 0, '1_101_12122012132645_4.jpg', 'LIPK7326', 1, 5, 840, 560, 'jpeg', ''),
(231, 0, 101, 0, '1_101_12122012132645_5.jpg', 'LIPK7327', 1, 6, 840, 560, 'jpeg', ''),
(232, 0, 101, 0, '1_101_12122012132653_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(233, 0, 102, 1, '1_102_12122012132844_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(234, 0, 102, 0, '1_102_12122012132851_1.jpg', 'LIPK7001', 1, 2, 840, 560, 'jpeg', ''),
(235, 0, 102, 0, '1_102_12122012132851_2.jpg', 'LIPK7174', 1, 3, 840, 560, 'jpeg', ''),
(236, 0, 102, 0, '1_102_12122012132851_3.jpg', 'LIPK7176', 1, 4, 840, 560, 'jpeg', ''),
(237, 0, 102, 0, '1_102_12122012132851_4.jpg', 'LIPK7178', 1, 5, 840, 560, 'jpeg', ''),
(238, 0, 102, 0, '1_102_12122012132851_5.jpg', 'LIPK7179', 1, 6, 840, 560, 'jpeg', ''),
(239, 0, 103, 0, '1_103_12122012133139_1.jpg', 'LIPK7196', 1, 2, 840, 560, 'jpeg', ''),
(240, 0, 103, 1, '1_103_12122012133139_2.jpg', 'LIPK7197', 1, 1, 840, 560, 'jpeg', ''),
(241, 0, 103, 0, '1_103_12122012133139_3.jpg', 'LIPK7199', 1, 3, 840, 560, 'jpeg', ''),
(242, 0, 103, 0, '1_103_12122012133139_4.jpg', 'LIPK7200', 1, 4, 840, 560, 'jpeg', ''),
(243, 0, 103, 0, '1_103_12122012133140_5.jpg', 'LIPK7202', 1, 5, 840, 560, 'jpeg', ''),
(244, 0, 104, 1, '1_104_12122012133621_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(245, 0, 104, 0, '1_104_12122012133628_1.jpg', 'LIPK7158', 1, 2, 840, 560, 'jpeg', ''),
(246, 0, 104, 0, '1_104_12122012133628_2.jpg', 'LIPK7162', 1, 3, 840, 560, 'jpeg', ''),
(247, 0, 104, 0, '1_104_12122012133628_3.jpg', 'LIPK7165', 1, 4, 840, 560, 'jpeg', ''),
(248, 0, 105, 1, '1_105_12122012133811_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(249, 0, 105, 0, '1_105_12122012133818_1.jpg', 'LIPK7190', 1, 2, 840, 560, 'jpeg', ''),
(250, 0, 105, 0, '1_105_12122012133818_2.jpg', 'LIPK7192', 1, 3, 840, 560, 'jpeg', ''),
(251, 0, 105, 0, '1_105_12122012133818_3.jpg', 'LIPK7193', 1, 4, 840, 560, 'jpeg', ''),
(252, 0, 105, 0, '1_105_12122012133818_4.jpg', 'LIPK7194', 1, 5, 840, 560, 'jpeg', ''),
(253, 0, 105, 0, '1_105_12122012133818_5.jpg', 'LIPK7195', 1, 6, 840, 560, 'jpeg', ''),
(254, 0, 106, 1, '1_106_12122012133922_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(255, 0, 106, 0, '1_106_12122012133925_1.jpg', 'LIPK7212', 1, 2, 840, 560, 'jpeg', ''),
(256, 0, 107, 1, '1_107_12122012134056_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(257, 0, 78, 0, '1_78_12122012134204_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(258, 0, 108, 1, '1_108_12122012134321_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(259, 0, 108, 0, '1_108_12122012134328_1.jpg', 'LIPK7222', 1, 2, 840, 560, 'jpeg', ''),
(260, 0, 108, 0, '1_108_12122012134328_2.jpg', 'LIPK7223', 1, 3, 840, 560, 'jpeg', ''),
(261, 0, 108, 0, '1_108_12122012134328_3.jpg', 'LIPK7226', 1, 4, 840, 560, 'jpeg', ''),
(262, 0, 108, 0, '1_108_12122012134328_4.jpg', 'LIPK7228', 1, 5, 840, 560, 'jpeg', ''),
(263, 0, 108, 0, '1_108_12122012134328_5.jpg', 'LIPK7229', 1, 6, 840, 560, 'jpeg', ''),
(264, 0, 108, 0, '1_108_12122012134328_6.jpg', 'LIPK7230', 1, 7, 840, 560, 'jpeg', ''),
(265, 0, 109, 1, '1_109_12122012134501_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(266, 0, 109, 0, '1_109_12122012134510_1.jpg', 'LIPK6991', 1, 2, 840, 560, 'jpeg', ''),
(267, 0, 109, 0, '1_109_12122012134510_2.jpg', 'LIPK6993', 1, 3, 840, 560, 'jpeg', ''),
(268, 0, 109, 0, '1_109_12122012134510_3.jpg', 'LIPK6995', 1, 4, 840, 560, 'jpeg', ''),
(269, 0, 109, 0, '1_109_12122012134510_4.jpg', 'LIPK6996', 1, 5, 840, 560, 'jpeg', ''),
(270, 0, 109, 0, '1_109_12122012134510_5.jpg', 'LIPK6997', 1, 6, 840, 560, 'jpeg', ''),
(271, 0, 109, 0, '1_109_12122012134510_6.jpg', 'LIPK6998', 1, 7, 840, 560, 'jpeg', ''),
(272, 0, 109, 0, '1_109_12122012134510_7.jpg', 'LIPK7000', 1, 8, 840, 560, 'jpeg', ''),
(273, 0, 110, 1, '1_110_12122012134629_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(279, 0, 111, 1, '1_111_12122012134953_1.jpg', 'LIPK7100', 1, 1, 840, 560, 'jpeg', ''),
(275, 0, 110, 0, '1_110_12122012134636_2.jpg', 'LIPK7008', 1, 3, 840, 560, 'jpeg', ''),
(276, 0, 110, 0, '1_110_12122012134636_3.jpg', 'LIPK7011', 1, 4, 840, 560, 'jpeg', ''),
(277, 0, 110, 0, '1_110_12122012134636_4.jpg', 'LIPK7012', 1, 5, 840, 560, 'jpeg', ''),
(278, 0, 110, 0, '1_110_12122012134636_5.jpg', 'LIPK7013', 1, 6, 840, 560, 'jpeg', ''),
(280, 0, 111, 0, '1_111_12122012134956_1.jpg', 'LIPK7097', 1, 2, 840, 560, 'jpeg', ''),
(281, 0, 112, 1, '1_112_12122012135112_1.jpg', 'LIPK7045', 1, 1, 840, 560, 'jpeg', ''),
(282, 0, 112, 0, '1_112_12122012135120_1.jpg', 'LIPK7044', 1, 2, 840, 560, 'jpeg', ''),
(283, 0, 112, 0, '1_112_12122012135120_2.jpg', 'LIPK7046', 1, 3, 840, 560, 'jpeg', ''),
(284, 0, 112, 0, '1_112_12122012135120_3.jpg', 'LIPK7047', 1, 4, 840, 560, 'jpeg', ''),
(285, 0, 112, 0, '1_112_12122012135120_4.jpg', 'LIPK7048', 1, 5, 840, 560, 'jpeg', ''),
(286, 0, 113, 1, '1_113_12122012135951_1.jpg', 'LIPK7141', 1, 1, 840, 560, 'jpeg', ''),
(287, 0, 114, 1, '1_114_12122012140127_1.jpg', 'LIPK7142', 1, 1, 840, 560, 'jpeg', ''),
(288, 0, 115, 1, '1_115_12122012140244_1.jpg', 'LIPK7099', 1, 1, 840, 560, 'jpeg', ''),
(289, 0, 116, 1, '1_116_12122012140436_1.jpg', 'LIPK7210', 1, 1, 840, 560, 'jpeg', ''),
(290, 0, 116, 0, '1_116_12122012140440_1.jpg', 'LIPK7209', 1, 2, 840, 560, 'jpeg', ''),
(291, 0, 117, 1, '1_117_12122012141722_1.jpg', 'LIPK7110', 1, 1, 840, 560, 'jpeg', ''),
(292, 0, 117, 0, '1_117_12122012141726_1.jpg', 'LIPK7144', 1, 2, 840, 560, 'jpeg', ''),
(293, 0, 118, 0, '1_118_12122012141907_1.jpg', 'LIPK7130', 1, 2, 840, 560, 'jpeg', ''),
(294, 0, 118, 1, '1_118_12122012141911_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(295, 0, 118, 0, '1_118_12122012141922_1.jpg', 'LIPK7121', 1, 3, 840, 560, 'jpeg', ''),
(296, 0, 118, 0, '1_118_12122012141922_2.jpg', 'LIPK7126', 1, 4, 840, 560, 'jpeg', ''),
(297, 0, 118, 0, '1_118_12122012141922_3.jpg', 'LIPK7127', 1, 5, 840, 560, 'jpeg', ''),
(298, 0, 118, 0, '1_118_12122012141922_4.jpg', 'LIPK7128', 1, 6, 840, 560, 'jpeg', ''),
(299, 0, 119, 0, '1_119_12122012142030_1.jpg', 'LIPK7151', 1, 2, 840, 560, 'jpeg', ''),
(300, 0, 119, 1, '1_119_12122012142030_2.jpg', 'LIPK7152', 1, 1, 840, 560, 'jpeg', ''),
(301, 0, 120, 1, '1_120_12122012142140_1.jpg', 'LIPK7189', 1, 1, 840, 560, 'jpeg', ''),
(302, 0, 84, 0, '1_84_12122012142222_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(303, 0, 84, 0, '1_84_12122012142228_1.jpg', 'LIPK7024', 1, 3, 840, 560, 'jpeg', ''),
(304, 0, 84, 0, '1_84_12122012142228_2.jpg', 'LIPK7026', 1, 4, 840, 560, 'jpeg', ''),
(305, 0, 84, 0, '1_84_12122012142228_3.jpg', 'LIPK7028', 1, 5, 840, 560, 'jpeg', ''),
(306, 0, 84, 0, '1_84_12122012142228_4.jpg', 'LIPK7029', 1, 6, 840, 560, 'jpeg', ''),
(307, 0, 84, 0, '1_84_12122012142228_5.jpg', 'LIPK7030', 1, 7, 840, 560, 'jpeg', ''),
(308, 0, 84, 0, '1_84_12122012142228_6.jpg', 'LIPK7033', 1, 8, 840, 560, 'jpeg', ''),
(309, 0, 121, 1, '1_121_12122012142344_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(310, 0, 121, 0, '1_121_12122012142350_1.jpg', 'LIPK7232', 1, 2, 840, 560, 'jpeg', ''),
(311, 0, 121, 0, '1_121_12122012142350_2.jpg', 'LIPK7236', 1, 3, 840, 560, 'jpeg', ''),
(312, 0, 121, 0, '1_121_12122012142350_3.jpg', 'LIPK7237', 1, 4, 840, 560, 'jpeg', ''),
(313, 0, 121, 0, '1_121_12122012142350_4.jpg', 'LIPK7239', 1, 5, 840, 560, 'jpeg', ''),
(314, 0, 121, 0, '1_121_12122012142350_5.jpg', 'LIPK7240', 1, 6, 840, 560, 'jpeg', ''),
(315, 0, 122, 1, '1_122_12122012142731_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(316, 0, 122, 0, '1_122_12122012142740_1.jpg', 'LIPK7153', 1, 2, 840, 560, 'jpeg', ''),
(317, 0, 122, 0, '1_122_12122012142740_2.jpg', 'LIPK7155', 1, 3, 840, 560, 'jpeg', ''),
(318, 0, 122, 0, '1_122_12122012142740_3.jpg', 'LIPK7157', 1, 4, 840, 560, 'jpeg', ''),
(319, 0, 123, 1, '1_123_12122012142915_1.jpg', 'LIPK7262', 1, 1, 840, 560, 'jpeg', ''),
(320, 0, 124, 1, '1_124_12122012143153_1.jpg', 'LIPK7277', 1, 1, 840, 560, 'jpeg', ''),
(321, 0, 125, 1, '1_125_12122012143319_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(322, 0, 125, 0, '1_125_12122012143324_1.jpg', 'LIPK7145', 1, 2, 840, 560, 'jpeg', ''),
(323, 0, 125, 0, '1_125_12122012143324_2.jpg', 'LIPK7147', 1, 3, 840, 560, 'jpeg', ''),
(324, 0, 125, 0, '1_125_12122012143324_3.jpg', 'LIPK7150', 1, 4, 840, 560, 'jpeg', ''),
(325, 0, 126, 1, '1_126_12122012143642_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(326, 0, 126, 0, '1_126_12122012143648_1.jpg', 'LIPK7037', 1, 2, 840, 560, 'jpeg', ''),
(327, 0, 126, 0, '1_126_12122012143648_2.jpg', 'LIPK7039', 1, 3, 840, 560, 'jpeg', ''),
(328, 0, 126, 0, '1_126_12122012143648_3.jpg', 'LIPK7040', 1, 4, 840, 560, 'jpeg', ''),
(329, 0, 126, 0, '1_126_12122012143648_4.jpg', 'LIPK7041', 1, 5, 840, 560, 'jpeg', ''),
(330, 0, 126, 0, '1_126_12122012143648_5.jpg', 'LIPK7043', 1, 6, 840, 560, 'jpeg', ''),
(331, 0, 85, 0, '1_85_12122012143746_1.jpg', 'main', 1, 2, 840, 560, 'jpeg', ''),
(332, 0, 85, 0, '1_85_12122012143751_1.jpg', 'LIPK7248', 1, 3, 840, 560, 'jpeg', ''),
(333, 0, 85, 0, '1_85_12122012143751_2.jpg', 'LIPK7251', 1, 4, 840, 560, 'jpeg', ''),
(334, 0, 85, 0, '1_85_12122012143751_3.jpg', 'LIPK7253', 1, 5, 840, 560, 'jpeg', ''),
(335, 0, 127, 1, '1_127_12122012143922_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(336, 0, 127, 0, '1_127_12122012143929_1.jpg', 'LIPK7102', 1, 2, 840, 560, 'jpeg', ''),
(337, 0, 127, 0, '1_127_12122012143929_2.jpg', 'LIPK7104', 1, 3, 840, 560, 'jpeg', ''),
(338, 0, 127, 0, '1_127_12122012143929_3.jpg', 'LIPK7107', 1, 4, 840, 560, 'jpeg', ''),
(339, 0, 127, 0, '1_127_12122012143929_4.jpg', 'LIPK7108', 1, 5, 840, 560, 'jpeg', ''),
(340, 0, 127, 0, '1_127_12122012143929_5.jpg', 'LIPK7109', 1, 6, 840, 560, 'jpeg', ''),
(341, 0, 128, 1, '1_128_12122012144914_1.jpg', 'аптекарь', 1, 1, 840, 560, 'jpeg', ''),
(342, 0, 129, 1, '1_129_12122012145018_1.jpg', 'LIPK7278', 1, 1, 840, 560, 'jpeg', ''),
(343, 0, 130, 1, '1_130_12122012145131_1.jpg', 'LIPK7287', 1, 1, 840, 560, 'jpeg', ''),
(344, 0, 131, 1, '1_131_12122012145239_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(345, 0, 131, 0, '1_131_12122012145245_1.jpg', 'LIPK7315', 1, 2, 840, 560, 'jpeg', ''),
(346, 0, 131, 0, '1_131_12122012145245_2.jpg', 'LIPK7317', 1, 3, 840, 560, 'jpeg', ''),
(347, 0, 131, 0, '1_131_12122012145245_3.jpg', 'LIPK7318', 1, 4, 840, 560, 'jpeg', ''),
(348, 0, 132, 1, '1_132_12122012145617_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(349, 0, 132, 0, '1_132_12122012145626_1.jpg', 'LIPK7056', 1, 2, 840, 560, 'jpeg', ''),
(350, 0, 132, 0, '1_132_12122012145626_2.jpg', 'LIPK7057', 1, 3, 840, 560, 'jpeg', ''),
(351, 0, 132, 0, '1_132_12122012145626_3.jpg', 'LIPK7059', 1, 4, 840, 560, 'jpeg', ''),
(352, 0, 132, 0, '1_132_12122012145626_4.jpg', 'LIPK7061', 1, 5, 840, 560, 'jpeg', ''),
(353, 0, 132, 0, '1_132_12122012145626_5.jpg', 'LIPK7062', 1, 6, 840, 560, 'jpeg', ''),
(354, 0, 132, 0, '1_132_12122012145626_6.jpg', 'LIPK7063', 1, 7, 840, 560, 'jpeg', ''),
(355, 0, 132, 0, '1_132_12122012145626_7.jpg', 'LIPK7064', 1, 8, 840, 560, 'jpeg', ''),
(356, 0, 132, 0, '1_132_12122012145626_8.jpg', 'LIPK7065', 1, 9, 840, 560, 'jpeg', ''),
(357, 0, 132, 0, '1_132_12122012145626_9.jpg', 'LIPK7066', 1, 10, 840, 560, 'jpeg', ''),
(358, 0, 133, 1, '1_133_12122012145757_1.jpg', 'LIPK7281', 1, 1, 840, 560, 'jpeg', ''),
(359, 0, 134, 1, '1_134_12122012150000_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(360, 0, 134, 0, '1_134_12122012150003_1.jpg', 'LIPK7004', 1, 2, 840, 560, 'jpeg', ''),
(361, 0, 136, 1, '1_136_12122012150210_1.jpg', 'LIPK7280', 1, 1, 840, 560, 'jpeg', ''),
(362, 0, 137, 1, '1_137_12122012150328_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(363, 0, 137, 0, '1_137_12122012150331_1.jpg', 'LIPK6988', 1, 2, 840, 560, 'jpeg', ''),
(364, 0, 137, 0, '1_137_12122012150337_1.jpg', 'LIPK6985', 1, 3, 840, 560, 'jpeg', ''),
(365, 0, 137, 0, '1_137_12122012150337_2.jpg', 'LIPK6987', 1, 4, 840, 560, 'jpeg', ''),
(366, 0, 138, 1, '1_138_12122012150529_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(367, 0, 138, 0, '1_138_12122012150534_1.jpg', 'LIPK7050', 1, 2, 840, 560, 'jpeg', ''),
(368, 0, 138, 0, '1_138_12122012150534_2.jpg', 'LIPK7052', 1, 3, 840, 560, 'jpeg', ''),
(369, 0, 138, 0, '1_138_12122012150534_3.jpg', 'LIPK7054', 1, 4, 840, 560, 'jpeg', ''),
(370, 0, 139, 1, '1_139_12122012150617_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(371, 0, 139, 0, '1_139_12122012150623_1.jpg', 'LIPK7294', 1, 2, 840, 560, 'jpeg', ''),
(372, 0, 139, 0, '1_139_12122012150623_2.jpg', 'LIPK7299', 1, 3, 840, 560, 'jpeg', ''),
(373, 0, 140, 1, '1_140_12122012150728_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(374, 0, 140, 0, '1_140_12122012150734_1.jpg', 'LIPK7472', 1, 2, 840, 560, 'jpeg', ''),
(375, 0, 140, 0, '1_140_12122012150734_2.jpg', 'LIPK7474', 1, 3, 840, 560, 'jpeg', ''),
(376, 0, 141, 1, '1_141_12122012150831_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(377, 0, 141, 0, '1_141_12122012150838_1.jpg', 'LIPK7300', 1, 2, 840, 560, 'jpeg', ''),
(378, 0, 141, 0, '1_141_12122012150838_2.jpg', 'LIPK7303', 1, 3, 840, 560, 'jpeg', ''),
(379, 0, 141, 0, '1_141_12122012150838_3.jpg', 'LIPK7304', 1, 4, 840, 560, 'jpeg', ''),
(380, 0, 141, 0, '1_141_12122012150838_4.jpg', 'LIPK7305', 1, 5, 840, 560, 'jpeg', ''),
(381, 0, 142, 1, '1_142_12122012150940_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(382, 0, 142, 0, '1_142_12122012150946_1.jpg', 'LIPK7268', 1, 2, 840, 560, 'jpeg', ''),
(383, 0, 142, 0, '1_142_12122012150946_2.jpg', 'LIPK7269', 1, 3, 840, 560, 'jpeg', ''),
(387, 0, 41, 0, '1_41_12122012151205_3.jpg', 'LIPK7169', 1, 5, 840, 560, 'jpeg', ''),
(388, 0, 41, 0, '1_41_12122012151205_4.jpg', 'LIPK7170', 1, 6, 840, 560, 'jpeg', ''),
(389, 0, 41, 0, '1_41_12122012151205_5.jpg', 'LIPK7171', 1, 7, 840, 560, 'jpeg', ''),
(390, 0, 41, 0, '1_41_12122012151205_6.jpg', 'LIPK7172', 1, 8, 840, 560, 'jpeg', ''),
(391, 0, 41, 0, '1_41_12122012151205_7.jpg', 'LIPK7173', 1, 9, 840, 560, 'jpeg', ''),
(401, 0, 143, 1, '1_143_12122012152400_1.jpg', 'main', 1, 2, 300, 200, 'jpeg', ''),
(393, 0, 143, 0, '1_143_12122012151320_1.jpg', 'LIPK7460', 1, 3, 840, 560, 'jpeg', ''),
(394, 0, 143, 0, '1_143_12122012151320_2.jpg', 'LIPK7465', 1, 4, 840, 560, 'jpeg', ''),
(395, 0, 143, 0, '1_143_12122012151320_3.jpg', 'LIPK7467', 1, 4, 840, 560, 'jpeg', ''),
(396, 0, 144, 1, '1_144_12122012151905_1.jpg', 'logo_pivna-duma1', 1, 1, 342, 300, 'jpeg', ''),
(400, 0, 145, 1, '1_145_12122012152257_1.jpg', '1', 1, 2, 300, 82, 'jpeg', ''),
(399, 0, 145, 0, '1_145_12122012152134_1.jpg', 'LIPK7035', 1, 2, 840, 560, 'jpeg', ''),
(404, 0, 147, 1, '1_147_13122012151830_1.jpg', 'IMG_2994', 1, 1, 1200, 800, 'jpeg', ''),
(405, 0, 147, 0, '1_147_13122012151840_1.jpg', 'IMG_2995', 1, 2, 799, 1200, 'jpeg', ''),
(406, 0, 147, 0, '1_147_13122012151840_2.jpg', 'IMG_2996', 1, 3, 1200, 800, 'jpeg', ''),
(407, 0, 147, 0, '1_147_13122012151840_3.jpg', 'IMG_2997', 1, 4, 1200, 800, 'jpeg', ''),
(408, 0, 147, 0, '1_147_13122012151840_4.jpg', 'IMG_2998', 1, 5, 1200, 800, 'jpeg', ''),
(409, 0, 147, 0, '1_147_13122012151840_5.jpg', 'IMG_3001', 1, 6, 799, 1200, 'jpeg', ''),
(410, 0, 147, 0, '1_147_13122012151840_6.jpg', 'IMG_3002', 1, 7, 1200, 800, 'jpeg', ''),
(411, 0, 147, 0, '1_147_13122012151840_7.jpg', 'IMG_3004', 1, 8, 1199, 800, 'jpeg', ''),
(412, 0, 147, 0, '1_147_13122012151840_8.jpg', 'IMG_3005', 1, 9, 1200, 800, 'jpeg', ''),
(413, 0, 147, 0, '1_147_13122012151840_9.jpg', 'IMG_3007', 1, 10, 1200, 800, 'jpeg', ''),
(414, 0, 147, 0, '1_147_13122012151840_10.jpg', 'IMG_3009', 1, 11, 1200, 800, 'jpeg', ''),
(415, 0, 147, 0, '1_147_13122012151840_11.jpg', 'IMG_3010', 1, 12, 1200, 800, 'jpeg', ''),
(416, 0, 147, 0, '1_147_13122012151840_12.jpg', 'IMG_3013', 1, 13, 1200, 800, 'jpeg', ''),
(417, 0, 147, 0, '1_147_13122012151840_13.jpg', 'IMG_3015', 1, 14, 1200, 800, 'jpeg', ''),
(418, 0, 147, 0, '1_147_13122012151840_14.jpg', 'IMG_3016', 1, 15, 1199, 800, 'jpeg', ''),
(419, 0, 147, 0, '1_147_13122012151840_15.jpg', 'IMG_3019', 1, 16, 1200, 800, 'jpeg', ''),
(420, 0, 147, 0, '1_147_13122012151840_16.jpg', 'IMG_3021', 1, 17, 1200, 800, 'jpeg', ''),
(421, 0, 147, 0, '1_147_13122012151840_17.jpg', 'IMG_3023', 1, 18, 800, 1200, 'jpeg', ''),
(422, 0, 147, 0, '1_147_13122012152629_1.jpg', 'IMG_3025', 1, 19, 1200, 800, 'jpeg', ''),
(423, 0, 147, 0, '1_147_13122012152629_2.jpg', 'IMG_3026', 1, 20, 1200, 800, 'jpeg', ''),
(424, 0, 147, 0, '1_147_13122012152629_3.jpg', 'IMG_3027', 1, 21, 1200, 800, 'jpeg', ''),
(425, 0, 147, 0, '1_147_13122012152629_4.jpg', 'IMG_3028', 1, 22, 800, 1200, 'jpeg', ''),
(426, 0, 147, 0, '1_147_13122012152629_5.jpg', 'IMG_3030', 1, 23, 1199, 800, 'jpeg', ''),
(427, 0, 147, 0, '1_147_13122012152629_6.jpg', 'IMG_3034', 1, 24, 1199, 800, 'jpeg', ''),
(428, 0, 147, 0, '1_147_13122012152629_7.jpg', 'IMG_3035', 1, 25, 800, 1200, 'jpeg', ''),
(429, 0, 147, 0, '1_147_13122012152629_8.jpg', 'IMG_3036', 1, 26, 1200, 800, 'jpeg', ''),
(430, 0, 147, 0, '1_147_13122012152629_9.jpg', 'IMG_3037', 1, 27, 1200, 800, 'jpeg', ''),
(431, 0, 147, 0, '1_147_13122012152629_10.jpg', 'IMG_3040', 1, 28, 1200, 800, 'jpeg', ''),
(432, 0, 147, 0, '1_147_13122012152629_11.jpg', 'IMG_3042', 1, 29, 1200, 800, 'jpeg', ''),
(433, 0, 147, 0, '1_147_13122012152629_12.jpg', 'IMG_3043', 1, 30, 1200, 800, 'jpeg', ''),
(434, 0, 147, 0, '1_147_13122012152629_13.jpg', 'IMG_3047', 1, 31, 1200, 800, 'jpeg', ''),
(435, 0, 147, 0, '1_147_13122012152629_14.jpg', 'IMG_3049', 1, 32, 1199, 800, 'jpeg', ''),
(436, 0, 147, 0, '1_147_13122012152629_15.jpg', 'IMG_3051', 1, 33, 1200, 800, 'jpeg', ''),
(437, 0, 147, 0, '1_147_13122012152629_16.jpg', 'IMG_3052', 1, 34, 1199, 800, 'jpeg', ''),
(438, 0, 147, 0, '1_147_13122012152629_17.jpg', 'IMG_3054', 1, 35, 1199, 800, 'jpeg', ''),
(439, 0, 147, 0, '1_147_13122012152629_18.jpg', 'IMG_3055', 1, 36, 1200, 800, 'jpeg', ''),
(440, 0, 147, 0, '1_147_13122012152629_19.jpg', 'IMG_3057', 1, 37, 799, 1200, 'jpeg', ''),
(441, 0, 147, 0, '1_147_13122012152629_20.jpg', 'IMG_3059', 1, 38, 1199, 800, 'jpeg', ''),
(442, 0, 147, 0, '1_147_13122012152629_21.jpg', 'IMG_3063', 1, 39, 1200, 800, 'jpeg', ''),
(443, 0, 147, 0, '1_147_13122012152629_22.jpg', 'IMG_3065', 1, 40, 1199, 800, 'jpeg', ''),
(444, 0, 147, 0, '1_147_13122012152629_23.jpg', 'IMG_3066', 1, 41, 1200, 800, 'jpeg', ''),
(445, 0, 147, 0, '1_147_13122012152629_24.jpg', 'IMG_3067', 1, 42, 1200, 800, 'jpeg', ''),
(446, 0, 147, 0, '1_147_13122012152629_25.jpg', 'IMG_3068', 1, 43, 799, 1200, 'jpeg', ''),
(447, 0, 147, 0, '1_147_13122012152629_26.jpg', 'IMG_3072', 1, 44, 800, 1200, 'jpeg', ''),
(448, 0, 147, 0, '1_147_13122012152629_27.jpg', 'IMG_3073', 1, 45, 1200, 800, 'jpeg', ''),
(449, 0, 147, 0, '1_147_13122012152629_28.jpg', 'IMG_3075', 1, 46, 799, 1200, 'jpeg', ''),
(450, 0, 147, 0, '1_147_13122012152629_29.jpg', 'IMG_3076', 1, 47, 800, 1200, 'jpeg', ''),
(451, 0, 147, 0, '1_147_13122012152629_30.jpg', 'IMG_3078', 1, 48, 1200, 800, 'jpeg', ''),
(452, 0, 147, 0, '1_147_13122012152629_31.jpg', 'IMG_3079', 1, 49, 1200, 800, 'jpeg', ''),
(453, 0, 147, 0, '1_147_13122012152629_32.jpg', 'IMG_3080', 1, 50, 800, 1200, 'jpeg', ''),
(454, 0, 147, 0, '1_147_13122012152629_33.jpg', 'IMG_3081', 1, 51, 800, 1200, 'jpeg', ''),
(455, 0, 147, 0, '1_147_13122012152629_34.jpg', 'IMG_3082', 1, 52, 799, 1200, 'jpeg', ''),
(456, 0, 147, 0, '1_147_13122012152629_35.jpg', 'IMG_3083', 1, 53, 799, 1200, 'jpeg', ''),
(457, 0, 147, 0, '1_147_13122012152629_36.jpg', 'IMG_3084', 1, 54, 1200, 800, 'jpeg', ''),
(458, 0, 147, 0, '1_147_13122012152705_1.jpg', 'IMG_3086', 1, 55, 800, 1200, 'jpeg', ''),
(459, 0, 147, 0, '1_147_13122012152705_2.jpg', 'IMG_3088', 1, 56, 799, 1200, 'jpeg', ''),
(460, 0, 147, 0, '1_147_13122012152705_3.jpg', 'IMG_3090', 1, 57, 800, 1200, 'jpeg', ''),
(461, 0, 147, 0, '1_147_13122012152705_4.jpg', 'IMG_3094', 1, 58, 800, 1200, 'jpeg', ''),
(462, 0, 147, 0, '1_147_13122012152705_5.jpg', 'IMG_3096', 1, 59, 800, 1200, 'jpeg', ''),
(463, 0, 147, 0, '1_147_13122012152705_6.jpg', 'IMG_3097', 1, 60, 1200, 800, 'jpeg', ''),
(464, 0, 147, 0, '1_147_13122012152705_7.jpg', 'IMG_3101', 1, 61, 1200, 800, 'jpeg', ''),
(465, 0, 147, 0, '1_147_13122012152705_8.jpg', 'IMG_3102', 1, 62, 1200, 800, 'jpeg', ''),
(466, 0, 147, 0, '1_147_13122012152705_9.jpg', 'IMG_3104', 1, 63, 1200, 800, 'jpeg', ''),
(467, 0, 147, 0, '1_147_13122012152705_10.jpg', 'IMG_3112', 1, 64, 1199, 800, 'jpeg', ''),
(468, 0, 147, 0, '1_147_13122012152705_11.jpg', 'IMG_3113', 1, 65, 1199, 800, 'jpeg', ''),
(469, 0, 147, 0, '1_147_13122012152705_12.jpg', 'IMG_3114', 1, 66, 1200, 800, 'jpeg', ''),
(470, 0, 147, 0, '1_147_13122012152705_13.jpg', 'IMG_3116', 1, 67, 1200, 800, 'jpeg', ''),
(471, 0, 147, 0, '1_147_13122012152705_14.jpg', 'IMG_3119', 1, 68, 1200, 800, 'jpeg', ''),
(472, 0, 147, 0, '1_147_13122012152705_15.jpg', 'IMG_3121', 1, 69, 1200, 800, 'jpeg', ''),
(473, 0, 147, 0, '1_147_13122012152705_16.jpg', 'IMG_3124', 1, 70, 800, 1200, 'jpeg', ''),
(474, 0, 147, 0, '1_147_13122012152705_17.jpg', 'IMG_3125', 1, 71, 1200, 800, 'jpeg', ''),
(475, 0, 147, 0, '1_147_13122012152705_18.jpg', 'IMG_3126', 1, 72, 1200, 800, 'jpeg', ''),
(476, 0, 147, 0, '1_147_13122012152705_19.jpg', 'IMG_3129', 1, 73, 799, 1200, 'jpeg', ''),
(477, 0, 147, 0, '1_147_13122012152705_20.jpg', 'IMG_3133', 1, 74, 1200, 800, 'jpeg', ''),
(478, 0, 147, 0, '1_147_13122012152705_21.jpg', 'IMG_3134', 1, 75, 1199, 800, 'jpeg', ''),
(479, 0, 147, 0, '1_147_13122012152705_22.jpg', 'IMG_3137', 1, 76, 800, 1200, 'jpeg', ''),
(480, 0, 147, 0, '1_147_13122012152705_23.jpg', 'IMG_3138', 1, 77, 1200, 800, 'jpeg', ''),
(481, 0, 147, 0, '1_147_13122012152705_24.jpg', 'IMG_3143', 1, 78, 1200, 800, 'jpeg', ''),
(482, 0, 147, 0, '1_147_13122012152705_25.jpg', 'IMG_3144', 1, 79, 1200, 800, 'jpeg', ''),
(483, 0, 147, 0, '1_147_13122012152705_26.jpg', 'IMG_3148', 1, 80, 1199, 800, 'jpeg', ''),
(484, 0, 147, 0, '1_147_13122012152705_27.jpg', 'IMG_3153', 1, 81, 1199, 800, 'jpeg', ''),
(485, 0, 147, 0, '1_147_13122012152705_28.jpg', 'IMG_3155', 1, 82, 1200, 800, 'jpeg', ''),
(486, 0, 147, 0, '1_147_13122012152705_29.jpg', 'IMG_3158', 1, 83, 1199, 800, 'jpeg', ''),
(487, 0, 147, 0, '1_147_13122012152705_30.jpg', 'IMG_3160', 1, 84, 800, 1200, 'jpeg', ''),
(488, 0, 147, 0, '1_147_13122012152705_31.jpg', 'IMG_3161', 1, 85, 1200, 800, 'jpeg', ''),
(489, 0, 147, 0, '1_147_13122012152705_32.jpg', 'IMG_3162', 1, 86, 1200, 800, 'jpeg', ''),
(490, 0, 147, 0, '1_147_13122012152705_33.jpg', 'IMG_3163', 1, 87, 1199, 800, 'jpeg', ''),
(491, 0, 147, 0, '1_147_13122012152705_34.jpg', 'IMG_3167', 1, 88, 800, 1200, 'jpeg', ''),
(492, 0, 147, 0, '1_147_13122012152705_35.jpg', 'IMG_3168', 1, 89, 1200, 800, 'jpeg', ''),
(493, 0, 147, 0, '1_147_13122012152705_36.jpg', 'IMG_3169', 1, 90, 1200, 800, 'jpeg', ''),
(494, 0, 147, 0, '1_147_13122012152705_37.jpg', 'IMG_3173', 1, 91, 1199, 800, 'jpeg', ''),
(495, 0, 147, 0, '1_147_13122012152705_38.jpg', 'IMG_3176', 1, 92, 1199, 800, 'jpeg', ''),
(496, 0, 147, 0, '1_147_13122012152705_39.jpg', 'IMG_3177', 1, 93, 1200, 800, 'jpeg', ''),
(497, 0, 147, 0, '1_147_13122012152705_40.jpg', 'IMG_3180', 1, 94, 1200, 800, 'jpeg', ''),
(498, 0, 147, 0, '1_147_13122012152705_41.jpg', 'IMG_3182', 1, 95, 1200, 800, 'jpeg', ''),
(499, 0, 147, 0, '1_147_13122012152705_42.jpg', 'IMG_3187', 1, 96, 1200, 800, 'jpeg', ''),
(500, 0, 147, 0, '1_147_13122012152705_43.jpg', 'IMG_3190', 1, 97, 1200, 800, 'jpeg', ''),
(501, 0, 147, 0, '1_147_13122012152705_44.jpg', 'IMG_3192', 1, 98, 1199, 800, 'jpeg', ''),
(502, 0, 147, 0, '1_147_13122012152705_45.jpg', 'IMG_3193', 1, 99, 1199, 800, 'jpeg', ''),
(503, 0, 147, 0, '1_147_13122012152705_46.jpg', 'IMG_3195', 1, 100, 1200, 800, 'jpeg', ''),
(504, 0, 147, 0, '1_147_13122012152705_47.jpg', 'IMG_3197', 1, 101, 1200, 800, 'jpeg', ''),
(505, 0, 147, 0, '1_147_13122012152705_48.jpg', 'IMG_3199', 1, 102, 1200, 800, 'jpeg', ''),
(506, 0, 147, 0, '1_147_13122012152705_49.jpg', 'IMG_3200', 1, 103, 1200, 800, 'jpeg', ''),
(507, 0, 147, 0, '1_147_13122012152705_50.jpg', 'IMG_3208', 1, 104, 1199, 800, 'jpeg', ''),
(508, 0, 147, 0, '1_147_13122012152843_1.jpg', 'IMG_3241', 1, 105, 1200, 800, 'jpeg', ''),
(509, 0, 147, 0, '1_147_13122012152843_2.jpg', 'IMG_3242', 1, 106, 800, 1200, 'jpeg', ''),
(510, 0, 147, 0, '1_147_13122012152843_3.jpg', 'IMG_3244', 1, 107, 800, 1200, 'jpeg', ''),
(511, 0, 147, 0, '1_147_13122012152843_4.jpg', 'IMG_3246', 1, 108, 1199, 800, 'jpeg', ''),
(512, 0, 147, 0, '1_147_13122012152843_5.jpg', 'IMG_3247', 1, 109, 1200, 800, 'jpeg', ''),
(513, 0, 147, 0, '1_147_13122012152843_6.jpg', 'IMG_3255', 1, 110, 1199, 800, 'jpeg', ''),
(514, 0, 147, 0, '1_147_13122012152843_7.jpg', 'IMG_3257', 1, 111, 1199, 800, 'jpeg', ''),
(515, 0, 147, 0, '1_147_13122012152843_8.jpg', 'IMG_3259', 1, 112, 1200, 800, 'jpeg', ''),
(516, 0, 147, 0, '1_147_13122012152843_9.jpg', 'IMG_3261', 1, 113, 1200, 800, 'jpeg', ''),
(517, 0, 147, 0, '1_147_13122012152843_10.jpg', 'IMG_3262', 1, 114, 1200, 800, 'jpeg', ''),
(518, 0, 147, 0, '1_147_13122012152843_11.jpg', 'IMG_3264', 1, 115, 799, 1200, 'jpeg', ''),
(519, 0, 147, 0, '1_147_13122012152843_12.jpg', 'IMG_3266', 1, 116, 1200, 800, 'jpeg', ''),
(520, 0, 147, 0, '1_147_13122012152843_13.jpg', 'IMG_3267', 1, 117, 1200, 800, 'jpeg', ''),
(521, 0, 147, 0, '1_147_13122012152843_14.jpg', 'IMG_3269', 1, 118, 1199, 800, 'jpeg', ''),
(522, 0, 147, 0, '1_147_13122012152843_15.jpg', 'IMG_3270', 1, 119, 1200, 800, 'jpeg', ''),
(523, 0, 147, 0, '1_147_13122012152843_16.jpg', 'IMG_3273', 1, 120, 1200, 800, 'jpeg', ''),
(524, 0, 147, 0, '1_147_13122012152843_17.jpg', 'IMG_3274', 1, 121, 1200, 800, 'jpeg', ''),
(525, 0, 147, 0, '1_147_13122012152843_18.jpg', 'IMG_3275', 1, 122, 1200, 800, 'jpeg', ''),
(526, 0, 147, 0, '1_147_13122012152843_19.jpg', 'IMG_3276', 1, 123, 1199, 800, 'jpeg', ''),
(527, 0, 147, 0, '1_147_13122012152843_20.jpg', 'IMG_3279', 1, 124, 1200, 800, 'jpeg', ''),
(528, 0, 147, 0, '1_147_13122012152843_21.jpg', 'IMG_3284', 1, 125, 1200, 800, 'jpeg', ''),
(529, 0, 147, 0, '1_147_13122012152843_22.jpg', 'IMG_3285', 1, 126, 1200, 800, 'jpeg', ''),
(530, 0, 147, 0, '1_147_13122012152843_23.jpg', 'IMG_3291', 1, 127, 1200, 800, 'jpeg', ''),
(531, 0, 147, 0, '1_147_13122012152843_24.jpg', 'IMG_3293', 1, 128, 1199, 800, 'jpeg', ''),
(532, 0, 147, 0, '1_147_13122012152843_25.jpg', 'IMG_3296', 1, 129, 1200, 800, 'jpeg', ''),
(533, 0, 147, 0, '1_147_13122012152843_26.jpg', 'IMG_3299', 1, 130, 1200, 800, 'jpeg', ''),
(534, 0, 147, 0, '1_147_13122012152843_27.jpg', 'IMG_3301', 1, 131, 1200, 800, 'jpeg', ''),
(535, 0, 147, 0, '1_147_13122012152843_28.jpg', 'IMG_3303', 1, 132, 800, 1200, 'jpeg', ''),
(536, 0, 147, 0, '1_147_13122012152843_29.jpg', 'IMG_3306', 1, 133, 799, 1200, 'jpeg', ''),
(537, 0, 147, 0, '1_147_13122012152843_30.jpg', 'IMG_3309', 1, 134, 800, 1200, 'jpeg', ''),
(538, 0, 147, 0, '1_147_13122012152843_31.jpg', 'IMG_3311', 1, 135, 1200, 800, 'jpeg', ''),
(539, 0, 147, 0, '1_147_13122012152843_32.jpg', 'IMG_3312', 1, 136, 1200, 800, 'jpeg', ''),
(540, 0, 147, 0, '1_147_13122012152843_33.jpg', 'IMG_3314', 1, 137, 1200, 800, 'jpeg', ''),
(541, 0, 147, 0, '1_147_13122012152843_34.jpg', 'IMG_3316', 1, 138, 1200, 800, 'jpeg', ''),
(542, 0, 147, 0, '1_147_13122012152843_35.jpg', 'IMG_3317', 1, 139, 1200, 800, 'jpeg', ''),
(543, 0, 147, 0, '1_147_13122012152843_36.jpg', 'IMG_3320', 1, 140, 1200, 800, 'jpeg', ''),
(544, 0, 147, 0, '1_147_13122012152843_37.jpg', 'IMG_3322', 1, 141, 799, 1200, 'jpeg', ''),
(545, 0, 147, 0, '1_147_13122012152843_38.jpg', 'IMG_3324', 1, 142, 800, 1200, 'jpeg', ''),
(546, 0, 147, 0, '1_147_13122012152843_39.jpg', 'IMG_3326', 1, 143, 799, 1200, 'jpeg', ''),
(547, 0, 147, 0, '1_147_13122012152843_40.jpg', 'IMG_3329', 1, 144, 799, 1200, 'jpeg', ''),
(548, 0, 147, 0, '1_147_13122012152843_41.jpg', 'IMG_3330', 1, 145, 1200, 800, 'jpeg', ''),
(549, 0, 147, 0, '1_147_13122012152843_42.jpg', 'IMG_3334', 1, 146, 1200, 800, 'jpeg', ''),
(550, 0, 147, 0, '1_147_13122012152843_43.jpg', 'IMG_3335', 1, 147, 800, 1200, 'jpeg', ''),
(551, 0, 147, 0, '1_147_13122012152843_44.jpg', 'IMG_3342', 1, 148, 1200, 800, 'jpeg', ''),
(552, 0, 147, 0, '1_147_13122012152843_45.jpg', 'IMG_3346', 1, 149, 1199, 800, 'jpeg', ''),
(553, 0, 147, 0, '1_147_13122012152843_46.jpg', 'IMG_3347', 1, 150, 799, 1200, 'jpeg', ''),
(554, 0, 147, 0, '1_147_13122012152843_47.jpg', 'IMG_3348', 1, 151, 1200, 800, 'jpeg', ''),
(555, 0, 147, 0, '1_147_13122012152843_48.jpg', 'IMG_3351', 1, 152, 1199, 800, 'jpeg', ''),
(556, 0, 147, 0, '1_147_13122012152843_49.jpg', 'IMG_3356', 1, 153, 800, 1200, 'jpeg', ''),
(557, 0, 147, 0, '1_147_13122012152843_50.jpg', 'IMG_3358_1', 1, 154, 799, 1200, 'jpeg', ''),
(558, 0, 147, 0, '1_147_13122012152948_1.jpg', 'IMG_3487', 1, 155, 800, 1200, 'jpeg', ''),
(559, 0, 147, 0, '1_147_13122012152948_2.jpg', 'IMG_3491', 1, 156, 1199, 800, 'jpeg', ''),
(560, 0, 147, 0, '1_147_13122012152948_3.jpg', 'IMG_3497', 1, 157, 1199, 800, 'jpeg', ''),
(561, 0, 147, 0, '1_147_13122012152948_4.jpg', 'IMG_3511', 1, 158, 1200, 800, 'jpeg', ''),
(562, 0, 147, 0, '1_147_13122012152948_5.jpg', 'IMG_3513', 1, 159, 1200, 800, 'jpeg', ''),
(563, 0, 147, 0, '1_147_13122012152948_6.jpg', 'IMG_3516', 1, 160, 1200, 800, 'jpeg', ''),
(564, 0, 147, 0, '1_147_13122012152948_7.jpg', 'IMG_3520', 1, 161, 1199, 800, 'jpeg', ''),
(565, 0, 147, 0, '1_147_13122012152948_8.jpg', 'IMG_3525_1', 1, 162, 1200, 800, 'jpeg', ''),
(566, 0, 147, 0, '1_147_13122012152948_9.jpg', 'IMG_3530', 1, 163, 1200, 800, 'jpeg', ''),
(567, 0, 147, 0, '1_147_13122012152948_10.jpg', 'IMG_3534', 1, 164, 1200, 800, 'jpeg', ''),
(568, 0, 147, 0, '1_147_13122012152948_11.jpg', 'IMG_3547', 1, 165, 1200, 800, 'jpeg', ''),
(569, 0, 147, 0, '1_147_13122012152948_12.jpg', 'IMG_3549', 1, 166, 1200, 800, 'jpeg', ''),
(570, 0, 147, 0, '1_147_13122012152948_13.jpg', 'IMG_3553', 1, 167, 1200, 800, 'jpeg', ''),
(571, 0, 147, 0, '1_147_13122012152948_14.jpg', 'IMG_3555', 1, 168, 800, 1200, 'jpeg', ''),
(572, 0, 147, 0, '1_147_13122012152948_15.jpg', 'IMG_3556', 1, 169, 800, 1200, 'jpeg', ''),
(573, 0, 147, 0, '1_147_13122012152948_16.jpg', 'IMG_3565', 1, 170, 1200, 638, 'jpeg', ''),
(574, 0, 147, 0, '1_147_13122012152948_17.jpg', 'IMG_3573', 1, 171, 1200, 800, 'jpeg', ''),
(575, 0, 147, 0, '1_147_13122012152948_18.jpg', 'IMG_3577', 1, 172, 1200, 658, 'jpeg', ''),
(576, 0, 147, 0, '1_147_13122012152948_19.jpg', 'IMG_3578', 1, 173, 1200, 743, 'jpeg', ''),
(577, 0, 147, 0, '1_147_13122012152948_20.jpg', 'IMG_3581', 1, 174, 1200, 800, 'jpeg', ''),
(578, 0, 147, 0, '1_147_13122012152948_21.jpg', 'IMG_3585', 1, 175, 1200, 800, 'jpeg', ''),
(579, 0, 147, 0, '1_147_13122012152948_22.jpg', 'IMG_3589', 1, 176, 1199, 800, 'jpeg', ''),
(580, 0, 147, 0, '1_147_13122012152948_23.jpg', 'IMG_3590', 1, 177, 1200, 800, 'jpeg', ''),
(581, 0, 147, 0, '1_147_13122012152948_24.jpg', 'IMG_3591', 1, 178, 1199, 800, 'jpeg', ''),
(582, 0, 147, 0, '1_147_13122012152948_25.jpg', 'IMG_3596', 1, 179, 1200, 800, 'jpeg', ''),
(583, 0, 147, 0, '1_147_13122012152948_26.jpg', 'IMG_3603', 1, 180, 1200, 800, 'jpeg', ''),
(584, 0, 147, 0, '1_147_13122012152948_27.jpg', 'IMG_3605', 1, 181, 1199, 800, 'jpeg', ''),
(585, 0, 147, 0, '1_147_13122012152948_28.jpg', 'IMG_3611', 1, 182, 1200, 710, 'jpeg', ''),
(586, 0, 147, 0, '1_147_13122012152948_29.jpg', 'IMG_3613', 1, 183, 1200, 712, 'jpeg', ''),
(587, 0, 147, 0, '1_147_13122012152948_30.jpg', 'IMG_3615', 1, 184, 1200, 800, 'jpeg', ''),
(588, 0, 147, 0, '1_147_13122012152948_31.jpg', 'IMG_3622', 1, 185, 1200, 800, 'jpeg', ''),
(589, 0, 147, 0, '1_147_13122012152948_32.jpg', 'IMG_3625', 1, 186, 1200, 800, 'jpeg', ''),
(590, 0, 147, 0, '1_147_13122012152948_33.jpg', 'IMG_3630', 1, 187, 1200, 800, 'jpeg', ''),
(591, 0, 147, 0, '1_147_13122012152948_34.jpg', 'IMG_3631', 1, 188, 1200, 800, 'jpeg', ''),
(592, 0, 147, 0, '1_147_13122012152948_35.jpg', 'IMG_3645', 1, 189, 1199, 800, 'jpeg', ''),
(593, 0, 147, 0, '1_147_13122012152948_36.jpg', 'IMG_3646', 1, 190, 1200, 800, 'jpeg', ''),
(594, 0, 147, 0, '1_147_13122012152948_37.jpg', 'IMG_3650', 1, 191, 1200, 800, 'jpeg', ''),
(595, 0, 147, 0, '1_147_13122012152948_38.jpg', 'IMG_3651', 1, 192, 800, 1200, 'jpeg', ''),
(596, 0, 147, 0, '1_147_13122012152948_39.jpg', 'IMG_3654', 1, 193, 799, 1200, 'jpeg', ''),
(597, 0, 147, 0, '1_147_13122012152948_40.jpg', 'IMG_3655', 1, 194, 1200, 800, 'jpeg', ''),
(598, 0, 147, 0, '1_147_13122012152948_41.jpg', 'IMG_3665', 1, 195, 1200, 702, 'jpeg', ''),
(599, 0, 147, 0, '1_147_13122012152948_42.jpg', 'IMG_3667', 1, 196, 1200, 800, 'jpeg', ''),
(600, 0, 147, 0, '1_147_13122012152948_43.jpg', 'IMG_3669', 1, 197, 1200, 800, 'jpeg', ''),
(601, 0, 147, 0, '1_147_13122012152948_44.jpg', 'IMG_3670', 1, 198, 1200, 800, 'jpeg', ''),
(602, 0, 147, 0, '1_147_13122012152948_45.jpg', 'IMG_3679', 1, 199, 1200, 800, 'jpeg', ''),
(603, 0, 147, 0, '1_147_13122012152948_46.jpg', 'IMG_3683', 1, 200, 1200, 800, 'jpeg', ''),
(604, 0, 147, 0, '1_147_13122012152948_47.jpg', 'IMG_3685', 1, 201, 1199, 800, 'jpeg', ''),
(605, 0, 147, 0, '1_147_13122012152948_48.jpg', 'IMG_3688', 1, 202, 1200, 800, 'jpeg', ''),
(606, 0, 147, 0, '1_147_13122012152948_49.jpg', 'IMG_3691', 1, 203, 1200, 800, 'jpeg', ''),
(607, 0, 147, 0, '1_147_13122012152948_50.jpg', 'IMG_3695', 1, 204, 800, 800, 'jpeg', ''),
(608, 0, 147, 0, '1_147_13122012153034_1.jpg', 'IMG_3845', 1, 205, 800, 1200, 'jpeg', ''),
(609, 0, 147, 0, '1_147_13122012153034_2.jpg', 'IMG_3856', 1, 206, 1200, 800, 'jpeg', ''),
(610, 0, 147, 0, '1_147_13122012153034_3.jpg', 'IMG_3858', 1, 207, 1200, 800, 'jpeg', ''),
(611, 0, 147, 0, '1_147_13122012153034_4.jpg', 'IMG_3859', 1, 208, 1199, 800, 'jpeg', ''),
(612, 0, 147, 0, '1_147_13122012153034_5.jpg', 'IMG_3863', 1, 209, 1200, 800, 'jpeg', ''),
(613, 0, 147, 0, '1_147_13122012153034_6.jpg', 'IMG_3865', 1, 210, 1200, 800, 'jpeg', ''),
(614, 0, 147, 0, '1_147_13122012153034_7.jpg', 'IMG_3868', 1, 211, 1199, 800, 'jpeg', ''),
(615, 0, 147, 0, '1_147_13122012153034_8.jpg', 'IMG_3874', 1, 212, 1200, 800, 'jpeg', ''),
(616, 0, 147, 0, '1_147_13122012153034_9.jpg', 'IMG_3875', 1, 213, 1200, 800, 'jpeg', ''),
(617, 0, 147, 0, '1_147_13122012153034_10.jpg', 'IMG_3886', 1, 214, 800, 1200, 'jpeg', ''),
(618, 0, 147, 0, '1_147_13122012153034_11.jpg', 'IMG_3892', 1, 215, 1200, 800, 'jpeg', ''),
(619, 0, 147, 0, '1_147_13122012153034_12.jpg', 'IMG_3894', 1, 216, 1200, 800, 'jpeg', ''),
(620, 0, 147, 0, '1_147_13122012153034_13.jpg', 'IMG_3896', 1, 217, 1199, 800, 'jpeg', ''),
(621, 0, 147, 0, '1_147_13122012153034_14.jpg', 'IMG_3900', 1, 218, 1200, 800, 'jpeg', ''),
(622, 0, 147, 0, '1_147_13122012153034_15.jpg', 'IMG_3901', 1, 219, 1200, 800, 'jpeg', ''),
(623, 0, 147, 0, '1_147_13122012153034_16.jpg', 'IMG_3902', 1, 220, 1200, 800, 'jpeg', ''),
(624, 0, 147, 0, '1_147_13122012153034_17.jpg', 'IMG_3905', 1, 221, 1200, 800, 'jpeg', ''),
(625, 0, 147, 0, '1_147_13122012153034_18.jpg', 'IMG_3906', 1, 222, 1199, 800, 'jpeg', ''),
(626, 0, 147, 0, '1_147_13122012153034_19.jpg', 'IMG_3907', 1, 223, 1200, 800, 'jpeg', ''),
(627, 0, 147, 0, '1_147_13122012153034_20.jpg', 'IMG_3908', 1, 224, 1200, 800, 'jpeg', ''),
(628, 0, 147, 0, '1_147_13122012153034_21.jpg', 'IMG_3909', 1, 225, 799, 1200, 'jpeg', ''),
(629, 0, 147, 0, '1_147_13122012153034_22.jpg', 'IMG_3914', 1, 226, 1200, 800, 'jpeg', ''),
(630, 0, 147, 0, '1_147_13122012153034_23.jpg', 'IMG_3921', 1, 227, 1199, 800, 'jpeg', ''),
(631, 0, 147, 0, '1_147_13122012153034_24.jpg', 'IMG_3925', 1, 228, 800, 1200, 'jpeg', ''),
(632, 0, 147, 0, '1_147_13122012153034_25.jpg', 'IMG_3927', 1, 229, 800, 1200, 'jpeg', ''),
(633, 0, 147, 0, '1_147_13122012153034_26.jpg', 'IMG_3931', 1, 230, 800, 1200, 'jpeg', ''),
(634, 0, 147, 0, '1_147_13122012153034_27.jpg', 'IMG_3936', 1, 231, 1199, 800, 'jpeg', ''),
(635, 0, 147, 0, '1_147_13122012153034_28.jpg', 'IMG_3943', 1, 232, 1200, 800, 'jpeg', ''),
(636, 0, 147, 0, '1_147_13122012153034_29.jpg', 'IMG_3944', 1, 233, 1200, 800, 'jpeg', ''),
(637, 0, 147, 0, '1_147_13122012153034_30.jpg', 'IMG_3957', 1, 234, 1200, 800, 'jpeg', ''),
(638, 0, 147, 0, '1_147_13122012153034_31.jpg', 'IMG_3959', 1, 235, 1200, 800, 'jpeg', ''),
(639, 0, 147, 0, '1_147_13122012153034_32.jpg', 'IMG_3960', 1, 236, 1199, 800, 'jpeg', ''),
(640, 0, 147, 0, '1_147_13122012153034_33.jpg', 'IMG_3962', 1, 237, 1200, 800, 'jpeg', ''),
(641, 0, 147, 0, '1_147_13122012153034_34.jpg', 'IMG_3964', 1, 238, 1199, 800, 'jpeg', ''),
(642, 0, 147, 0, '1_147_13122012153034_35.jpg', 'IMG_3965', 1, 239, 1200, 744, 'jpeg', ''),
(643, 0, 147, 0, '1_147_13122012153034_36.jpg', 'IMG_3968', 1, 240, 1200, 721, 'jpeg', ''),
(644, 0, 147, 0, '1_147_13122012153034_37.jpg', 'IMG_3975', 1, 241, 1200, 694, 'jpeg', ''),
(645, 0, 147, 0, '1_147_13122012153034_38.jpg', 'IMG_3981', 1, 242, 1200, 717, 'jpeg', ''),
(646, 0, 147, 0, '1_147_13122012153034_39.jpg', 'IMG_3986', 1, 243, 1200, 800, 'jpeg', ''),
(647, 0, 147, 0, '1_147_13122012153034_40.jpg', 'IMG_3994', 1, 244, 1200, 800, 'jpeg', ''),
(648, 0, 147, 0, '1_147_13122012153034_41.jpg', 'IMG_3996', 1, 245, 799, 1200, 'jpeg', ''),
(649, 0, 147, 0, '1_147_13122012153034_42.jpg', 'IMG_4003', 1, 246, 1200, 800, 'jpeg', ''),
(650, 0, 147, 0, '1_147_13122012153034_43.jpg', 'IMG_4006', 1, 247, 1200, 800, 'jpeg', ''),
(651, 0, 147, 0, '1_147_13122012153034_44.jpg', 'IMG_4009', 1, 248, 1200, 755, 'jpeg', ''),
(652, 0, 147, 0, '1_147_13122012153034_45.jpg', 'IMG_4017', 1, 249, 1200, 770, 'jpeg', ''),
(653, 0, 147, 0, '1_147_13122012153034_46.jpg', 'IMG_4028', 1, 250, 1200, 770, 'jpeg', ''),
(654, 0, 147, 0, '1_147_13122012153034_47.jpg', 'IMG_4029', 1, 251, 1200, 703, 'jpeg', ''),
(655, 0, 147, 0, '1_147_13122012153034_48.jpg', 'IMG_4034', 1, 252, 1200, 665, 'jpeg', ''),
(656, 0, 147, 0, '1_147_13122012153034_49.jpg', 'IMG_4035', 1, 253, 1200, 750, 'jpeg', ''),
(657, 0, 147, 0, '1_147_13122012153034_50.jpg', 'IMG_4037', 1, 254, 1200, 800, 'jpeg', ''),
(658, 0, 148, 1, '1_148_13122012153653_1.jpg', 'Скидка до 50%', 1, 1, 612, 858, 'jpeg', ''),
(659, 0, 149, 1, '1_149_13122012154119_1.jpg', 'main', 1, 1, 840, 560, 'jpeg', ''),
(663, 0, 151, 1, '1_151_17122012180239_1.jpg', 'icon', 1, 1, 72, 91, 'png', ''),
(664, 0, 153, 1, '1_153_19122012112502_1.jpg', 'logo', 1, 1, 173, 94, 'png', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mainmenu`
--

CREATE TABLE IF NOT EXISTS `mainmenu` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(200) default NULL,
  `link` varchar(200) default NULL,
  `invisible` int(11) NOT NULL default '0',
  `showorder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `name`) VALUES
(1, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `menuitem`
--

CREATE TABLE IF NOT EXISTS `menuitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `menuid` bigint(20) NOT NULL default '0',
  `parentid` bigint(20) NOT NULL default '-1',
  `title` varchar(200) NOT NULL default '',
  `link` varchar(250) NOT NULL default '',
  `childsql` text NOT NULL,
  `showorder` int(11) NOT NULL default '0',
  `linktemplate` varchar(250) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Дамп данных таблицы `menuitem`
--

INSERT INTO `menuitem` (`id`, `menuid`, `parentid`, `title`, `link`, `childsql`, `showorder`, `linktemplate`) VALUES
(1, 1, -1, 'Администрирование', '#', '', 29, ''),
(2, 1, 1, 'Пользователи', 'index.php?t=users', '', 1, ''),
(3, 1, 1, 'Интерфейсы', 'index.php?t=menu', '', 2, ''),
(16, 1, 1, 'Модули', 'index.php?t=modules', '', 3, ''),
(17, 1, -1, 'Формы', '#', '', 21, ''),
(18, 1, 17, 'Создать / редактировать', 'index.php?t=requestgroup', '', 1, ''),
(19, 1, 17, 'Виды форм', '', 'SELECT * FROM requestgroup', 2, '<a href=''index.php?t=requests&parent=[id]''>[name]</a>'),
(22, 1, 1, 'Настройки', 'index.php?t=settings', '', 4, ''),
(28, 1, -1, 'Области контента', 'index.php?t=contentarea', '', 22, ''),
(29, 1, -1, 'Контент', 'index.php?t=content&sort=showorder+ASC', '', 16, ''),
(40, 1, -1, 'Новости', 'index.php?t=news&sort=ndate+DESC', '', 18, ''),
(89, 1, -1, 'Настройка меню', 'index.php?t=mainmenu', '', 30, ''),
(92, 1, 29, 'Тип новости', 'index.php?t=showtype', '', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL auto_increment,
  `create_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `subject` text NOT NULL,
  `info` text NOT NULL,
  `user_form` int(11) NOT NULL default '0',
  `user_to` int(11) NOT NULL default '0',
  `isread` int(11) NOT NULL default '0',
  `fvisible` int(11) NOT NULL default '1',
  `tvisible` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `path` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `modules`
--

INSERT INTO `modules` (`id`, `name`, `path`) VALUES
(11, 'Главная страница', 'templates/default.html'),
(13, 'Карта сайта', 'templates/sitemap.php'),
(14, 'Рестораны', 'templates/restorauns.php'),
(15, 'Галерея', 'templates/gallery.php'),
(16, 'Партнеры', 'templates/partners.php'),
(17, 'Магазины', 'templates/shops.php'),
(18, 'О ТРК', 'templates/about.php'),
(19, 'Обратная связь', 'templates/feedback.php'),
(20, 'Карта проезда', 'templates/karta.php'),
(21, 'Контакты', 'templates/kontakty.php'),
(22, 'Схема', 'templates/shema.php'),
(23, 'Типы новостей', 'templates/action_activity.php');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `ndate` date NOT NULL default '0000-00-00',
  `title` text NOT NULL,
  `info` text NOT NULL,
  `in_index` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `userid`, `ndate`, `title`, `info`, `in_index`) VALUES
(4, -1, '2012-12-11', 'С 19 по 30 декабря в &quot;РайON&quot; тебя ждет Дед Мороз!', '&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;С 19 по 30 декабря, ежедневно с 12:00 до 19:00, в торгово-развлекательном центре &amp;quot;РайON&amp;quot; тебя ждет Дед Мороз!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;Сделай три шага к своему новогоднему желанию:&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;1.Приходи в &amp;quot;РайON&amp;quot;!&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;2.Расскажи Дедушке хорошо ли ты себя вел весь год&lt;/span&gt;&lt;/p&gt;\r\n&lt;p style=&quot;font-family: arial, sans-serif; font-size: 13px; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; text-align: justify; line-height: 10.5pt;&quot;&gt;\r\n	&lt;span style=&quot;font-size: 9pt; font-family: Arial, sans-serif; color: rgb(40, 40, 40);&quot;&gt;3.Получи волшебный Свиток, который исполняет желания!&lt;/span&gt;&lt;/p&gt;\r\n', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `newstype`
--

CREATE TABLE IF NOT EXISTS `newstype` (
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `sortorder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `caption` varchar(200) NOT NULL default '',
  `title` varchar(200) NOT NULL default '',
  `description` varchar(200) NOT NULL default '',
  `keywords` varchar(200) NOT NULL default '',
  `script` bigint(20) NOT NULL default '0',
  `formid` bigint(20) NOT NULL default '0',
  `page_content` text NOT NULL,
  PRIMARY KEY  (`id`),
  FULLTEXT KEY `page_content` (`page_content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `qitem`
--

CREATE TABLE IF NOT EXISTS `qitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `parentid` bigint(20) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `click` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` text NOT NULL,
  `start_date` date NOT NULL default '0000-00-00',
  `finish_date` date NOT NULL default '0000-00-00',
  `invisible` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `id` bigint(20) NOT NULL auto_increment,
  `parentid` bigint(20) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `fieldtype` int(11) NOT NULL default '0',
  `items` text NOT NULL,
  `isrequired` int(11) NOT NULL default '0',
  `showorder` int(11) NOT NULL default '0',
  `modules` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `parentid`, `title`, `description`, `fieldtype`, `items`, `isrequired`, `showorder`, `modules`) VALUES
(1, 2, 'Ваше Имя:', '', 1, '', 1, 1, ''),
(2, 2, 'Ваш E-Mail:', '', 5, '', 1, 2, ''),
(4, 2, 'Сообщение:', '', 4, '', 1, 4, ''),
(14, 4, 'Продукт:', '', 2, 'Интернет магазин - Старт, Интернет магазин-Бизнес,Сайт-Визитка, Бизнес-Сайт', 1, 1, ''),
(15, 4, 'Ваше Имя:', '', 1, '', 1, 2, ''),
(16, 4, 'Ваш E-mail:', '', 5, '', 0, 4, ''),
(17, 4, 'Ваш телефон:', '', 1, '', 1, 3, ''),
(18, 4, 'Доп. информация:', '', 4, '', 0, 5, ''),
(19, 5, 'Ваше Имя:', '', 1, '', 1, 1, ''),
(20, 5, 'Тема сообщения:', '', 1, '', 0, 2, ''),
(21, 5, 'Электронный адрес для ответа:', '', 5, '', 1, 3, ''),
(22, 5, 'Текст сообщения:', '', 4, '', 1, 4, ''),
(23, 6, 'Ваше Имя:', '', 1, '', 1, 1, ''),
(24, 6, 'Тема сообщения:', '', 1, '', 0, 2, ''),
(25, 6, 'Электронный адрес для ответа:', '', 5, '', 1, 3, ''),
(26, 6, 'Текст сообщения:', '', 4, '', 1, 4, ''),
(27, 7, 'Наименование организации', '', 1, '', 1, 1, ''),
(28, 7, 'Количество экземпляров журнала', '', 3, '', 1, 2, ''),
(29, 7, 'Контактная информация', 'Просим оставить адрес и номер телефона контактного лица, ответственного за прием тиража и перевод средств за заказ', 1, '', 1, 3, ''),
(31, 7, 'Дополнительная информация', '', 4, '', 0, 5, ''),
(32, 7, 'E-mail для связи', '', 5, '', 0, 6, ''),
(39, 8, 'E-mail', '', 5, '', 1, 3, ''),
(38, 8, 'Имя', '', 1, '', 1, 2, ''),
(36, 8, 'Тема', '', 2, 'Предложение по сотрудничеству, Обслуживание в ТРЦ,Другое', 1, 1, ''),
(40, 8, 'Сообщение', '', 4, '', 1, 5, ''),
(41, 8, 'Организация', '', 1, '', 1, 4, '');

-- --------------------------------------------------------

--
-- Структура таблицы `requestfieldtype`
--

CREATE TABLE IF NOT EXISTS `requestfieldtype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `requestfieldtype`
--

INSERT INTO `requestfieldtype` (`id`, `name`) VALUES
(1, 'Текст'),
(2, 'Список'),
(3, 'Число'),
(4, 'Длинный текст'),
(5, 'E-Mail'),
(6, 'Файл'),
(7, 'Программное'),
(8, 'Флажок');

-- --------------------------------------------------------

--
-- Структура таблицы `requestgroup`
--

CREATE TABLE IF NOT EXISTS `requestgroup` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(250) NOT NULL default '',
  `email` varchar(200) NOT NULL default '',
  `buttontext` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `requestgroup`
--

INSERT INTO `requestgroup` (`id`, `name`, `email`, `buttontext`) VALUES
(8, 'Форма обратной связи', '', 'Отправить');

-- --------------------------------------------------------

--
-- Структура таблицы `requestitem`
--

CREATE TABLE IF NOT EXISTS `requestitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `parentid` bigint(20) NOT NULL default '0',
  `fieldid` bigint(20) NOT NULL default '0',
  `val` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `requestitem`
--

INSERT INTO `requestitem` (`id`, `parentid`, `fieldid`, `val`) VALUES
(25, 8, 36, 'Тема1'),
(26, 8, 38, 'test'),
(27, 8, 39, 'dd@gg.gg'),
(28, 8, 41, 'test'),
(29, 8, 40, 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE IF NOT EXISTS `requests` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` date NOT NULL default '0000-00-00',
  `parentid` bigint(20) NOT NULL default '0',
  `ip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id`, `create_date`, `parentid`, `ip`) VALUES
(8, '2012-12-05', 8, '93.75.141.248');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(250) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `val` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `title`, `name`, `val`) VALUES
(1, 'E-Mail для контактов', 'contact_email', 'Natasha.Kurikalova@ppa.kiev.ua'),
(2, 'Общий TITLE', 'title', ''),
(3, 'Общий DESCRIPTION', 'description', ''),
(4, 'Общий KEYWORDS', 'keywords', ''),
(12, 'Массив цветов', 'color_array', '#40A828,#D26E00,#E6B278,#FF9C00,#B24932,#FFF5C7,#EFA93B'),
(13, 'Размер страниц', 'default_pagesize', '20');

-- --------------------------------------------------------

--
-- Структура таблицы `showtype`
--

CREATE TABLE IF NOT EXISTS `showtype` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `showtype`
--

INSERT INTO `showtype` (`id`, `name`) VALUES
(7, 'Акции'),
(6, 'Мероприятия');

-- --------------------------------------------------------

--
-- Структура таблицы `siteusers`
--

CREATE TABLE IF NOT EXISTS `siteusers` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `email` varchar(200) NOT NULL default '',
  `passw` varchar(200) NOT NULL default '',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_ip` varchar(200) NOT NULL default '',
  `isactive` int(11) NOT NULL default '0',
  `reject` int(11) NOT NULL default '0',
  `r46` text,
  `r47` text,
  `r48` text,
  `r49` text,
  `r50` text,
  `r52` text,
  `r54` text,
  `r55` text,
  `userregion` int(11) NOT NULL default '0',
  `r58` text,
  `r59` text,
  `isblog` int(11) NOT NULL default '0',
  `istrust` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `siteusers_fields`
--

CREATE TABLE IF NOT EXISTS `siteusers_fields` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(200) NOT NULL default '',
  `code` varchar(200) NOT NULL default '',
  `fieldtype` bigint(20) default NULL,
  `items` text NOT NULL,
  `isrequired` int(11) NOT NULL default '0',
  `showorder` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `siteusers_fields`
--

INSERT INTO `siteusers_fields` (`id`, `title`, `code`, `fieldtype`, `items`, `isrequired`, `showorder`) VALUES
(13, 'Фамилия', 'r46', 1, '', 0, 1),
(14, 'Имя', 'r47', 1, '', 0, 2),
(15, 'Сан (если есть)', 'r48', 1, '', 0, 3),
(16, 'Телефон', 'r49', 1, '', 0, 4),
(17, 'Организация', 'r50', 1, '', 0, 5),
(19, 'Должность:', 'r52', 1, '', 0, 7),
(25, 'Город', 'r58', 1, '', 0, 0),
(26, 'Адрес сайта (если есть)', 'r59', 1, '', 0, 0),
(22, 'О себе', 'r55', 4, '', 0, 20),
(21, 'Ваша цель регистрации на портале', 'r54', 4, '', 0, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` varchar(30) NOT NULL default '',
  `val` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `states`
--

INSERT INTO `states` (`id`, `val`) VALUES
('fields_id', '59');

-- --------------------------------------------------------

--
-- Структура таблицы `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
  `id` int(11) NOT NULL auto_increment,
  `email` text NOT NULL,
  `isactive` int(11) NOT NULL default '1',
  `create_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `code` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) character set cp1251 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL auto_increment,
  `login` varchar(200) NOT NULL default '',
  `passw` varchar(200) NOT NULL default '',
  `name` varchar(200) NOT NULL default '',
  `groupid` bigint(20) NOT NULL default '0',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_ip` varchar(50) NOT NULL default '',
  `menuid` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `passw`, `name`, `groupid`, `last_login`, `last_ip`, `menuid`) VALUES
(1, 'admin', 'admin', 'Администратор', -1, '2012-12-19 10:45:23', '93.75.141.248', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `usersgroup`
--

CREATE TABLE IF NOT EXISTS `usersgroup` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `menuid` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(11) NOT NULL auto_increment,
  `parentid` int(11) NOT NULL default '0',
  `source` int(11) NOT NULL default '1',
  `video` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
