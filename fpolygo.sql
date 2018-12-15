-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2018 lúc 04:01 AM
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
(48, 0, 'Phim Hồi Hộp - Gây Cấn qwe qư'),
(49, 0, '1312312qwe qư '),
(50, 0, 'HAHAHHA CON CHÓ 2 2 21 312 123 123wqe qư');

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

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `content`, `id_customer`, `date`, `id_movie`, `likes`, `unlikes`) VALUES
(1, 'Phim hay quá đi', 1, '2018-12-05 00:00:00', 55, 10, 50),
(3, 'Phim hay quá đi', 1, '2018-12-05 00:00:00', 55, 10, 50);

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
(7, 'Đài Loan'),
(8, 'Mỹ'),
(9, 'Ấn Độ'),
(10, 'Úc'),
(11, 'Hàn Quốc'),
(12, 'Thái Lan'),
(13, 'Anh'),
(14, 'Trung Quốc'),
(15, 'Hồng Kông'),
(16, 'Đài Loan'),
(17, 'Mỹ'),
(18, 'Ấn Độ'),
(19, 'Úc'),
(20, 'Hàn Quốc'),
(21, 'Thái Lan asd á'),
(22, 'Anh'),
(23, 'PHIÊU LƯU NGOẠI TÌNH NGÔN LÙ SIÊU NHÂN'),
(24, 'Con gì nè '),
(25, 'Vật vờ Studio');

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
  `date` date NOT NULL,
  `number` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `password`, `email`, `role`, `activated`, `avatar`, `date`, `number`) VALUES
