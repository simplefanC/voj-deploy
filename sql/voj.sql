/*
 Navicat Premium Data Transfer

 Source Server         : 47.100.64.212
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : voj

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/09/2022 17:18:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `voj` DEFAULT CHARACTER SET utf8;

USE `voj`;
-- ----------------------------
-- Table structure for admin_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `admin_sys_notice`;
CREATE TABLE `admin_sys_notice`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
    `type`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发给哪些用户类型',
    `state`        tinyint(1) NULL DEFAULT 0 COMMENT '是否已拉取给用户',
    `recipient_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接受通知的用户id',
    `admin_id`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送通知的管理员id',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `recipient_id`(`recipient_id`) USING BTREE,
    INDEX          `admin_id`(`admin_id`) USING BTREE,
    CONSTRAINT `admin_sys_notice_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `admin_sys_notice_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `status`       int(11) NULL DEFAULT 0 COMMENT '0可见，1不可见',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
    `permission`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限字符串',
    `status`       tinyint(4) NOT NULL DEFAULT 0 COMMENT '0可用，1不可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for code_template
-- ----------------------------
DROP TABLE IF EXISTS `code_template`;
CREATE TABLE `code_template`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `pid`          bigint(20) UNSIGNED NOT NULL,
    `lid`          bigint(20) UNSIGNED NOT NULL,
    `code`         longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `status`       tinyint(1) NULL DEFAULT 0,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `lid`(`lid`) USING BTREE,
    CONSTRAINT `code_template_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `code_template_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `cid`          bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'null表示无引用比赛',
    `did`          int(11) NULL DEFAULT NULL COMMENT 'null表示无引用讨论',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
    `from_uid`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论者id',
    `from_name`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者用户名',
    `from_avatar`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论组头像地址',
    `from_role`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者角色',
    `like_num`     int(11) NULL DEFAULT 0 COMMENT '点赞数量',
    `status`       int(11) NULL DEFAULT 0 COMMENT '是否封禁或逻辑删除该评论',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`from_uid`) USING BTREE,
    INDEX          `from_avatar`(`from_avatar`) USING BTREE,
    INDEX          `comment_ibfk_7`(`did`) USING BTREE,
    INDEX          `cid`(`cid`) USING BTREE,
    CONSTRAINT `comment_ibfk_6` FOREIGN KEY (`from_avatar`) REFERENCES `user_info` (`avatar`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `comment_ibfk_7` FOREIGN KEY (`did`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `comment_ibfk_8` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment_like
-- ----------------------------
DROP TABLE IF EXISTS `comment_like`;
CREATE TABLE `comment_like`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `cid`          int(11) NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `cid`(`cid`) USING BTREE,
    CONSTRAINT `comment_like_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `comment_like_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest
-- ----------------------------
DROP TABLE IF EXISTS `contest`;
CREATE TABLE `contest`
(
    `id`                 bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `uid`                varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '比赛创建者id',
    `author`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛创建者的用户名',
    `title`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛标题',
    `type`               int(11) NOT NULL DEFAULT 0 COMMENT '0为acm赛制，1为比分赛制',
    `description`        longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '比赛说明',
    `source`             int(11) NULL DEFAULT 0 COMMENT '比赛来源，原创为0，克隆赛为比赛id',
    `auth`               int(11) NOT NULL COMMENT '0为公开赛，1为私有赛（访问有密码），2为保护赛（提交有密码）',
    `open_pwd_limit`     tinyint(1) NULL DEFAULT NULL,
    `pwd`                varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛密码',
    `start_time`         datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
    `end_time`           datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
    `duration`           bigint(20) NULL DEFAULT NULL COMMENT '比赛时长(s)',
    `seal_rank`          tinyint(1) NULL DEFAULT 0 COMMENT '是否开启封榜',
    `seal_rank_time`     datetime(0) NULL DEFAULT NULL COMMENT '封榜起始时间，一直到比赛结束，不刷新榜单',
    `auto_real_rank`     tinyint(1) NULL DEFAULT 1 COMMENT '比赛结束是否自动解除封榜,自动转换成真实榜单',
    `status`             int(11) NULL DEFAULT NULL COMMENT '-1为未开始，0为进行中，1为已结束',
    `visible`            tinyint(1) NULL DEFAULT 1 COMMENT '是否可见',
    `open_print`         tinyint(1) NULL DEFAULT 0 COMMENT '是否打开打印功能',
    `open_account_limit` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启账号限制',
    `account_limit_rule` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '账号限制规则',
    `rank_show_name`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'username' COMMENT '排行榜显示（username、nickname、realname）',
    `open_rank`          tinyint(1) NULL DEFAULT 0 COMMENT '是否开放比赛榜单',
    `star_account`       mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '打星用户列表',
    `gmt_create`         datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`       datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    `oi_rank_score_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Recent' COMMENT 'oi排行榜得分方式，Recent、Highest',
    PRIMARY KEY (`id`, `uid`) USING BTREE,
    INDEX                `uid`(`uid`) USING BTREE,
    CONSTRAINT `contest_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_announcement
-- ----------------------------
DROP TABLE IF EXISTS `contest_announcement`;
CREATE TABLE `contest_announcement`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `aid`          bigint(20) UNSIGNED NOT NULL COMMENT '公告id',
    `cid`          bigint(20) UNSIGNED NOT NULL COMMENT '比赛id',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `contest_announcement_ibfk_1`(`cid`) USING BTREE,
    INDEX          `contest_announcement_ibfk_2`(`aid`) USING BTREE,
    CONSTRAINT `contest_announcement_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_announcement_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `announcement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_explanation
-- ----------------------------
DROP TABLE IF EXISTS `contest_explanation`;
CREATE TABLE `contest_explanation`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `cid`          bigint(20) UNSIGNED NOT NULL,
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发布者（必须为比赛创建者或者超级管理员才能）',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容(支持markdown)',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `contest_explanation_ibfk_1`(`cid`) USING BTREE,
    CONSTRAINT `contest_explanation_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_explanation_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_print
-- ----------------------------
DROP TABLE IF EXISTS `contest_print`;
CREATE TABLE `contest_print`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `realname`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `cid`          bigint(20) UNSIGNED NULL DEFAULT NULL,
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `status`       int(11) NULL DEFAULT 0,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `cid`(`cid`) USING BTREE,
    INDEX          `username`(`username`) USING BTREE,
    CONSTRAINT `contest_print_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_print_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_problem
-- ----------------------------
DROP TABLE IF EXISTS `contest_problem`;
CREATE TABLE `contest_problem`
(
    `id`            bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `display_id`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该题目在比赛中的顺序id',
    `cid`           bigint(20) UNSIGNED NOT NULL COMMENT '比赛id',
    `pid`           bigint(20) UNSIGNED NOT NULL COMMENT '题目id',
    `display_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该题目在比赛中的标题，默认为原名字',
    `color`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '气球颜色',
    `gmt_create`    datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`  datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `cid`, `pid`) USING BTREE,
    UNIQUE INDEX `display_id`(`display_id`, `cid`, `pid`) USING BTREE,
    INDEX           `contest_problem_ibfk_1`(`cid`) USING BTREE,
    INDEX           `contest_problem_ibfk_2`(`pid`) USING BTREE,
    CONSTRAINT `contest_problem_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_problem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 382 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_record
-- ----------------------------
DROP TABLE IF EXISTS `contest_record`;
CREATE TABLE `contest_record`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `cid`          bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '比赛id',
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `pid`          bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '题目id',
    `cpid`         bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '比赛中的题目的id',
    `username`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
    `realname`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `display_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '比赛中展示的id',
    `submit_id`    bigint(20) UNSIGNED NOT NULL COMMENT '提交id，用于可重判',
    `status`       int(11) NULL DEFAULT NULL COMMENT '提交结果，0表示未AC通过不罚时，1表示AC通过，-1为未AC通过算罚时',
    `submit_time`  datetime(0) NOT NULL COMMENT '具体提交时间',
    `time`         bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '提交时间，为提交时间减去比赛时间',
    `score`        int(11) NULL DEFAULT NULL COMMENT 'OI比赛的得分',
    `use_time`     int(11) NULL DEFAULT NULL COMMENT '运行耗时',
    `first_blood`  tinyint(1) NULL DEFAULT 0 COMMENT '是否为一血AC(废弃)',
    `checked`      tinyint(1) NULL DEFAULT 0 COMMENT 'AC是否已校验',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `submit_id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `cpid`(`cpid`) USING BTREE,
    INDEX          `submit_id`(`submit_id`) USING BTREE,
    INDEX          `index_cid`(`cid`) USING BTREE,
    INDEX          `index_time`(`time`) USING BTREE,
    CONSTRAINT `contest_record_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_record_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_record_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_record_ibfk_4` FOREIGN KEY (`cpid`) REFERENCES `contest_problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_record_ibfk_5` FOREIGN KEY (`submit_id`) REFERENCES `judge` (`submit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19424 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_register
-- ----------------------------
DROP TABLE IF EXISTS `contest_register`;
CREATE TABLE `contest_register`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `cid`          bigint(20) UNSIGNED NOT NULL COMMENT '比赛id',
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `status`       int(11) NULL DEFAULT 0 COMMENT '默认为0表示正常，1为失效。',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `cid`, `uid`) USING BTREE,
    UNIQUE INDEX `cid_uid_unique`(`cid`, `uid`) USING BTREE,
    INDEX          `contest_register_ibfk_2`(`uid`) USING BTREE,
    CONSTRAINT `contest_register_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `contest_register_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1665 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for contest_score
-- ----------------------------
DROP TABLE IF EXISTS `contest_score`;
CREATE TABLE `contest_score`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `cid`          bigint(20) UNSIGNED NOT NULL,
    `last`         int(11) NULL DEFAULT NULL COMMENT '比赛前的score得分',
    `change`       int(11) NULL DEFAULT NULL COMMENT 'Score比分变化',
    `now`          int(11) NULL DEFAULT NULL COMMENT '现在的score',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `cid`) USING BTREE,
    INDEX          `contest_score_ibfk_1`(`cid`) USING BTREE,
    CONSTRAINT `contest_score_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contest` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussion
-- ----------------------------
DROP TABLE IF EXISTS `discussion`;
CREATE TABLE `discussion`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `category_id`  int(11) NOT NULL COMMENT '分类id',
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论标题',
    `description`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讨论简介',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '讨论内容',
    `pid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联题目id',
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '发表者id',
    `author`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发表者用户名',
    `avatar`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发表讨论者头像',
    `role`         varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'user' COMMENT '发表者角色',
    `view_num`     int(11) NULL DEFAULT 0 COMMENT '浏览数量',
    `like_num`     int(11) NULL DEFAULT 0 COMMENT '点赞数量',
    `top_priority` tinyint(1) NULL DEFAULT 0 COMMENT '优先级，是否置顶',
    `comment_num`  int(11) NULL DEFAULT 0 COMMENT '评论数量',
    `status`       int(1) NULL DEFAULT 0 COMMENT '是否封禁该讨论',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `category_id`(`category_id`) USING BTREE,
    INDEX          `discussion_ibfk_4`(`avatar`) USING BTREE,
    INDEX          `discussion_ibfk_1`(`uid`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    CONSTRAINT `discussion_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `discussion_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `discussion_ibfk_4` FOREIGN KEY (`avatar`) REFERENCES `user_info` (`avatar`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `discussion_ibfk_6` FOREIGN KEY (`pid`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussion_like
-- ----------------------------
DROP TABLE IF EXISTS `discussion_like`;
CREATE TABLE `discussion_like`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `did`          int(11) NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `did`(`did`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `discussion_like_ibfk_1` FOREIGN KEY (`did`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `discussion_like_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discussion_report
-- ----------------------------
DROP TABLE IF EXISTS `discussion_report`;
CREATE TABLE `discussion_report`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `did`          int(11) NULL DEFAULT NULL COMMENT '讨论id',
    `reporter`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报者的用户名',
    `content`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报内容',
    `status`       tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `did`(`did`) USING BTREE,
    INDEX          `reporter`(`reporter`) USING BTREE,
    CONSTRAINT `discussion_report_ibfk_1` FOREIGN KEY (`did`) REFERENCES `discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `discussion_report_ibfk_2` FOREIGN KEY (`reporter`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`
(
    `id`           bigint(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
    `suffix`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件后缀格式',
    `folder_path`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件所在文件夹的路径',
    `file_path`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件绝对路径',
    `type`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件所属类型，例如avatar',
    `delete`       tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `file_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for judge
-- ----------------------------
DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge`
(
    `submit_id`        bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `pid`              bigint(20) UNSIGNED NOT NULL COMMENT '题目id',
    `display_pid`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目展示id',
    `uid`              varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '用户id',
    `username`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
    `submit_time`      datetime(0) NOT NULL COMMENT '提交的时间',
    `status`           int(11) NULL DEFAULT NULL COMMENT '结果码具体参考文档',
    `share`            tinyint(1) NULL DEFAULT 0 COMMENT '0为仅自己可见，1为全部人可见。',
    `error_message`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '错误提醒（编译错误，或者vj提醒）',
    `time`             int(11) NULL DEFAULT NULL COMMENT '运行时间(ms)',
    `memory`           int(11) NULL DEFAULT NULL COMMENT '运行内存（kb）',
    `score`            int(11) NULL DEFAULT NULL COMMENT 'IO判题则不为空',
    `length`           int(11) NULL DEFAULT NULL COMMENT '代码长度',
    `code`             longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
    `language`         varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码语言',
    `cid`              bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '比赛id，非比赛题目默认为0',
    `cpid`             bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '比赛中题目排序id，非比赛题目默认为0',
    `judger`           varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '判题机ip',
    `ip`               varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交者所在ip',
    `version`          int(11) NOT NULL DEFAULT 0 COMMENT '乐观锁',
    `oi_rank_score`    int(11) NULL DEFAULT 0 COMMENT 'oi排行榜得分',
    `vjudge_submit_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vjudge判题在其它oj的提交id',
    `vjudge_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vjudge判题在其它oj的提交用户名',
    `vjudge_password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vjudge判题在其它oj的提交账号密码',
    `gmt_create`       datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`     datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`submit_id`, `pid`, `display_pid`, `uid`, `cid`) USING BTREE,
    INDEX              `pid`(`pid`) USING BTREE,
    INDEX              `uid`(`uid`) USING BTREE,
    INDEX              `username`(`username`) USING BTREE,
    CONSTRAINT `judge_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `judge_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `judge_ibfk_3` FOREIGN KEY (`username`) REFERENCES `user_info` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21157 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for judge_case
-- ----------------------------
DROP TABLE IF EXISTS `judge_case`;
CREATE TABLE `judge_case`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `submit_id`    bigint(20) UNSIGNED NOT NULL COMMENT '提交判题id',
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `pid`          bigint(20) UNSIGNED NOT NULL COMMENT '题目id',
    `case_id`      bigint(20) NULL DEFAULT NULL COMMENT '测试样例id',
    `status`       int(11) NULL DEFAULT NULL COMMENT '具体看结果码',
    `time`         int(11) NULL DEFAULT NULL COMMENT '测试该样例所用时间ms',
    `memory`       int(11) NULL DEFAULT NULL COMMENT '测试该样例所用空间KB',
    `score`        int(11) NULL DEFAULT NULL COMMENT 'IO得分',
    `input_data`   longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '样例输入，比赛不可看',
    `output_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '样例输出，比赛不可看',
    `user_output`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户样例输出，比赛不可看',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `submit_id`, `uid`, `pid`) USING BTREE,
    INDEX          `case_id`(`case_id`) USING BTREE,
    INDEX          `judge_case_ibfk_1`(`uid`) USING BTREE,
    INDEX          `judge_case_ibfk_2`(`pid`) USING BTREE,
    INDEX          `judge_case_ibfk_3`(`submit_id`) USING BTREE,
    CONSTRAINT `judge_case_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `judge_case_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `judge_case_ibfk_3` FOREIGN KEY (`submit_id`) REFERENCES `judge` (`submit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 131010 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for judge_server
-- ----------------------------
DROP TABLE IF EXISTS `judge_server`;
CREATE TABLE `judge_server`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `name`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '判题服务名字',
    `ip`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '判题机ip',
    `port`            int(11) NOT NULL COMMENT '判题机端口号',
    `url`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip:port',
    `cpu_core`        int(11) NULL DEFAULT 0 COMMENT '判题机所在服务器cpu核心数',
    `task_number`     int(11) NOT NULL DEFAULT 0 COMMENT '当前判题数',
    `max_task_number` int(11) NOT NULL COMMENT '判题并发最大数',
    `status`          int(11) NULL DEFAULT 0 COMMENT '0可用，1不可用',
    `is_remote`       tinyint(1) NULL DEFAULT NULL COMMENT '是否开启远程判题vj',
    `cf_submittable`  tinyint(1) NULL DEFAULT 1 COMMENT '是否可提交CF',
    `gmt_create`      datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`    datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX             `index_judge_remote`(`is_remote`) USING BTREE,
    INDEX             `index_judge_url`(`url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 321 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`
(
    `id`              bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `content_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言类型',
    `description`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言描述',
    `name`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言名字',
    `compile_command` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '编译指令',
    `template`        longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板',
    `code_template`   longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '语言默认代码模板',
    `is_spj`          tinyint(1) NULL DEFAULT 0 COMMENT '是否可作为特殊判题的一种语言',
    `oj`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该语言属于哪个oj，自身oj用ME',
    `gmt_create`      datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`    datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mapping_training_category
-- ----------------------------
DROP TABLE IF EXISTS `mapping_training_category`;
CREATE TABLE `mapping_training_category`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `tid`          bigint(20) UNSIGNED NOT NULL,
    `cid`          bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `tid`(`tid`) USING BTREE,
    INDEX          `cid`(`cid`) USING BTREE,
    CONSTRAINT `mapping_training_category_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `mapping_training_category_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `training_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for msg_remind
-- ----------------------------
DROP TABLE IF EXISTS `msg_remind`;
CREATE TABLE `msg_remind`
(
    `id`             bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `action`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动作类型，如点赞讨论帖Like_Post、点赞评论Like_Discuss、评论Discuss、回复Reply等',
    `source_id`      int(10) UNSIGNED NULL DEFAULT NULL COMMENT '消息来源id，讨论id或比赛id',
    `source_type`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件源类型：\' Discussion\'、\' Contest\'等',
    `source_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件源的内容，比如回复的内容，评论的帖子标题等等',
    `quote_id`       int(10) UNSIGNED NULL DEFAULT NULL COMMENT '事件引用上一级评论或回复id',
    `quote_type`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件引用上一级的类型：Comment、Reply',
    `url`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件所发生的地点链接 url',
    `state`          tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
    `sender_id`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者的id',
    `recipient_id`   varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接受消息的用户id',
    `gmt_create`     datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `gmt_modified`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `sender_id`(`sender_id`) USING BTREE,
    INDEX            `recipient_id`(`recipient_id`) USING BTREE,
    CONSTRAINT `msg_remind_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `msg_remind_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`
(
    `id`                  bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `problem_id`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问题的自定义ID 例如（HOJ-1000）',
    `title`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目',
    `author`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '作者',
    `type`                int(11) NOT NULL DEFAULT 0 COMMENT '0为ACM,1为OI',
    `judge_mode`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'default,spj,interactive',
    `time_limit`          int(11) NULL DEFAULT 1000 COMMENT '单位ms',
    `memory_limit`        int(11) NULL DEFAULT 65535 COMMENT '单位kb',
    `stack_limit`         int(11) NULL DEFAULT 128 COMMENT '单位mb',
    `description`         longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
    `input`               longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '输入描述',
    `output`              longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '输出描述',
    `examples`            longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '题面样例',
    `is_remote`           tinyint(1) NULL DEFAULT 0 COMMENT '是否为vj判题',
    `source`              text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '题目来源',
    `difficulty`          int(11) NULL DEFAULT 0 COMMENT '题目难度,0简单，1中等，2困难',
    `hint`                longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注,提醒',
    `auth`                int(11) NULL DEFAULT 1 COMMENT '默认为1公开，2为私有，3为比赛题目',
    `io_score`            int(11) NULL DEFAULT 100 COMMENT '当该题目为io题目时的分数',
    `code_share`          tinyint(1) NULL DEFAULT 1 COMMENT '该题目对应的相关提交代码，用户是否可用分享',
    `spj_code`            longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特判程序代码 空代表非特判',
    `spj_language`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特判程序的语言',
    `user_extra_file`     mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特判程序或交互程序的额外文件',
    `judge_extra_file`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特判程序或交互程序的额外文件',
    `is_remove_end_blank` tinyint(1) NULL DEFAULT 1 COMMENT '是否默认去除用户代码的文末空格',
    `open_case_result`    tinyint(1) NULL DEFAULT 1 COMMENT '是否默认开启该题目的测试样例结果查看',
    `is_upload_case`      tinyint(1) NULL DEFAULT 1 COMMENT '题目测试数据是否是上传文件的',
    `case_version`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '题目测试数据的版本号',
    `modified_user`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改题目的管理员用户名',
    `info`                varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `gmt_create`          datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified`        datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX                 `author`(`author`) USING BTREE,
    INDEX                 `problem_id`(`problem_id`) USING BTREE,
    CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user_info` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7834 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problem_case
-- ----------------------------
DROP TABLE IF EXISTS `problem_case`;
CREATE TABLE `problem_case`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `pid`          bigint(20) UNSIGNED NOT NULL COMMENT '题目id',
    `input`        longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测试样例的输入',
    `output`       longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '测试样例的输出',
    `score`        int(11) NULL DEFAULT NULL COMMENT '该测试样例的IO得分',
    `status`       int(11) NULL DEFAULT 0 COMMENT '0可用，1不可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    CONSTRAINT `problem_case_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3665 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problem_language
-- ----------------------------
DROP TABLE IF EXISTS `problem_language`;
CREATE TABLE `problem_language`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `pid`          bigint(20) UNSIGNED NOT NULL,
    `lid`          bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `lid`(`lid`) USING BTREE,
    CONSTRAINT `problem_language_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `problem_language_ibfk_2` FOREIGN KEY (`lid`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 85203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for problem_tag
-- ----------------------------
DROP TABLE IF EXISTS `problem_tag`;
CREATE TABLE `problem_tag`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `pid`          bigint(20) UNSIGNED NOT NULL,
    `tid`          bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `tid`(`tid`) USING BTREE,
    CONSTRAINT `problem_tag_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `problem_tag_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7810 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remote_judge_account
-- ----------------------------
DROP TABLE IF EXISTS `remote_judge_account`;
CREATE TABLE `remote_judge_account`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `oj`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '远程oj名字',
    `username`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
    `password`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    `status`       tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
    `version`      bigint(20) NULL DEFAULT 0 COMMENT '版本控制',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1299 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`
(
    `id`           int(11) NOT NULL AUTO_INCREMENT,
    `comment_id`   int(11) NOT NULL COMMENT '被回复的评论id',
    `from_uid`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起回复的用户id',
    `from_name`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发起回复的用户名',
    `from_avatar`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起回复的用户头像地址',
    `from_role`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起回复的用户角色',
    `to_uid`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被回复的用户id',
    `to_name`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被回复的用户名',
    `to_avatar`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被回复的用户头像地址',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复的内容',
    `status`       int(11) NULL DEFAULT 0 COMMENT '是否封禁或逻辑删除该回复',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `comment_id`(`comment_id`) USING BTREE,
    INDEX          `from_avatar`(`from_avatar`) USING BTREE,
    INDEX          `to_avatar`(`to_avatar`) USING BTREE,
    CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`from_avatar`) REFERENCES `user_info` (`avatar`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`to_avatar`) REFERENCES `user_info` (`avatar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
    `id`           bigint(20) UNSIGNED ZEROFILL NOT NULL,
    `role`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
    `description`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `status`       tinyint(4) NOT NULL DEFAULT 0 COMMENT '默认0可用，1不可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `auth_id`      bigint(20) UNSIGNED NOT NULL,
    `role_id`      bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `auth_id`(`auth_id`) USING BTREE,
    INDEX          `role_id`(`role_id`) USING BTREE,
    CONSTRAINT `role_auth_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `auth` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `role_auth_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `user_agent`   varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `ip`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `session_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3784 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名字',
    `color`        varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签颜色',
    `oj`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ME' COMMENT '标签所属oj',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    `tcid`         bigint(20) UNSIGNED NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `name`(`name`, `oj`) USING BTREE,
    INDEX          `tag_ibfk_2`(`tcid`) USING BTREE,
    CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`tcid`) REFERENCES `tag_classification` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag_classification
-- ----------------------------
DROP TABLE IF EXISTS `tag_classification`;
CREATE TABLE `tag_classification`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签分类名称',
    `oj`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签分类所属oj',
    `gmt_create`   datetime(0) NULL DEFAULT NULL,
    `gmt_modified` datetime(0) NULL DEFAULT NULL,
    `rank`         int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '标签分类优先级 越小越高',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for training
-- ----------------------------
DROP TABLE IF EXISTS `training`;
CREATE TABLE `training`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '训练题单名称',
    `description`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '训练题单简介',
    `author`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '训练题单创建者用户名',
    `auth`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '训练题单权限类型：Public、Private',
    `private_pwd`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '训练题单权限为Private时的密码',
    `rank`         int(11) NULL DEFAULT 0 COMMENT '编号，升序',
    `status`       tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for training_category
-- ----------------------------
DROP TABLE IF EXISTS `training_category`;
CREATE TABLE `training_category`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `color`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for training_problem
-- ----------------------------
DROP TABLE IF EXISTS `training_problem`;
CREATE TABLE `training_problem`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `tid`          bigint(20) UNSIGNED NOT NULL COMMENT '训练id',
    `pid`          bigint(20) UNSIGNED NOT NULL COMMENT '题目id',
    `rank`         int(11) NULL DEFAULT 0,
    `display_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `tid`(`tid`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `display_id`(`display_id`) USING BTREE,
    CONSTRAINT `training_problem_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_problem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_problem_ibfk_3` FOREIGN KEY (`display_id`) REFERENCES `problem` (`problem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for training_record
-- ----------------------------
DROP TABLE IF EXISTS `training_record`;
CREATE TABLE `training_record`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `tid`          bigint(20) UNSIGNED NOT NULL,
    `tpid`         bigint(20) UNSIGNED NOT NULL,
    `pid`          bigint(20) UNSIGNED NOT NULL,
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `submit_id`    bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `tid`(`tid`) USING BTREE,
    INDEX          `tpid`(`tpid`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `submit_id`(`submit_id`) USING BTREE,
    CONSTRAINT `training_record_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_record_ibfk_2` FOREIGN KEY (`tpid`) REFERENCES `training_problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_record_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_record_ibfk_4` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_record_ibfk_5` FOREIGN KEY (`submit_id`) REFERENCES `judge` (`submit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for training_register
-- ----------------------------
DROP TABLE IF EXISTS `training_register`;
CREATE TABLE `training_register`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `tid`          bigint(20) UNSIGNED NOT NULL COMMENT '训练id',
    `uid`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `status`       tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `tid`(`tid`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `training_register_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `training_register_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_acproblem
-- ----------------------------
DROP TABLE IF EXISTS `user_acproblem`;
CREATE TABLE `user_acproblem`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `pid`          bigint(20) UNSIGNED NOT NULL COMMENT 'ac的题目id',
    `submit_id`    bigint(20) UNSIGNED NOT NULL COMMENT '提交id',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `submit_id`(`submit_id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `pid`(`pid`) USING BTREE,
    CONSTRAINT `user_acproblem_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `problem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_acproblem_ibfk_3` FOREIGN KEY (`submit_id`) REFERENCES `judge` (`submit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 543 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`
(
    `uuid`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `username`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    `password`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    `nickname`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `school`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
    `course`       varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
    `number`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
    `realname`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `gender`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL DEFAULT 'secrecy' COMMENT '性别',
    `github`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github地址',
    `blog`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客地址',
    `cf_username`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cf的username',
    `email`        varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `avatar`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
    `signature`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个性签名',
    `title_name`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头衔、称号',
    `title_color`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头衔、称号的颜色',
    `status`       int(11) NOT NULL DEFAULT 0 COMMENT '0可用，1不可用',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '修改时间',
    PRIMARY KEY (`uuid`) USING BTREE,
    UNIQUE INDEX `USERNAME_UNIQUE`(`username`) USING BTREE,
    UNIQUE INDEX `EMAIL_UNIQUE`(`email`) USING BTREE,
    UNIQUE INDEX `avatar`(`avatar`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_record
-- ----------------------------
DROP TABLE IF EXISTS `user_record`;
CREATE TABLE `user_record`
(
    `id`           bigint(20) NOT NULL AUTO_INCREMENT,
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
    `rating`       int(11) NULL DEFAULT NULL COMMENT 'cf得分',
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`, `uid`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    CONSTRAINT `user_record_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 896 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`
(
    `id`           bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `uid`          varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `role_id`      bigint(20) UNSIGNED NOT NULL,
    `gmt_create`   datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0),
    `gmt_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX          `uid`(`uid`) USING BTREE,
    INDEX          `role_id`(`role_id`) USING BTREE,
    CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 896 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `user_sys_notice`;
CREATE TABLE `user_sys_notice`
(
    `id`            bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `sys_notice_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '系统通知的id',
    `recipient_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接受通知的用户id',
    `type`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型，系统通知sys、我的信息mine',
    `state`         tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
    `gmt_create`    datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '读取时间',
    `gmt_modified`  datetime(0) NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0),
    PRIMARY KEY (`id`) USING BTREE,
    INDEX           `sys_notice_id`(`sys_notice_id`) USING BTREE,
    INDEX           `recipient_id`(`recipient_id`) USING BTREE,
    CONSTRAINT `user_sys_notice_ibfk_1` FOREIGN KEY (`sys_notice_id`) REFERENCES `admin_sys_notice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_sys_notice_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for contest_status
-- ----------------------------
DROP PROCEDURE IF EXISTS `contest_status`;
delimiter;;
CREATE PROCEDURE `contest_status`()
BEGIN
UPDATE contest
SET STATUS = (
    CASE
        WHEN NOW() < start_time THEN -1
        WHEN NOW() >= start_time AND NOW() < end_time THEN 0
        WHEN NOW() >= end_time THEN 1
        END);
END
;;
delimiter ;

-- ----------------------------
-- Event structure for contest_event
-- ----------------------------
DROP
EVENT IF EXISTS `contest_event`;
delimiter ;;
CREATE
EVENT `contest_event`
ON SCHEDULE
EVERY '1' SECOND STARTS '2021-04-18 19:04:49'
ON COMPLETION PRESERVE
DO CALL contest_status()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table contest
-- ----------------------------
DROP TRIGGER IF EXISTS `contest_trigger`;
delimiter;;
CREATE TRIGGER `contest_trigger`
    BEFORE INSERT
    ON `contest`
    FOR EACH ROW
BEGIN
    set new.status=(
	CASE
	  WHEN NOW() < new.start_time THEN -1
	  WHEN NOW() >= new.start_time AND NOW()<new.end_time THEN  0
	  WHEN NOW() >= new.end_time THEN 1
END);
END
;;
delimiter;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES (1, 'problem', 'problem_admin', 0, '2020-10-25 00:17:17', '2021-05-15 06:51:23');
INSERT INTO `auth` VALUES (2, 'submit', 'submit', 0, '2020-10-25 00:17:22', '2021-05-15 06:41:59');
INSERT INTO `auth` VALUES (3, 'contest', 'contest_admin', 0, '2020-10-25 00:17:33', '2021-05-15 06:51:28');
INSERT INTO `auth` VALUES (4, 'rejudge', 'rejudge', 0, '2020-10-25 00:17:49', '2021-05-15 06:50:55');
INSERT INTO `auth` VALUES (5, 'announcement', 'announcement_admin', 0, '2021-05-15 06:54:28', '2021-05-15 06:54:31');
INSERT INTO `auth` VALUES (6, 'user', 'user_admin', 0, '2021-05-15 06:54:30', '2021-05-15 06:55:04');
INSERT INTO `auth` VALUES (7, 'system_info', 'system_info_admin', 0, '2021-05-15 06:57:34', '2021-05-15 06:57:41');
INSERT INTO `auth` VALUES (8, 'dicussion', 'discussion_add', 0, '2021-05-15 06:57:36', '2021-05-15 07:50:45');
INSERT INTO `auth` VALUES (9, 'dicussion', 'discussion_del', 0, '2021-05-15 07:01:02', '2021-05-15 07:51:31');
INSERT INTO `auth` VALUES (10, 'dicussion', 'discussion_edit', 0, '2021-05-15 07:02:15', '2021-05-15 07:51:34');
INSERT INTO `auth` VALUES (11, 'comment', 'comment_add', 0, '2021-05-15 07:03:48', '2021-05-15 07:03:48');
INSERT INTO `auth` VALUES (12, 'reply', 'reply_add', 0, '2021-05-15 07:04:55', '2021-05-15 07:04:55');
-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '闲聊', '2021-05-06 11:25:24', '2021-05-06 16:43:42');
INSERT INTO `category` VALUES (2, '题解', '2021-05-06 11:25:36', '2021-05-06 16:43:47');
INSERT INTO `category` VALUES (3, '求助', '2021-05-06 11:25:40', '2021-05-06 11:25:40');
INSERT INTO `category` VALUES (4, '建议', '2021-05-06 11:25:56', '2021-05-06 11:25:56');
INSERT INTO `category` VALUES (5, '记录', '2021-05-06 11:26:02', '2021-05-06 16:43:51');
-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (1, 'text/x-csrc', 'GCC 7.5.0', 'C', '/usr/bin/gcc -DONLINE_JUDGE -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}', '#include <stdio.h>\r\nint add(int a, int b) {\r\n    return a+b;\r\n}\r\nint main() {\r\n    printf(\"%d\", add(1, 2));    \r\n    return 0;\r\n}', '//PREPEND BEGIN\r\n#include <stdio.h>\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\nint add(int a, int b) {\r\n  // Please fill this blank\r\n  return ___________;\r\n}\r\n//TEMPLATE END\r\n\r\n//APPEND BEGIN\r\nint main() {\r\n  printf(\"%d\", add(1, 2));\r\n  return 0;\r\n}\r\n//APPEND END', 1, 'LOCAL', '2020-12-12 23:11:44', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (2, 'text/x-csrc', 'GCC 7.5.0', 'C With O2', '/usr/bin/gcc -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c11 {src_path} -lm -o {exe_path}', '#include <stdio.h>\r\nint add(int a, int b) {\r\n    return a+b;\r\n}\r\nint main() {\r\n    printf(\"%d\", add(1, 2));    \r\n    return 0;\r\n}', '//PREPEND BEGIN\r\n#include <stdio.h>\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\nint add(int a, int b) {\r\n  // Please fill this blank\r\n  return ___________;\r\n}\r\n//TEMPLATE END\r\n\r\n//APPEND BEGIN\r\nint main() {\r\n  printf(\"%d\", add(1, 2));\r\n  return 0;\r\n}\r\n//APPEND END', 0, 'LOCAL', '2021-06-14 21:05:57', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (3, 'text/x-c++src', 'G++ 7.5.0', 'C++', '/usr/bin/g++ -DONLINE_JUDGE -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}', '#include <iostream>\r\nint add(int a, int b) {\r\n    return a+b;\r\n}\r\nint main() {\r\n    std::cout << add(1, 2);\r\n    return 0;\r\n}', '//PREPEND BEGIN\r\n#include <iostream>\r\nusing namespace std;\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\nint add(int a, int b) {\r\n  // Please fill this blank\r\n  return ___________;\r\n}\r\n//TEMPLATE END\r\n\r\n//APPEND BEGIN\r\nint main() {\r\n  cout << add(1, 2);\r\n  return 0;\r\n}\r\n//APPEND END', 1, 'LOCAL', '2020-12-12 23:12:44', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (4, 'text/x-c++src', 'G++ 7.5.0', 'C++ With O2', '/usr/bin/g++ -DONLINE_JUDGE -O2 -w -fmax-errors=3 -std=c++14 {src_path} -lm -o {exe_path}', '#include <iostream>\r\nint add(int a, int b) {\r\n    return a+b;\r\n}\r\nint main() {\r\n    std::cout << add(1, 2);\r\n    return 0;\r\n}', '//PREPEND BEGIN\r\n#include <iostream>\r\nusing namespace std;\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\nint add(int a, int b) {\r\n  // Please fill this blank\r\n  return ___________;\r\n}\r\n//TEMPLATE END\r\n\r\n//APPEND BEGIN\r\nint main() {\r\n  cout << add(1, 2);\r\n  return 0;\r\n}\r\n//APPEND END', 0, 'LOCAL', '2021-06-14 21:09:35', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (5, 'text/x-java', 'OpenJDK 1.8', 'Java', '/usr/bin/javac {src_path} -d {exe_dir} -encoding UTF8', 'import java.util.Scanner;\r\npublic class Main{\r\n    public static void main(String[] args){\r\n        Scanner in=new Scanner(System.in);\r\n        int a=in.nextInt();\r\n        int b=in.nextInt();\r\n        System.out.println((a+b));\r\n    }\r\n}', '//PREPEND BEGIN\r\nimport java.util.Scanner;\r\n//PREPEND END\r\n\r\npublic class Main{\r\n    //TEMPLATE BEGIN\r\n    public static Integer add(int a,int b){\r\n        return _______;\r\n    }\r\n    //TEMPLATE END\r\n\r\n    //APPEND BEGIN\r\n    public static void main(String[] args){\r\n        System.out.println(add(a,b));\r\n    }\r\n    //APPEND END\r\n}\r\n', 0, 'LOCAL', '2020-12-12 23:12:51', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (6, 'text/x-python', 'Python 3.6.9', 'Python3', '/usr/bin/python3 -m py_compile {src_path}', 'a, b = map(int, input().split())\r\nprint(a + b)', '//PREPEND BEGIN\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\ndef add(a, b):\r\n    return a + b\r\n//TEMPLATE END\r\n\r\n\r\nif __name__ == \'__main__\':  \r\n    //APPEND BEGIN\r\n    a, b = 1, 1\r\n    print(add(a, b))\r\n    //APPEND END', 0, 'LOCAL', '2020-12-12 23:14:23', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (7, 'text/x-python', 'Python 2.7.17', 'Python2', '/usr/bin/python -m py_compile {src_path}', 'a, b = map(int, raw_input().split())\r\nprint a+b', '//PREPEND BEGIN\r\n//PREPEND END\r\n\r\n//TEMPLATE BEGIN\r\ndef add(a, b):\r\n    return a + b\r\n//TEMPLATE END\r\n\r\n\r\nif __name__ == \'__main__\':  \r\n    //APPEND BEGIN\r\n    a, b = 1, 1\r\n    print add(a, b)\r\n    //APPEND END', 0, 'LOCAL', '2021-01-26 11:11:44', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (8, 'text/x-go', 'Golang 1.16', 'Golang', '/usr/bin/go build -o {exe_path} {src_path}', 'package main\r\nimport \"fmt\"\r\n\r\nfunc main(){\r\n    var x int\r\n    var y int\r\n    fmt.Scanln(&x,&y)\r\n    fmt.Printf(\"%d\",x+y)  \r\n}\r\n', '\r\npackage main\r\n\r\n//PREPEND BEGIN\r\nimport \"fmt\"\r\n//PREPEND END\r\n\r\n\r\n//TEMPLATE BEGIN\r\nfunc add(a,b int)int{\r\n    return ______\r\n}\r\n//TEMPLATE END\r\n\r\n//APPEND BEGIN\r\nfunc main(){\r\n    var x int\r\n    var y int\r\n    fmt.Printf(\"%d\",add(x,y))  \r\n}\r\n//APPEND END\r\n', 0, 'LOCAL', '2021-03-28 23:15:54', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (9, 'text/x-csharp', 'C# Mono 4.6.2', 'C#', '/usr/bin/mcs -optimize+ -out:{exe_path} {src_path}', 'using System;\r\nusing System.Collections.Generic;\r\nusing System.Text;\r\nclass Solution\r\n{\r\n   static void Main(string[] args)\r\n   {\r\n       int a = int.Parse(Console.ReadLine());\r\n       int b = int.Parse(Console.ReadLine());\r\n       Console.WriteLine(a+b);\r\n   }\r\n}', '//PREPEND BEGIN\r\nusing System;\r\nusing System.Collections.Generic;\r\nusing System.Text;\r\n//PREPEND END\r\n\r\nclass Solution\r\n{\r\n    //TEMPLATE BEGIN\r\n    static int add(int a,int b){\r\n        return _______;\r\n    }\r\n    //TEMPLATE END\r\n\r\n    //APPEND BEGIN\r\n    static void Main(string[] args)\r\n    {\r\n        int a ;\r\n        int b ;\r\n        Console.WriteLine(add(a,b));\r\n    }\r\n    //APPEND END\r\n}', 0, 'LOCAL', '2021-04-13 16:10:03', '2022-04-19 09:19:18');
INSERT INTO `language` VALUES (11, 'text/x-csrc', 'GCC', 'GCC', NULL, NULL, NULL, 0, 'HDU', '2021-02-18 21:32:34', '2021-06-14 21:19:08');
INSERT INTO `language` VALUES (12, 'text/x-c++src', 'G++', 'G++', NULL, NULL, NULL, 0, 'HDU', '2021-02-18 21:32:58', '2021-06-14 21:19:05');
INSERT INTO `language` VALUES (13, 'text/x-c++src', 'C++', 'C++', NULL, NULL, NULL, 0, 'HDU', '2021-02-18 21:33:11', '2021-06-14 21:19:03');
INSERT INTO `language` VALUES (14, 'text/x-csrc', 'C', 'C', NULL, NULL, NULL, 0, 'HDU', '2021-02-18 21:33:41', '2021-06-14 21:18:58');
INSERT INTO `language` VALUES (15, 'text/x-pascal', 'Pascal', 'Pascal', NULL, NULL, NULL, 0, 'HDU', '2021-02-18 21:34:33', '2021-06-14 21:18:56');
INSERT INTO `language` VALUES (16, 'text/x-csrc', 'GNU GCC C11 5.1.0', 'GNU GCC C11 5.1.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:55');
INSERT INTO `language` VALUES (17, 'text/x-c++src', 'Clang++17 Diagnostics', 'Clang++17 Diagnostics', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:54');
INSERT INTO `language` VALUES (19, 'text/x-c++src', 'GNU G++14 6.4.0', 'GNU G++14 6.4.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:46');
INSERT INTO `language` VALUES (20, 'text/x-c++src', 'GNU G++17 7.3.0', 'GNU G++17 7.3.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:45');
INSERT INTO `language` VALUES (21, 'text/x-c++src', 'Microsoft Visual C++ 2010', 'Microsoft Visual C++ 2010', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:43');
INSERT INTO `language` VALUES (22, 'text/x-c++src', 'Microsoft Visual C++ 2017', 'Microsoft Visual C++ 2017', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:40');
INSERT INTO `language` VALUES (23, 'text/x-csharp', 'C# Mono 6.8', 'C# Mono 6.8', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:36');
INSERT INTO `language` VALUES (24, 'text/x-d', 'D DMD32 v2.091.0', 'D DMD32 v2.091.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:34');
INSERT INTO `language` VALUES (25, 'text/x-go', 'Go 1.15.6', 'Go 1.15.6', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:32');
INSERT INTO `language` VALUES (26, 'text/x-haskell', 'Haskell GHC 8.10.1', 'Haskell GHC 8.10.1', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:31');
INSERT INTO `language` VALUES (27, 'text/x-java', 'Java 1.8.0_241', 'Java 1.8.0_241', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:26');
INSERT INTO `language` VALUES (28, 'text/x-java', 'Kotlin 1.4.0', 'Kotlin 1.4.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:24');
INSERT INTO `language` VALUES (29, 'text/x-ocaml', 'OCaml 4.02.1', 'OCaml 4.02.1', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:23');
INSERT INTO `language` VALUES (30, 'text/x-pascal', 'Delphi 7', 'Delphi 7', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:20');
INSERT INTO `language` VALUES (31, 'text/x-pascal', 'Free Pascal 3.0.2', 'Free Pascal 3.0.2', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:18');
INSERT INTO `language` VALUES (32, 'text/x-pascal', 'PascalABC.NET 3.4.2', 'PascalABC.NET 3.4.2', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:16');
INSERT INTO `language` VALUES (33, 'text/x-perl', 'Perl 5.20.1', 'Perl 5.20.1', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:15');
INSERT INTO `language` VALUES (34, 'text/x-php', 'PHP 7.2.13', 'PHP 7.2.13', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:12');
INSERT INTO `language` VALUES (35, 'text/x-python', 'Python 2.7.18', 'Python 2.7.18', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:06');
INSERT INTO `language` VALUES (36, 'text/x-python', 'Python 3.9.1', 'Python 3.9.1', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:04');
INSERT INTO `language` VALUES (37, 'text/x-python', 'PyPy 2.7 (7.3.0)', 'PyPy 2.7 (7.3.0)', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:02');
INSERT INTO `language` VALUES (38, 'text/x-python', 'PyPy 3.7 (7.3.0)', 'PyPy 3.7 (7.3.0)', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:18:00');
INSERT INTO `language` VALUES (39, 'text/x-ruby', 'Ruby 3.0.0', 'Ruby 3.0.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:17:58');
INSERT INTO `language` VALUES (40, 'text/x-rustsrc', 'Rust 1.49.0', 'Rust 1.49.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:17:56');
INSERT INTO `language` VALUES (41, 'text/x-scala', 'Scala 2.12.8', 'Scala 2.12.8', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:17:54');
INSERT INTO `language` VALUES (42, 'text/javascript', 'JavaScript V8 4.8.0', 'JavaScript V8 4.8.0', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:17:52');
INSERT INTO `language` VALUES (43, 'text/javascript', 'Node.js 12.6.3', 'Node.js 12.6.3', NULL, NULL, NULL, 0, 'CF', '2021-03-03 19:46:24', '2021-06-14 21:17:50');
INSERT INTO `language` VALUES (44, 'text/x-csharp', 'C# 8, .NET Core 3.1', 'C# 8, .NET Core 3.1', NULL, NULL, NULL, 0, 'CF', '2021-03-25 21:17:39', '2021-06-14 21:17:47');
INSERT INTO `language` VALUES (45, 'text/x-java', 'Java 11.0.6', 'Java 11.0.6', NULL, NULL, NULL, 0, 'CF', '2021-03-25 21:20:03', '2021-06-14 21:17:46');
INSERT INTO `language` VALUES (46, 'text/x-c++src', 'G++', 'G++', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:50:50', '2021-06-24 22:50:50');
INSERT INTO `language` VALUES (47, 'text/x-csrc', 'GCC', 'GCC', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:51:04', '2021-06-24 22:51:12');
INSERT INTO `language` VALUES (48, 'text/x-java', 'Java', 'Java', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:51:29', '2021-06-24 22:51:44');
INSERT INTO `language` VALUES (49, 'text/x-pascal', 'Pascal', 'Pascal', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:51:50', '2021-06-24 22:52:02');
INSERT INTO `language` VALUES (50, 'text/x-c++src', 'C++', 'C++', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:52:15', '2021-06-24 22:52:27');
INSERT INTO `language` VALUES (51, 'text/x-csrc', 'C', 'C', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:52:38', '2021-06-24 22:52:38');
INSERT INTO `language` VALUES (52, 'text/x-fortran', 'Fortran', 'Fortran', NULL, NULL, NULL, 0, 'POJ', '2021-06-24 22:55:15', '2021-06-24 22:55:15');
INSERT INTO `language` VALUES (53, 'text/x-csrc', 'C', 'c', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:57:09', '2022-01-17 22:57:29');
INSERT INTO `language` VALUES (54, 'text/x-csrc', 'C (NOI)', 'c_noi', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:57:50', '2022-01-17 23:01:39');
INSERT INTO `language` VALUES (55, 'text/x-c++src', 'C++11', 'c++', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:03', '2022-01-17 23:01:34');
INSERT INTO `language` VALUES (56, 'text/x-c++src', 'C++14', 'c++14', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:12', '2022-01-17 23:01:33');
INSERT INTO `language` VALUES (57, 'text/x-c++src', 'C++ (NOI)', 'c++_noi', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:23', '2022-01-17 23:01:31');
INSERT INTO `language` VALUES (58, 'text/x-java', 'Java', 'java', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:30', '2022-01-17 23:01:13');
INSERT INTO `language` VALUES (59, 'text/x-python', 'Python 2.7', 'python', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:37', '2022-01-17 23:01:07');
INSERT INTO `language` VALUES (60, 'text/x-python', 'Python 3.5', 'python3', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:44', '2022-01-17 23:01:05');
INSERT INTO `language` VALUES (61, 'text/x-ruby', 'Ruby', 'ruby', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:50', '2022-01-17 23:00:59');
INSERT INTO `language` VALUES (62, 'text/x-matlab', 'Octave', 'octave', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:58:59', '2022-01-17 23:04:35');
INSERT INTO `language` VALUES (63, 'text/x-pascal', 'Pascal', 'pascal', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:59:05', '2022-01-17 23:00:49');
INSERT INTO `language` VALUES (64, 'text/x-go', 'Go', 'go', NULL, NULL, NULL, 0, 'JSK', '2022-01-17 22:59:07', '2022-01-17 23:00:42');
INSERT INTO `language` VALUES (65, 'text/x-csrc', 'C', 'C', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:21:34', '2022-01-23 19:32:27');
INSERT INTO `language` VALUES (66, 'text/x-c++src', 'C++', 'C++', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:21:47', '2022-01-23 19:32:15');
INSERT INTO `language` VALUES (67, 'text/x-pascal', 'Pascal', 'Pascal', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:21:51', '2022-01-23 19:32:21');
INSERT INTO `language` VALUES (68, 'text/x-java', 'Java', 'Java', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:02', '2022-01-23 19:32:10');
INSERT INTO `language` VALUES (69, 'text/x-ruby', 'Ruby', 'Ruby', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:07', '2022-01-23 19:32:00');
INSERT INTO `language` VALUES (70, NULL, 'Bash', 'Bash', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:17', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (71, 'text/x-python', 'Python', 'Python', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:20', '2022-01-23 19:32:33');
INSERT INTO `language` VALUES (72, NULL, 'PHP', 'PHP', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:26', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (73, NULL, 'Perl', 'Perl', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:33', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (74, 'text/x-csharp', 'C#', 'C#', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:45', '2022-01-23 19:33:07');
INSERT INTO `language` VALUES (75, NULL, 'Obj-C', 'Obj-C', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:48', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (76, NULL, 'FreeBasic', 'FreeBasic', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:22:58', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (77, NULL, 'Scheme', 'Scheme', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:03', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (78, NULL, 'Clang', 'Clang', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:10', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (79, NULL, 'Clang++', 'Clang++', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:15', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (80, NULL, 'Lua', 'Lua', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:20', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (81, 'text/javascript', 'JavaScript', 'JavaScript', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:23', '2022-01-23 19:32:46');
INSERT INTO `language` VALUES (82, 'text/x-go', 'Go', 'Go', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:33', '2022-01-23 19:32:05');
INSERT INTO `language` VALUES (83, NULL, 'SQL(sqlite3)', 'SQL(sqlite3)', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:37', '2022-01-23 19:31:21');
INSERT INTO `language` VALUES (84, 'text/x-fortran', 'Fortran', 'Fortran', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:42', '2022-01-23 19:31:51');
INSERT INTO `language` VALUES (85, 'text/x-matlab', 'Matlab(Octave)', 'Matlab(Octave)', NULL, NULL, NULL, 0, 'MXT', '2022-01-23 17:23:49', '2022-01-23 19:31:55');
INSERT INTO `language` VALUES (86, 'text/x-csrc', 'C', 'C', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:25:53', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (87, 'text/x-c++src', 'C++', 'C++', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:25:56', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (88, 'text/x-pascal', 'Pascal', 'Pascal', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:11', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (89, 'text/x-java', 'Java', 'Java', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:13', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (90, 'text/x-ruby', 'Ruby', 'Ruby', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:17', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (91, NULL, 'Bash', 'Bash', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:20', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (92, 'text/x-python', 'Python', 'Python', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:22', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (93, NULL, 'PHP', 'PHP', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:25', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (94, NULL, 'Perl', 'Perl', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:27', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (95, 'text/x-csharp', 'C#', 'C#', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:30', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (96, NULL, 'Obj-C', 'Obj-C', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:33', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (97, NULL, 'FreeBasic', 'FreeBasic', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:36', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (98, NULL, 'Scheme', 'Scheme', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:41', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (99, NULL, 'Clang', 'Clang', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:45', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (100, NULL, 'Clang++', 'Clang++', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:47', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (101, NULL, 'Lua', 'Lua', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:49', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (102, 'text/javascript', 'JavaScript', 'JavaScript', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:26:57', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (103, 'text/x-go', 'Go', 'Go', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:27:44', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (104, NULL, 'SQL(sqlite3)', 'SQL(sqlite3)', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:27:46', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (105, 'text/x-fortran', 'Fortran', 'Fortran', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:27:49', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (106, 'text/x-matlab', 'Matlab(Octave)', 'Matlab(Octave)', NULL, NULL, NULL, 0, 'TKOJ', '2022-01-23 23:27:51', '2022-01-23 23:28:14');
INSERT INTO `language` VALUES (107, 'text/x-scheme', 'Scheme (Gauche 0.9.9)', 'Scheme (Gauche 0.9.9)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (108, 'text/x-nim', 'Nim (1.0.6)', 'Nim (1.0.6)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (109, 'text/x-cobol', 'COBOL - Free (OpenCOBOL 1.1.0)', 'COBOL - Free (OpenCOBOL 1.1.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (110, 'text/x-python', 'PyPy3 (7.3.0)', 'PyPy3 (7.3.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (111, 'text/x-ada', 'Ada2012 (GNAT 9.2.1)', 'Ada2012 (GNAT 9.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (112, 'text/x-scala', 'Scala (2.13.1)', 'Scala (2.13.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (113, 'text/x-d', 'D (DMD 2.091.0)', 'D (DMD 2.091.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (114, 'text/x-rustsrc', 'Rust (1.42.0)', 'Rust (1.42.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (115, 'application/dart', 'Dart (2.7.2)', 'Dart (2.7.2)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (116, 'text/x-csrc', 'C (GCC 9.2.1)', 'C (GCC 9.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (117, 'text/x-java', 'Java (OpenJDK 1.8.0)', 'Java (OpenJDK 1.8.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (118, 'text/x-ruby', 'Ruby (2.7.1)', 'Ruby (2.7.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (119, 'text/x-racket', 'Racket (7.6)', 'Racket (7.6)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (120, 'text/x-objectivec', 'Objective-C (Clang 10.0.0)', 'Objective-C (Clang 10.0.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (121, 'text/x-haxe', 'Haxe (4.0.3); js', 'Haxe (4.0.3); js', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (122, 'text/x-kotlin', 'Kotlin (1.3.71)', 'Kotlin (1.3.71)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (123, 'text/x-sh', 'Bash (5.0.11)', 'Bash (5.0.11)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (124, 'text/x-python', 'Python (3.8.2)', 'Python (3.8.2)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (125, 'text/x-lua', 'Lua (Lua 5.3.5)', 'Lua (Lua 5.3.5)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (126, 'text/x-julia', 'Julia (1.4.0)', 'Julia (1.4.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (127, 'text/x-c++src', 'C++ (Clang 10.0.0)', 'C++ (Clang 10.0.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (128, 'text/x-crystal', 'Crystal (0.33.0)', 'Crystal (0.33.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (129, 'text/x-csharp', 'C# (.NET Core 3.1.201)', 'C# (.NET Core 3.1.201)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (130, 'text/x-sh', 'Awk (GNU Awk 4.1.4)', 'Awk (GNU Awk 4.1.4)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (131, 'text/x-haskell', 'Haskell (GHC 8.8.3)', 'Haskell (GHC 8.8.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (132, 'text/x-c++src', 'C++ (GCC 9.2.1)', 'C++ (GCC 9.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (133, 'elixir', 'Elixir (1.10.2)', 'Elixir (1.10.2)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (134, 'text/x-csharp', 'C# (Mono-mcs 6.8.0.105)', 'C# (Mono-mcs 6.8.0.105)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (135, 'text/x-unlambda', 'Unlambda (2.0.0)', 'Unlambda (2.0.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (136, 'text/x-dc', 'dc (1.4.1)', 'dc (1.4.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (137, 'text/x-haxe', 'Haxe (4.0.3); Java', 'Haxe (4.0.3); Java', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (138, 'text/x-csrc', 'C (Clang 10.0.0)', 'C (Clang 10.0.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (139, 'text/x-swift', 'Swift (5.2.1)', 'Swift (5.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (140, 'text/x-php', 'PHP (7.4.4)', 'PHP (7.4.4)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (141, 'text/x-erlang', 'Erlang (22.3)', 'Erlang (22.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (142, 'text/x-pascal', 'Pascal (FPC 3.0.4)', 'Pascal (FPC 3.0.4)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (143, 'text/typescript', 'TypeScript (3.8)', 'TypeScript (3.8)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (144, 'text/x-d', 'D (LDC 1.20.1)', 'D (LDC 1.20.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (145, 'text/x-forth', 'Forth (gforth 0.7.3)', 'Forth (gforth 0.7.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (146, 'text/x-python', 'Cython (0.29.16)', 'Cython (0.29.16)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (147, 'text/x-bc', 'bc (1.07.1)', 'bc (1.07.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (148, 'text/x-common-lisp', 'Common Lisp (SBCL 2.0.3)', 'Common Lisp (SBCL 2.0.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (149, 'text/x-sh', 'Dash (0.5.8)', 'Dash (0.5.8)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (150, 'text/x-perl', 'Perl (5.26.1)', 'Perl (5.26.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (151, 'text/x-ocaml', 'OCaml (4.10.0)', 'OCaml (4.10.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (152, 'text/x-prolog', 'Prolog (SWI-Prolog 8.0.3)', 'Prolog (SWI-Prolog 8.0.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (153, 'text/x-sml', 'Standard ML (MLton 20130715)', 'Standard ML (MLton 20130715)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (154, 'text/x-csharp', 'C# (Mono-csc 3.5.0)', 'C# (Mono-csc 3.5.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (155, 'text/javascript', 'JavaScript (Node.js 12.16.1)', 'JavaScript (Node.js 12.16.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (156, 'text/x-fsharp', 'F# (.NET Core 3.1.201)', 'F# (.NET Core 3.1.201)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (157, 'text/x-python', 'PyPy2 (7.3.0)', 'PyPy2 (7.3.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (158, 'text/x-vb', 'Visual Basic (.NET Core 3.1.101)', 'Visual Basic (.NET Core 3.1.101)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (159, 'text/x-sh', 'Zsh (5.4.2)', 'Zsh (5.4.2)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (160, 'text/x-vim', 'Vim (8.2.0460)', 'Vim (8.2.0460)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (161, 'text/x-fortran', 'Fortran (GNU Fortran 9.2.1)', 'Fortran (GNU Fortran 9.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (162, 'text/x-perl', 'Raku (Rakudo 2020.02.1)', 'Raku (Rakudo 2020.02.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (163, 'text/x-clojure', 'Clojure (1.10.1.536)', 'Clojure (1.10.1.536)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (164, 'text/x-octave', 'Octave (5.2.0)', 'Octave (5.2.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (165, 'text/x-d', 'D (GDC 9.2.1)', 'D (GDC 9.2.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (166, 'text/x-go', 'Go (1.14.1)', 'Go (1.14.1)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (167, 'text/x-fsharp', 'F# (Mono 10.2.3)', 'F# (Mono 10.2.3)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (168, 'text/plain', 'Text (cat 8.28)', 'Text (cat 8.28)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (169, 'text/x-sh', 'Sed (4.4)', 'Sed (4.4)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (170, 'text/x-lua', 'Lua (LuaJIT 2.1.0)', 'Lua (LuaJIT 2.1.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (171, 'text/x-cobol', 'COBOL - Fixed (OpenCOBOL 1.1.0)', 'COBOL - Fixed (OpenCOBOL 1.1.0)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (172, 'text/x-brainfuck', 'Brainfuck (bf 20041219)', 'Brainfuck (bf 20041219)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
INSERT INTO `language` VALUES (173, 'text/x-java', 'Java (OpenJDK 11.0.6)', 'Java (OpenJDK 11.0.6)', NULL, NULL, NULL, 0, 'AC', '2022-07-25 13:41:20', '2022-07-26 12:07:12');
-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (00000000000000001000, 'root', '超级管理员', 0, '2020-10-25 00:16:30', '2020-10-25 00:16:30');
INSERT INTO `role` VALUES (00000000000000001001, 'admin', '管理员', 0, '2020-10-25 00:16:41', '2020-10-25 00:16:41');
INSERT INTO `role` VALUES (00000000000000001002, 'default_user', '默认用户', 0, '2020-10-25 00:16:52', '2021-05-15 07:39:05');
INSERT INTO `role` VALUES (00000000000000001003, 'no_submit_user', '禁止提交用户', 0, '2021-05-15 07:10:14', '2022-05-19 20:51:51');
INSERT INTO `role` VALUES (00000000000000001004, 'no_discuss_user', '禁止发贴讨论用户', 0, '2021-05-15 07:11:28', '2021-05-15 07:39:16');
INSERT INTO `role` VALUES (00000000000000001005, 'mute_user', '禁言包括回复讨论发帖用户', 0, '2021-05-15 07:12:51', '2021-05-15 07:39:19');
INSERT INTO `role` VALUES (00000000000000001006, 'no_submit_no_discuss_user', '禁止提交同时禁止发帖用户', 0, '2021-05-15 07:38:08', '2021-05-15 07:39:34');
INSERT INTO `role` VALUES (00000000000000001007, 'no_submit_mute_user', '禁言禁提交用户', 0, '2021-05-15 07:39:00', '2021-05-15 07:39:26');
INSERT INTO `role` VALUES (00000000000000001008, 'problem_admin', '题目管理员', 0, '2021-06-12 23:15:06', '2021-06-12 23:15:06');
-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES (1, 1, 1000, '2020-10-25 00:18:17', '2020-10-25 00:18:17');
INSERT INTO `role_auth` VALUES (2, 2, 1000, '2020-10-25 00:18:38', '2021-05-15 07:17:35');
INSERT INTO `role_auth` VALUES (3, 3, 1000, '2020-10-25 00:18:48', '2021-05-15 07:17:44');
INSERT INTO `role_auth` VALUES (4, 4, 1000, '2021-05-15 07:17:56', '2021-05-15 07:17:56');
INSERT INTO `role_auth` VALUES (5, 5, 1000, '2021-05-15 07:18:20', '2021-05-15 07:18:20');
INSERT INTO `role_auth` VALUES (6, 6, 1000, '2021-05-15 07:18:29', '2021-05-15 07:18:29');
INSERT INTO `role_auth` VALUES (7, 7, 1000, '2021-05-15 07:18:42', '2021-05-15 07:18:42');
INSERT INTO `role_auth` VALUES (8, 8, 1000, '2021-05-15 07:18:59', '2021-05-15 07:18:59');
INSERT INTO `role_auth` VALUES (9, 9, 1000, '2021-05-15 07:19:07', '2021-05-15 07:19:07');
INSERT INTO `role_auth` VALUES (10, 10, 1000, '2021-05-15 07:19:10', '2021-05-15 07:19:10');
INSERT INTO `role_auth` VALUES (11, 11, 1000, '2021-05-15 07:19:13', '2021-05-15 07:19:13');
INSERT INTO `role_auth` VALUES (12, 12, 1000, '2021-05-15 07:19:18', '2021-05-15 07:19:30');
INSERT INTO `role_auth` VALUES (13, 1, 1001, '2021-05-15 07:19:29', '2021-05-15 07:20:02');
INSERT INTO `role_auth` VALUES (14, 2, 1001, '2021-05-15 07:20:25', '2021-05-15 07:20:25');
INSERT INTO `role_auth` VALUES (15, 3, 1001, '2021-05-15 07:20:33', '2021-05-15 07:20:33');
INSERT INTO `role_auth` VALUES (16, 8, 1001, '2021-05-15 07:21:56', '2021-05-15 07:21:56');
INSERT INTO `role_auth` VALUES (17, 9, 1001, '2021-05-15 07:22:03', '2021-05-15 07:22:03');
INSERT INTO `role_auth` VALUES (18, 10, 1001, '2021-05-15 07:22:10', '2021-05-15 07:22:10');
INSERT INTO `role_auth` VALUES (19, 11, 1001, '2021-05-15 07:22:17', '2021-05-15 07:22:17');
INSERT INTO `role_auth` VALUES (20, 12, 1001, '2021-05-15 07:22:21', '2021-05-15 07:22:21');
INSERT INTO `role_auth` VALUES (21, 2, 1002, '2021-05-15 07:22:40', '2021-05-15 07:22:40');
INSERT INTO `role_auth` VALUES (22, 8, 1002, '2021-05-15 07:23:49', '2021-05-15 07:23:49');
INSERT INTO `role_auth` VALUES (23, 9, 1002, '2021-05-15 07:24:10', '2021-05-15 07:24:10');
INSERT INTO `role_auth` VALUES (24, 10, 1002, '2021-05-15 07:24:14', '2021-05-15 07:24:14');
INSERT INTO `role_auth` VALUES (25, 11, 1002, '2021-05-15 07:24:19', '2021-05-15 07:24:19');
INSERT INTO `role_auth` VALUES (26, 12, 1002, '2021-05-15 07:24:23', '2021-05-15 07:24:23');
INSERT INTO `role_auth` VALUES (27, 8, 1003, '2021-05-15 07:32:56', '2021-05-15 07:32:56');
INSERT INTO `role_auth` VALUES (28, 9, 1003, '2021-05-15 07:33:01', '2021-05-15 07:33:01');
INSERT INTO `role_auth` VALUES (29, 10, 1003, '2021-05-15 07:33:05', '2021-05-15 07:33:05');
INSERT INTO `role_auth` VALUES (30, 11, 1003, '2021-05-15 07:33:09', '2021-05-15 07:33:09');
INSERT INTO `role_auth` VALUES (31, 12, 1003, '2021-05-15 07:33:22', '2021-05-15 07:33:22');
INSERT INTO `role_auth` VALUES (32, 2, 1004, '2021-05-15 07:33:38', '2021-05-15 07:33:38');
INSERT INTO `role_auth` VALUES (33, 9, 1004, '2021-05-15 07:34:27', '2021-05-15 07:34:27');
INSERT INTO `role_auth` VALUES (34, 10, 1004, '2021-05-15 07:34:31', '2021-05-15 07:34:31');
INSERT INTO `role_auth` VALUES (35, 11, 1004, '2021-05-15 07:34:42', '2021-05-15 07:34:42');
INSERT INTO `role_auth` VALUES (36, 12, 1004, '2021-05-15 07:34:47', '2021-05-15 07:34:47');
INSERT INTO `role_auth` VALUES (37, 2, 1005, '2021-05-15 07:35:11', '2021-05-15 07:35:11');
INSERT INTO `role_auth` VALUES (38, 9, 1005, '2021-05-15 07:35:46', '2021-05-15 07:35:46');
INSERT INTO `role_auth` VALUES (39, 10, 1005, '2021-05-15 07:36:01', '2021-05-15 07:36:01');
INSERT INTO `role_auth` VALUES (40, 9, 1006, '2021-05-15 07:40:09', '2021-05-15 07:40:09');
INSERT INTO `role_auth` VALUES (41, 10, 1006, '2021-05-15 07:40:16', '2021-05-15 07:40:16');
INSERT INTO `role_auth` VALUES (42, 11, 1006, '2021-05-15 07:40:30', '2021-05-15 07:40:30');
INSERT INTO `role_auth` VALUES (43, 12, 1006, '2021-05-15 07:40:37', '2021-05-15 07:40:37');
INSERT INTO `role_auth` VALUES (44, 9, 1007, '2021-05-15 07:40:54', '2021-05-15 07:40:54');
INSERT INTO `role_auth` VALUES (45, 10, 1007, '2021-05-15 07:41:04', '2021-05-15 07:41:04');
INSERT INTO `role_auth` VALUES (46, 1, 1008, '2021-06-12 23:16:10', '2021-06-12 23:16:10');
INSERT INTO `role_auth` VALUES (47, 2, 1008, '2021-06-12 23:16:15', '2021-06-12 23:16:15');
INSERT INTO `role_auth` VALUES (48, 3, 1008, '2021-06-12 23:16:19', '2021-06-12 23:16:19');
INSERT INTO `role_auth` VALUES (49, 8, 1008, '2021-06-12 23:16:24', '2021-06-12 23:16:24');
INSERT INTO `role_auth` VALUES (50, 9, 1008, '2021-06-12 23:16:45', '2021-06-12 23:16:45');
INSERT INTO `role_auth` VALUES (51, 10, 1008, '2021-06-12 23:16:48', '2021-06-12 23:16:48');
INSERT INTO `role_auth` VALUES (52, 11, 1008, '2021-06-12 23:16:52', '2021-06-12 23:16:52');
INSERT INTO `role_auth` VALUES (53, 12, 1008, '2021-06-12 23:16:58', '2021-06-12 23:16:58');
INSERT INTO `user_info`(`uuid`,`username`,`password`,`gmt_create`,`gmt_modified`) values('1','root','1c5b7c6c353ea1c003f9165e41130a68',NOW(),NOW());
INSERT INTO `user_record`(`uid`,`gmt_create`,`gmt_modified`) values('1',NOW(),NOW());
INSERT INTO `user_role`(`uid`,`role_id`,`gmt_create`,`gmt_modified`) values('1',00000000000000001000,NOW(),NOW());

SET FOREIGN_KEY_CHECKS = 1;