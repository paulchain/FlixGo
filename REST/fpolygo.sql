-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 24, 2018 lúc 06:16 PM
-- Phiên bản máy phục vụ: 10.1.37-MariaDB
-- Phiên bản PHP: 7.2.12

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
  `name_cata` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `location`, `name_cata`, `count`) VALUES
(67, 1, 'Hành động', 3),
(68, 1, 'Hài kịch', 3),
(69, 3, 'Cổ trang', 0),
(70, 4, 'Trính kịch', 0),
(71, 5, 'Viễn tưởng', 1),
(72, 6, 'Vỗ thuật', 0),
(73, 7, 'Thần thoại', 0),
(74, 8, 'Thể thao - Âm nhạc', 0),
(75, 9, 'Chiến tranh', 0),
(76, 10, 'Kinh dị', 0),
(77, 11, 'Tâm Lý', 0),
(78, 12, 'Gia đình', 2),
(79, 13, 'Hình sự', 2),
(80, 14, 'Hồi hộp - Gay cấn', 1),
(81, 15, 'Tài liệu', 1),
(82, 16, 'Hoạt hình', 1);

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
(2, 'Nội Dung phim quá ấn tượng', 8, '2018-08-12 00:00:00', 145, 0, 0),
(3, 'Phim dỡ lắm mọi người ơi', 6, '2018-08-12 00:00:00', 145, 0, 0),
(4, 'Nội dung hay ', 7, '2018-08-12 00:00:00', 131, 12, 3);

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

--
-- Đang đổ dữ liệu cho bảng `comment_kids`
--

INSERT INTO `comment_kids` (`id`, `id_comment`, `id_customer`, `date`, `content`, `likes`, `unlikes`) VALUES
(1, 3, 4, '2018-08-12 00:00:00', 'Không có dỡ đâu mọi người ơi', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name_country` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `country`
--

INSERT INTO `country` (`id`, `name_country`, `count`) VALUES
(7, 'Đài Loan', 0),
(8, 'Mỹ', 0),
(10, 'Úc', 0),
(11, 'Hàn Quốc', 1),
(12, 'Thái Lan', 0),
(13, 'Anh', 0),
(15, 'Hồng Kông', 0),
(16, 'Đài Loan', 0),
(17, 'Mỹ', -3),
(18, 'Ấn Độ Dương Cực', 0),
(19, 'Úc', 1),
(22, 'Anh 12', 1),
(29, 'Anh', 4),
(30, 'Trung Quốc', 2);

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
(1, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'nhat.jpg', '2018-12-05', '096643251'),
(2, 'Ngọc Nhất', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-19', '096643251'),
(3, 'Ngọc Thọ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(4, 'Thúy Vân', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-18', '096643251'),
(5, 'Đăng Khoa', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-29', '096643251'),
(6, 'Ngọc Nhất 1 ', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-30', '096643251'),
(7, 'Ngọc Nhất 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-24', '096643251'),
(8, 'Ngọc Thọ 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-31', '096643251'),
(9, 'Thúy Vân 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-03', '096643251'),
(10, 'Đăng Khoa 1', '0966643251', 'nhatnnps07643@fpt.edu.vn', 1, 1, 'trash.png', '2018-12-05', '096643251'),
(11, 'Ngọc Thọ', '09982568a', 'beodayroi@gmail.com', 1, 1, 'ngoctho.jpg', '2018-12-19', '0961544404'),
(12, 'Ngọc Thọ', '09982568a', 'beodayroi@gmail.com', 1, 1, 'ngoctho.jpg', '2018-12-19', '0961544404');

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
  `trailer` text COLLATE utf8_unicode_ci NOT NULL,
  `clip_SD` text COLLATE utf8_unicode_ci NOT NULL,
  `clip_HD` text COLLATE utf8_unicode_ci NOT NULL,
  `clip_FHD` text COLLATE utf8_unicode_ci NOT NULL,
  `age` int(50) NOT NULL,
  `resolution` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(10) NOT NULL DEFAULT '1',
  `id_cata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`id`, `name_movie`, `evaluate`, `view`, `release_year`, `running_time`, `id_country`, `short_description`, `description`, `image`, `trailer`, `clip_SD`, `clip_HD`, `clip_FHD`, `age`, `resolution`, `type`, `id_cata`) VALUES
