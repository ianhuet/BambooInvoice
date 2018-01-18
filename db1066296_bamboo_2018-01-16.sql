# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: mysql804.cp.blacknight.com (MySQL 5.0.83-community)
# Database: db1066296_bamboo
# Generation Time: 2018-01-16 14:59:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table kid_clientcontacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_clientcontacts`;

CREATE TABLE `kid_clientcontacts` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) default NULL,
  `first_name` varchar(25) default NULL,
  `last_name` varchar(25) default NULL,
  `title` varchar(75) default NULL,
  `email` varchar(127) default NULL,
  `phone` varchar(20) default NULL,
  `password` varchar(100) default NULL,
  `access_level` tinyint(1) default '0',
  `supervisor` int(11) default NULL,
  `last_login` int(11) default NULL,
  `password_reset` varchar(12) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_clientcontacts` WRITE;
/*!40000 ALTER TABLE `kid_clientcontacts` DISABLE KEYS */;

INSERT INTO `kid_clientcontacts` (`id`, `client_id`, `first_name`, `last_name`, `title`, `email`, `phone`, `password`, `access_level`, `supervisor`, `last_login`, `password_reset`)
VALUES
	(1,0,NULL,NULL,NULL,'ian@kestrelid.com',NULL,'D4106XBc7a3iMUhllrKmgOXNa5UWBRJdx3R457tcSFcY7rVxGd/V7iEZuO//AyDuoo/xU6sriaX4hUVLmd2jBA==',1,NULL,1297093288,''),
	(2,3,'Rachel','Walshe','0','rachel@3go.ie','045-989090',NULL,0,NULL,NULL,NULL),
	(3,4,'Michael','Collins','0','michael@abroadmagazine.com','',NULL,0,NULL,NULL,NULL),
	(4,5,'Hugh-John','O\'Reilly','0','hughjohn.oreilly@iqcontent.com','',NULL,0,NULL,NULL,NULL),
	(5,5,'Accounts','Dept','0','accounts@iqcontent.com','',NULL,0,NULL,NULL,NULL),
	(6,3,'Mick','Joyce','0','mick@3go.ie','',NULL,0,NULL,NULL,NULL),
	(7,6,'Brendan','Muldowney','0','brendan@spfilms.ie','',NULL,0,NULL,NULL,NULL),
	(8,7,'Raoul','Empey','0','raoul@sustineo.ie','',NULL,0,NULL,NULL,NULL),
	(9,2,'Fiona','Kelly','0','fionakelly@glimmer.ie','',NULL,0,NULL,NULL,NULL),
	(10,9,'Paul','O\'Connor','0','paul@propertyweek.ie','',NULL,0,NULL,NULL,NULL);

/*!40000 ALTER TABLE `kid_clientcontacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_clients`;

CREATE TABLE `kid_clients` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(75) default NULL,
  `address1` varchar(100) default NULL,
  `address2` varchar(100) default NULL,
  `city` varchar(50) default NULL,
  `province` varchar(25) default NULL,
  `country` varchar(25) default NULL,
  `postal_code` varchar(10) default NULL,
  `website` varchar(150) default NULL,
  `tax_status` int(1) default '1',
  `client_notes` mediumtext,
  `tax_code` varchar(75) default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_clients` WRITE;
/*!40000 ALTER TABLE `kid_clients` DISABLE KEYS */;

