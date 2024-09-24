-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 11:29 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tests_interview_bdtask`
--
DROP DATABASE IF EXISTS `tests_interview_bdtask`;
CREATE DATABASE IF NOT EXISTS `tests_interview_bdtask` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tests_interview_bdtask`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `post_id`, `comment`, `date_added`) VALUES
(2, 2, 10, 'Hi, this is a comment. Thanks for this nice post. I like to see you blog. ', '2014-08-26 15:38:00'),
(3, 4, 10, 'Oh, thanks for reading this blog. Thanks for being with me.', '2014-08-26 15:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_title`, `post`, `active`, `date_added`, `user_id`, `img`) VALUES
(1, 'Post 1', 'This is a demo post. This post is just only to test the functionality of the blog. If this post works properly then I could say that I am done for today. Thank you my dear.', 1, '2014-08-18 11:29:30', 1, NULL),
(2, 'Post 2', 'This is the 2nd post. This post is to test the insert functionality of my blog. If this method works properly then I can say that I am done with insert. Thanks for being with me.', 1, '2014-08-18 11:50:17', 1, NULL),
(3, 'Post 3', 'Yahh! It\'s working properly. I have done the operation of CRUD on database. I feel really cool with codeigniter. This framework is really very easy to learn for the first time you start.', 1, '2014-08-18 11:50:36', 2, NULL),
(4, 'Post 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,', 1, '2014-08-18 18:23:29', 1, NULL),
(5, 'Post 5', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere', 1, '2014-08-18 18:23:40', 2, NULL),
(6, 'Post 6', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee', 1, '2014-08-18 18:23:49', 1, NULL),
(7, 'Post 7', 'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues. Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es.Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.', 1, '2014-08-18 18:24:00', 3, NULL),
(8, 'Post 8', 'The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is.The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To', 1, '2014-08-18 18:24:11', 4, NULL),
(9, 'Post 9', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, '2014-08-18 18:24:18', 4, NULL),
(10, 'Post 10', 'Lorem Ipsum is', 1, '2014-08-19 18:38:18', 3, NULL),
(14, 'Good To tests', 'asdosod s ds goe she', 1, '2022-01-22 08:27:27', 1, NULL),
(15, 'My Post', 'Post Description goes here.', 1, '2022-01-22 09:11:58', 1, '{\"upload_data\":{\"file_name\":\"red-banner-examples-260nw-11500020411.jpg\",\"file_type\":\"image\\/jpeg\",\"file_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/\",\"full_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/red-banner-examples-260nw-11500020411.jpg\",\"raw_name\":\"red-banner-examples-260nw-11500020411\",\"orig_name\":\"red-banner-examples-260nw-1150002041.jpg\",\"client_name\":\"red-banner-examples-260nw-1150002041.jpg\",\"file_ext\":\".jpg\",\"file_size\":18.67,\"is_image\":true,\"image_width\":705,\"image_height\":280,\"image_type\":\"jpeg\",\"image_size_str\":\"width=\\\"705\\\" height=\\\"280\\\"\"}}'),
(16, 'My Post Title', 'alsdo ds d s sed sdf', 1, '2022-01-22 09:14:17', 1, '{\"upload_data\":{\"file_name\":\"download3.png\",\"file_type\":\"image\\/png\",\"file_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/\",\"full_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/download3.png\",\"raw_name\":\"download3\",\"orig_name\":\"download.png\",\"client_name\":\"download.png\",\"file_ext\":\".png\",\"file_size\":5.73,\"is_image\":true,\"image_width\":278,\"image_height\":181,\"image_type\":\"png\",\"image_size_str\":\"width=\\\"278\\\" height=\\\"181\\\"\"}}'),
(22, 'Gofdgdfg', 'asdfasd fasd fdfgdfg dsfg ', 1, '2022-01-22 10:10:21', 1, '{\"upload_data\":{\"file_name\":\"istockphoto-1316134499-170667a.jpg\",\"file_type\":\"image\\/jpeg\",\"file_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/\",\"full_path\":\"C:\\/xampp\\/htdocs\\/bdtask\\/public\\/uploads\\/istockphoto-1316134499-170667a.jpg\",\"raw_name\":\"istockphoto-1316134499-170667a\",\"orig_name\":\"istockphoto-1316134499-170667a.jpg\",\"client_name\":\"istockphoto-1316134499-170667a.jpg\",\"file_ext\":\".jpg\",\"file_size\":86.79,\"is_image\":true,\"image_width\":509,\"image_height\":339,\"image_type\":\"jpeg\",\"image_size_str\":\"width=\\\"509\\\" height=\\\"339\\\"\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(4) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('admin','author','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `username`, `password`, `user_type`) VALUES
(1, 'admin@user.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
