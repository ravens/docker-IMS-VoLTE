CREATE DATABASE `scscf`;

GRANT delete,insert,select,update on scscf.* to scscf@'%' identified by 'heslo';

USE scscf;

CREATE TABLE `version` (
    `table_name` VARCHAR(32) NOT NULL,
    `table_version` INT UNSIGNED DEFAULT 0 NOT NULL,
    CONSTRAINT table_name_idx UNIQUE (`table_name`)
);

REPLACE INTO version (table_name, table_version) values ('contact','6');

DROP TABLE IF EXISTS contact;
CREATE TABLE `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact` char(255) NOT NULL,
  `params` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `received` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `callid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact` (`contact`)
);

REPLACE INTO version (table_name, table_version) values ('impu','6');
DROP TABLE IF EXISTS impu;
CREATE TABLE `impu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `impu` char(64) NOT NULL,
  `barring` int(1) DEFAULT '0',
  `reg_state` int(11) DEFAULT '0',
  `ccf1` char(64) DEFAULT NULL,
  `ccf2` char(64) DEFAULT NULL,
  `ecf1` char(64) DEFAULT NULL,
  `ecf2` char(64) DEFAULT NULL,
  `ims_subscription_data` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `impu` (`impu`)
);

REPLACE INTO version (table_name, table_version) values ('impu_contact','6');
DROP TABLE IF EXISTS impu_contact;
CREATE TABLE `impu_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `impu_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `impu_id` (`impu_id`,`contact_id`)
);

REPLACE INTO version (table_name, table_version) values ('subscriber','6');
DROP TABLE IF EXISTS subscriber;
CREATE TABLE `subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watcher_uri` varchar(50) NOT NULL,
  `watcher_contact` varchar(50) NOT NULL,
  `presentity_uri` varchar(50) NOT NULL,
  `event` int(11) NOT NULL,
  `expires` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `local_cseq` int(11) NOT NULL,
  `call_id` varchar(50) NOT NULL,
  `from_tag` varchar(50) NOT NULL,
  `to_tag` varchar(50) NOT NULL,
  `record_route` varchar(50) NOT NULL,
  `sockinfo_str` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `watcher_uri` (`event`,`watcher_contact`,`presentity_uri`)
);

REPLACE INTO version (table_name, table_version) values ('impu_subscriber','6');
DROP TABLE IF EXISTS impu_subscriber;
CREATE TABLE `impu_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `impu_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `impu_id` (`impu_id`,`subscriber_id`)
);