INSERT INTO `kid_clients` (`id`, `name`, `address1`, `address2`, `city`, `province`, `country`, `postal_code`, `website`, `tax_status`, `client_notes`, `tax_code`)
VALUES
	(1,'Ian Tester','No. 4 13 Newgrove Avenue','Sandymount','Dublin 4','','','','learn.kestrelid.com',1,NULL,''),
	(2,'Glimmer Design','Suite 1, Parliament Buildings,','5 Cork Hill,','Dublin 2','','','','www.glimmer.ie',1,NULL,''),
	(3,'3Go Mobile','Unit 2a','Clane Business Park','Clane','','Co. Kildare','','www.3go.ie',1,NULL,''),
	(4,'Woodfield Publishing','','','','','','','',1,NULL,''),
	(5,'IQContent','2nd Floor, Clarendon House','34 - 37 Clarendon Street','Dublin 2','','','','www.iqcontent.com',1,NULL,''),
	(6,'SP Films','','','','','','','',1,NULL,''),
	(7,'Sustineo','20 Harcourt Street','','Dublin 2','','Ireland','','www.sustineo.ie',1,NULL,''),
	(8,'Dept. of Social Protection','','','','','','','',0,NULL,''),
	(9,'Property Week','','','','','','','www.propertyweek.ie',1,NULL,'');

/*!40000 ALTER TABLE `kid_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_invoice_histories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_invoice_histories`;

CREATE TABLE `kid_invoice_histories` (
  `id` int(11) NOT NULL auto_increment,
  `invoice_id` int(11) default NULL,
  `clientcontacts_id` varchar(255) default NULL,
  `date_sent` date default NULL,
  `contact_type` int(1) default NULL,
  `email_body` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_invoice_histories` WRITE;
/*!40000 ALTER TABLE `kid_invoice_histories` DISABLE KEYS */;

