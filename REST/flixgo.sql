-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 23, 2018 lúc 05:29 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `flixgo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id_cata` int(11) NOT NULL,
  `stt` int(11) NOT NULL,
  `name_cata` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id_cata`, `stt`, `name_cata`) VALUES
(4, 2, 'bbb'),
(5, 5, 'aaa'),
(6, 5123, 'aaa'),
(7, 0, 'aaa'),
(8, 0, 'aaa'),
(9, 3, 'aaa'),
(10, 6, 'aaa'),
(11, 6, 'aaa'),
(12, 6, 'aaa'),
(13, 0, 'aaa'),
(14, 6, 'aaa'),
(15, 0, 'aaa'),
(16, 5, 'aaa'),
(17, 1, 'aaa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date_comment` datetime DEFAULT NULL,
  `id_movie` int(11) NOT NULL,
  `full_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(50) DEFAULT NULL,
  `unlikes` int(50) DEFAULT NULL,
  `types` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_kids`
--

CREATE TABLE `comment_kids` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(50) NOT NULL,
  `unlikes` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id_country` int(11) NOT NULL,
  `name_country` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name_customer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `activated` tinyint(4) DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_pricing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `id_movie` int(11) NOT NULL,
  `name_movie` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `evaluate` float DEFAULT NULL,
  `evalute_view` float DEFAULT NULL,
  `release_year` int(50) NOT NULL,
  `running_time` int(50) NOT NULL,
  `id_country` int(11) NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clips` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(50) NOT NULL,
  `resolution` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_cata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_series`
--

CREATE TABLE `movie_series` (
  `id_series` int(11) NOT NULL,
  `episodes` int(50) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL,
  `clips` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photos`
--

CREATE TABLE `photos` (
  `id_photos` int(11) NOT NULL,
  `photos` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricing_plan`
--

CREATE TABLE `pricing_plan` (
  `id_pricing` int(11) NOT NULL,
  `package` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(250) NOT NULL,
  `time` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `availability` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `device` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `support` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `describe_1` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `describe_2` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id_cata`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `FK_comments_movie` (`id_movie`),
  ADD KEY `FK_comments_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_kids_comment` (`id_comment`),
  ADD KEY `FK_kids_customer` (`id_customer`);

--
-- Chỉ mục cho bảng `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id_country`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `FK_customer_pricing` (`id_pricing`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `FK_movie_catalog` (`id_cata`),
  ADD KEY `FK_movie_country` (`id_country`);

--
-- Chỉ mục cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  ADD PRIMARY KEY (`id_series`),
  ADD KEY `FK_tvseries_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id_photos`),
  ADD KEY `FK_photos_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  ADD PRIMARY KEY (`id_pricing`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id_cata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id_country` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id_photos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  MODIFY `id_pricing` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comments_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `FK_comments_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);

--
-- Các ràng buộc cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  ADD CONSTRAINT `FK_kids_comment` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id_comment`),
  ADD CONSTRAINT `FK_kids_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_customer_pricing` FOREIGN KEY (`id_pricing`) REFERENCES `pricing_plan` (`id_pricing`);

--
-- Các ràng buộc cho bảng `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_movie_catalog` FOREIGN KEY (`id_cata`) REFERENCES `catalog` (`id_cata`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_movie_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id_country`);

--
-- Các ràng buộc cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  ADD CONSTRAINT `FK_tvseries_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);

--
-- Các ràng buộc cho bảng `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FK_photos_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