(1, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-05', '096643251'),
(2, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-19', '096643251'),
(3, 'Ngọc Thọ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(4, 'Thúy Vân', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-18', '096643251'),
(5, 'Đăng Khoa', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-29', '096643251'),
(6, 'Ngọc Nhất 1 ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-30', '096643251'),
(7, 'Ngọc Nhất 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(8, 'Ngọc Thọ 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-31', '096643251'),
(9, 'Thúy Vân 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-03', '096643251'),
(10, 'Đăng Khoa 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-05', '096643251');

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
  `type` int(10) NOT NULL DEFAULT '1',
  `id_cata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`id`, `name_movie`, `evaluate`, `view`, `release_year`, `running_time`, `id_country`, `short_description`, `description`, `image`, `clip_SD`, `clip_HD`, `clip_FHD`, `age`, `resolution`, `type`, `id_cata`) VALUES
(43, 'Naruto  2', 5.6, 0, 7, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 38),
(48, 'Naruto  2', 5.6, 0, 7, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 38),
(52, 'ĐỘI TRƯỞNG MARVEL 2', 5, 0, 6, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 41),
(53, 'Naruto  2', 5.6, 0, 7, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 38),
(54, 'Lời NGUYỀN ANH YÊU EM', 6, 0, 2, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', '12416202465_e69de42632_b.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(55, 'CÔ GIÁO THẢO', 7, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 6, 'FHD', 0, 38),
(56, 'ĐỘI CƠ ĐỘNG NẶNG', 6, 0, 2, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 41),
(57, 'NORUTO ', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(58, 'Lời NGUYỀN ANH YÊU EM', 6, 0, 2, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', '12416202465_e69de42632_b.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(59, 'CÔ GIÁO THẢO', 7, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 6, 'FHD', 0, 38),
(60, 'ĐỘI CƠ ĐỘNG NẶNG', 6, 0, 2, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 41),
(61, 'NORUTO ', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(62, 'Phim Phiu Liêu11', 6, NULL, 7, 190, 7, 's simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown pr', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in thei', 'home__bg3.jpg', 'sdgsdgds', 'fdfsdfdsf', 'dsgsdgdsgdsg', 6, 'HD', 0, 43),
(63, 'ĐỘI TRƯỞNG MARVEL 2', 5, 0, 6, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 41),
(64, 'Naruto  2', 5.6, 0, 7, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 1, 38),
(65, 'Lời NGUYỀN ANH YÊU EM', 6, 0, 2, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', '12416202465_e69de42632_b.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(66, 'CÔ GIÁO THẢO', 7, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 6, 'FHD', 0, 38),
(67, 'ĐỘI CƠ ĐỘNG NẶNG', 6, 0, 2, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 41),
(68, 'NORUTO ', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(69, 'Lời NGUYỀN ANH YÊU EM', 6, 0, 2, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', '12416202465_e69de42632_b.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(70, 'CÔ GIÁO THẢO', 7, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 6, 'FHD', 0, 38),
(71, 'ĐỘI CƠ ĐỘNG NẶNG', 6, 0, 2, 120, 8, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', '<p>Bộ phim được x&acirc;y dựng dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật về một người phụ nữ (Han Ji Min) c&oacute; tiền &aacute;n tiền sự đang cố để ho&agrave; nhập với x&atilde; hội. V&igrave; c&oacute; qu&aacute; khứ kh&ocirc;ng trong sạch n&ecirc;n c&ocirc; lu&ocirc;n ăn năn, day dứt, cố gắng sống kh&eacute;p k&iacute;n hết mức c&oacute; thể. Một ng&agrave;y, người phụ nữ bắt gặp một b&eacute; g&aacute;i c&oacute; ho&agrave;n cảnh bất hạnh v&agrave; quyết định ra tay gi&uacute;p đỡ c&am', 'wallpaper2you_94700.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 41),
(72, 'NORUTO ', 6.4, 0, 2018, 120, 11, 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người ph', 'Bộ phim được xây dựng dựa trên câu chuyện có thật về một người phụ nữ (Han Ji Min) có tiền án tiền sự đang cố để hoà nhập với xã hội. Vì có quá khứ không trong sạch nên cô luôn ăn năn, day dứt, cố gắng sống khép kín hết mức có thể. Một ngày, người phụ nữ bắt gặp một bé gái có hoàn cảnh bất hạnh và quyết định ra tay giúp đỡ cô bé. Trong khi đó, cô không hề biết rằng có một người đàn ông khác (Lee Hee Joon) đang cảm nắng và âm thầm bảo vệ mình từ xa.', 'naruto.jpg', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 18, 'FHD', 0, 38),
(73, 'qưeqweqwe', 6.9, 0, 1233, 120, 10, 'sgđgdsgdsg', '<p>dsgsdgsdgsdg</p>\r\n', '306574_titanic-movie-beautiful-hd-wallpapers-high-quality-all-hd_1280x800_h - Copy (2) - Copy.jpg', 'qưeqweqwe', 'ưqeqweqwe', 'qưeqweqw', 18, 'SD', 0, 39),
(74, 'dgdsgsdgs', 6.2, 0, 2018, 120, 7, 'xcdsgdfgsdfgsdfgdsf', '<p>hdsfhdfhdfhsdfhdsfhdsfh</p>\r\n', '306574_titanic-movie-beautiful-hd-wallpapers-high-quality-all-hd_1280x800_h - Copy (2) - Copy.jpg', 'dfgdfgd', 'fgdfgdf', 'gdfgdfgdfg', 18, 'SD', 0, 43),
(75, 'dgdsgsdgs', 6.2, 0, 2018, 120, 7, 'xcdsgdfgsdfgsdfgdsf', '<p>hdsfhdfhdfhsdfhdsfhdsfh</p>\r\n', '306574_titanic-movie-beautiful-hd-wallpapers-high-quality-all-hd_1280x800_h - Copy (2) - Copy.jpg', 'dfgdfgd', 'fgdfgdf', 'gdfgdfgdfg', 18, 'SD', 0, 43);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie_series`
--

CREATE TABLE `movie_series` (
  `id_series` int(11) NOT NULL,
  `episodes` int(50) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_movie` int(11) NOT NULL,
  `clip_SD` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_HD` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `clip_FHD` varchar(250) COLLATE utf8_unicode_ci NOT NULL
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

--
-- Đang đổ dữ liệu cho bảng `photos`
--

INSERT INTO `photos` (`id`, `link`, `id_movie`) VALUES
(1, '_img - Copy.jpg', 75),
(2, '50-Beautiful-and-Minimalist-Presentation-Backgrounds-04.jpg', 75),
(3, '306574_titanic-movie-beautiful-hd-wallpapers-high-quality-all-hd_1280x800_h - Copy (2) - Copy.jpg', 75);

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `FK_photos_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