(121, 'ĐIỆP VIÊN KHÔNG KHÔNG THẤY 3: TÁI XUẤT GIANG HỒ', 6.6, 0, 2018, 89, 29, 'JOHNNY ENGLISH: TÁI XUẤT GIANG HỒ là phần thứ ba của loạt phim hài Johnny English, với Rowan Atkinson trong vai một gã bỗng dưng trở thành một điệp viên bí mật. Cuộc phiêu lưu mới bắt đầu khi một vụ điều tra hệ thống an ninh mạng cho thấy danh tính c', '<p><strong>JOHNNY ENGLISH: T&Aacute;I XUẤT GIANG HỒ</strong>&nbsp;l&agrave; phần thứ ba của loạt phim h&agrave;i Johnny English, với Rowan Atkinson trong vai một g&atilde; bỗng dưng trở th&agrave;nh một điệp vi&ecirc;n b&iacute; mật. Cuộc phi&ecirc;u lưu mới bắt đầu khi một vụ điều tra hệ thống an ninh mạng cho thấy danh t&iacute;nh của tất cả c&aacute;c điệp vi&ecirc;n đang hoạt động tại Anh, v&agrave; Johnny l&agrave; hy vọng cuối c&ugrave;ng để điều tra b&iacute; mật ấy.&nbsp;<br />\n<br />\nD&', 'poster.medium.jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/goh-FbUbSA0\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r5---sn-i3belne6.googlevideo.com/videoplayback?id=e28da06da712dffc&itag=18&source=webdrive&&requiressl=yes&hcs=yes&mm=30&mn=sn-i3belne6&ms=nxu&mv=u&pl=48&sc=yes&shardbypass=yes&ttl=transient&ei=RMMcXILaDIzA4wLcyKOYCQ&susc=drp&app=fife&driveid', 'https://r5---sn-i3belne6.googlevideo.com/videoplayback?id=e28da06da712dffc&itag=22&source=webdrive&&requiressl=yes&hcs=yes&mm=30&mn=sn-i3belne6&ms=nxu&mv=u&pl=48&sc=yes&shardbypass=yes&ttl=transient&ei=RcMcXI26H47g4wLo34SwBg&susc=drp&app=fife&driveid=1mnJ', 'https://r1---sn-i3b7knld.googlevideo.com/videoplayback?id=e28da06da712dffc&itag=37&source=webdrive&&requiressl=yes&hcs=yes&mm=30&mn=sn-i3b7knld&ms=nxu&mv=u&pl=48&sc=yes&shardbypass=yes&ttl=transient&ei=RcMcXPydI8r64wLGlqr4Ag&susc=drp&app=fife&driveid=1mnJ', 6, 'FHD', 1, 67),
(125, 'ĐIỆP VỤ XXXL', 4.5, 0, 2018, 109, 30, 'Nội dung phim xoay quanh cặp đôi cảnh sát “cồng kềnh, bồng bềnh” và hành trình phá án vạch trần một công ty sản xuất thuốc phiện. Trong đó, một người là Hách Anh Tuấn, 175 kg và đang làm nhân viên bảo vệ, anh luôn mơ ước trở thành một thám tử thực th', '<p>Nội dung phim xoay quanh cặp đ&ocirc;i cảnh s&aacute;t &ldquo;cồng kềnh, bồng bềnh&rdquo; v&agrave; h&agrave;nh tr&igrave;nh ph&aacute; &aacute;n vạch trần một c&ocirc;ng ty sản xuất thuốc phiện. Trong đ&oacute;, một người l&agrave; H&aacute;ch Anh Tuấn, 175 kg v&agrave; đang l&agrave;m nh&acirc;n vi&ecirc;n bảo vệ, anh lu&ocirc;n mơ ước trở th&agrave;nh một th&aacute;m tử thực thụ v&agrave; người c&ograve;n lại l&agrave; đại &uacute;y J, một cựu nh&acirc;n vi&ecirc;n đặc vụ cao cấp.<br />\n<b', 'poster.medium (1).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/c8tY1GwFTps\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r2---sn-i3belnel.googlevideo.com/videoplayback?id=095fd4a8194f012e&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=RMMcXK-iLZD84gLmnJ_ACQ&susc=drp&app=fife&driveid=1XswY1CXlX8IW04taL38kYB', 'https://r2---sn-i3belnel.googlevideo.com/videoplayback?id=095fd4a8194f012e&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=RMMcXPzuNIjw4AKAmZjoDg&susc=drp&app=fife&driveid=1XswY1CXlX8IW04taL38kYBkErym', 'https://r2---sn-i3belnel.googlevideo.com/videoplayback?id=095fd4a8194f012e&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=RMMcXPvwO5ei4QL91pWQDQ&susc=drp&app=fife&driveid=1XswY1CXlX8IW04taL38kYBkErym', 6, 'FHD', 1, 67),
(128, 'MẬT VỤ GIẢI CỨU', 7, 0, 2018, 122, 17, '“Mật Vụ Giải Cứu” xoay quanh Joe Glass (Gerard Butler ) – một thuyền trưởng tàu ngầm Mỹ, phát hiện ra một âm mưu đảo chính quân sự và bắt cóc tổng thống Nga, được khởi sướng bởi một vị tướng phản trắc Sergi Àndropoyov (Michael Nyqvist). Vì sao Sergi ', '<p>&ldquo;<strong>Mật Vụ Giải Cứu</strong>&rdquo; xoay quanh&nbsp;<strong>Joe Glass</strong>&nbsp;(Gerard Butler ) &ndash; một thuyền trưởng t&agrave;u ngầm Mỹ, ph&aacute;t hiện ra một &acirc;m mưu đảo ch&iacute;nh qu&acirc;n sự v&agrave; bắt c&oacute;c tổng thống Nga, được khởi sướng bởi một vị tướng phản trắc&nbsp;<strong>Sergi &Agrave;ndropoyov</strong>&nbsp;(Michael Nyqvist). V&igrave; sao Sergi &Agrave;ndropoyov lại bắt c&oacute;c Tổng thống? Liệu Joe Class c&ugrave;ng những hậu vệ của m&ig', 'poster.medium (2).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/5KQNnA3Bu5U\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r6---sn-i3b7kn7s.googlevideo.com/videoplayback?id=0542f777769d6462&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7s&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=u8McXJedGNeV4gLc1IDwDg&susc=drp&app=fife&driveid=1lM9l719lRkiXVFNjZCpCbd', 'https://r6---sn-i3b7kn7s.googlevideo.com/videoplayback?id=0542f777769d6462&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7s&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=usMcXMGgJof24gLqzY7YDw&susc=drp&app=fife&driveid=1lM9l719lRkiXVFNjZCpCbdPqngz', 'https://r6---sn-i3b7kn7s.googlevideo.com/videoplayback?id=0542f777769d6462&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7s&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=usMcXJ2hE87G4gK2ga3ABQ&susc=drp&app=fife&driveid=1lM9l719lRkiXVFNjZCpCbdPqngz', 13, 'FHD', 1, 67),
(129, 'CHÀNG MÙ SỐ NHỌ', 9, 0, 2018, 139, 17, 'NỘI DUNG PHIM\n\nAkash, một nghệ sĩ piano mù đang chuẩn bị cho một buổi hòa nhạc ở London. Xe tay ga của anh ta va phải Akash và khi biết anh ấy một nghệ sĩ piano, cô ấy đưa anh ấy đến nhà hàng Franco do cha cô ấy điều hành và mời anh ấy làm việc tại đ', '<h2>NỘI DUNG PHIM</h2>\n\n<p>&nbsp;</p>\n\n<p>Akash, một nghệ sĩ piano m&ugrave; đang chuẩn bị cho một buổi h&ograve;a nhạc ở London. Xe tay ga của anh ta va phải Akash v&agrave; khi biết anh ấy một nghệ sĩ piano, c&ocirc; ấy đưa anh ấy đến nh&agrave; h&agrave;ng Franco do cha c&ocirc; ấy điều h&agrave;nh v&agrave; mời anh ấy l&agrave;m việc tại đ&oacute;.&nbsp;<br />\n<br />\nĐột nhi&ecirc;n, một loạt c&aacute;c vụ &aacute;n mạng li&ecirc;n tiếp xảy ra đều c&oacute; mối li&ecirc;n hệ với ch&agrave;ng', 'poster.medium (3).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/2iVYI99VGaw\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r4---sn-i3b7knlk.googlevideo.com/videoplayback?id=72ded898e5c47d44&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knlk&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=6sAcXJnSOsiu4gK4nJMw&susc=drp&app=fife&driveid=1atbVFSHxKAU66YJKrkchsL_W', 'https://r4---sn-i3b7knlk.googlevideo.com/videoplayback?id=72ded898e5c47d44&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knlk&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=6sAcXJnSOsiu4gK4nJMw&susc=drp&app=fife&driveid=1atbVFSHxKAU66YJKrkchsL_WX2oTz', 'https://r4---sn-i3b7knlk.googlevideo.com/videoplayback?id=72ded898e5c47d44&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knlk&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=6sAcXJnSOsiu4gK4nJMw&susc=drp&app=fife&driveid=1atbVFSHxKAU66YJKrkchsL_WX2oTz', 6, 'FHD', 1, 79),
(131, 'VENOM', 7.1, 0, 2018, 112, 17, 'Quái Vật Venom là một kẻ thù nguy hiểm và nặng ký của Người nhện trong loạt series của Marvel. Chàng phóng viên Eddie Brock (do Tom Hardy thủ vai) bí mật theo dõi âm mưu xấu xa của một tổ chức và đã không may mắn khi nhiễm phải loại cộng sinh trùng n', '<p><strong>Qu&aacute;i Vật Venom</strong>&nbsp;l&agrave; một kẻ th&ugrave; nguy hiểm v&agrave; nặng k&yacute; của Người nhện trong loạt series của Marvel. Ch&agrave;ng ph&oacute;ng vi&ecirc;n&nbsp;<strong>Eddie Brock</strong>&nbsp;(do Tom Hardy thủ vai) b&iacute; mật theo d&otilde;i &acirc;m mưu xấu xa của một tổ chức v&agrave; đ&atilde; kh&ocirc;ng may mắn khi nhiễm phải loại cộng sinh tr&ugrave;ng ngo&agrave;i h&agrave;nh tinh (Symbiote) v&agrave; từ đ&oacute; đ&atilde; kh&ocirc;ng c&ograve;n ', 'VENOM.jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/Mi1a8GLiW8I\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r2---sn-i3belne6.googlevideo.com/videoplayback?id=9e261c1c6631e00c&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belne6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=xcMcXNr6Eo_o4wKp7ZbgAQ&susc=drp&app=fife&driveid=11Vx7YaeEDtIlzj4VuJuBAj', 'https://r2---sn-i3b7kn7z.googlevideo.com/videoplayback?id=9e261c1c6631e00c&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7z&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=xsMcXPuMEo3k4wLGjKeQAQ&susc=drp&app=fife&driveid=11Vx7YaeEDtIlzj4VuJuBAjeGpxu', 'https://r2---sn-i3belne6.googlevideo.com/videoplayback?id=9e261c1c6631e00c&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belne6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=xsMcXIHUGZma4wKSrLrYCw&susc=drp&app=fife&driveid=11Vx7YaeEDtIlzj4VuJuBAjeGpxu', 16, 'FHD', 1, 71),
(138, 'CÁO GIÀ GIAN ÁC VÀ NHỮNG CHUYỆN KHÁC...', 7.4, 0, 2017, 84, 29, 'Nông trại của Thung lũng ngàn hoa vốn là một nơi yên bình với những loài động vật chung sống hòa thuận quanh năm. Thế nhưng sự xuất hiện của một vài nhân vật không ngờ tới cùng bản tính khờ dại của bộ', '<p>N&ocirc;ng trại của&nbsp;<strong>Thung lũng ng&agrave;n hoa</strong>&nbsp;vốn l&agrave; một nơi y&ecirc;n b&igrave;nh với những lo&agrave;i động vật chung sống h&ograve;a thuận quanh năm. Thế nhưng sự xuất hiện của một v&agrave;i nh&acirc;n vật kh&ocirc;ng ngờ tới c&ugrave;ng bản t&iacute;nh khờ dại của bộ đ&ocirc;i Thỏ v&agrave; Vịt đ&atilde; cuốn c&aacute;c cư d&acirc;n ở đ&acirc;y v&agrave;o những cuộc h&agrave;nh tr&igrave;nh dở kh&oacute;c dở cười, khi Thỏ tinh nghịch phải thay lo&agrave', 'poster.medium (5).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/PEEWvU5Ibpo\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r5---sn-i3b7knlk.googlevideo.com/videoplayback?id=42346ac10d709d1b&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knlk&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=3dAcXPGkO5ns4wL74r2QDg&susc=drp&app=fife&driveid=1m7VN1pk8pVDqRcvvjrp1_R', 'https://r5---sn-i3belne6.googlevideo.com/videoplayback?id=42346ac10d709d1b&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belne6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=3tAcXOi6LIzA4wLcyKOYCQ&susc=drp&app=fife&driveid=1m7VN1pk8pVDqRcvvjrp1_RJ5Dsx', 'https://r5---sn-i3b7knlk.googlevideo.com/videoplayback?id=42346ac10d709d1b&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knlk&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=3tAcXPDZOpCk4wKn1obQBw&susc=drp&app=fife&driveid=1m7VN1pk8pVDqRcvvjrp1_RJ5Dsx', 3, 'FHD', 1, 82),
(140, 'ÔNG ANH \"TRỜI ĐÁNH\"', 6.4, 0, 2018, 125, 11, 'Ngay từ thời thơ ấu, cậu nhóc Chut luôn nghĩ là em bé trong bụng mẹ là em trai để có người chơi robot và đá bóng cùng mình. Tiếc là ông trời đã không lắng nghe nguyện vọng này khi để mẹ cậu hạ sinh một cô em gái \"hở chút là mè nheo khóc lóc\". \n', '<p>Ngay từ thời thơ ấu, cậu nh&oacute;c Chut lu&ocirc;n nghĩ l&agrave; em b&eacute; trong bụng mẹ l&agrave; em trai để c&oacute; người chơi robot v&agrave; đ&aacute; b&oacute;ng c&ugrave;ng m&igrave;nh. Tiếc l&agrave; &ocirc;ng trời đ&atilde; kh&ocirc;ng lắng nghe nguyện vọng n&agrave;y khi để mẹ cậu hạ sinh một c&ocirc; em g&aacute;i &quot;hở ch&uacute;t l&agrave; m&egrave; nheo kh&oacute;c l&oacute;c&quot;.&nbsp;<br />\n<br />\nTheo thời gian trưởng th&agrave;nh, sự tr&aacute;i dấu giữa hai anh ', 'poster.medium (7).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/6v0Lna2yKRc\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r3---sn-i3beln7s.googlevideo.com/videoplayback?id=2ed85dd037abd67d&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3beln7s&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=esccXIj7I5jQ4wKr75fIAw&susc=drp&app=fife&driveid=1ena1_EEX5ef93oEQ1mil00', 'https://r3---sn-i3b7knl6.googlevideo.com/videoplayback?id=2ed85dd037abd67d&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knl6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=e8ccXMCgCIjw4AKAmZjoDg&susc=drp&app=fife&driveid=1ena1_EEX5ef93oEQ1mil0096dqj', 'https://r3---sn-i3b7knl6.googlevideo.com/videoplayback?id=2ed85dd037abd67d&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knl6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=e8ccXOuPE4eg4QKi1paABw&susc=drp&app=fife&driveid=1ena1_EEX5ef93oEQ1mil0096dqj', 12, 'FHD', 1, 68),
(141, 'VUA LỪA ĐẢO', 5.9, 0, 2018, 95, 30, 'The Polka King là một bộ phim hài tiểu sử của Mỹ do Maya Forbes đạo diễn và được viết bởi Forbes và Wallace Wolodarsky. Bộ phim kể về người đứng đầu ban nhạc polka gốc Ba Lan, người Mỹ gốc Phi Jan Lew ..', '<p><strong>The Polka King</strong>&nbsp;l&agrave; một bộ phim h&agrave;i tiểu sử của Mỹ do Maya Forbes đạo diễn v&agrave; được viết bởi Forbes v&agrave; Wallace Wolodarsky. Bộ phim dựa tr&ecirc;n c&acirc;u chuyện c&oacute; thật kể về người đứng đầu ban nhạc Polka gốc Ba Lan, người Mỹ gốc Phi Jan Lewan, người đ&atilde; bị bắt giam năm 2004 v&igrave; đ&atilde; điều h&agrave;nh một m&ocirc; h&igrave;nh Ponzi lừa đảo.<br />\n<br />\n<strong>Jan Lewan</strong>&nbsp;(Jack Black) l&agrave; một người nhập', 'poster.medium (8).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/ZWGh7si0Y50\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r3---sn-i3belnel.googlevideo.com/videoplayback?id=8f935713d99bb300&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=bsgcXMfaFpfw4wLUrLyADw&susc=drp&app=fife&driveid=1b-a45UQmjvLcu_OGEgenrQ', 'https://r3---sn-i3b7knld.googlevideo.com/videoplayback?id=8f935713d99bb300&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knld&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=bsgcXLvMPJCk4wKn1obQBw&susc=drp&app=fife&driveid=1b-a45UQmjvLcu_OGEgenrQQnZxu', 'https://r3---sn-i3belnel.googlevideo.com/videoplayback?id=8f935713d99bb300&itag=37&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=b8gcXO2kBoSi4ALns6_ABg&susc=drp&app=fife&driveid=1b-a45UQmjvLcu_OGEgenrQQnZxu', 6, 'FHD', 1, 68),
(142, 'CÔNG CHÚA THẾ VAI', 6, 0, 2018, 101, 17, 'Trong khi chuẩn bị cho Cuộc thi làm bánh Giáng sinh Hoàng gia, cô nàng thợ bánh Stacy De Novo chạm mặt với một người lạ giống mình như hai giọt nước là Nữ công tước Margaret Delacourt. Muốn có một cơ ', '<p>Trong khi chuẩn bị cho Cuộc thi l&agrave;m b&aacute;nh Gi&aacute;ng sinh Ho&agrave;ng gia, c&ocirc; n&agrave;ng thợ b&aacute;nh&nbsp;<strong>Stacy De Novo</strong>&nbsp;chạm mặt với một người lạ giống m&igrave;nh như hai giọt nước l&agrave; Nữ c&ocirc;ng tước&nbsp;<strong>Margaret Delacourt</strong>. Muốn c&oacute; một cơ hội cuối c&ugrave;ng để trải nghiệm cuộc sống như một &quot;người b&igrave;nh thường&quot; trước khi c&ocirc; kết h&ocirc;n với Ho&agrave;ng tử Bỉ, nữ c&ocirc;ng tước đ&atil', 'poster.medium (9).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/-ATVRW6Kh5Y\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r1---sn-i3b7knl6.googlevideo.com/videoplayback?id=93bcabe54efa26c1&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knl6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=o8wcXLCFI4_o4wKp7ZbgAQ&susc=drp&app=fife&driveid=1aBZapImjmkBs_yqPyvXhRp', 'https://r1---sn-i3b7knl6.googlevideo.com/videoplayback?id=93bcabe54efa26c1&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knl6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=o8wcXLCFI4_o4wKp7ZbgAQ&susc=drp&app=fife&driveid=1aBZapImjmkBs_yqPyvXhRpbvue2', 'https://r1---sn-i3b7knl6.googlevideo.com/videoplayback?id=93bcabe54efa26c1&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7knl6&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=o8wcXLCFI4_o4wKp7ZbgAQ&susc=drp&app=fife&driveid=1aBZapImjmkBs_yqPyvXhRpbvue2', 13, 'FHD', 1, 78),
(143, 'BỆNH LẠ', 6, 0, 2017, 90, 17, 'Diễn viên hài gốc Pakistan, Kumail Nanjiani và học viên cao học Emily Gardner đã có một mối tình lãng mạn nhưng họ vấp phải khó khăn do sự khác biệt văn hoá. Khi Emily mắc một chứng bệnh bí ẩn, Kumail ', '<p><strong>The Big Sick</strong>&nbsp;l&agrave; bộ phim h&agrave;i l&atilde;ng mạn được đạo diễn bởi Micheal Showalter (Hello My Name is Doris). Phim dựa tr&ecirc;n c&acirc;u chuyện cuộc đời của diễn vi&ecirc;n ch&iacute;nh ki&ecirc;m bi&ecirc;n kịch Kumail Nanjiani v&agrave; người hiện l&agrave; vợ anh Emily Gordon. Gia đ&igrave;nh Hồi gi&aacute;o gốc Pakistan của Kumail kh&ocirc;ng h&agrave;i l&ograve;ng về mối quan hệ giữa anh v&agrave; Emily, vốn l&agrave; một người Mỹ.&nbsp;<br />\n<br />\nT&', 'poster.medium (10).jpg', '<iframe width=\"650\" height=\"366\" src=\"https://www.youtube.com/embed/jcD0Daqc3Yw\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'https://r6---sn-i3belnel.googlevideo.com/videoplayback?id=32571459b7456bdd&itag=18&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=k80cXKqIAo3k4wLGjKeQAQ&susc=drp&app=fife&driveid=1IojhkLb5hoOROyoKMEyTLS', 'https://r6---sn-i3belnel.googlevideo.com/videoplayback?id=32571459b7456bdd&itag=59&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3belnel&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=k80cXMLIBsiu4gK4nJMw&susc=drp&app=fife&driveid=1IojhkLb5hoOROyoKMEyTLSaKqfCqG', 'https://r1---sn-i3b7kn7k.googlevideo.com/videoplayback?id=32571459b7456bdd&itag=22&source=webdrive&&requiressl=yes&mm=30&mn=sn-i3b7kn7k&ms=nxu&mv=u&pl=48&sc=yes&ttl=transient&ei=k80cXJfjKpfM4QKIyoXYAQ&susc=drp&app=fife&driveid=1IojhkLb5hoOROyoKMEyTLSaKqfC', 6, 'FHD', 1, 68),
(145, 'NHÃY LÊN NÀO', 2.1, 0, 123, 123, 22, 'ewqwe', '<p>qwewq</p>\n', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg.jpg', 'wqe', 'ewqeqw', 'wqeqw', 'wqe', 213, 'FHD', 1, 78),
(150, 'NHÃY LÊN NÀO', 2.5, 0, 132, 123, 19, '221', '<p>qweq</p>\n', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg.jpg', 'dfbdf', 'bfđfb', 'dfbdf', 'fbdfd', 12312, 'FHD', 1, 79),
(155, 'ĐỘI TRƯỞNG MARVEL', 2, 0, 123213, 21321, 29, 'ưe', '<p>qưeqw</p>\n', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg.jpg', '123', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 312, 'FHD', 1, 81),
(161, 'Nhãy lên nào', 1, 0, 123, 123, 17, 'ưqeqw', '<p>eqw</p>\n', 'Titanic_Jack_and_Rose_Atlantic_Ocean_fa_rszd.jpg.jpg', '123', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSy', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 'https://video.xx.fbcdn.net/v/t42.9040-2/10000000_1163364727161500_6069916484451172352_n.mp4?_nc_cat=102&efg=eyJybHIiOjE1MDAsInJsYSI6NDA5NiwidmVuY29kZV90YWciOiJzdmVfaGQifQ%3D%3D&_nc_eui2=AeGC8zTnFKwiMkV02j5C2IVmkvdMH2TR-xverbLPuO8MPCRVX0CE2Lf8YmUmggSyqkrD7', 123, 'FHD', 0, 80);

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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pricing_customer`
--

CREATE TABLE `pricing_customer` (
  `id_pc` int(4) NOT NULL,
  `id_customer` int(4) NOT NULL,
  `id_pricing` int(4) NOT NULL,
  `date_create` date NOT NULL,
  `date_end` date NOT NULL
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
  `support` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pricing_plan`
--

INSERT INTO `pricing_plan` (`id`, `name`, `price`, `time_limit`, `resolution`, `support`, `description`) VALUES
(1, 'Basic\r\n', '0', '7 day', '720p ', 'Limited Support', 'ád'),
(2, 'Free', '0', '7 day', 'HD', 'No support ', 'Gói miển phí được xem phim  trong 7 ngày không quản cáo');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comment_kids`
--
ALTER TABLE `comment_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT cho bảng `movie_series`
--
ALTER TABLE `movie_series`
  MODIFY `id_series` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pricing_plan`
--
ALTER TABLE `pricing_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comments_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `FK_comments_movie` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