INSERT INTO `kid_invoice_histories` (`id`, `invoice_id`, `clientcontacts_id`, `date_sent`, `contact_type`, `email_body`)
VALUES
	(1,2,'a:1:{i:0;s:13:\"Rachel Walshe\";}','2011-03-21',1,'Hello Rachel,\n\nPlease find the attached invoice for web hosting and domain name for last year. If you have any queries in relation to this you can contact me on 087-9292900.\n\nBest regards,\nIan'),
	(2,3,'a:1:{i:0;s:15:\"Michael Collins\";}','2011-03-21',1,'Morning Michael,\n\nAfter reviewing my accounts recently I was reminded of the outstanding payments due on your account. We previously discussed your desire to move to a situation of outsourcing the elsewhere yet I am not aware of any movement having been made in that regard.\n\nPart of the arrangement was to facilitate that transition, however at this stage I think it not unreasonable to issue this invoice for 2/3 of the outstanding amount due. If you have any questions in relation to this please contact me on 087-9292900.\n\nBest regards,\nIan'),
	(3,4,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-04-04',1,'Summary of Billable Hours\n\n12/03/11 02:06:30 initial setup and assets review\n15/03/11 01:17:54 revise login, add input fields\n16/03/11 00:32:24 drop down menu\n16/03/11 05:30:36 v.3 search, batch, single screens w/inputs, transitions and secondary buttons\n21/03/11 02:50:29 Android app development\n22/03/11 00:32:22 Android app development\n23/03/11 05:00:50 v.3 page revision + snags\n24/03/11 00:58:10 final snags. image cropping, search input, alternate home screen\n24/03/11 00:10:25 v.3 page revision + snags\n29/03/11 02:17:19 final snags & customer feedback. images Graphics v.4.0\n  \n  \nTotal Time - 24:57:00\n'),
	(4,4,'a:1:{i:0;s:13:\"Accounts Dept\";}','2011-04-04',1,'Revised as requested by noelle.mccoy@iqcontent.com.\n\nAlso I am aware that the payment terms of IQContent are different to those stated on the invoice. I am aware of this but technically unable to remove the payment period notice from the invoice at this time.\n\nbest regards,\nIan'),
	(5,2,'a:2:{i:0;s:13:\"Rachel Walshe\";i:1;s:10:\"Mick Joyce\";}','2011-04-06',1,'Please see attached invoice, which is overdue. please initiate payment or contact me on 087-9292900 at your nearest convenience.\n\nBest regards,\nIan'),
	(6,5,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-05-04',1,''),
	(7,5,'a:1:{i:0;s:13:\"Accounts Dept\";}','2011-05-10',1,'Total hours detail revised as advised.\n\nThanks,\nIan'),
	(8,7,'a:1:{i:0;s:17:\"Brendan Muldowney\";}','2011-06-01',1,'Hello Brendan,\n\nPlease find the attached invoice for hosting and domains which is now due. Please contact me on 087-9292900 if you have any queries.\n\nRegards,\nIan'),
	(9,6,'a:1:{i:0;s:15:\"Michael Collins\";}','2011-06-01',1,'Hello Michael,\n\nAmple time has passed since our last correspondence which I am taking as an indicator that no obstacles have been encourntered. Please find the attached invoice for the final, outstanding payment due for services rendered.\n\nBest regards,\nIan'),
	(10,8,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-06-07',1,'Please see attached invoice for May 2011, for Irish Life design to mark-up conversion. Any queries or issues please contact me on 087-9292900.\n\nAll the best,\nIan'),
	(11,7,'a:1:{i:0;s:17:\"Brendan Muldowney\";}','2011-06-15',1,'Please see revised invoice as discussed.'),
	(12,9,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-07-12',1,'Please see attached invoice for web development services during June 2011.\n\nyours sincerely,\nIan'),
	(13,9,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-08-08',1,'Please find attached outstanding invoice.\n\nBest regards,\nIan'),
	(14,10,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-08-09',1,'Please find attached invoice.\n\nBest regards,\nIan Huet'),
	(16,13,'a:1:{i:0;s:11:\"Fiona Kelly\";}','2011-09-15',1,'Hi Fiona,\n\nPlease see the attached invoice, I expect everything is in order and I appreciate your positive response earlier this week after such a long time. Never mind the payment term detail at the bottom, I just haven\'t figured out how to change that on a per-invoice basis as yet.\n\nAll the best,\nIan'),
	(17,14,'a:2:{i:0;s:18:\"Hugh-John O\'Reilly\";i:1;s:13:\"Accounts Dept\";}','2011-09-15',1,'Please see attached invoice for services rendered during August 2011.\n\nBest regards,\nIan'),
	(18,13,'a:1:{i:0;s:11:\"Fiona Kelly\";}','2011-09-22',1,'Hi Fiona,\n\nPlease find revised invoice attached.\n\nBest regards,\nIan'),
	(19,15,'a:1:{i:0;s:11:\"Fiona Kelly\";}','2011-09-22',1,'Hi Fiona,\n\nPlease find FutureFold invoice attached.\n\nMany thanks,\nIan'),
	(20,16,'a:1:{i:0;s:13:\"Paul O\'Connor\";}','2014-08-14',1,'Hi Paul,\n\nPlease find site disaster recovery invoice attached.\n\nAll the best,\nIan '),
	(21,17,'a:1:{i:0;s:13:\"Paul O\'Connor\";}','2015-06-15',1,'Hi Paul,\n\nPls find the attached invoice for all work undertaken as under the migration phase, including: modernisation & upgrading the application, move your websites to Blacknight, as well as your email.\n\nI will be away on holiday until July 8th, if you have any queries in the meantime I\'ll be checking my email periodically.\n\nThank you,\nIan'),
	(22,18,'a:1:{i:0;s:13:\"Paul O\'Connor\";}','2015-09-17',1,'Hi Paul,\n\nPlease find attached invoice for ValuePro Interface development.\n\nMany thanks,\nIan'),
	(23,19,'a:1:{i:0;s:13:\"Paul O\'Connor\";}','2016-04-06',1,'Hi Paul,\n\nWe\'ve not been in touch in a while. The app was updated with your feedback but I\'ve not a peep since. Been busy elsewhere or have we fallen into a mutual waiting situation?\n\nAlso, this invoice is outstanding.\n\nHope to hear from you soon,\nIan');

/*!40000 ALTER TABLE `kid_invoice_histories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_invoice_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_invoice_items`;

CREATE TABLE `kid_invoice_items` (
  `id` int(11) NOT NULL auto_increment,
  `invoice_id` int(11) default '0',
  `amount` decimal(11,2) default '0.00',
  `quantity` decimal(7,2) default '1.00',
  `work_description` mediumtext,
  `taxable` int(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_invoice_items` WRITE;
/*!40000 ALTER TABLE `kid_invoice_items` DISABLE KEYS */;

INSERT INTO `kid_invoice_items` (`id`, `invoice_id`, `amount`, `quantity`, `work_description`, `taxable`)
VALUES
	(5,2,225.00,1.00,'for year Feb 2010 - Mar 2011\n- business web hosting\n- domain renewal : www.3go.ie',1),
	(6,3,400.00,1.00,'Outstanding charges for services delivered 2009-2010',1),
	(8,4,1250.00,1.00,'Web development services for Citi Direct Android app\n\n25 hours @ €50 per hour\n\n\nSummary of Billable Hours\n\n12/03/11 02:06:30 initial setup and assets review\n15/03/11 01:17:54 revise login, add input fields\n16/03/11 00:32:24 drop down menu\n16/03/11 05:30:36 v.3 search, batch, single screens w/inputs, transitions and secondary buttons\n21/03/11 02:50:29 Android app development\n22/03/11 00:32:22 Android app development\n23/03/11 05:00:50 v.3 page revision + snags\n24/03/11 00:58:10 final snags. image cropping, search input, alternate home screen\n24/03/11 00:10:25 v.3 page revision + snags\n29/03/11 02:17:19 final snags & customer feedback. images Graphics v.4.0\n  \n  \nTotal Time - 24:57:00',1),
	(11,5,2810.00,1.00,'Web development services for Citi Direct Android app (April 2011)\n\n56hr 10min @ €50 per hour\n\n\nSummary of Billable Hours\n18/04/11 03:46:46 snagging\n18/04/11 00:24:22 implementation\n17/04/11 06:20:27 implementation\n17/04/11 07:00:58 implementation\n16/04/11 02:47:20 implementation\n15/04/11 03:13:01 implementation\n14/04/11 03:56:43 implementation\n14/04/11 02:04:30 v.2 designs review and implementation\n12/04/11 03:40:05 login, web cache, homepage menu revision\n11/04/11 04:31:40 login, web cache, homepage menu revision\n10/04/11 09:25:29 map all pages and storyboards v.1\n06/04/11 03:27:59 initial wireframe review and feature sandbox\n05/04/11 04:51:41 initial wireframe review and feature sandbox\n14/04/11 00:39:52 update page content (phone app)\n\nTotal Time - 56:10:00\n',1),
	(12,6,200.00,1.00,'Final, outstanding charges for services delivered 2009-2010',1),
	(15,8,2175.00,1.00,'Web development services for Irish Life conversion (May 2011)\n\n43.5 hr @ €50 per hour\n\nSummary of Billable Hours\n05/31/11 02:26:11 homepage slider testing\n05/30/11 03:10:43 homepage slider reconstruction\n05/18/11 06:42:33 redesign v3\n05/17/11 04:22:41 redesign v3\n05/17/11 03:51:09 redesign v.2\n05/16/11 02:45:20 redesign v.2\n05/15/11 09:06:20 master page v.1\n05/14/11 04:08:19 homepage v.1\n05/13/11 03:52:37 homepage v.1\n05/12/11 03:09:59 homepage v.1\n\nTotal Time: 43hr 35min',1),
	(17,7,40.00,1.00,'www.spfilms.ie - Domain registration\nwww.savagethefilm.com - Domain registration\n\nTransfer & hand-over handling',1),
	(18,9,1337.50,1.00,'Web development services for Citi Direct Cash2Mobile iOS app (June 2011)\n\n26hr 45min @ €50 per hour\n\n06/30/2011 04:03:52 final snags and app distribution\n06/29/2011 06:11:00 round 4 - adjustments and app packaging\n06/28/2011 04:08:00 round 3 adjustments\n06/27/2011 02:25:00 round 2 adjustments and fixes\n06/27/2011 02:17:00 round 2 adjustments and fixes\n06/24/2011 01:52:04 review iOS web app review & build version 1\n06/23/2011 03:30:57 review iOS web app review & build version 1\n06/22/2011 02:18:00 initial web app review\n\nTotal Time - 26:45:00',1),
	(19,10,612.50,1.00,'Web development services for Chinese conversion of Citi Direct Cash2Mobile app (July 2011)\n\n12hr 14min @ €50 per hour\n\n30/07/11 00:38:24 round 4 - refactor markup structure\n27/07/11 01:05:36 round 3 - UTF8 charset update\n22/07/11 01:19:00 round 2 - aspect rotation\n22/07/11 08:00:01 Round 1 - translation design HTML\n20/07/11 01:10:31 initial review\n\nTotal Time - 12:14:00',1),
	(29,12,225.00,1.00,'Design and Development of Content Managed website, www.sustineo.ie\n\nTotal cost for website quoted at eur300\n\n\n* eur75 part payment by Raoul Empey, received 2nd August 2011\n\nBalance payment of eur225 due by Dept of Social Protection',0),
	(35,13,300.00,1.00,'Loreto on the Green Past Pupils\n- Paypal integration\n- Membership registration',1),
	(33,14,596.50,1.00,'Web development services for Citi Pay (Palm Pre) & Cash2Mobile app (August 2011)\n\n11.95 hr @ €50 per hour\n\nSummary of Billable Hours\n08/09/11 04:42:41 initial review\n08/15/11 01:32:43 initial development\n08/17/11 03:03:28 initial development\n08/17/11 02:14:32 HTML content translation & prepare App files\n08/31/11 00:25:09 Cash2Mobile App\n\n\nTotal Time: 11hr 57min ',1),
	(34,15,150.00,1.00,'FutureFold\n- Conversion of Flash menu to HTML, CSS & jQuery',1),
	(37,16,75.00,6.00,'Site support / Development services',1),
	(39,17,950.00,1.00,'Modernise PW application (Upgrade from PHP3/4 to PHP5)\nUpgrade all database interactions for essential security improvement\n\nMigrate PropertyWeek website to Blacknight hosting\nMigrate Penhire website to Blacknight hosting\n\nMigrate domain nameservers (Penhire & PropertyWeek) to Blacknight\nMigrate all email accounts to Blacknight hosting\nUpdate all GMail account configurations inline with migration\n\nBackup database and codebase\nComplete several minor updates (Sale Agreed & Sold messages)',1),
	(40,18,800.00,1.00,'ValuePro Interface\n\n- Setup sub-domain: vpi.propertyweek.ie\n\n- Develop initial prototype API /2nd, /2nd/area, /2nd/address\n\n- Delivery expanded, complete search endpoint in API /2ndSearch\n\n- Liaise w/ ValuePro until API connectivity established\n\n- Support ValuePro integration process for 2 weeks after initial connectivity established\n',1),
	(41,19,2100.00,1.00,'Building mobile optimised version of PropertyWeek (37 hours)\n- Login authentication\n- 2nd Hand market search\n- Property Market News\n\nPropertyWeek database API\n- Data API for Mobile application\n\n\nLegacy website maintenance (5 hours)\n- Add Eircode UI (data admin & user view)\n- Minor update on SaleAgreed presentation\n- System admin support\n\n42hr @ €50 per hour',1);

/*!40000 ALTER TABLE `kid_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_invoice_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_invoice_payments`;

CREATE TABLE `kid_invoice_payments` (
  `id` int(11) NOT NULL auto_increment,
  `invoice_id` int(11) default NULL,
  `date_paid` date default NULL,
  `amount_paid` float(7,2) default NULL,
  `payment_note` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_invoice_payments` WRITE;
/*!40000 ALTER TABLE `kid_invoice_payments` DISABLE KEYS */;

INSERT INTO `kid_invoice_payments` (`id`, `invoice_id`, `date_paid`, `amount_paid`, `payment_note`)
VALUES
	(1,3,'2011-03-28',484.00,'0'),
	(2,2,'2011-05-24',225.00,'Full payment received'),
	(3,2,'2011-05-24',47.25,'Full payment received'),
	(4,4,'2011-05-18',1512.50,'0'),
	(5,6,'2011-06-15',242.00,'Payment in full'),
	(6,8,'2011-07-22',3400.00,'Payment in full'),
	(7,7,'2011-07-22',48.40,'Payment in Full'),
	(8,5,'2011-07-22',0.10,'Not Paid, disregarded'),
	(9,5,'2011-07-22',3400.00,'Payment in Full'),
	(10,10,'2011-09-08',741.13,'Payment in Full'),
	(11,9,'2011-09-08',1618.38,'Payment in Full'),
	(12,9,'2011-09-08',1618.38,'Payment in Full'),
	(13,12,'2011-09-29',225.00,'Payment in full'),
	(14,13,'2011-12-14',363.00,'payment in full'),
	(15,14,'2011-12-14',721.77,'Payment in full'),
	(16,15,'2011-12-23',181.50,'Payment in Full'),
	(17,16,'2014-09-04',553.50,'Payment in full'),
	(18,17,'2015-05-31',1168.50,'Paid in May 2015'),
	(19,18,'2015-09-24',984.00,'0'),
	(20,19,'2016-04-28',2583.00,'0');

/*!40000 ALTER TABLE `kid_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_invoices`;

CREATE TABLE `kid_invoices` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) default NULL,
  `invoice_number` varchar(255) default NULL,
  `dateIssued` date default NULL,
  `payment_term` varchar(50) default NULL,
  `tax1_desc` varchar(50) default NULL,
  `tax1_rate` decimal(6,3) default NULL,
  `tax2_desc` varchar(50) default NULL,
  `tax2_rate` decimal(6,3) default NULL,
  `invoice_note` text,
  `days_payment_due` int(3) unsigned default '30',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_invoices` WRITE;
/*!40000 ALTER TABLE `kid_invoices` DISABLE KEYS */;

INSERT INTO `kid_invoices` (`id`, `client_id`, `invoice_number`, `dateIssued`, `payment_term`, `tax1_desc`, `tax1_rate`, `tax2_desc`, `tax2_rate`, `invoice_note`, `days_payment_due`)
VALUES
	(4,5,'2011-IC-1','2011-04-04',NULL,'',21.000,'',0.000,'',30),
	(2,3,'2011-3Go-1','2011-03-21',NULL,'',21.000,'',0.000,'* 10% discount of eur25 applied for all long-term customers',30),
	(3,4,'2011-WP-1','2011-03-21',NULL,'',21.000,'',0.000,'** This is 2/3 of the actual, agreed outstanding charges of €600.',30),
	(5,5,'2011-IC-2','2011-05-03',NULL,'',21.000,'',0.000,'',30),
	(6,4,'2011-WP-2','2011-05-31',NULL,'',21.000,'',0.000,'',30),
	(7,6,'2011-SF-1','2011-05-31',NULL,'',21.000,'',0.000,'Revised invoice based on hosting transfer request',30),
	(8,5,'2011-IC-3','2011-06-02',NULL,'',21.000,'',0.000,'',30),
	(9,5,'2011-IC-4','2011-07-12',NULL,'',21.000,'',0.000,'',30),
	(10,5,'2011-IC-5','2011-08-09',NULL,'',21.000,'',0.000,'',30),
	(12,8,'2011-SU-1','2011-08-17',NULL,'0',0.000,'0',0.000,'',30),
	(13,2,'2011-GD-1','2011-09-15',NULL,'',21.000,'',0.000,'',30),
	(14,5,'2011-IQ-6','2011-09-15',NULL,'',21.000,'',0.000,'',30),
	(15,2,'2011-GD-2','2011-09-22',NULL,'',21.000,'',0.000,'',30),
	(16,9,'2014-PW-1','2014-08-14',NULL,'',23.000,'',0.000,'Hi Paul,\n\nPlease find migrated site recovery invoice attached.\n\nMany thanks,\nIan',30),
	(17,9,'2015-PW-1','2015-06-15',NULL,'',23.000,'',0.000,'',30),
	(18,9,'2015-PW-2','2015-09-17',NULL,'',23.000,'',0.000,'',30),
	(19,9,'2016-PW-1','2016-03-04',NULL,'',23.000,'',0.000,'Hi Paul,\n\nHere is the first invoice as recently discussed.\n\nMany thanks,\nIan',30);

/*!40000 ALTER TABLE `kid_invoices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table kid_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_sessions`;

CREATE TABLE `kid_sessions` (
  `session_id` varchar(40) NOT NULL default '0',
  `ip_address` varchar(16) NOT NULL default '0',
  `user_agent` varchar(50) default '',
  `last_activity` int(10) unsigned default '0',
  `user_id` int(11) default '0',
  `user_data` text,
  `logged_in` int(1) default '0',
  PRIMARY KEY  (`session_id`,`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table kid_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `kid_settings`;

CREATE TABLE `kid_settings` (
  `id` int(11) NOT NULL auto_increment,
  `company_name` varchar(75) default NULL,
  `address1` varchar(100) default NULL,
  `address2` varchar(100) default NULL,
  `city` varchar(50) default NULL,
  `province` varchar(25) default NULL,
  `country` varchar(25) default NULL,
  `postal_code` varchar(10) default NULL,
  `website` varchar(150) default NULL,
  `primary_contact` varchar(75) default NULL,
  `primary_contact_email` varchar(50) default NULL,
  `logo` varchar(50) default NULL,
  `logo_pdf` varchar(50) default NULL,
  `invoice_note_default` varchar(255) default NULL,
  `currency_type` varchar(20) default NULL,
  `currency_symbol` varchar(9) default '$',
  `tax_code` varchar(50) default NULL,
  `tax1_desc` varchar(50) default NULL,
  `tax1_rate` float(6,3) default '0.000',
  `tax2_desc` varchar(50) default NULL,
  `tax2_rate` float(6,3) default '0.000',
  `save_invoices` char(1) default 'n',
  `days_payment_due` int(3) unsigned default '30',
  `demo_flag` char(1) default 'n',
  `display_branding` char(1) default 'y',
  `bambooinvoice_version` varchar(9) default NULL,
  `new_version_autocheck` char(1) default 'n',
  `logo_realpath` char(1) default 'n',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `kid_settings` WRITE;
/*!40000 ALTER TABLE `kid_settings` DISABLE KEYS */;

INSERT INTO `kid_settings` (`id`, `company_name`, `address1`, `address2`, `city`, `province`, `country`, `postal_code`, `website`, `primary_contact`, `primary_contact_email`, `logo`, `logo_pdf`, `invoice_note_default`, `currency_type`, `currency_symbol`, `tax_code`, `tax1_desc`, `tax1_rate`, `tax2_desc`, `tax2_rate`, `save_invoices`, `days_payment_due`, `demo_flag`, `display_branding`, `bambooinvoice_version`, `new_version_autocheck`, `logo_realpath`)
VALUES
	(1,'Kestrel ID','Kestrel Lodge','','Kilmacanogue','Co. Wicklow','Ireland','','www.kestrelid.com','Ian Huet','ian@kestrelid.com',NULL,NULL,'','','&#0128;','','',23.000,'',0.000,'n',21,'n','0','0.8.9','y','n');

/*!40000 ALTER TABLE `kid_settings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
