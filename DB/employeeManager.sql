/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50732
Source Host           : localhost:3306
Source Database       : employeemanager

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2021-04-16 22:47:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `deptno` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `loc` varchar(50) DEFAULT NULL COMMENT '部门地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '学工部', '石家庄', '2021-04-13 14:20:19', '2021-04-13 14:20:19');
INSERT INTO `department` VALUES ('2', '后勤部', '石家庄', '2021-04-14 10:26:07', '2021-04-14 10:26:07');
INSERT INTO `department` VALUES ('3', '软件部', '石家庄', '2021-04-14 10:26:20', '2021-04-14 10:26:37');
INSERT INTO `department` VALUES ('4', '管理层', '保定', '2021-04-14 10:26:23', '2021-04-14 10:26:42');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empno` bigint(32) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `ename` varchar(50) DEFAULT NULL COMMENT '员工名称',
  `job` varchar(50) DEFAULT NULL COMMENT '工作',
  `hiredate` date DEFAULT NULL COMMENT '入职日期',
  `sal` decimal(7,2) DEFAULT NULL COMMENT '薪水',
  `comm` decimal(7,2) DEFAULT NULL COMMENT '奖金',
  `deptno` int(32) DEFAULT NULL COMMENT '所属部门，部门表外键',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '张三', '经理', '2021-04-01', '3000.00', '200.00', '1', '2021-04-13 14:23:44', '2021-04-15 22:28:57');
INSERT INTO `employee` VALUES ('2', '李四', '员工', '2021-04-02', '2000.00', '100.00', '2', '2021-04-14 10:22:00', '2021-04-14 10:22:00');
INSERT INTO `employee` VALUES ('3', '王五', '员工', '2021-04-02', '2000.00', null, '1', '2021-04-14 10:22:25', '2021-04-15 10:27:30');
INSERT INTO `employee` VALUES ('4', '关羽', '员工', '2021-04-02', '2000.00', null, '1', '2021-04-14 10:22:26', '2021-04-15 10:27:31');
INSERT INTO `employee` VALUES ('5', '张飞', '员工', '2021-04-02', '2000.00', null, '2', '2021-04-14 10:22:26', '2021-04-15 10:27:32');
INSERT INTO `employee` VALUES ('6', '董卓', '经理', '2021-04-02', '3000.00', '200.00', '1', '2021-04-14 10:22:27', '2021-04-16 19:04:51');
INSERT INTO `employee` VALUES ('7', '李娜', '经理', '2021-04-02', '3000.00', '200.00', '3', '2021-04-14 10:22:27', '2021-04-15 10:27:36');
INSERT INTO `employee` VALUES ('8', 'tom', '员工', '2021-04-14', '222.00', '222.00', '1', '2021-04-15 14:16:51', '2021-04-16 22:39:36');
INSERT INTO `employee` VALUES ('9', 'tom', '部长', '2021-04-14', '33333.00', '4444.00', '1', '2021-04-15 14:25:55', '2021-04-16 22:39:44');
INSERT INTO `employee` VALUES ('10', 'ww', '人事', '2021-04-15', '666.00', '666.00', '1', '2021-04-15 14:53:52', '2021-04-16 22:39:50');
