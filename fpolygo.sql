-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 10, 2018 lúc 03:06 AM
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
-- Cơ sở dữ liệu: `fpolygo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `name_cata` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `location`, `name_cata`) VALUES
(37, 0, 'Phim Hành Động'),
(38, 0, 'Phim Hài Hước '),
(39, 0, 'Phim Cổ Trang'),
(40, 0, 'Phim Chính Kịch - Drama'),
(41, 0, 'Phim Viễn Tưởng'),
(42, 0, 'Phim Võ Thuật'),
(43, 0, 'Phim Thần Thoại'),
(44, 0, 'Phim Thể Thao - Âm Nhạc'),
(45, 0, 'Phim Chiến Tranh'),
(46, 0, 'Phim Kinh Dị'),
(47, 0, 'Phim Hình Sự'),
(48, 0, 'Phim Hồi Hộp - Gây Cấn'),
(49, 0, 'Phim Tài Liệu'),
(50, 0, 'Phim Hoạt Hình'),
(52, 1, 'Phim Phiêu Lưu'),
(53, 1, 'Phim Phiêu Lưu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `id_movie` int(11) NOT NULL,
  `likes` int(10) DEFAULT '0',
  `unlikes` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_kids`
--

CREATE TABLE `comment_kids` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `likes` int(50) NOT NULL,
  `unlikes` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name_country` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `country`
--

INSERT INTO `country` (`id`, `name_country`) VALUES
(1, 'Việt Nam'),
(2, 'Nhật Bản'),
(3, 'Pháp '),
(4, 'Canada'),
(5, 'Trung Quốc'),
(6, 'Hồng Kông'),
(7, 'Đài Loan'),
(8, 'Mỹ'),
(9, 'Ấn Độ'),
(10, 'Úc'),
(11, 'Hàn Quốc'),
(12, 'Thái Lan'),
(13, 'Anh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
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
  `id` int(11) NOT NULL,
  `name_movie` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `evaluate` float DEFAULT NULL,
  `view` float DEFAULT NULL,
  `release_year` int(50) NOT NULL,
  `running_time` int(50) NOT NULL,
  `id_country` int(11) NOT NULL,
  `short_description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_SD` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_HD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clip_FHD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(50) NOT NULL,
  `resolution` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_cata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`id`, `name_movie`, `evaluate`, `view`, `release_year`, `running_time`, `id_country`, `short_description`, `description`, `image`, `clip_SD`, `clip_HD`, `clip_FHD`, `age`, `resolution`, `id_cata`) VALUES
(1, 'CÔ BAEK', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'KIEMKIDAM.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 38),
(2, 'ĐỘI TRƯỞNG MARVEL', 6.4, 0, 2018, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'movie1.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 41),
(3, 'Naruto ', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 38),
(4, 'VENOM', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'VENOM.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 38),
(5, 'SUMENHNGUYHIEM', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'SUMENHNGUYHIEM.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 38),
(6, 'Phim Phiu Liêu11', NULL, NULL, 2111, 322, 7, 'gfdgdfgfdg', '<p>dfgdfgdfgdfg</p>\r\n', 'home__bg3.jpg', 'sdgsdgds', 'fdfsdfdsf', 'dsgsdgdsgdsg', 11, 'on', 43),
(7, 'Phim Phiu Liêu11', NULL, NULL, 2111, 322, 7, 'gfdgdfgfdg', '<p>dfgdfgdfgdfg</p>\r\n', 'home__bg3.jpg', 'sdgsdgds', 'fdfsdfdsf', 'dsgsdgdsgdsg', 11, 'on', 43);

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
  `id` int(11) NOT NULL,
  `link` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricing_plan`
--

CREATE TABLE `pricing_plan` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `time_limit` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `availability` tinyint(2) NOT NULL,
  `device` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `support` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pricing_plan`
--

INSERT INTO `pricing_plan` (`id`, `name`, `price`, `time_limit`, `resolution`, `availability`, `device`, `support`, `description`) VALUES
(1, 'Basic\r\n', '0', '7 day', '720p ', 1, 'phone, desktop', 'Limited Support', 'ád');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_customer_pricing` (`id_pricing`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_photos_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comments_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_comments_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`);

--
-- Các ràng buộc cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  ADD CONSTRAINT `FK_kids_comment` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id`),
  ADD CONSTRAINT `FK_kids_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_customer_pricing` FOREIGN KEY (`id_pricing`) REFERENCES `pricing_plan` (`id`);

--
-- Các ràng buộc cho bảng `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_movie_catalog` FOREIGN KEY (`id_cata`) REFERENCES `catalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_movie_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`);

--
-- Các ràng buộc cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  ADD CONSTRAINT `FK_tvseries_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`);

--
-- Các ràng buộc cho bảng `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `FK_photos_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
