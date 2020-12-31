/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50727
Source Host           : localhost:3306
Source Database       : initoalal

Target Server Type    : MYSQL
Target Server Version : 50727
File Encoding         : 65001

Date: 2020-12-27 16:32:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_consignee`
-- ----------------------------
DROP TABLE IF EXISTS `c_consignee`;
CREATE TABLE `c_consignee` (
  `CUSTOMER_ADDR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键ID',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '消费者主键ID',
  `ZIP` varchar(10) DEFAULT NULL COMMENT '邮编',
  `PROVINCE` varchar(20) DEFAULT NULL COMMENT '省份',
  `CITY` varchar(20) DEFAULT NULL COMMENT '城市',
  `DISTRICT` varchar(20) DEFAULT NULL COMMENT '城市中的区域',
  `ADDRESS` varchar(50) DEFAULT NULL COMMENT '地址 具体到门牌号',
  `IS_DEFAULT` tinyint(1) DEFAULT '0' COMMENT '是否默认 0否 1默认',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`CUSTOMER_ADDR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of c_consignee
-- ----------------------------

-- ----------------------------
-- Table structure for `c_customer_info`
-- ----------------------------
DROP TABLE IF EXISTS `c_customer_info`;
CREATE TABLE `c_customer_info` (
  `CUSTOMER_INF_ID` varchar(12) NOT NULL COMMENT '消费者信息详情主键ID',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '消费者主键ID',
  `CUSTOMER_NAME` varchar(20) NOT NULL COMMENT '消费者用户名',
  `REAL_NAME` varchar(20) DEFAULT NULL COMMENT '消费者真实姓名',
  `IDENTY_CATRD_TYPE` tinyint(1) NOT NULL COMMENT '证件类型：1 身份证，2 军官证，3 护照',
  `IDENTY_CATRD_NO` varchar(20) DEFAULT NULL COMMENT '证件号码',
  `USER_MOBILE` varchar(20) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `GENDER` tinyint(1) DEFAULT '0' COMMENT '性别 0保密 1女 2男',
  `BIRTHDAY` varchar(20) DEFAULT NULL COMMENT '生日',
  `USER_POINT` int(11) DEFAULT '0' COMMENT '用户积分',
  `REGISTER_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `CUSTOMER_LEVEL` tinyint(1) DEFAULT '1' COMMENT '会员级别：1 普通会员，2 青铜，3白银，4黄金，5钻石',
  `USER_BALANCE` int(11) DEFAULT NULL COMMENT '用户余额（分）',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`CUSTOMER_INF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of c_customer_info
-- ----------------------------

-- ----------------------------
-- Table structure for `c_login`
-- ----------------------------
DROP TABLE IF EXISTS `c_login`;
CREATE TABLE `c_login` (
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '客户主键ID',
  `LOGIN_NAME` varchar(20) NOT NULL COMMENT '登录用户名',
  `PASSWORD` varchar(32) NOT NULL COMMENT '登录密码(加密）',
  `USER_STATUS` tinyint(1) DEFAULT '1' COMMENT '用户状态 0，未登录 1，已登陆',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of c_login
-- ----------------------------

-- ----------------------------
-- Table structure for `c_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `c_login_log`;
CREATE TABLE `c_login_log` (
  `LOGIN_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '登录日志主键ID',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '消费者ID',
  `LOGIN_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `LOGIN_IP` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `LOGIN_TYPE` tinyint(1) DEFAULT '0' COMMENT '登陆状态 0未登陆成功 1登录成功',
  PRIMARY KEY (`LOGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户登录日志表';

-- ----------------------------
-- Records of c_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for `c_point_log`
-- ----------------------------
DROP TABLE IF EXISTS `c_point_log`;
CREATE TABLE `c_point_log` (
  `POINT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '积分记录主键ID',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '消费者主键ID',
  `SOURCE` tinyint(1) NOT NULL COMMENT '积分来源：0订单，1登陆，2活动',
  `REFER_NUM` varchar(30) DEFAULT NULL COMMENT '积分来源相关编号',
  `CHARGE_POINT` int(11) DEFAULT NULL COMMENT '变更积分数',
  `RANK_POINTS` int(11) DEFAULT '0' COMMENT '等级积分,跟消费积分是分开的',
  `PAY_POINTS` int(11) DEFAULT '0' COMMENT '消费积分,跟等级积分是分开的',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '积分日志生成时间',
  `CHANGE_DESC` varchar(200) DEFAULT NULL COMMENT '消费记录说明',
  PRIMARY KEY (`POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分日志表';

-- ----------------------------
-- Records of c_point_log
-- ----------------------------

-- ----------------------------
-- Table structure for `g_business`
-- ----------------------------
DROP TABLE IF EXISTS `g_business`;
CREATE TABLE `g_business` (
  `BUSINESS_ID` varchar(12) NOT NULL COMMENT '店铺ID',
  `BUSINESS_NAME` varchar(50) NOT NULL COMMENT '店铺名称',
  `BUSINESS_CODE` varchar(20) DEFAULT NULL COMMENT '店铺代码',
  `ADDRESS` varchar(150) DEFAULT NULL COMMENT '店铺的地址',
  `SEND_RANGE` varchar(200) DEFAULT NULL COMMENT '配送范围',
  `FANS_COUNT` int(11) DEFAULT '0' COMMENT '店铺的粉丝数',
  `SCORE` int(11) DEFAULT NULL COMMENT '店铺评分 整存',
  `BUSINESS_LEVEL` tinyint(1) DEFAULT NULL COMMENT '店铺等级',
  `BUSINESS_TYPE` varchar(20) DEFAULT NULL COMMENT '店铺类型 ',
  `TERMINAL_CODE` varchar(50) DEFAULT NULL COMMENT '设备终端编码',
  `STATUS` tinyint(1) DEFAULT '1' COMMENT '店铺状态 0 暂停营业，1 营业',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(30) DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_BY` varchar(30) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`BUSINESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家店铺表';

-- ----------------------------
-- Records of g_business
-- ----------------------------

-- ----------------------------
-- Table structure for `g_category`
-- ----------------------------
DROP TABLE IF EXISTS `g_category`;
CREATE TABLE `g_category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `CATEGORY_NAME` varchar(50) NOT NULL COMMENT '分类名称',
  `PARENT_ID` varchar(12) DEFAULT '0' COMMENT '分类父级ID   默认-1为一级分类',
  `KEYWORDS` varchar(50) DEFAULT NULL COMMENT '分类编码   名称简拼，用于快捷页面跳转',
  `CATY_DESC` varchar(150) DEFAULT NULL COMMENT '商品分类描述',
  `SORT_ORL` int(11) DEFAULT NULL COMMENT '商品分类排序',
  `IS_SHOW_IN_NAV` tinyint(1) DEFAULT '0' COMMENT '是否显示在导航栏,0不;1显示',
  `GRADE` tinyint(4) DEFAULT '1' COMMENT '该分类的最高和最低价之间的价格分级,当大于1时,会根据最大最小价格区间分成区间,会在页面显示价格范围,如0-300,300-600,600-900这种;',
  `FILTER_ATTR` varchar(50) DEFAULT NULL COMMENT '如果该字段有值,则该分类将还会按照该值对应在表goods_attr的goods_attr_id所对应的属性筛选，如，封面颜色下有红，黑分类筛选',
  `IS_SHOW` tinyint(1) DEFAULT '1' COMMENT '是否展示 0不显示 1显示',
  `IS_ENABLED` tinyint(1) DEFAULT '1' COMMENT '是否有效 0无效 1有效',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(30) DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_BY` varchar(30) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Records of g_category
-- ----------------------------
INSERT INTO `g_category` VALUES ('1', '家用电器', '-1', 'jiayongdianqi', '家用电器', '1', '1', '1', '01a', '1', '1', '2020-07-09 10:50:32', 'admin', '2020-07-09 10:50:32', 'admin');
INSERT INTO `g_category` VALUES ('2', '手机', '-1', 'shouji01', '手机', '2', '1', '1', '02a', '1', '1', '2020-07-09 12:10:15', 'admin', '2020-07-09 12:10:15', 'admin');
INSERT INTO `g_category` VALUES ('3', '运营商', '-1', 'yunyingshang', '运营商', '3', '1', '1', '02a', '1', '1', '2020-07-09 10:50:33', 'admin', '2020-07-09 10:50:33', 'admin');
INSERT INTO `g_category` VALUES ('4', '数码', '-1', 'shuma', '数码', '4', '1', '1', '02a', '1', '1', '2020-07-09 10:50:39', 'admin', '2020-07-09 10:50:39', 'admin');
INSERT INTO `g_category` VALUES ('5', '电脑', '-1', 'diannao', '电脑', '5', '1', '1', '03a', '1', '1', '2020-07-09 10:50:34', 'admin', '2020-07-09 10:50:34', 'admin');
INSERT INTO `g_category` VALUES ('6', '办公', '-1', 'bangong', '办公', '6', '1', '1', '03a', '1', '1', '2020-07-09 10:50:36', 'admin', '2020-07-09 10:50:36', 'admin');
INSERT INTO `g_category` VALUES ('7', '家居', '-1', 'jiaju01', '家居', '7', '1', '1', '04a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('8', '家具', '-1', 'jiaju02', '家具', '8', '1', '1', '04a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('9', '家装', '-1', 'jiazhuang', '家装', '9', '1', '1', '04a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('10', '厨具', '-1', 'chuju', '厨具', '10', '1', '1', '04a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('11', '男装', '-1', 'nanzhuang', '男装', '11', '1', '1', '05a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('12', '女装', '-1', 'nvzhuang', '女装', '12', '1', '1', '05a', '1', '1', '2020-07-09 10:50:46', 'admin', '2020-07-09 10:50:46', 'admin');
INSERT INTO `g_category` VALUES ('13', '童装', '-1', 'tongzhuang', '童装', '13', '1', '1', '05a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('14', '内衣', '-1', 'neiyi', '内衣', '14', '1', '1', '05a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('15', '美妆', '-1', 'meizhuang', '美妆', '15', '1', '1', '06a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('16', '个护清洁', '-1', 'gehuqingjie', '个护清洁', '16', '1', '1', '06a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('17', '宠物', '-1', 'chongwu', '宠物', '17', '1', '1', '06a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('18', '女鞋', '-1', 'nvxie', '女鞋', '18', '1', '1', '07a', '1', '1', '2020-07-09 10:50:51', 'admin', '2020-07-09 10:50:51', 'admin');
INSERT INTO `g_category` VALUES ('19', '箱包', '-1', 'xiangbao', '箱包', '19', '1', '1', '07a', '1', '1', '2020-07-09 10:50:59', 'admin', '2020-07-09 10:50:59', 'admin');
INSERT INTO `g_category` VALUES ('20', '钟表', '-1', 'zhongbiao', '钟表', '20', '1', '1', '07a', '1', '1', '2020-07-09 10:50:59', 'admin', '2020-07-09 10:50:59', 'admin');
INSERT INTO `g_category` VALUES ('21', '珠宝', '-1', 'zhubao', '珠宝', '21', '1', '1', '07a', '1', '1', '2020-07-09 10:50:59', 'admin', '2020-07-09 10:50:59', 'admin');
INSERT INTO `g_category` VALUES ('22', '男鞋', '-1', 'nanxie', '男鞋', '22', '1', '1', '08a', '1', '1', '2020-07-09 10:50:59', 'admin', '2020-07-09 10:50:59', 'admin');
INSERT INTO `g_category` VALUES ('23', '运动', '-1', 'yundong', '运动', '23', '1', '1', '08a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('24', '户外', '-1', 'huwai', '户外', '24', '1', '1', '08a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('25', '房产', '-1', 'fangchan', '房产', '25', '1', '1', '09a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('26', '汽车', '-1', 'qiche', '汽车', '26', '1', '1', '09a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('27', '汽车用品', '-1', 'qicheyongpin', '汽车用品', '27', '1', '1', '09a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('28', ' 母婴', '-1', 'muying', ' 母婴', '28', '1', '1', '10a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('29', '玩具乐器', '-1', 'wanjuyueqi', '玩具乐器', '29', '1', '1', '10a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('30', '食品', '-1', 'shipin', '食品', '30', '1', '1', '11a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('31', '酒类', '-1', 'jiulei', '酒类', '31', '1', '1', '11a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('32', '生鲜', '-1', 'shengxian', '生鲜', '32', '1', '1', '11a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('33', '特产', '-1', 'techan', '特产', '33', '1', '1', '11a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('34', '艺术', '-1', 'yishu', '艺术', '34', '1', '1', '12a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('35', '礼品鲜花', '-1', 'lipinxianhua', '礼品鲜花', '35', '1', '1', '12a', '1', '1', '2020-07-09 10:50:59', null, '2020-07-09 10:50:59', null);
INSERT INTO `g_category` VALUES ('36', '农资绿植', '-1', 'nongzilvzhi', '农资绿植', '36', '1', '1', '12a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('37', '医药保健', '-1', 'yiyaobaojian', '医药保健', '37', '1', '1', '13a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('38', '计生情趣', '-1', 'jishengqingque', '计生情趣', '38', '1', '1', '13a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('39', '图书', '-1', 'tushu', '图书', '39', '1', '1', '14a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('40', '文娱', '-1', 'wenyu', '文娱', '40', '1', '1', '14a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('41', '教育', '-1', 'jiaoyu', '教育', '41', '1', '1', '14a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('42', '电子书', '-1', 'dianzishu', '电子书', '42', '1', '1', '14a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('43', '机票', '-1', 'jipiao', '机票', '43', '1', '1', '15a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('44', '酒店', '-1', 'jiudian', '酒店', '44', '1', '1', '15a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('45', '旅游', '-1', 'lvyou', '旅游', '45', '1', '1', '15a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('46', '生活', '-1', 'shenghuo', '生活', '46', '1', '1', '15a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('47', '理财', '-1', 'licai', '理财', '47', '1', '1', '16a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('48', '众筹', '-1', 'zhongchou', '众筹', '48', '1', '1', '16a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('49', '白条', '-1', 'baitiao', '白条', '49', '1', '1', '16a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('50', '保险', '-1', 'baoxian', '保险', '50', '1', '1', '16a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('51', '安装', '-1', 'anzhuang', '安装', '51', '1', '1', '17a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('52', '维修', '-1', 'weixiu', '维修', '52', '1', '1', '17a', '1', '1', '2020-07-09 10:51:02', null, '2020-07-09 10:51:02', null);
INSERT INTO `g_category` VALUES ('53', '清洗', '-1', 'qingxi', '清洗', '53', '1', '1', '17a', '1', '1', '2020-07-09 10:51:06', null, '2020-07-09 10:51:06', null);
INSERT INTO `g_category` VALUES ('54', '二手', '-1', 'ershou', '二手', '54', '1', '1', '17a', '1', '1', '2020-07-09 10:51:06', null, '2020-07-09 10:51:06', null);
INSERT INTO `g_category` VALUES ('55', '工业品', '-1', 'gongyepin', '工业品', '55', '1', '1', '18a', '1', '1', '2020-07-09 10:51:06', null, '2020-07-09 10:51:06', null);
INSERT INTO `g_category` VALUES ('56', '电视', '1', 'dianshi', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:42:51', null, '2020-07-09 11:42:51', null);
INSERT INTO `g_category` VALUES ('57', '空调', '1', 'kongtiao', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:42:53', null, '2020-07-09 11:42:53', null);
INSERT INTO `g_category` VALUES ('58', '洗衣机', '1', 'xiyiji', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:42:53', null, '2020-07-09 11:42:53', null);
INSERT INTO `g_category` VALUES ('59', '冰箱', '1', 'bingxiang', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:42:54', null, '2020-07-09 11:42:54', null);
INSERT INTO `g_category` VALUES ('60', '厨卫大电', '1', 'chuweidadian', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:42:55', null, '2020-07-09 11:42:55', null);
INSERT INTO `g_category` VALUES ('61', '厨房小电', '1', 'chufangxiaodian', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:42:56', null, '2020-07-09 11:42:56', null);
INSERT INTO `g_category` VALUES ('62', '生活电器', '1', 'shenghuodianqi', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:42:56', null, '2020-07-09 11:42:56', null);
INSERT INTO `g_category` VALUES ('63', '个护健康', '1', 'gehujiankang', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:42:58', null, '2020-07-09 11:42:58', null);
INSERT INTO `g_category` VALUES ('64', '视听影音', '1', 'shitingyingyin', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:42:59', null, '2020-07-09 11:42:59', null);
INSERT INTO `g_category` VALUES ('65', '超薄电视', '56', 'chaobaodianshi', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:42:33', null, '2020-07-09 11:42:33', null);
INSERT INTO `g_category` VALUES ('66', '全面屏电视', '56', 'quanmianpingdianshi', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:42:34', null, '2020-07-09 11:42:34', null);
INSERT INTO `g_category` VALUES ('67', '智能电视', '56', 'zhinengdianshi', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:42:34', null, '2020-07-09 11:42:34', null);
INSERT INTO `g_category` VALUES ('68', '教育电视', '56', 'jiaoyudianshi', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:42:35', null, '2020-07-09 11:42:35', null);
INSERT INTO `g_category` VALUES ('69', 'OLED电视', '56', 'oleddianshi', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:42:36', null, '2020-07-09 11:42:36', null);
INSERT INTO `g_category` VALUES ('70', '智慧屏', '56', 'zhihuiping', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:42:37', null, '2020-07-09 11:42:37', null);
INSERT INTO `g_category` VALUES ('71', '4K超清电视', '56', '4kchaoqingdianshi', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:42:38', null, '2020-07-09 11:42:38', null);
INSERT INTO `g_category` VALUES ('72', '55英寸', '56', '55yingcun', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:42:39', null, '2020-07-09 11:42:39', null);
INSERT INTO `g_category` VALUES ('73', '65英寸', '56', '65yingcun', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:42:41', null, '2020-07-09 11:42:41', null);
INSERT INTO `g_category` VALUES ('74', '电视配件', '56', 'dianshipeijian', null, '9', '0', '1', null, '1', '1', '2020-07-09 11:42:42', null, '2020-07-09 11:42:42', null);
INSERT INTO `g_category` VALUES ('75', '空调挂机', '57', 'kongtiaoguaji', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:42:18', null, '2020-07-09 11:42:18', null);
INSERT INTO `g_category` VALUES ('76', '空调柜机', '57', 'kongtiaoguiji', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:42:19', null, '2020-07-09 11:42:19', null);
INSERT INTO `g_category` VALUES ('77', '中央空调', '57', 'zhongyangkongtiao', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:42:20', null, '2020-07-09 11:42:20', null);
INSERT INTO `g_category` VALUES ('78', '变频空调', '57', 'bianpinkongtiao', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:42:21', null, '2020-07-09 11:42:21', null);
INSERT INTO `g_category` VALUES ('79', '一级能效', '57', 'yijinengxiao', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:42:22', null, '2020-07-09 11:42:22', null);
INSERT INTO `g_category` VALUES ('80', '移动空调', '57', 'yidongkongtiao', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:42:23', null, '2020-07-09 11:42:23', null);
INSERT INTO `g_category` VALUES ('81', '以旧换新', '57', 'yijiuhuanxin', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:42:25', null, '2020-07-09 11:42:25', null);
INSERT INTO `g_category` VALUES ('82', '滚筒洗衣机', '58', 'guntongxiyiji', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:42:03', null, '2020-07-09 11:42:03', null);
INSERT INTO `g_category` VALUES ('83', '洗烘一体机', '58', 'xihongyitiji', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:42:04', null, '2020-07-09 11:42:04', null);
INSERT INTO `g_category` VALUES ('84', '波轮洗衣机', '58', 'bolunxiyiji', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:42:05', null, '2020-07-09 11:42:05', null);
INSERT INTO `g_category` VALUES ('85', '迷你洗衣机', '58', 'minixiyiji', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:42:10', null, '2020-07-09 11:42:10', null);
INSERT INTO `g_category` VALUES ('86', '烘干机', '58', 'hongganji', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:42:10', null, '2020-07-09 11:42:10', null);
INSERT INTO `g_category` VALUES ('87', '洗衣机配件', '58', 'xiyijipeijian', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:42:13', null, '2020-07-09 11:42:13', null);
INSERT INTO `g_category` VALUES ('88', '多门', '59', 'duomenbx', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:41:48', null, '2020-07-09 11:41:48', null);
INSERT INTO `g_category` VALUES ('89', '对开门', '59', 'duikaimenbx', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:41:50', null, '2020-07-09 11:41:50', null);
INSERT INTO `g_category` VALUES ('90', '三门', '59', 'sanmenbx', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:41:51', null, '2020-07-09 11:41:51', null);
INSERT INTO `g_category` VALUES ('91', '双门', '59', 'shuangkaimenbx', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:41:52', null, '2020-07-09 11:41:52', null);
INSERT INTO `g_category` VALUES ('92', '冰柜/冰吧', '59', 'binggui&bingba', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:41:52', null, '2020-07-09 11:41:52', null);
INSERT INTO `g_category` VALUES ('93', '酒柜', '59', 'jiujiu', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:41:53', null, '2020-07-09 11:41:53', null);
INSERT INTO `g_category` VALUES ('94', '冰箱配件', '59', 'bxpj', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:41:55', null, '2020-07-09 11:41:55', null);
INSERT INTO `g_category` VALUES ('95', '油烟机', '60', 'chouyanji', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:41:26', null, '2020-07-09 11:41:26', null);
INSERT INTO `g_category` VALUES ('96', '燃气灶', '60', 'ranqizao', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:41:30', null, '2020-07-09 11:41:30', null);
INSERT INTO `g_category` VALUES ('97', '烟灶套装', '60', 'yanzaotaozhuang', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:41:30', null, '2020-07-09 11:41:30', null);
INSERT INTO `g_category` VALUES ('98', '集成灶', '60', 'jichengzao', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:41:31', null, '2020-07-09 11:41:31', null);
INSERT INTO `g_category` VALUES ('99', '消毒柜', '60', 'xiaodugui', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:41:32', null, '2020-07-09 11:41:32', null);
INSERT INTO `g_category` VALUES ('100', '洗碗机', '60', 'xiwanji', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:41:32', null, '2020-07-09 11:41:32', null);
INSERT INTO `g_category` VALUES ('101', '电热水器', '60', 'dianreshuiqi', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:41:34', null, '2020-07-09 11:41:34', null);
INSERT INTO `g_category` VALUES ('102', '燃气热水器', '60', 'ranqireshuiqi', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:41:34', null, '2020-07-09 11:41:34', null);
INSERT INTO `g_category` VALUES ('103', '空气能热水器', '60', 'kqnrsq', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:41:35', null, '2020-07-09 11:41:35', null);
INSERT INTO `g_category` VALUES ('104', '太阳能热水器', '60', 'tynrsq', null, '9', '0', '1', null, '1', '1', '2020-07-09 11:41:36', null, '2020-07-09 11:41:36', null);
INSERT INTO `g_category` VALUES ('105', '嵌入式厨电', '60', 'qianrushichudian', null, '10', '0', '1', null, '1', '1', '2020-07-09 11:41:38', null, '2020-07-09 11:41:38', null);
INSERT INTO `g_category` VALUES ('106', '烟机灶具配件', '60', 'yjzjpj', null, '11', '0', '1', null, '1', '1', '2020-07-09 11:41:41', null, '2020-07-09 11:41:41', null);
INSERT INTO `g_category` VALUES ('107', '破壁机', '61', 'pobiji', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:40:43', null, '2020-07-09 11:40:43', null);
INSERT INTO `g_category` VALUES ('108', '电烤箱', '61', 'diankaoxiang', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:40:44', null, '2020-07-09 11:40:44', null);
INSERT INTO `g_category` VALUES ('109', '电饭煲', '61', 'dianfanbao', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:40:45', null, '2020-07-09 11:40:45', null);
INSERT INTO `g_category` VALUES ('110', '电压力锅', '61', 'dianyaliguo', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:40:45', null, '2020-07-09 11:40:45', null);
INSERT INTO `g_category` VALUES ('111', '电炖锅', '61', 'diandunguo', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:40:46', null, '2020-07-09 11:40:46', null);
INSERT INTO `g_category` VALUES ('112', '豆浆机', '61', 'doujiangji', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:40:47', null, '2020-07-09 11:40:47', null);
INSERT INTO `g_category` VALUES ('113', '料理机', '61', 'liaoliji', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:40:48', null, '2020-07-09 11:40:48', null);
INSERT INTO `g_category` VALUES ('114', '咖啡机', '61', 'kafeiji', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:40:49', null, '2020-07-09 11:40:49', null);
INSERT INTO `g_category` VALUES ('115', '电饼铛', '61', 'dianbingcheng', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:40:50', null, '2020-07-09 11:40:50', null);
INSERT INTO `g_category` VALUES ('116', '榨汁机/原汁机', '61', 'zzj&yzj', null, '9', '0', '1', null, '1', '1', '2020-07-09 11:40:51', null, '2020-07-09 11:40:51', null);
INSERT INTO `g_category` VALUES ('117', '电水壶/热水瓶', '61', 'dsh&rsp', null, '10', '0', '1', null, '1', '1', '2020-07-09 11:40:54', null, '2020-07-09 11:40:54', null);
INSERT INTO `g_category` VALUES ('118', '微波炉', '61', 'weibolu', null, '11', '0', '1', null, '1', '1', '2020-07-09 11:40:55', null, '2020-07-09 11:40:55', null);
INSERT INTO `g_category` VALUES ('119', '电热饭盒', '61', 'dianrefanhe', null, '12', '0', '1', null, '1', '1', '2020-07-09 11:40:56', null, '2020-07-09 11:40:56', null);
INSERT INTO `g_category` VALUES ('120', '电火锅', '61', 'dianhuoguo', null, '13', '0', '1', null, '1', '1', '2020-07-09 11:40:57', null, '2020-07-09 11:40:57', null);
INSERT INTO `g_category` VALUES ('121', '养生壶', '61', 'yangshenghu', null, '14', '0', '1', null, '1', '1', '2020-07-09 11:40:59', null, '2020-07-09 11:40:59', null);
INSERT INTO `g_category` VALUES ('122', '电磁炉', '61', 'diancilu', null, '15', '0', '1', null, '1', '1', '2020-07-09 11:41:06', null, '2020-07-09 11:41:06', null);
INSERT INTO `g_category` VALUES ('123', '面包机', '61', 'mianboji', null, '16', '0', '1', null, '1', '1', '2020-07-09 11:41:08', null, '2020-07-09 11:41:08', null);
INSERT INTO `g_category` VALUES ('124', '空气炸锅', '61', 'kongqizhaguo', null, '17', '0', '1', null, '1', '1', '2020-07-09 11:41:10', null, '2020-07-09 11:41:10', null);
INSERT INTO `g_category` VALUES ('125', '面条机', '61', 'miantiaoji', null, '18', '0', '1', null, '1', '1', '2020-07-09 11:41:12', null, '2020-07-09 11:41:12', null);
INSERT INTO `g_category` VALUES ('126', '电陶炉', '61', 'diantaolu', null, '19', '0', '1', null, '1', '1', '2020-07-09 11:41:14', null, '2020-07-09 11:41:14', null);
INSERT INTO `g_category` VALUES ('127', '煮蛋器', '61', 'zhudanqi', null, '20', '0', '1', null, '1', '1', '2020-07-09 11:41:16', null, '2020-07-09 11:41:16', null);
INSERT INTO `g_category` VALUES ('128', '电烧烤炉', '61', 'dianshaokaolu', null, '21', '0', '1', null, '1', '1', '2020-07-09 11:41:17', null, '2020-07-09 11:41:17', null);
INSERT INTO `g_category` VALUES ('129', '电风扇', '62', 'dianfengshan', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:40:11', null, '2020-07-09 11:40:11', null);
INSERT INTO `g_category` VALUES ('130', '冷风扇', '62', 'lengfengshan', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:40:13', null, '2020-07-09 11:40:13', null);
INSERT INTO `g_category` VALUES ('131', '空气净化器', '62', 'kqjhq', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:40:15', null, '2020-07-09 11:40:15', null);
INSERT INTO `g_category` VALUES ('132', '吸尘器', '62', 'xichenqi', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:40:14', null, '2020-07-09 11:40:14', null);
INSERT INTO `g_category` VALUES ('133', '除螨仪', '62', 'chumanyi', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:40:16', null, '2020-07-09 11:40:16', null);
INSERT INTO `g_category` VALUES ('134', '扫地机器人', '62', 'sdjqr', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:40:17', null, '2020-07-09 11:40:17', null);
INSERT INTO `g_category` VALUES ('135', '除湿机', '62', 'chushiji', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:40:18', null, '2020-07-09 11:40:18', null);
INSERT INTO `g_category` VALUES ('136', '干衣机', '62', 'ganyiji', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:40:19', null, '2020-07-09 11:40:19', null);
INSERT INTO `g_category` VALUES ('137', '蒸汽拖把/拖地机', '62', 'zqtb&tdj', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:40:20', null, '2020-07-09 11:40:20', null);
INSERT INTO `g_category` VALUES ('138', '挂烫机/熨斗', '62', 'gtj&yd', null, '9', '0', '1', null, '1', '1', '2020-07-09 11:40:21', null, '2020-07-09 11:40:21', null);
INSERT INTO `g_category` VALUES ('139', '电话机', '62', 'dianhuaji', null, '10', '0', '1', null, '1', '1', '2020-07-09 11:40:23', null, '2020-07-09 11:40:23', null);
INSERT INTO `g_category` VALUES ('140', '饮水机', '62', 'yinshuiji', null, '11', '0', '1', null, '1', '1', '2020-07-09 11:40:24', null, '2020-07-09 11:40:24', null);
INSERT INTO `g_category` VALUES ('141', '净水器', '62', 'jingshuiqi', null, '12', '0', '1', null, '1', '1', '2020-07-09 11:40:26', null, '2020-07-09 11:40:26', null);
INSERT INTO `g_category` VALUES ('142', '取暖器', '62', 'qunuanqi', null, '13', '0', '1', null, '1', '1', '2020-07-09 11:40:29', null, '2020-07-09 11:40:29', null);
INSERT INTO `g_category` VALUES ('143', '加湿器', '62', 'jiashiqi', null, '14', '0', '1', null, '1', '1', '2020-07-09 11:40:31', null, '2020-07-09 11:40:31', null);
INSERT INTO `g_category` VALUES ('144', '毛球修剪器', '62', 'mqxjq', null, '15', '0', '1', null, '1', '1', '2020-07-09 11:40:32', null, '2020-07-09 11:40:32', null);
INSERT INTO `g_category` VALUES ('145', '生活电器配件', '62', 'shdqpj', null, '16', '0', '1', null, '1', '1', '2020-07-09 11:40:34', null, '2020-07-09 11:40:34', null);
INSERT INTO `g_category` VALUES ('146', '剃须刀', '63', 'tixudao', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:39:44', null, '2020-07-09 11:39:44', null);
INSERT INTO `g_category` VALUES ('147', '电动牙刷', '63', 'diandongyashua', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:39:46', null, '2020-07-09 11:39:46', null);
INSERT INTO `g_category` VALUES ('148', '电吹风', '63', 'dianchuifeng', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:39:46', null, '2020-07-09 11:39:46', null);
INSERT INTO `g_category` VALUES ('149', '美容仪', '63', 'meirongyi', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:39:47', null, '2020-07-09 11:39:47', null);
INSERT INTO `g_category` VALUES ('150', '洁面仪', '63', 'jiemianyi', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:39:48', null, '2020-07-09 11:39:48', null);
INSERT INTO `g_category` VALUES ('151', '按摩器', '63', 'anmoqi', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:39:52', null, '2020-07-09 11:39:52', null);
INSERT INTO `g_category` VALUES ('152', '健康秤', '63', 'jiankangcheng', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:39:50', null, '2020-07-09 11:39:50', null);
INSERT INTO `g_category` VALUES ('153', '卷/直发器', '63', 'juan&zhifaqi', null, '7', '0', '1', null, '1', '1', '2020-07-09 11:39:53', null, '2020-07-09 11:39:53', null);
INSERT INTO `g_category` VALUES ('154', '剃/脱毛器', '63', 'ti&tuomaoqi', null, '8', '0', '1', null, '1', '1', '2020-07-09 11:39:55', null, '2020-07-09 11:39:55', null);
INSERT INTO `g_category` VALUES ('155', '理发器', '63', 'lifaqi', null, '9', '0', '1', null, '1', '1', '2020-07-09 11:39:56', null, '2020-07-09 11:39:56', null);
INSERT INTO `g_category` VALUES ('156', '足浴盆', '63', 'zuyupen', null, '10', '0', '1', null, '1', '1', '2020-07-09 11:39:57', null, '2020-07-09 11:39:57', null);
INSERT INTO `g_category` VALUES ('157', '足疗机', '63', 'zuliaoji', null, '11', '0', '1', null, '1', '1', '2020-07-09 11:39:59', null, '2020-07-09 11:39:59', null);
INSERT INTO `g_category` VALUES ('158', '按摩椅', '63', 'anmoyi', null, '12', '0', '1', null, '1', '1', '2020-07-09 11:40:00', null, '2020-07-09 11:40:00', null);
INSERT INTO `g_category` VALUES ('159', '家庭影院', '64', 'jiatingyingyuan', null, '0', '0', '1', null, '1', '1', '2020-07-09 11:39:20', null, '2020-07-09 11:39:20', null);
INSERT INTO `g_category` VALUES ('160', 'KTV音响', '64', 'ktvyinxiang', null, '1', '0', '1', null, '1', '1', '2020-07-09 11:39:22', null, '2020-07-09 11:39:22', null);
INSERT INTO `g_category` VALUES ('161', '迷你音响', '64', 'miniyinxiang', null, '2', '0', '1', null, '1', '1', '2020-07-09 11:39:22', null, '2020-07-09 11:39:22', null);
INSERT INTO `g_category` VALUES ('162', 'DVD', '64', 'dvd', null, '3', '0', '1', null, '1', '1', '2020-07-09 11:39:24', null, '2020-07-09 11:39:24', null);
INSERT INTO `g_category` VALUES ('163', '功放', '64', 'gongfang', null, '4', '0', '1', null, '1', '1', '2020-07-09 11:39:25', null, '2020-07-09 11:39:25', null);
INSERT INTO `g_category` VALUES ('164', '回音壁', '64', 'huiyinbi', null, '5', '0', '1', null, '1', '1', '2020-07-09 11:39:26', null, '2020-07-09 11:39:26', null);
INSERT INTO `g_category` VALUES ('165', '麦克风', '64', 'maikefeng', null, '6', '0', '1', null, '1', '1', '2020-07-09 11:39:28', null, '2020-07-09 11:39:28', null);
INSERT INTO `g_category` VALUES ('166', '手机通讯', '2', 'shoujitongxun', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:42', null, '2020-07-09 12:08:42', null);
INSERT INTO `g_category` VALUES ('167', '运营商', '2', 'yunyingshang', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:51', null, '2020-07-09 12:08:51', null);
INSERT INTO `g_category` VALUES ('168', '手机配件', '2', 'shoujipeijian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:55', null, '2020-07-09 12:08:55', null);
INSERT INTO `g_category` VALUES ('169', '摄影摄像', '2', 'sheyingshexiang', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:01', null, '2020-07-09 12:09:01', null);
INSERT INTO `g_category` VALUES ('170', '数码配件', '2', 'shumapeijian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:05', null, '2020-07-09 12:09:05', null);
INSERT INTO `g_category` VALUES ('171', '影音娱乐', '2', 'yingyinyule', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:11', null, '2020-07-09 12:09:11', null);
INSERT INTO `g_category` VALUES ('172', '智能设备', '2', 'zhinengshebei', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:19', null, '2020-07-09 12:09:19', null);
INSERT INTO `g_category` VALUES ('173', '电子教育', '2', 'dianzijiaoyu', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:24', null, '2020-07-09 12:09:24', null);
INSERT INTO `g_category` VALUES ('174', '手机', '166', 'shouji02', null, null, '0', '1', null, '1', '1', '2020-07-09 12:10:34', null, '2020-07-09 12:10:34', null);
INSERT INTO `g_category` VALUES ('175', '游戏手机', '166', 'youxishouji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:36', null, '2020-07-09 12:09:36', null);
INSERT INTO `g_category` VALUES ('176', '5G手机', '166', '5gshouji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:40', null, '2020-07-09 12:09:40', null);
INSERT INTO `g_category` VALUES ('177', '拍照手机', '166', 'paizhaoshouji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:45', null, '2020-07-09 12:09:45', null);
INSERT INTO `g_category` VALUES ('178', '全面屏手机', '166', 'qmpshouji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:50', null, '2020-07-09 12:09:50', null);
INSERT INTO `g_category` VALUES ('179', '老人机', '166', 'laorenji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:09:55', null, '2020-07-09 12:09:55', null);
INSERT INTO `g_category` VALUES ('180', '对讲机', '166', 'duijiangji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:34', null, '2020-07-09 12:08:34', null);
INSERT INTO `g_category` VALUES ('181', '以旧换新', '166', 'yijiuhuanxin', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:30', null, '2020-07-09 12:08:30', null);
INSERT INTO `g_category` VALUES ('182', '手机维修', '166', 'shoujiweixiu', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:25', null, '2020-07-09 12:08:25', null);
INSERT INTO `g_category` VALUES ('183', '合约机', '167', 'heyueji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:21', null, '2020-07-09 12:08:21', null);
INSERT INTO `g_category` VALUES ('184', '手机卡', '167', 'shoujika', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:18', null, '2020-07-09 12:08:18', null);
INSERT INTO `g_category` VALUES ('185', '宽带', '167', 'kuandai', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:14', null, '2020-07-09 12:08:14', null);
INSERT INTO `g_category` VALUES ('186', '充话费/流量', '167', 'chf&liul', null, null, '0', '1', null, '1', '1', '2020-07-09 12:08:11', null, '2020-07-09 12:08:11', null);
INSERT INTO `g_category` VALUES ('187', '中国电信', '167', 'zgdx', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:58', null, '2020-07-09 12:07:58', null);
INSERT INTO `g_category` VALUES ('188', '中国移动', '167', 'zgyd', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:54', null, '2020-07-09 12:07:54', null);
INSERT INTO `g_category` VALUES ('189', '中国联通', '167', 'zglt', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:50', null, '2020-07-09 12:07:50', null);
INSERT INTO `g_category` VALUES ('190', '京东通信', '167', 'jdtx', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:45', null, '2020-07-09 12:07:45', null);
INSERT INTO `g_category` VALUES ('191', '挑靓号', '167', 'tiaolianghao', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:33', null, '2020-07-09 12:07:33', null);
INSERT INTO `g_category` VALUES ('192', '手机壳', '168', 'shoujike', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:26', null, '2020-07-09 12:07:26', null);
INSERT INTO `g_category` VALUES ('193', '贴膜', '168', 'tiemo', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:22', null, '2020-07-09 12:07:22', null);
INSERT INTO `g_category` VALUES ('194', '手机存储卡', '168', 'shoujicunchuka', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:16', null, '2020-07-09 12:07:16', null);
INSERT INTO `g_category` VALUES ('195', '数据线', '168', 'shujuxian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:09', null, '2020-07-09 12:07:09', null);
INSERT INTO `g_category` VALUES ('196', '充电器', '168', 'chongdianqi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:07:04', null, '2020-07-09 12:07:04', null);
INSERT INTO `g_category` VALUES ('197', '手机耳机', '168', 'shoujierji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:57', null, '2020-07-09 12:06:57', null);
INSERT INTO `g_category` VALUES ('198', '创意配件', '168', 'chuangyipeijian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:53', null, '2020-07-09 12:06:53', null);
INSERT INTO `g_category` VALUES ('199', '手机饰品', '168', 'shoujishipin', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:49', null, '2020-07-09 12:06:49', null);
INSERT INTO `g_category` VALUES ('200', '手机电池', '168', 'shoujidianchi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:44', null, '2020-07-09 12:06:44', null);
INSERT INTO `g_category` VALUES ('201', '苹果周边', '168', 'pingguozhoubian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:40', null, '2020-07-09 12:06:40', null);
INSERT INTO `g_category` VALUES ('202', '移动电源', '168', 'yidongdianyuan', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:32', null, '2020-07-09 12:06:32', null);
INSERT INTO `g_category` VALUES ('203', '蓝牙耳机', '168', 'lanyaerji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:28', null, '2020-07-09 12:06:28', null);
INSERT INTO `g_category` VALUES ('204', '手机支架', '168', 'shoujizhijia', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:23', null, '2020-07-09 12:06:23', null);
INSERT INTO `g_category` VALUES ('205', '拍照配件', '168', 'paizhaopeijian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:19', null, '2020-07-09 12:06:19', null);
INSERT INTO `g_category` VALUES ('206', '数码相机', '169', 'shumaxj', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:13', null, '2020-07-09 12:06:13', null);
INSERT INTO `g_category` VALUES ('207', '微单相机', '169', 'weidanxj', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:08', null, '2020-07-09 12:06:08', null);
INSERT INTO `g_category` VALUES ('208', '单反相机', '169', 'danfanxj', null, null, '0', '1', null, '1', '1', '2020-07-09 12:06:04', null, '2020-07-09 12:06:04', null);
INSERT INTO `g_category` VALUES ('209', '拍立得', '169', 'pailide', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:59', null, '2020-07-09 12:05:59', null);
INSERT INTO `g_category` VALUES ('210', '运动相机', '169', 'yundongxiangji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:51', null, '2020-07-09 12:05:51', null);
INSERT INTO `g_category` VALUES ('211', '摄像机', '169', 'shexiangji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:46', null, '2020-07-09 12:05:46', null);
INSERT INTO `g_category` VALUES ('212', '镜头', '169', 'jingtou', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:40', null, '2020-07-09 12:05:40', null);
INSERT INTO `g_category` VALUES ('213', '户外器材', '169', 'huwaiqicai', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:37', null, '2020-07-09 12:05:37', null);
INSERT INTO `g_category` VALUES ('214', '影棚器材', '169', 'yingpengqicai', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:27', null, '2020-07-09 12:05:27', null);
INSERT INTO `g_category` VALUES ('215', '冲印服务', '169', 'chongyinfuwu', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:20', null, '2020-07-09 12:05:20', null);
INSERT INTO `g_category` VALUES ('216', '数码相框', '169', 'shumaxiangkuang', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:14', null, '2020-07-09 12:05:14', null);
INSERT INTO `g_category` VALUES ('217', '存储卡', '170', 'cunchuka', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:09', null, '2020-07-09 12:05:09', null);
INSERT INTO `g_category` VALUES ('218', '三脚架/云台', '170', 'sanjiaojia&yuntai', null, null, '0', '1', null, '1', '1', '2020-07-09 12:05:04', null, '2020-07-09 12:05:04', null);
INSERT INTO `g_category` VALUES ('219', '相机包', '170', 'xiangjibao', null, null, '0', '1', null, '1', '1', '2020-07-09 12:04:56', null, '2020-07-09 12:04:56', null);
INSERT INTO `g_category` VALUES ('220', '滤镜', '170', 'lvjing', null, null, '0', '1', null, '1', '1', '2020-07-09 12:04:50', null, '2020-07-09 12:04:50', null);
INSERT INTO `g_category` VALUES ('221', '闪光灯/手柄', '170', 'sgd&sb', null, null, '0', '1', null, '1', '1', '2020-07-09 12:04:47', null, '2020-07-09 12:04:47', null);
INSERT INTO `g_category` VALUES ('222', '相机清洁/贴膜', '170', 'xjqj&tm', null, null, '0', '1', null, '1', '1', '2020-07-09 12:04:41', null, '2020-07-09 12:04:41', null);
INSERT INTO `g_category` VALUES ('223', '机身附件', '170', 'jishenfujian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:03:09', null, '2020-07-09 12:03:09', null);
INSERT INTO `g_category` VALUES ('224', '镜头附件', '170', 'jingtoufujian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:03:04', null, '2020-07-09 12:03:04', null);
INSERT INTO `g_category` VALUES ('225', '读卡器', '170', 'dukaqi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:53', null, '2020-07-09 12:02:53', null);
INSERT INTO `g_category` VALUES ('226', '支架', '170', 'zhijia', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:49', null, '2020-07-09 12:02:49', null);
INSERT INTO `g_category` VALUES ('227', '电池/充电器', '170', 'dc&cdq', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:46', null, '2020-07-09 12:02:46', null);
INSERT INTO `g_category` VALUES ('228', '耳机/耳麦', '171', 'ej&em', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:38', null, '2020-07-09 12:02:38', null);
INSERT INTO `g_category` VALUES ('229', '音箱/音响', '171', 'yx&yx', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:28', null, '2020-07-09 12:02:28', null);
INSERT INTO `g_category` VALUES ('230', '智能音箱', '171', 'zhinengyinxiang', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:17', null, '2020-07-09 12:02:17', null);
INSERT INTO `g_category` VALUES ('231', '收音机', '171', 'shouyinji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:12', null, '2020-07-09 12:02:12', null);
INSERT INTO `g_category` VALUES ('232', '麦克风', '171', 'maikefeng02', null, null, '0', '1', null, '1', '1', '2020-07-09 12:02:03', null, '2020-07-09 12:02:03', null);
INSERT INTO `g_category` VALUES ('233', 'MP3/MP4', '171', 'mp3&mp4', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:58', null, '2020-07-09 12:01:58', null);
INSERT INTO `g_category` VALUES ('234', '专业音频', '171', 'zhuanyeyinpin', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:50', null, '2020-07-09 12:01:50', null);
INSERT INTO `g_category` VALUES ('235', '音频线', '171', 'yinpinxian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:42', null, '2020-07-09 12:01:42', null);
INSERT INTO `g_category` VALUES ('236', '智能手环', '172', 'zhinengshouhuan', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:38', null, '2020-07-09 12:01:38', null);
INSERT INTO `g_category` VALUES ('237', '智能手表', '172', 'zhinengshoubiao', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:33', null, '2020-07-09 12:01:33', null);
INSERT INTO `g_category` VALUES ('238', '智能眼镜', '172', 'zhinengyanjing', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:25', null, '2020-07-09 12:01:25', null);
INSERT INTO `g_category` VALUES ('239', '智能机器人', '172', 'znjqr', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:20', null, '2020-07-09 12:01:20', null);
INSERT INTO `g_category` VALUES ('240', '运动跟踪器', '172', 'ydgzq', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:14', null, '2020-07-09 12:01:14', null);
INSERT INTO `g_category` VALUES ('241', '健康监测', '172', 'jiankangjiance', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:08', null, '2020-07-09 12:01:08', null);
INSERT INTO `g_category` VALUES ('242', '智能配饰', '172', 'zhinengpeishi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:01:01', null, '2020-07-09 12:01:01', null);
INSERT INTO `g_category` VALUES ('243', '智能家居', '172', 'zhinengjiaju', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:56', null, '2020-07-09 12:00:56', null);
INSERT INTO `g_category` VALUES ('244', '体感车', '172', 'tiganche', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:52', null, '2020-07-09 12:00:52', null);
INSERT INTO `g_category` VALUES ('245', '无人机', '172', 'wurenji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:46', null, '2020-07-09 12:00:46', null);
INSERT INTO `g_category` VALUES ('246', '学生平板', '173', 'xuexipinban', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:41', null, '2020-07-09 12:00:41', null);
INSERT INTO `g_category` VALUES ('247', '点读机/笔', '173', 'dianduji&bi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:32', null, '2020-07-09 12:00:32', null);
INSERT INTO `g_category` VALUES ('248', '早教益智', '173', 'zaojiaoyizhi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:26', null, '2020-07-09 12:00:26', null);
INSERT INTO `g_category` VALUES ('249', '录音笔', '173', 'luyinbi', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:21', null, '2020-07-09 12:00:21', null);
INSERT INTO `g_category` VALUES ('250', '电纸书', '173', 'dianzhishu', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:17', null, '2020-07-09 12:00:17', null);
INSERT INTO `g_category` VALUES ('251', '电子词典', '173', 'dianzicidian', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:14', null, '2020-07-09 12:00:14', null);
INSERT INTO `g_category` VALUES ('252', '复读机', '173', 'fuduji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:08', null, '2020-07-09 12:00:08', null);
INSERT INTO `g_category` VALUES ('253', '翻译机', '173', 'fanyiji', null, null, '0', '1', null, '1', '1', '2020-07-09 12:00:05', null, '2020-07-09 12:00:05', null);

-- ----------------------------
-- Table structure for `g_categ_busi`
-- ----------------------------
DROP TABLE IF EXISTS `g_categ_busi`;
CREATE TABLE `g_categ_busi` (
  `CATY_BUSI_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `BUSINESS_ID` varchar(12) DEFAULT NULL COMMENT '店铺主键ID',
  `CATEGORY_ID` int(11) DEFAULT NULL COMMENT '商品分类主键ID',
  `PARENT_CATEG_ID` int(11) DEFAULT NULL COMMENT '父级分类ID',
  PRIMARY KEY (`CATY_BUSI_ID`),
  KEY `FK_BUSINESSID_C` (`BUSINESS_ID`) USING BTREE,
  KEY `FK_CATEGORYID_B` (`CATEGORY_ID`) USING BTREE,
  CONSTRAINT `g_categ_busi_ibfk_1` FOREIGN KEY (`BUSINESS_ID`) REFERENCES `g_business` (`BUSINESS_ID`),
  CONSTRAINT `g_categ_busi_ibfk_2` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `g_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺分类表';

-- ----------------------------
-- Records of g_categ_busi
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods`;
CREATE TABLE `g_goods` (
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品ID',
  `GOODS_SN` varchar(60) DEFAULT NULL COMMENT '商品的唯一货号',
  `GOODS_NAME` varchar(150) NOT NULL COMMENT '商品名称',
  `KEYWORDS` varchar(50) DEFAULT NULL COMMENT '商品关键字，放在商品页的关键字中，为搜索引擎收录用',
  `CATY_ID` varchar(12) DEFAULT NULL COMMENT '商品分类ID',
  `CATY_SN` varchar(20) DEFAULT NULL COMMENT '商品分类编码',
  `BUSINESS_ID` varchar(12) NOT NULL COMMENT '所属店铺ID',
  `EFFECTIVE_DATE` datetime DEFAULT NULL COMMENT '生产日期',
  `EXPIRY_DAYS` int(11) DEFAULT '0' COMMENT '有效期(天)',
  `GOODS_BRIEF` varchar(200) DEFAULT NULL COMMENT '商品的简短描述',
  `GOODS_DESC` text COMMENT '商品的详细描述',
  `MARKET_PRICE` int(11) DEFAULT NULL COMMENT '市场售价(分)',
  `DISCOUNT` int(11) DEFAULT '100' COMMENT '折扣',
  `SHOP_PRICE` int(11) DEFAULT NULL COMMENT '本店售价(分)',
  `PROMOTE_PRICE` int(11) DEFAULT NULL COMMENT '促销价格（分）',
  `PROMOTE_START_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '促销开始时间',
  `PROMOTE_END_DATE` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '促销结束时间',
  `COUPON_SN` varchar(12) DEFAULT NULL COMMENT '优惠券编号',
  `IS_ONSALE` tinyint(1) DEFAULT '1' COMMENT '是否开售 1是 0否',
  `SHIP_FEE` int(11) DEFAULT '0' COMMENT '快递费（分）',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '商品录入时间',
  `CREATE_BY` varchar(30) DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '商品更新时间',
  `UPDATE_BY` varchar(30) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of g_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_brand`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_brand`;
CREATE TABLE `g_goods_brand` (
  `BRAND_ID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `BRAND_NAME` varchar(60) NOT NULL COMMENT '品牌名称',
  `CATEGORY_ID` int(11) DEFAULT NULL COMMENT '品牌类别ID',
  `BRAND_LOGO` varchar(80) DEFAULT NULL COMMENT '上传的该品牌Logo图片',
  `BRAND_DESC` text COMMENT '品牌描述',
  `SITE_URL` varchar(255) DEFAULT NULL COMMENT '品牌的网址',
  `SORT_ORL` tinyint(4) DEFAULT NULL COMMENT '品牌在前台页面的显示顺序,数字越大越靠后',
  `IS_SHOW` tinyint(4) DEFAULT '1' COMMENT '该品牌是否显示;0否1显示',
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品品牌信息表';

-- ----------------------------
-- Records of g_goods_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_extends`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_extends`;
CREATE TABLE `g_goods_extends` (
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品ID',
  `EXTEND1` varchar(150) DEFAULT NULL COMMENT '扩展字段1',
  `EXTEND2` varchar(150) DEFAULT NULL COMMENT '扩展字段2',
  `EXTEND3` varchar(150) DEFAULT NULL COMMENT '扩展字段3',
  `EXTEND4` varchar(150) DEFAULT NULL COMMENT '扩展字段1',
  `EXTEND5` varchar(150) DEFAULT NULL COMMENT '扩展字段5',
  `EXTEND6` varchar(150) DEFAULT NULL COMMENT '扩展字段6',
  KEY `FK_GOODS_E` (`GOODS_ID`) USING BTREE,
  CONSTRAINT `g_goods_extends_ibfk_1` FOREIGN KEY (`GOODS_ID`) REFERENCES `g_goods` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性扩展表';

-- ----------------------------
-- Records of g_goods_extends
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_param`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_param`;
CREATE TABLE `g_goods_param` (
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品ID',
  `BRAND_ID` smallint(6) DEFAULT NULL COMMENT '品牌ID',
  `FOOD_TASTE` varchar(50) DEFAULT NULL COMMENT '食物的口味',
  `WEIGHT` float(10,0) DEFAULT NULL COMMENT '商品重量',
  `LENGTH` float(10,0) DEFAULT NULL COMMENT '商品长度',
  `SIZE` varchar(10) DEFAULT NULL COMMENT '尺码',
  `COLOR` varchar(10) DEFAULT NULL COMMENT '颜色',
  `PACKAGE` varchar(50) DEFAULT NULL COMMENT '包装',
  `STORAGE_TYPE` varchar(50) DEFAULT NULL COMMENT '储藏方式',
  `SOURCE_ADDR` varchar(50) DEFAULT NULL COMMENT '原料产地',
  `PRODUCE_ADDR` varchar(50) DEFAULT NULL COMMENT '产地',
  `INGREDIENTS` varchar(100) DEFAULT NULL COMMENT '配料、原料',
  `SPECS` varchar(10) DEFAULT NULL COMMENT '规格（g）',
  `PRO_STANDARD` varchar(20) DEFAULT NULL COMMENT '产品标准号',
  `PRO_LICENSE_NO` varchar(20) DEFAULT NULL COMMENT '生产许可证编号',
  `EAT_METHOD` varchar(50) DEFAULT NULL COMMENT '食用方法',
  `CLICK_COUNT` int(11) DEFAULT '0' COMMENT '商品的点击数',
  `IS_ALONESALE` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否能单独销售，1，是；0，否；如果不能单独销售，则只能作为某商品的配件或者赠品销售',
  `INTEGRAL` int(11) DEFAULT '0' COMMENT '购买该商品可以使用的积分数量',
  `IS_DELETE` tinyint(1) DEFAULT '0' COMMENT '是否已删除 0，否；1，已删除',
  `IS_BEST` tinyint(1) DEFAULT '0' COMMENT '是否精品 0，否；1，是',
  `IS_NEW` tinyint(1) DEFAULT '1' COMMENT '是否是新品 0否 1是',
  `IS_HOT` tinyint(1) DEFAULT '0' COMMENT '是否热销，0，否；1，是',
  `IS_PROMOTE` tinyint(1) DEFAULT '0' COMMENT '是否特价促销；0，否；1，是',
  `BONUS_TYPE_ID` int(11) DEFAULT NULL COMMENT '购买该商品所能领到的优惠券类型',
  `SELLER_NOTE` varchar(200) DEFAULT NULL COMMENT '商品的商家备注，仅商家可见',
  `GIVE_INTEGRAL` int(11) NOT NULL DEFAULT '-1' COMMENT '购买该商品时每笔成功交易赠送的积分数量',
  KEY `FK_GOODSID_P` (`GOODS_ID`) USING BTREE,
  CONSTRAINT `g_goods_param_ibfk_1` FOREIGN KEY (`GOODS_ID`) REFERENCES `g_goods` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格详情表';

-- ----------------------------
-- Records of g_goods_param
-- ----------------------------

-- ----------------------------
-- Table structure for `g_goods_report`
-- ----------------------------
DROP TABLE IF EXISTS `g_goods_report`;
CREATE TABLE `g_goods_report` (
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品主键ID',
  `MONTH_SALES` int(11) DEFAULT '0' COMMENT '月销量',
  `COUNT_SALES` int(11) DEFAULT '0' COMMENT '总销量',
  `COUNT_COMMS` int(11) DEFAULT '0' COMMENT '总评价数',
  `COMMEND_SCORE` int(11) DEFAULT '0' COMMENT '评分',
  PRIMARY KEY (`GOODS_ID`),
  CONSTRAINT `g_goods_report_ibfk_1` FOREIGN KEY (`GOODS_ID`) REFERENCES `g_goods` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品汇总报表';

-- ----------------------------
-- Records of g_goods_report
-- ----------------------------

-- ----------------------------
-- Table structure for `g_picture`
-- ----------------------------
DROP TABLE IF EXISTS `g_picture`;
CREATE TABLE `g_picture` (
  `PICTURE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图片主键ID',
  `GOODS_ID` varchar(12) DEFAULT NULL COMMENT '商品主键ID',
  `BUSINESS_ID` varchar(12) DEFAULT NULL COMMENT '商家主键ID',
  `PIC_DESC` text COMMENT '图片描述',
  `THUMB_IMG` varchar(150) DEFAULT NULL COMMENT '商品在前台显示的微缩图片，如在分类筛选时显示的小图片',
  `REAL_IMG` varchar(150) NOT NULL COMMENT '商品的实际大小图片，如进入该商品页时介绍商品属性所显示的大图片',
  `ORIGINAL_IMG` varchar(150) DEFAULT NULL COMMENT '商品的原始图片',
  `LINK_URL` varchar(150) DEFAULT NULL COMMENT '图片超链接地址',
  `WIDTH` varchar(20) DEFAULT NULL COMMENT '图片宽度',
  `HEIGHT` varchar(20) DEFAULT NULL COMMENT '图片高度',
  `SORT_ORL` int(11) DEFAULT NULL COMMENT '图片排序',
  `STATUS` tinyint(1) DEFAULT '1' COMMENT '图片状态 0无效 1有效',
  `IS_MASTER` tinyint(1) DEFAULT '0' COMMENT '是否为主图 0否 1是',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(30) DEFAULT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_BY` varchar(30) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`PICTURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品/店铺图片表';

-- ----------------------------
-- Records of g_picture
-- ----------------------------

-- ----------------------------
-- Table structure for `o_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `o_order_detail`;
CREATE TABLE `o_order_detail` (
  `ORDER_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情表ID',
  `ORDER_ID` int(11) NOT NULL COMMENT '订单表ID',
  `GOODS_ID` varchar(12) NOT NULL COMMENT '订单商品ID',
  `GOODS_NAME` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `GOODS_CNT` int(11) DEFAULT NULL COMMENT '购买商品数量',
  `GOODS_PRICE` int(11) DEFAULT NULL COMMENT '购买商品单价（分）',
  `AVERAGE_COST` int(11) DEFAULT NULL COMMENT '平均成本价格（分）',
  `WEIGHT` float DEFAULT NULL COMMENT '商品重量',
  `DISTRICT_MONEY` int(11) DEFAULT NULL COMMENT '优惠分摊金额（分）',
  `WHID` int(11) DEFAULT NULL COMMENT '仓库ID',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`ORDER_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of o_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `o_order_master`
-- ----------------------------
DROP TABLE IF EXISTS `o_order_master`;
CREATE TABLE `o_order_master` (
  `ORDER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `ORDER_SN` varchar(32) NOT NULL COMMENT '订单编号',
  `TRANSATION_NO` varchar(20) DEFAULT NULL COMMENT '交易流水号',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '客户ID',
  `PAY_TYPE` tinyint(1) DEFAULT NULL COMMENT '支付方式：1现金，2余额，3网银，4支付宝，5微信',
  `PAY_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间',
  `ORDER_MONEY` int(11) DEFAULT NULL COMMENT '订单金额（分）',
  `DISTRICT_MONEY` int(11) DEFAULT NULL COMMENT '优惠金额（分）',
  `PAY_MONEY` int(11) DEFAULT NULL COMMENT '支付金额（分）',
  `CREATE_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `RECEIVE_TIME` datetime DEFAULT NULL COMMENT '收货时间',
  `ORDER_STATUS` tinyint(4) DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已完成 3待退款 4已退款 5已关闭',
  `ORDER_POINT` int(11) DEFAULT NULL COMMENT '订单积分',
  `INVOICE_TITLE` varchar(100) DEFAULT NULL COMMENT '发票抬头',
  `INVOICE_NO` varchar(50) DEFAULT NULL COMMENT '发票单号',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of o_order_master
-- ----------------------------

-- ----------------------------
-- Table structure for `o_shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `o_shop_cart`;
CREATE TABLE `o_shop_cart` (
  `SHOP_CART_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `CUSTOMER_ID` varchar(12) NOT NULL COMMENT '消费者主键ID',
  `SESSION_ID` char(32) DEFAULT NULL COMMENT '如果该用户退出,该Session_id对应的购物车中所有记录都将被删除',
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品ID',
  `GOODS_SN` varchar(60) DEFAULT NULL COMMENT '商品的唯一货号',
  `GOODS_NAME` varchar(50) NOT NULL COMMENT '商品名称',
  `CART_TYPE` tinyint(1) DEFAULT '0' COMMENT '购物车商品类型;0普通;1团够;2拍卖;3夺宝奇兵',
  `GOODS_ATTR` text COMMENT '商品属性,JSON形式',
  `GOODS_AMOUNT` int(11) DEFAULT NULL COMMENT '加入购物车商品数量',
  `MARKET_PRICE` int(11) DEFAULT NULL COMMENT '市场价(分)',
  `SHOP_PRICE` int(11) DEFAULT NULL COMMENT '本店价(分)',
  `REAL_BUY_PRICE` int(11) NOT NULL COMMENT '实际购买价格(分)',
  `IS_OPEN_SALE` tinyint(1) DEFAULT '0' COMMENT '是否开售 1是 0否',
  `PARENT_GOODS_ID` varchar(12) DEFAULT NULL COMMENT '该商品的父商品ID,没有该值为0,有的话那该商品就是该id的配件',
  `IS_GIFT` smallint(6) DEFAULT NULL COMMENT '是否赠品 0否;1其他(参与活动的活动ID等)',
  `CAN_HANDLE` tinyint(1) DEFAULT '0' COMMENT '能否处理 0可以 1不可以',
  `ADD_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`SHOP_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of o_shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单名称',
  `URL` varchar(50) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` varchar(150) DEFAULT NULL COMMENT '授权(多个用逗号分隔)',
  `TYPE` int(11) DEFAULT NULL COMMENT '类型 0：目录 1：菜单 2：按钮',
  `ICON` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `ORDER_NUM` int(11) DEFAULT NULL COMMENT '排序',
  `ROUTER_NAME` varchar(50) DEFAULT NULL COMMENT '路由名称',
  `ROUTER_PATH` varchar(80) DEFAULT NULL COMMENT '路由路径',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10097 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '备注',
  `DEPT_NAME` varchar(30) DEFAULT NULL COMMENT '所属部门',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(20) NOT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_BY` varchar(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `RM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`RM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '后台用户主键ID',
  `USER_NAME` varchar(20) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(16) DEFAULT NULL COMMENT '密码',
  `REAL_NAME` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `SALT` varchar(20) DEFAULT NULL COMMENT '加密盐',
  `EMAIL` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(25) DEFAULT NULL COMMENT '手机号',
  `STATUS` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
  `DEPT_NAME` varchar(20) DEFAULT NULL COMMENT '所属部门',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATE_BY` varchar(20) NOT NULL COMMENT '创建者',
  `UPDATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `UPDATE_BY` varchar(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10539 DEFAULT CHARSET=utf8 COMMENT='后台管理系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'zhaoy', 'zhaoy0721', '燕子', 'zhaoy', null, '18105910331', '1', '教育中心', '2020-07-07 17:23:40', 'admin', '2020-07-07 17:23:40', 'admin');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `UR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`UR_ID`),
  KEY `IDX_USERID_ROLEID` (`USER_ID`,`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `w_goods`
-- ----------------------------
DROP TABLE IF EXISTS `w_goods`;
CREATE TABLE `w_goods` (
  `WP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
  `GOODS_ID` varchar(12) NOT NULL COMMENT '商品ID',
  `WH_ID` int(11) NOT NULL COMMENT '仓库ID',
  `CURRENT_CNT` int(11) DEFAULT '1' COMMENT '当前商品数量',
  `LOCK_CNT` int(11) DEFAULT '1' COMMENT '当前占用数量',
  `INTRANSIT_CNT` int(11) DEFAULT '0' COMMENT '在途数量',
  `AVERAGE_COST` int(11) DEFAULT '0' COMMENT '移动加权成本',
  `MODIFIED_TIME` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`WP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存表';

-- ----------------------------
-- Records of w_goods
-- ----------------------------
