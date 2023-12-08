-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 05:29 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amono`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_name` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `user_id`, `business_name`, `description`, `logo`, `created_date`, `updated_date`) VALUES
(48, 16, 'Electra Tech Innovation', 'Electa Tech Innovation is your go-to destination for cutting-edge electronic devices and gadgets. We specialize in bringing you the latest innovations in the world of technology. Whether you\'re a tech enthusiast, a professional in need of reliable equipment, or someone looking for the perfect gift, TechTrove Electronics has you covered.\r\nOur extensive range of products includes state-of-the-art smartphones, tablets, laptops, smartwatches, gaming consoles, and much more. We source our inventory from reputable manufacturers known for their quality and performance.', '1a11cbfc-e506-4826-a088-37d55580208aPhoto_1694230574683.png', '2023-09-14 11:35:34', '2023-09-14 11:35:34'),
(49, 17, 'Smart House 2', 'Smart House2 is your trusted partner in the world of mobile communication. We specialize in offering a wide range of cutting-edge mobile devices and services to keep you connected, informed, and entertained.', '3bb39d47-d0f2-4d42-80f1-05a8bf15bb11Photo_1693101271955.png', '2023-09-14 12:51:50', '2023-09-15 11:50:51'),
(50, 18, 'Timepiece Elegance', 'Timepiece Elegancec is your destination for timeless elegance and precision craftsmanship. We specialize in curating a stunning collection of wristwatches that combine style, functionality, and affordability. Explore our world of horology and discover the perfect timepiece to adorn your wrist.', 'a9834da1-22e4-45c8-8164-0c701c332927Photo_1694230453208.png', '2023-09-14 13:04:01', '2023-09-14 13:04:01'),
(51, 19, 'Fashion Fusion', 'At Fashion Fusion, we\'re not just a clothing store; we\'re a destination for style enthusiasts and trendsetters. Our passion for fashion drives us to curate a diverse and ever-evolving collection of clothing and accessories that cater to a wide range of tastes.', 'f9de4a66-27d2-45cb-b6d3-6b6979475ee5Photo_1693101148437.png', '2023-09-14 13:26:36', '2023-09-14 13:26:36'),
(52, 21, 'Unique Dragon', 'Unique Dragon is your one-stop destination for top-quality shoes that blend fashion, comfort, and durability. We believe that every step you take should be a confident one, and that\'s why we offer a curated collection of footwear that caters to your unique style and needs.', '9757a904-bb7d-45aa-91aa-b6912c36220cPhoto_1693101223721.png', '2023-09-14 13:45:59', '2023-09-14 13:45:59'),
(53, 24, 'Tech Heaven Electronics', 'At Tech Heaven Electronics, we\'re your one-stop destination for all things tech. We\'re passionate about the latest gadgets and electronics, and we\'ve curated a vast selection of products that cater to tech enthusiasts, professionals, and everyday users alike.', 'fdd4c5da-c5e0-4cbe-93e7-8c717c1b25d0Photo_1694229929219.png', '2023-09-15 11:27:43', '2023-09-15 11:27:43'),
(54, 28, 'Tech Treasures', 'Tech Treasure is your one-stop destination for the latest and greatest in technology. From state-of-the-art gadgets to futuristic software, we constantly explore the tech landscape to bring you innovations that enhance your personal and professional life.', 'd598cd00-7afa-4169-916d-fc862c64a162Photo_1694230866956.png', '2023-09-15 16:02:35', '2023-09-15 16:02:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_date`, `updated_date`) VALUES
(37, 'Electronic Device', '2023-09-14 11:40:14', '2023-09-14 11:40:14'),
(38, 'Watch', '2023-09-14 11:40:18', '2023-09-14 11:40:18'),
(39, 'Clothing', '2023-09-14 11:40:22', '2023-09-14 11:40:22'),
(40, 'Shoe', '2023-09-14 11:40:27', '2023-09-14 11:40:27'),
(41, 'Fashion', '2023-09-15 07:29:36', '2023-09-15 07:30:11'),
(42, 'Book & Stationery', '2023-09-15 11:47:47', '2023-09-15 11:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `message`, `status`, `created_date`, `updated_date`) VALUES
(12, 23, 'I wanted to express my appreciation for the excellent service I received. My recent shopping experience on your website was smooth and enjoyable. The website\'s user interface is intuitive, and I easily found the products I was looking for. The checkout process was hassle-free, and my order arrived sooner than expected. The quality of the products is outstanding. I would definitely recommend your online shop to my friends and family. Keep up the great work!\"', 1, '2023-09-14 17:13:18', '2023-09-14 17:13:18'),
(13, 21, 'I\'ve been using the Amono Online Shop platform for my electronics business for several months now, and overall, it\'s been a great experience. The user-friendly dashboard makes it easy to manage my products and business details. However, I have a feature request. It would be incredibly helpful if there were more advanced analytics and reporting tools available. Having access to detailed sales data, customer behavior insights, and inventory management features would be a game-changer for businesses like mine. Keep up the good work, and I hope you consider adding these enhancements in the future!', 0, '2023-09-14 17:14:36', '2023-09-14 17:14:36'),
(14, 17, 'As the owner of a bookstore and stationery shop on Amono, I have noticed a growing demand for books, stationery items, and related products. To better serve our customers and enhance their shopping experience, I kindly request the addition of a dedicated \"Books & Stationery\" category on the platform.\r\n', 0, '2023-09-15 11:47:07', '2023-09-15 11:47:07'),
(15, 25, 'I\'ve been shopping on Amono Online Shop for a while, and I must say it\'s been a fantastic experience. The website is easy to navigate, and I love the variety of products available. The checkout process is smooth, and my orders always arrive on time. The customer support team is responsive and helpful, addressing any queries promptly. Keep up the excellent work, Amono!\"', 0, '2023-09-15 11:51:50', '2023-09-15 11:51:50'),
(16, 19, 'As a business owner on Amono Online Shop, I\'ve had a generally positive experience. The platform has allowed me to expand my reach and connect with local customers effectively. Uploading and managing product listings is straightforward, and I appreciate the marketing support provided by Amono. However, I\'d love to see more features for analyzing business performance and customer engagement in the future. Overall, it\'s been a valuable partnership', 0, '2023-09-18 08:15:37', '2023-09-18 08:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `status`, `order_code`, `name`, `phone`, `address`, `created_date`, `updated_date`) VALUES
(69, 22, 39, 1, 30000, 0, 'amono55336296', 'Htoo Paing Aung', '09973126540', 'Myaing street, Pakoku', '2023-09-14 16:53:38', '2023-09-14 16:53:38'),
(70, 22, 40, 3, 60000, 0, 'amono55336296', 'Htoo Paing Aung', '09973126540', 'Myaing street, Pakoku', '2023-09-14 16:53:38', '2023-09-14 16:53:38'),
(71, 22, 36, 1, 1000000, 2, 'amono55336296', 'Htoo Paing Aung', '09973126540', 'Myaing street, Pakoku', '2023-09-14 16:53:38', '2023-09-14 16:53:38'),
(72, 23, 41, 3, 60000, 0, 'amono46511873', 'Si Thu', '09-323213457', 'DawNa street ShwePyiThar Yangon', '2023-09-14 17:01:55', '2023-09-14 17:01:55'),
(73, 23, 42, 5, 150000, 2, 'amono3629491', 'Si Thu', '09881971360', 'DawNa street ShwePyiThar Yangon', '2023-09-14 17:05:27', '2023-09-14 17:05:27'),
(74, 25, 35, 1, 800000, 0, 'amono58434374', 'Hein Htet Aung', '09-973126549', 'address MhawOne Quartar Pharkant', '2023-09-15 11:41:46', '2023-09-15 11:41:46'),
(75, 25, 43, 5, 75000, 1, 'amono58434374', 'Hein Htet Aung', '09-973126549', 'address MhawOne Quartar Pharkant', '2023-09-15 11:41:46', '2023-09-15 11:41:46');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `business_id`, `category_id`, `name`, `description`, `price`, `photo`, `count`, `status`, `created_date`, `updated_date`) VALUES
(31, 48, 37, 'TechTrove Electronics QuantumBook Pro', ' Experience unmatched productivity with the TechTrove Electronics QuantumBook Pro. This sleek and powerful laptop is designed to cater to both professionals and tech enthusiasts. Powered by the latest Intel processors, ample RAM, and a stunning 4K display, the QuantumBook Pro is your gateway to enhanced efficiency. From demanding work tasks to immersive entertainment, this laptop does it all.', 3000000, '8f69d334-fb0f-4e7f-a863-f00a50823e69Prometheus_Open_Angled_AMD_v2_1000x1000__59847.1610489428.jpg', 5, 1, '2023-09-14 12:40:06', '2023-09-14 12:40:06'),
(32, 48, 37, 'TechTrove Electronics PrecisionMouse X3', ' Elevate your computing experience with the TechTrove Electronics PrecisionMouse X3. This precision-engineered mouse offers unparalleled accuracy and comfort. Whether you need a wireless mouse for clutter-free convenience or a wired gaming mouse with customizable features, the PrecisionMouse X3 has you covered. Say goodbye to cursor lag and hello to seamless navigation.', 50000, 'e13b0dc4-2d96-4ee4-8f59-13a6408bb359ca6950bb-720e-460a-81c1-671edde082f0.3707b14bd1b34613d245dc173d2229e3.webp', 10, 1, '2023-09-14 12:42:39', '2023-09-14 12:42:39'),
(33, 48, 37, 'TechTrove Electronics StyleType S2 Keyboard', 'Typing becomes an art with the TechTrove Electronics StyleType S2 keyboard. This ultra-slim and stylish keyboard not only enhances your typing experience but also adds a touch of elegance to your workspace. With chiclet-style keys and quiet keystrokes, it\'s perfect for both work and play.\r\n', 100000, 'd8c1c6ca-3ced-4d8b-a2fc-0dd2f64e064471jOY1esINL.jpg', 7, 1, '2023-09-14 12:44:55', '2023-09-14 12:44:55'),
(34, 48, 38, 'TechTrove Electronics ConnectX1', 'Discover the latest in mobile technology with the TechTrove Electronics ConnectX1 smartphone watch. This feature-packed phone keeps you connected and productive on the go. Capture stunning photos with the high-quality camera, multitask seamlessly with a powerful processor, and enjoy immersive visuals on the vibrant display. ', 1500000, 'c67b6c64-3fe1-4256-a72a-85790bf597f2Sb3b8b4e052bd415c932e2d6f3a38a82dR.jpg_640x640Q90.jpg_.webp', 5, 1, '2023-09-14 12:48:21', '2023-09-14 12:48:21'),
(35, 49, 37, 'GlobeTalk ConnectX Pro', ' Elevate your mobile experience with the GlobeTalk ConnectX Pro smartphone. Designed for the tech-savvy individual, this powerhouse device boasts top-of-the-line features, including a stunning AMOLED display, powerful processors, and a high-capacity battery for all-day use. Stay connected, capture life\'s moments with a pro-grade camera, and explore the world of apps and entertainment like never before.', 800000, '78c04379-cfd1-4035-96c9-f97ba7ce58673332_One_Plus_Front_big.jpg', 3, 1, '2023-09-14 12:55:02', '2023-09-14 12:55:02'),
(36, 49, 37, 'GlobeTalk TabX Series Tablet', ' Experience the convenience of on-the-go computing with the GlobeTalk TabX Series tablets. Whether you need a portable workhorse for productivity or a versatile device for entertainment, our tablets deliver exceptional performance and stunning visuals. Stay productive, binge-watch your favorite shows, or immerse yourself in the latest games with the TabX Series.', 1000000, '842a3f0d-8a61-4ec5-92ce-dffb11b1ff39ZAAN0078AE.webp', 6, 1, '2023-09-14 12:57:41', '2023-09-14 12:57:41'),
(37, 50, 38, 'GlobeTalk', 'A timeless leather-strapped watch with a classic dial design.', 80000, 'ab578f30-030a-4b58-a224-0350266eddd1516wkPNV7bL._AC_UL240_SR240,220_.jpg', 7, 1, '2023-09-14 13:14:15', '2023-09-14 13:14:15'),
(38, 50, 38, ' Apple Watch Series 7', 'The Apple Watch Series 7 is the latest evolution in wearable technology, seamlessly blending style and functionality. With its stunning design and an array of features, it\'s more than just a watch; it\'s your daily companion for a healthier and more connected lifestyle.', 100000, 'ef904833-0a61-4611-979a-92b146a0645fUsed-Apple-Watch-Series-4-40mm-GPS-Cellular-4G-LTE-Stainless-Steel-Silver-Used_2bb45d9b-a4f7-4803-90bf-5ba14c8e5b72.0ab14c7e4f79eabcd7326438f3042bc1.webp', 5, 1, '2023-09-14 13:16:21', '2023-09-14 13:16:21'),
(39, 51, 39, ' Classic Denim Jacket', 'Elevate your style with our Classic Denim Jacket. This timeless piece is a must-have for any fashion-conscious individual. With its versatile design and superior craftsmanship, it\'s the perfect addition to your wardrobe.', 30000, '1a1098a8-9c95-4c96-8e2a-335261638aa8sherpa-denim-jacket-whit-protecction-level-2---3-in-1.jpg', 14, 1, '2023-09-14 13:29:50', '2023-09-14 13:29:50'),
(40, 51, 39, 'Cozy Knit Sweater', 'Stay warm and stylish with our Cozy Knit Sweater. This sweater is designed for ultimate comfort and versatility, making it a must-have for your winter wardrobe.', 20000, '2c2ce145-72ac-4fe1-8095-a479ea5cb92361TFlEAd5ML._AC_UF894,1000_QL80_.jpg', 17, 1, '2023-09-14 13:38:51', '2023-09-14 13:38:51'),
(41, 52, 40, 'Classic Leather Oxford Shoes', ' Elevate your formal attire with these timeless leather oxford shoes. Crafted with premium leather, these shoes feature a sleek design and comfortable fit, making them a perfect choice for business meetings and special occasions.', 20000, '8c085952-97f6-43d4-9264-ba5bea43af5f1TBLOX-H.jpg', 0, 1, '2023-09-14 13:53:23', '2023-09-14 13:53:23'),
(42, 52, 40, 'Athletic Performance Sneakers', 'Crush your fitness goals with our high-performance athletic sneakers. Designed for maximum comfort and support, these sneakers feature advanced cushioning technology and breathable mesh uppers, making them ideal for workouts or casual wear.', 30000, '08c9864f-6c23-4622-8e8f-597ffccae31cbest-jordan-sneakers-for-men-ultimate-style-and-performance.webp', 5, 1, '2023-09-14 13:54:48', '2023-09-14 13:54:48'),
(43, 53, 37, 'Fujitech Foldable Bluetooth Headphones2', 'Experience music like never before with our Fujitech Foldable Bluetooth Headphones. These wireless headphones deliver exceptional sound quality and comfort, making them perfect for long listening sessions. With built-in Bluetooth technology, you can easily pair them with your smartphone or tablet for a hassle-free, cord-free experience. The foldable design makes them portable and easy to carry wherever you go.', 15000, '8fba7d01-f648-46db-8beb-97570872863151THvStyxKS.jpg', 0, 1, '2023-09-15 11:30:07', '2023-09-15 11:30:50'),
(44, 49, 42, 'Premium Gel Pen Set', 'Experience smooth and effortless writing with this set of premium gel pens. Perfect for journaling and creative writing.', 10000, '11b048d7-4411-4849-bb3a-cd96164ebb9auni-ball-signo-207-retractable-gel-pen-ubc1745148.jpg', 6, 1, '2023-09-15 11:49:18', '2023-09-15 11:49:18'),
(45, 54, 37, 'Nexus X1 Pro Smartphone', ' The Nexus X1 Pro boasts a sleek and premium design that combines a polished metal frame with a vibrant 6.5-inch Super AMOLED display. It\'s both a fashion statement and a powerful tool.Equipped with the latest Snapdragon 8X chipset and 8GB of RAM, this smartphone delivers seamless multitasking, rapid app launches, and smooth gaming experiences.The 6.5-inch Super AMOLED display offers rich colors, deep blacks, and HDR10+ support, making every video and photo a visual masterpiece.', 500000, '08df4378-5ca2-4473-8210-d245c228d13f12c464ba-3f4b-4ee7-ae40-e2b8d46c0d29L.png', 2, 0, '2023-09-15 16:16:35', '2023-09-15 16:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(130) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `suspended` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `gender`, `profile`, `role_id`, `suspended`, `created_date`, `updated_date`) VALUES
(15, 'Aung Kyaw Wai Htun', 'admin@gmail.com', '$2a$10$samwCBfTC0NGTQVpg2BDveLHUJ3piVA4/XP35uxTr2VHREuft8v5a', 'Male', '03fc194d-17ee-4af2-ad2c-2faa7b34cd2e82463dff-a20e-4b80-8a69-4d71f395a6f5.jpg', 3, 0, '2023-09-14 11:30:26', '2023-09-14 11:32:22'),
(16, 'John Smith', 'john@gmail.com', '$2a$10$biR8ifGrdBBou2KbAwjhi.nb8.oXwtwA4H.bvTRCj2c06mLobPS4C', 'Male', NULL, 2, 0, '2023-09-14 11:34:24', '2023-09-14 11:34:24'),
(17, 'Will Stern', 'will@gmail.com', '$2a$10$/RbDG7qMf7u2W733R2Hd8.I2qRuWsThTia4tD2asoxKNegLQ1UEBS', 'Male', NULL, 2, 1, '2023-09-14 12:50:37', '2023-09-14 12:50:37'),
(18, 'Olivia', 'olivia@gmail.com', '$2a$10$BjmpdaBfkYf2Y2lP4UwEQeJW0tUVP7WGqOx1mkYeHw6bS25CtAoo.', 'Female', NULL, 2, 0, '2023-09-14 12:59:11', '2023-09-14 12:59:11'),
(19, 'Marry', 'marry@gmail.com', '$2a$10$h4fIBQPJKh77TGTFpoaD/uASdnpiQjgE7tdSTAd7DhLfCNkRS2ZqS', 'Female', '425e3e55-c0c7-4c07-8be0-a57b5b796ceaLove Story.jpg', 2, 0, '2023-09-14 13:21:06', '2023-09-18 08:12:58'),
(21, 'Jack', 'jack@gmail.com', '$2a$10$Y4fcNsXK2sauJFTXL6A9GuNfmwtevV3hPJ/do7plaCHNOOxnCNuay', 'Male', NULL, 2, 0, '2023-09-14 13:43:12', '2023-09-14 13:43:12'),
(22, 'Harry Hein', 'htoo@gmail.com', '$2a$10$CqEXJMMuFSL.Rn5iRxgLGes3QFgAkRQpwPjcH3Vsj/2CFvPScDz0a', 'Male', 'e0281a6a-cd71-4ec5-8aec-d897ce0541c2FB_IMG_1647143627201.jpg', 1, 0, '2023-09-14 16:42:28', '2023-09-15 17:46:57'),
(23, 'Si Thu', 'si@gmail.com', '$2a$10$X5jN/z009b4RPGSWTDqZN.OSKl4CNRAPd3MkG1B8GWm5pNm9/Yr/K', 'Male', NULL, 1, 1, '2023-09-14 17:00:32', '2023-09-14 17:01:05'),
(24, 'Harry', 'harry@gmail.com', '$2a$10$bZRqa7sX6.NDLyiNw/3whuKCRADYY6B58RpYi81VBiTLcOWIrf.le', 'Male', NULL, 2, 0, '2023-09-15 11:26:17', '2023-09-15 11:26:17'),
(25, 'Hein Htet Aung', 'hein@gmail.com', '$2a$10$i4MTIBbCNvbEhy48fWyjpuv.HkNYTR3Rd7kmgzX9PC0WGF0b/UjIm', 'Male', '1458d8ba-9a4a-47f7-b4bd-8b48d260369eFB_IMG_1627039138331.jpg', 1, 0, '2023-09-15 11:36:32', '2023-09-15 11:53:01'),
(27, 'Louis', 'louis@gmail.com', '$2a$10$uZ.KVCKoQHml7uSWgeMAgO26TjchH0omxiu9YxUGofIDz29n7Rdq2', 'Male', NULL, 2, 0, '2023-09-15 11:57:53', '2023-09-15 11:57:53'),
(28, 'Scotty', 'scotty@gmail.com', '$2a$10$sCHe0vNKFe3r9Lmq8qwdUewAcYTQLcnRAGuo.kd6tpS4De2gDjOL.', 'Male', NULL, 2, 0, '2023-09-15 16:00:17', '2023-09-15 16:00:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_id` (`business_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
