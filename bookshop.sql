/*
 Navicat Premium Dump SQL

 Source Server         : mysql5
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : bookshop

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 29/07/2024 17:16:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(10) NULL DEFAULT NULL,
  `bookType` int(1) NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `originalPrice` double(10, 2) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `degree` double(2, 1) NULL DEFAULT NULL,
  `publishDate` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_id`(`id`) USING BTREE,
  INDEX `fk_book_category`(`cid`) USING BTREE,
  INDEX `fk_book_user`(`uid`) USING BTREE,
  INDEX `index_bookname`(`name`) USING BTREE,
  INDEX `index_cid`(`cid`) USING BTREE,
  INDEX `index_uid`(`uid`) USING BTREE,
  CONSTRAINT `fk_book_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_book_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Java编程思想', 7, 1, 52.00, 108.00, 1, 'Bruce Eckel', '机械工业出版社', '第4版', 9.5, '2016-11', '四大名著啊！能不看吗', '2018-04-01 06:22:46');
INSERT INTO `book` VALUES (2, '明朝那些事儿（全9册）', 2, 1, 99.00, 178.00, 1, '当年明月', '北京联合出版公司', '平装', 8.5, '2017-05', '没买多久，急用钱，低价甩', '2018-04-06 07:23:15');
INSERT INTO `book` VALUES (3, '恶意', 1, 1, 9.90, 28.00, 1, '东野圭吾', '南海出版公司', '平装', 9.0, '2008-09', '书架太多书了 出给东野圭吾书迷', '2018-04-06 08:24:25');
INSERT INTO `book` VALUES (4, '白夜行', 1, 1, 12.00, 49.00, 2, '东野圭吾', '南海出版公司', '平装', 8.0, '2008-09', '书架太多书了 出给东野圭吾书迷', '2018-04-12 08:30:36');
INSERT INTO `book` VALUES (5, '简爱', 1, 1, 13.80, 26.00, 2, '夏洛特·勃朗特', '世界图书出版公司', '平装', 8.0, '2011-10', '不适合我看', '2018-04-12 08:31:41');
INSERT INTO `book` VALUES (6, '芒果街上的小屋', 1, 1, 10.80, 25.00, 2, '桑德拉·希斯内罗丝、潘帕', '译林出版社', '平装', 7.0, '2006-06', '买来垫泡面了', '2018-04-12 08:32:46');
INSERT INTO `book` VALUES (7, '活着', 1, 1, 12.10, 26.00, 2, '余华 ', '上海文艺出版社', '平装', 8.0, '2004-05', '好书 真的', '2018-04-12 08:24:17');
INSERT INTO `book` VALUES (8, '羊脂球', 1, 1, 11.20, 25.00, 2, '莫泊桑', ' 北京燕山出版社', '平装', 6.0, '2005-07', '莫泊桑 著 / 北京燕山出版社 / 2005-07 / 平装', '2018-04-12 08:25:24');
INSERT INTO `book` VALUES (9, 'Spring实战', 7, 1, 33.60, 79.00, 1, 'Craig Walls', '人民邮电出版社', '第4版', 9.0, '2016-04', 'Java必看经典书籍！', '2018-04-12 08:31:29');
INSERT INTO `book` VALUES (10, 'JavaScript高级程序设计', 7, 1, 31.00, 79.00, 2, 'Nicholas C.Zakas', '人民邮电出版社', '第3版', 8.0, '2012-03', 'Nicholas C.Zakas 著 / 人民邮电出版社 / 2012-03 / 第3版', '2018-04-12 08:36:34');
INSERT INTO `book` VALUES (11, '算法', 7, 1, 28.00, 89.90, 1, 'Robert Sedgewick', '人民邮电出版社', '第4版', 8.6, '2012-10', '算法书啃不下去了 我已经放弃了', '2018-04-12 08:36:41');
INSERT INTO `book` VALUES (12, 'Python基础教程', 7, 1, 34.00, 49.00, 1, 'Magnus Lie Hetland', '人民邮电出版社', '第3版', 7.5, '2018-02', 'python', '2018-04-12 08:37:49');
INSERT INTO `book` VALUES (13, '史记', 2, 1, 42.00, 99.00, 1, '司马迁', '光明日报出版社', '精装', 8.5, '2015-04', '司马迁 著 / 光明日报出版社 / 2015-04 / 精装', '2018-04-12 08:38:55');
INSERT INTO `book` VALUES (14, '朱镕基答记者问', 3, 1, 9.00, 59.00, 1, '《朱镕基答记者问》编辑组', '人民出版社', '平装', 5.0, '2009-08', '《朱镕基答记者问》编辑组 著 / 人民出版社 / 2009-08 / 平装', '2018-04-12 08:40:01');
INSERT INTO `book` VALUES (15, '邓小平时代', 3, 1, 32.00, 40.00, 1, '傅高义', '生活·读书·新知三联书店', '平装', 8.0, '2013-01', '傅高义 著 / 生活·读书·新知三联书店 / 2013-01 / 平装', '2018-04-12 08:42:11');
INSERT INTO `book` VALUES (16, '天才在左 疯子在右', 4, 1, 17.80, 36.00, 2, '高铭', '武汉大学出版社', '平装', 8.0, '2010-02', '高铭 著 / 武汉大学出版社 / 2010-02 / 平装', '2018-04-12 08:42:24');
INSERT INTO `book` VALUES (17, '蔡康永的说话之道', 4, 1, 8.80, 29.00, 1, '蔡康永', '沈阳出版社', '平装', 7.4, '2010-10', '蔡康永 著 / 沈阳出版社 / 2010-10 / 平装', '2018-04-12 08:44:29');
INSERT INTO `book` VALUES (18, '货币战争', 5, 1, 12.00, 34.00, 1, '宋鸿兵', '中信出版社', '平装', 6.0, '2007-06', '宋鸿兵 著 / 中信出版社 / 2007-06 / 平装', '2018-04-12 08:46:34');
INSERT INTO `book` VALUES (19, '菊与刀', 5, 1, 5.00, 19.00, 2, '鲁思·本尼迪克特', '商务印书馆', '平装', 7.0, '1990-06', '鲁思·本尼迪克特 著 / 商务印书馆 / 1990-06 / 平装', '2018-04-12 08:47:40');
INSERT INTO `book` VALUES (21, '梅者如西', 6, 1, 12.00, 34.00, 1, '冯逸明', '北京时代华文书局', '平装', 7.0, '2017-07', '冯逸明 著 / 北京时代华文书局 / 2017-07 / 平装', '2018-04-12 08:49:52');
INSERT INTO `book` VALUES (62, '精通Spring4.x', 7, 1, 30.00, 79.00, 1, '陈雄华', '电子工业出版社', '4', 9.9, '2016-11', '保证正版', '2018-04-12 08:26:16');
INSERT INTO `book` VALUES (64, '我们仨', 2, 1, 10.00, 18.80, 3, '杨绛', '生活·读书·新知三联书店', '1', 9.0, '2003-07', '杨绛的书', '2018-04-12 08:26:21');
INSERT INTO `book` VALUES (65, '史蒂夫·乔布斯传', 2, 1, 20.00, 68.00, 3, '沃尔特·艾萨克森', '中信出版社', '1', 8.0, '2011-10', '乔布斯大神', '2018-04-12 08:26:24');
INSERT INTO `book` VALUES (66, '万历十五年', 2, 1, 4.00, 12.80, 3, '黄仁宇', '生活·读书·新知三联书店', '1', 4.0, '1997-05', '老书了', '2018-04-12 08:26:27');
INSERT INTO `book` VALUES (67, '毛泽东选集 第一卷', 3, 1, 10.00, 40.00, 3, '毛泽东', '人民出版社', '2', 6.0, '2003-07', '毛主席', '2018-04-12 08:26:31');
INSERT INTO `book` VALUES (68, '孙子兵法', 3, 1, 10.00, 20.00, 3, '孙武', '上海古籍出版社', '2', 7.0, '2006-07', '军事爱好者可入', '2018-04-12 08:26:33');
INSERT INTO `book` VALUES (69, '三十六计', 3, 1, 2.00, 6.00, 3, '赵立', '吉林文史出版社', '2', 4.0, '2006-05', '用来压泡面了', '2018-04-12 08:26:36');
INSERT INTO `book` VALUES (70, '金刚经', 4, 1, 6.00, 16.00, 3, '鸠摩罗什', '2', '2', 9.0, '2009-01', '好！', '2018-04-12 08:26:40');
INSERT INTO `book` VALUES (71, '断舍离', 4, 1, 10.00, 32.00, 3, '山下英子', '广西科学技术出版社', '1', 9.0, '2014-05', '基本全新', '2018-04-12 08:26:42');
INSERT INTO `book` VALUES (72, '人性的弱点全集', 4, 1, 10.00, 25.00, 3, '戴尔·卡内基', '中国发展出版社', '2', 8.0, '2008-01', '好书啊', '2018-04-12 08:26:45');
INSERT INTO `book` VALUES (73, '人类简史：从动物到上帝', 5, 1, 24.00, 68.00, 3, '尤瓦尔·赫拉利', '中信出版社', '1', 9.0, '2014-11', '毕业便宜甩', '2018-04-12 08:26:47');
INSERT INTO `book` VALUES (74, '丑陋的中国人', 5, 1, 6.00, 22.00, 3, '柏杨', '古吴轩出版社', '1', 7.0, '2006-02', '老书了', '2018-04-12 08:26:49');
INSERT INTO `book` VALUES (75, '郎咸平说', 5, 1, 10.00, 32.00, 3, '郎咸平', '东方出版社', '1', 6.0, '2010-09', '我也不知道我们的日子为什么这么难', '2018-04-12 08:26:52');
INSERT INTO `book` VALUES (76, '孩子你慢慢来', 6, 1, 10.00, 28.00, 3, '龙应台', '生活·读书·新知三联书店', '1', 9.0, '2009-12', '好书推荐', '2018-04-12 08:26:55');
INSERT INTO `book` VALUES (77, '男人这东西', 6, 1, 8.00, 28.00, 3, '渡边淳一', '作家出版社', '1', 7.0, '2010-03', '渡边大神的书', '2018-04-12 08:26:58');
INSERT INTO `book` VALUES (78, '荒野生存', 6, 1, 19.00, 39.00, 3, '乔恩·克拉考尔', '中国人民大学出版社', '1', 7.0, '2008-08', '已改编成同名电影', '2018-04-12 08:27:02');
INSERT INTO `book` VALUES (80, '剑桥雅思真题9', 8, 1, 5.00, 15.00, 1, '无', '科学出版社', '1', 9.9, '2014-03', '全新没写过，已分手雅思', '2018-04-12 08:27:07');
INSERT INTO `book` VALUES (81, '剑桥雅思11', 8, 1, 15.00, 8.00, 1, '无', '中国人民大学出版社', '1', 9.9, '2015-09', '全新没写过的', '2018-04-12 08:27:10');
INSERT INTO `book` VALUES (82, '顾家北手把手教你雅思写作', 8, 1, 20.00, 55.60, 1, '顾家北', '中国人民大学出版社', '1', 8.0, '2017-09', '有一点点笔记', '2018-04-12 08:27:13');
INSERT INTO `book` VALUES (83, '雅思王听力语料库', 8, 1, 16.00, 37.50, 1, '王陆', '中国人民大学出版社', '1', 8.0, '2017-06', '接近全新啦', '2018-04-12 08:27:15');
INSERT INTO `book` VALUES (84, '时间简史', 9, 1, 15.00, 45.00, 2, '史蒂芬·霍金', '湖南科学技术出版社', '1', 8.0, '2015-04', '霍金大大啊', '2018-04-12 08:27:18');
INSERT INTO `book` VALUES (85, '万物简史', 9, 1, 11.00, 36.80, 2, '比尔·布莱森', '接力出版社', '1', 6.0, '2005-02', '很好的书', '2018-04-12 08:27:20');
INSERT INTO `book` VALUES (86, '昆虫记', 9, 1, 9.00, 19.00, 2, '法布尔', '作家出版社', '2', 2.0, '2000-06', '老书了', '2018-04-12 08:27:23');
INSERT INTO `book` VALUES (87, '黄帝内经', 3, 1, 10.00, 30.00, 3, '王冰', '中医古籍出版社', '1', 1.0, '2003-11', '好', '2018-04-12 08:27:25');
INSERT INTO `book` VALUES (94, '三体', 1, 1, 20.00, 58.00, 3, '刘慈欣', '人民出版社', '第2版', 9.9, '2018-06', '很好看的一本中国的科幻小说', '2024-07-29 14:27:51');
INSERT INTO `book` VALUES (95, '三体', 5, 1, 20.00, 59.00, 3, '刘慈欣', '人民出版社', '第1版', 9.0, '2017-06', '很好看的一本科幻小说，这个一册主要描述的是在大宇宙观下社会', '2024-07-29 14:36:08');
INSERT INTO `book` VALUES (97, '三体', NULL, 0, 0.00, 0.00, 3, '刘慈欣', '人民出版社', NULL, 0.0, NULL, NULL, '2024-07-29 14:45:59');

-- ----------------------------
-- Table structure for bookimage
-- ----------------------------
DROP TABLE IF EXISTS `bookimage`;
CREATE TABLE `bookimage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_bookimage_book`(`bid`) USING BTREE,
  CONSTRAINT `fk_bookimage_book` FOREIGN KEY (`bid`) REFERENCES `book` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookimage
-- ----------------------------
INSERT INTO `bookimage` VALUES (1, 4, 0);
INSERT INTO `bookimage` VALUES (2, 5, 0);
INSERT INTO `bookimage` VALUES (3, 6, 0);
INSERT INTO `bookimage` VALUES (4, 7, 0);
INSERT INTO `bookimage` VALUES (5, 8, 0);
INSERT INTO `bookimage` VALUES (6, 1, 0);
INSERT INTO `bookimage` VALUES (7, 3, 0);
INSERT INTO `bookimage` VALUES (8, 9, 0);
INSERT INTO `bookimage` VALUES (9, 10, 0);
INSERT INTO `bookimage` VALUES (10, 11, 0);
INSERT INTO `bookimage` VALUES (11, 12, 0);
INSERT INTO `bookimage` VALUES (12, 2, 0);
INSERT INTO `bookimage` VALUES (13, 13, 0);
INSERT INTO `bookimage` VALUES (14, 14, 0);
INSERT INTO `bookimage` VALUES (15, 15, 0);
INSERT INTO `bookimage` VALUES (16, 16, 0);
INSERT INTO `bookimage` VALUES (17, 17, 0);
INSERT INTO `bookimage` VALUES (18, 18, 0);
INSERT INTO `bookimage` VALUES (19, 19, 0);
INSERT INTO `bookimage` VALUES (21, 21, 0);
INSERT INTO `bookimage` VALUES (58, 62, NULL);
INSERT INTO `bookimage` VALUES (60, 64, NULL);
INSERT INTO `bookimage` VALUES (61, 65, NULL);
INSERT INTO `bookimage` VALUES (62, 66, NULL);
INSERT INTO `bookimage` VALUES (63, 67, NULL);
INSERT INTO `bookimage` VALUES (64, 68, NULL);
INSERT INTO `bookimage` VALUES (65, 69, NULL);
INSERT INTO `bookimage` VALUES (66, 70, NULL);
INSERT INTO `bookimage` VALUES (67, 71, NULL);
INSERT INTO `bookimage` VALUES (68, 72, NULL);
INSERT INTO `bookimage` VALUES (69, 73, NULL);
INSERT INTO `bookimage` VALUES (70, 74, NULL);
INSERT INTO `bookimage` VALUES (71, 75, NULL);
INSERT INTO `bookimage` VALUES (72, 76, NULL);
INSERT INTO `bookimage` VALUES (73, 77, NULL);
INSERT INTO `bookimage` VALUES (74, 78, NULL);
INSERT INTO `bookimage` VALUES (76, 80, NULL);
INSERT INTO `bookimage` VALUES (77, 81, NULL);
INSERT INTO `bookimage` VALUES (78, 82, NULL);
INSERT INTO `bookimage` VALUES (79, 83, NULL);
INSERT INTO `bookimage` VALUES (80, 84, NULL);
INSERT INTO `bookimage` VALUES (81, 85, NULL);
INSERT INTO `bookimage` VALUES (82, 86, NULL);
INSERT INTO `bookimage` VALUES (83, 87, NULL);
INSERT INTO `bookimage` VALUES (84, NULL, NULL);
INSERT INTO `bookimage` VALUES (85, NULL, NULL);
INSERT INTO `bookimage` VALUES (88, NULL, NULL);
INSERT INTO `bookimage` VALUES (89, 94, NULL);
INSERT INTO `bookimage` VALUES (90, 95, NULL);
INSERT INTO `bookimage` VALUES (91, 97, NULL);

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo`  (
  `id` int(11) NULL DEFAULT NULL,
  `bid` int(11) NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '小说 / 文学 / 语言文学');
INSERT INTO `category` VALUES (2, '历史 / 地理 / 艺术');
INSERT INTO `category` VALUES (3, '政治 / 法律 / 军事');
INSERT INTO `category` VALUES (4, '哲学 / 心理 / 宗教');
INSERT INTO `category` VALUES (5, '经济 / 社科 / 综合');
INSERT INTO `category` VALUES (6, '童书 / 生活 / 体育');
INSERT INTO `category` VALUES (7, '工程技术 / 互联网');
INSERT INTO `category` VALUES (8, '教材 / 教辅 / 考试');
INSERT INTO `category` VALUES (9, '自然科学 / 医药卫生');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentid` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1505119', '余文乐', '675844', 'm', '13712345678', '19-1-15', '计算机科学与技术');
INSERT INTO `user` VALUES (2, '1505101', '许玮甯', '549256', 'f', '13212345678', '19-1-1', '计算机科学与技术');
INSERT INTO `user` VALUES (3, '1505112', '彭于晏', '123456', 'm', '15812345678', '19-1-11', '计算机科学与技术');
INSERT INTO `user` VALUES (6, '1505110', '李xx', '1123456', 'm', '14785209630', '19-1-19', '计算机科学与技术');
INSERT INTO `user` VALUES (7, '1505107', '李xx', '123456', 'm', '14785209630', '13-3-29', '大数据科学与技术');

SET FOREIGN_KEY_CHECKS = 1;
