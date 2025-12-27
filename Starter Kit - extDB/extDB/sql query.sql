DROP TABLE IF EXISTS `startkit`;
CREATE TABLE `startkit` (
  `PlayerUID` varchar(20) NOT NULL DEFAULT '0',
  `Name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Null',
  `Claimed` bigint unsigned NOT NULL DEFAULT '0',
  `CharacterID` bigint unsigned NOT NULL DEFAULT '0',
  `Datestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;