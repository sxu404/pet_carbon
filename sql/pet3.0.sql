/*
 Navicat Premium Dump SQL

 Source Server         : BiShe
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : pet

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 14/06/2026 21:18:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for animal
-- ----------------------------
DROP TABLE IF EXISTS `animal`;
CREATE TABLE `animal`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '动物ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动物名称/昵称',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '动物类型：猫咪、狗狗、鸟类等',
  `age` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '预估年龄',
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别：公、母、未知',
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毛色特征',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '发现地点',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详细描述',
  `personality` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性格特征',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像图片URL',
  `life_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '待审核' COMMENT '生命周期状态：待审核、已驳回、健康、治疗中、待领养、已领养、已回星',
  `health_status` tinyint NOT NULL DEFAULT 0 COMMENT '健康状态：0-健康、1-生病/待治疗、2-治疗中、3-已康复',
  `found_time` datetime NULL DEFAULT NULL COMMENT '发现时间',
  `submitter_id` bigint NULL DEFAULT NULL COMMENT '提交人ID（关联user表）',
  `submitter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提交人姓名（冗余字段）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_animal_type`(`type` ASC) USING BTREE,
  INDEX `idx_animal_life_status`(`life_status` ASC) USING BTREE,
  INDEX `idx_animal_health_status`(`health_status` ASC) USING BTREE,
  INDEX `idx_animal_submitter_id`(`submitter_id` ASC) USING BTREE,
  CONSTRAINT `fk_animal_submitter` FOREIGN KEY (`submitter_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '动物档案表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of animal
-- ----------------------------
INSERT INTO `animal` VALUES (1, '小橘', '猫咪', '2岁', '公', '橘色', '岳麓区望月湖社区', '一只可爱的橘猫，经常在社区公园活动，喜欢被居民抚摸', '活泼好动，喜欢和人互动', 'https://picsum.photos/200/200?random=1', '健康', 0, '2024-03-15 10:30:00', 2, '张三', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (2, '花花', '猫咪', '1岁半', '母', '黑白花色', '天心区坡子街附近', '黑白相间的小猫咪，性格温顺，经常在街边店铺附近休息', '温顺乖巧，喜欢安静', 'https://picsum.photos/200/200?random=2', '健康', 0, '2024-04-01 14:20:00', 3, '李四', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (3, '奶茶', '猫咪', '2岁半', '公', '奶茶色', '雨花区万家丽路', '奶茶色的猫咪，非常粘人，会跟着喜欢的人走一段路', '粘人可爱，喜欢跟随', 'https://picsum.photos/200/200?random=3', '健康', 0, '2024-03-28 11:00:00', 5, '小明', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (4, '小黑', '猫咪', '4岁', '公', '黑色', '岳麓区麓山南路', '黑色猫咪，性格比较独立，但熟悉后会主动蹭人', '神秘高冷，偶尔亲近', 'https://picsum.photos/200/200?random=4', '健康', 0, '2024-01-15 08:30:00', 6, '小红', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (5, '虎斑', '猫咪', '2岁', '公', '虎斑纹', '开福区伍家岭', '虎斑纹猫咪，性格活泼，喜欢追逐蝴蝶和小虫子', '机灵活泼，喜欢追逐', 'https://picsum.photos/200/200?random=5', '健康', 0, '2024-05-05 15:20:00', 7, '小刚', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (6, '橘子', '猫咪', '3岁', '公', '橘白色', '芙蓉区解放西路', '橘白相间的猫咪，性格友善，喜欢在商业街附近活动', '友善亲人，喜欢被抚摸', 'https://picsum.photos/200/200?random=6', '健康', 0, '2024-06-01 10:00:00', 8, '小丽', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (7, '小花', '猫咪', '2岁', '母', '三花色', '雨花区香樟路', '三花猫咪，性格温柔，经常在小区花园晒太阳', '温柔安静，喜欢晒太阳', 'https://picsum.photos/200/200?random=7', '健康', 0, '2024-05-20 14:30:00', 9, '小华', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (8, '小白', '猫咪', '3岁', '公', '白色', '芙蓉区五一广场', '纯白色的小猫，眼睛是漂亮的蓝色，喜欢在广场附近等待投喂', '优雅独立，偶尔撒娇', 'https://picsum.photos/200/200?random=8', '待领养', 0, '2024-02-20 09:15:00', 2, '张三', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (9, '雪球', '猫咪', '1岁', '母', '白色长毛', '天心区黄兴步行街', '长毛白猫，非常漂亮，经常成为游客拍照的对象', '优雅漂亮，喜欢被拍照', 'https://picsum.photos/200/200?random=9', '待领养', 0, '2024-04-22 13:30:00', 3, '李四', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (10, '咪咪', '猫咪', '1岁', '母', '灰色', '开福区湘江中路', '灰色小猫，比较胆小，需要慢慢接近才能建立信任', '胆小害羞，需要耐心', 'https://picsum.photos/200/200?random=10', '治疗中', 2, '2024-05-10 16:45:00', 4, '赵六', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (11, '小白狗', '狗狗', '1岁半', '母', '白色', '芙蓉区火车站附近', '白色小狗，性格温柔，喜欢安静地待在车站附近', '温柔安静，喜欢被抚摸', 'https://picsum.photos/200/200?random=11', '健康', 0, '2024-03-20 14:00:00', 5, '小明', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (12, '大黄', '狗狗', '5岁', '公', '黄褐色', '开福区湘江世纪城', '黄褐色的大狗，年纪较大，性格稳重，经常在小区活动', '稳重老成，守护社区', 'https://picsum.photos/200/200?random=12', '健康', 0, '2024-01-05 07:45:00', 6, '小红', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (13, '小黑狗', '狗狗', '2岁', '母', '黑色', '岳麓区咸嘉湖', '黑色小狗，比较警惕，需要多次接触才能建立信任', '警惕性强，需要熟悉', 'https://picsum.photos/200/200?random=13', '健康', 0, '2024-04-08 11:20:00', 7, '小刚', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (14, '毛毛', '狗狗', '3岁', '公', '长毛棕色', '天心区侯家塘', '长毛棕色狗狗，毛发蓬松可爱，喜欢被梳理毛发', '毛发蓬松，喜欢被梳理', 'https://picsum.photos/200/200?random=14', '健康', 0, '2024-03-12 10:45:00', 8, '小丽', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (15, '欢欢', '狗狗', '2岁半', '公', '金黄色', '芙蓉区马王堆', '金黄色狗狗，性格开朗，喜欢和小朋友玩耍', '开朗活泼，喜欢玩耍', 'https://picsum.photos/200/200?random=15', '健康', 0, '2024-06-05 09:20:00', 9, '小华', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (16, '阿宝', '狗狗', '4岁', '公', '黑棕色', '雨花区高桥大市场', '黑棕色狗狗，性格沉稳，喜欢守护熟悉的区域', '沉稳可靠，喜欢守护', 'https://picsum.photos/200/200?random=16', '健康', 0, '2024-04-25 12:30:00', 10, '小强', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (17, '豆豆', '狗狗', '1岁', '公', '黑白斑点', '雨花区红星大市场', '黑白斑点的小狗，非常活泼，喜欢在市场附近奔跑玩耍', '活泼好动，喜欢奔跑', 'https://picsum.photos/200/200?random=17', '待领养', 0, '2024-05-15 16:30:00', 10, '小强', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (18, '乐乐', '狗狗', '1岁', '母', '浅黄色', '开福区四方坪', '浅黄色小狗，性格友善，很容易和陌生人亲近', '友善温和，容易亲近', 'https://picsum.photos/200/200?random=18', '待领养', 0, '2024-05-28 15:00:00', 5, '小明', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (19, '小黄', '狗狗', '3岁', '公', '黄色', '岳麓区梅溪湖公园', '黄色的小狗，非常热情，见到人就会摇尾巴表示欢迎', '热情友好，喜欢摇尾巴', 'https://picsum.photos/200/200?random=19', '治疗中', 2, '2024-04-18 10:00:00', 4, '赵六', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (20, '旺财', '狗狗', '2岁', '公', '棕色', '天心区南门口', '棕色小狗，非常忠诚，会陪伴投喂的人走一段路', '忠诚可靠，喜欢陪伴', 'https://picsum.photos/200/200?random=20', '已领养', 0, '2024-02-10 09:30:00', 2, '张三', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (21, '流浪猫A', '猫咪', '未知', '未知', '杂色', '岳麓区金星大道', '新发现的流浪猫，正在等待志愿者审核确认', '待观察', 'https://picsum.photos/200/200?random=21', '待审核', 0, '2024-06-10 09:00:00', 6, '小红', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (22, '流浪狗B', '狗狗', '未知', '未知', '灰色', '天心区书院路', '新发现的流浪狗，正在等待管理员审核确认', '待观察', 'https://picsum.photos/200/200?random=22', '待审核', 0, '2024-06-11 14:30:00', 7, '小刚', '2026-06-12 23:39:43', '2026-06-12 23:39:43');
INSERT INTO `animal` VALUES (23, '受伤猫咪', '猫咪', '未知', '未知', '白色', '芙蓉区八一路', '发现时腿部有伤，需要紧急救助治疗', '需要救助', 'https://picsum.photos/200/200?random=23', '待审核', 1, '2024-06-12 08:45:00', 8, '小丽', '2026-06-12 23:39:43', '2026-06-12 23:39:43');

-- ----------------------------
-- Table structure for feed_point
-- ----------------------------
DROP TABLE IF EXISTS `feed_point`;
CREATE TABLE `feed_point`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '投喂点ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投喂点名称',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详细位置（长沙具体地点）',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '投喂点描述',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '投喂点图片URL',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'normal' COMMENT '状态：normal（正常使用）、maintain（维护中）、closed（已关闭）',
  `apply_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending' COMMENT '审批状态：pending（待审批）、approve（已批准）、reject（已驳回）',
  `show_to_student` tinyint NOT NULL DEFAULT 0 COMMENT '是否展示给学生：0-不展示，1-展示',
  `animal_count` int NULL DEFAULT 0 COMMENT '该投喂点动物数量',
  `today_feed_count` int NULL DEFAULT 0 COMMENT '今日投喂次数',
  `latitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度（地图坐标）',
  `longitude` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度（地图坐标）',
  `submitter_id` bigint NULL DEFAULT NULL COMMENT '提交人ID（关联user表）',
  `submitter_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提交人姓名（冗余字段）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_feed_point_status`(`status` ASC) USING BTREE,
  INDEX `idx_feed_point_apply_status`(`apply_status` ASC) USING BTREE,
  INDEX `idx_feed_point_submitter_id`(`submitter_id` ASC) USING BTREE,
  CONSTRAINT `fk_feed_point_submitter` FOREIGN KEY (`submitter_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '投喂点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feed_point
-- ----------------------------
INSERT INTO `feed_point` VALUES (1, '岳麓区望月湖社区投喂点', '岳麓区望月湖社区公园北侧', '社区公园内的固定投喂点，有遮雨棚和喂食台', 'https://picsum.photos/200/200?random=fp1', 'normal', 'approve', 1, 3, 5, 28.2357000, 112.9389000, 2, '张三', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (2, '岳麓区麓山南路投喂点', '岳麓区麓山南路湖南大学附近', '大学城区域，学生常来投喂，有固定喂食区域', 'https://picsum.photos/200/200?random=fp2', 'normal', 'approve', 1, 5, 8, 28.1857000, 112.9456000, 3, '李四', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (3, '岳麓区咸嘉湖投喂点', '岳麓区咸嘉湖公园内', '公园湖边，环境优美，适合流浪动物栖息', 'https://picsum.photos/200/200?random=fp3', 'normal', 'approve', 1, 2, 3, 28.2156000, 112.9234000, 5, '小明', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (4, '岳麓区金星大道投喂点', '岳麓区金星大道与桐梓坡路交叉口', '商业区附近的隐蔽投喂点', 'https://picsum.photos/200/200?random=fp4', 'maintain', 'approve', 1, 1, 2, 28.2456000, 112.9567000, 6, '小红', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (5, '岳麓区梅溪湖公园投喂点', '岳麓区梅溪湖公园东侧', '梅溪湖公园内，风景优美，有多个投喂区域', 'https://picsum.photos/200/200?random=fp5', 'normal', 'approve', 1, 4, 6, 28.3123000, 112.8834000, 4, '赵六', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (6, '岳麓区银盆岭投喂点', '岳麓区银盆岭大桥下', '大桥下的隐蔽区域，适合流浪动物休息', 'https://picsum.photos/200/200?random=fp6', 'normal', 'approve', 1, 2, 4, 28.1987000, 112.9345000, 7, '小刚', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (7, '芙蓉区五一广场投喂点', '芙蓉区五一广场商业街附近', '商业区人流密集，有固定投喂志愿者', 'https://picsum.photos/200/200?random=fp7', 'normal', 'approve', 1, 6, 10, 28.1982000, 112.9889000, 2, '张三', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (8, '芙蓉区火车站投喂点', '芙蓉区长沙火车站广场西侧', '火车站附近，有爱心人士定期投喂', 'https://picsum.photos/200/200?random=fp8', 'normal', 'approve', 1, 3, 5, 28.1892000, 113.0234000, 5, '小明', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (9, '芙蓉区解放西路投喂点', '芙蓉区解放西路步行街', '步行街内，游客和居民常来投喂', 'https://picsum.photos/200/200?random=fp9', 'normal', 'approve', 1, 4, 7, 28.1934000, 112.9756000, 8, '小丽', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (10, '芙蓉区马王堆投喂点', '芙蓉区马王堆医院附近', '医院附近的安静区域，适合流浪动物', 'https://picsum.photos/200/200?random=fp10', 'normal', 'approve', 1, 2, 3, 28.2123000, 113.0123000, 9, '小华', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (11, '天心区坡子街投喂点', '天心区坡子街美食广场附近', '美食街附近，有固定投喂区域', 'https://picsum.photos/200/200?random=fp11', 'normal', 'approve', 1, 5, 8, 28.1912000, 112.9823000, 3, '李四', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (12, '天心区黄兴步行街投喂点', '天心区黄兴南路步行街', '步行街中心区域，人流密集', 'https://picsum.photos/200/200?random=fp12', 'normal', 'approve', 1, 7, 12, 28.1923000, 112.9765000, 6, '小红', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (13, '天心区南门口投喂点', '天心区南门口老街', '老街区域，有传统投喂习惯', 'https://picsum.photos/200/200?random=fp13', 'normal', 'approve', 1, 3, 5, 28.1856000, 112.9678000, 7, '小刚', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (14, '天心区侯家塘投喂点', '天心区侯家塘社区', '社区内的固定投喂点', 'https://picsum.photos/200/200?random=fp14', 'normal', 'approve', 1, 2, 4, 28.1678000, 112.9890000, 8, '小丽', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (15, '天心区书院路投喂点', '天心区书院路住宅区', '住宅区内的安静投喂点', 'https://picsum.photos/200/200?random=fp15', 'maintain', 'approve', 1, 1, 2, 28.1789000, 112.9567000, 10, '小强', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (16, '开福区湘江世纪城投喂点', '开福区湘江世纪城小区内', '大型社区内的固定投喂区域', 'https://picsum.photos/200/200?random=fp16', 'normal', 'approve', 1, 4, 6, 28.2567000, 112.9876000, 6, '小红', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (17, '开福区伍家岭投喂点', '开福区伍家岭商圈', '商圈附近的投喂点', 'https://picsum.photos/200/200?random=fp17', 'normal', 'approve', 1, 3, 5, 28.2345000, 112.9654000, 7, '小刚', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (18, '开福区湘江中路投喂点', '开福区湘江中路江边', '江边公园，环境优美', 'https://picsum.photos/200/200?random=fp18', 'normal', 'approve', 1, 2, 3, 28.2456000, 112.9432000, 8, '小丽', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (19, '开福区四方坪投喂点', '开福区四方坪市场附近', '市场附近的固定投喂点', 'https://picsum.photos/200/200?random=fp19', 'normal', 'approve', 1, 5, 7, 28.2234000, 112.9234000, 9, '小华', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (20, '开福区东风路投喂点', '开福区东风路街道', '街道内的社区投喂点', 'https://picsum.photos/200/200?random=fp20', 'normal', 'approve', 1, 2, 4, 28.2123000, 112.9123000, 10, '小强', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (21, '雨花区高桥大市场投喂点', '雨花区高桥大市场内', '大型市场内的固定投喂区域', 'https://picsum.photos/200/200?random=fp21', 'normal', 'approve', 1, 6, 9, 28.1789000, 113.0234000, 9, '小华', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (22, '雨花区万家丽路投喂点', '雨花区万家丽路商业街', '商业街附近的投喂点', 'https://picsum.photos/200/200?random=fp22', 'normal', 'approve', 1, 4, 6, 28.1678000, 113.0123000, 10, '小强', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (23, '雨花区香樟路投喂点', '雨花区香樟路住宅区', '住宅区内的安静投喂点', 'https://picsum.photos/200/200?random=fp23', 'normal', 'approve', 1, 3, 5, 28.1567000, 113.0012000, 5, '小明', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (24, '雨花区红星大市场投喂点', '雨花区红星大市场附近', '市场附近的固定投喂点', 'https://picsum.photos/200/200?random=fp24', 'normal', 'approve', 1, 5, 8, 28.1456000, 112.9890000, 6, '小红', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (25, '雨花区韶山南路投喂点', '雨花区韶山南路街道', '街道内的社区投喂点', 'https://picsum.photos/200/200?random=fp25', 'maintain', 'approve', 1, 2, 3, 28.1345000, 112.9789000, 7, '小刚', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (26, '岳麓区大学城新投喂点', '岳麓区中南大学附近', '新申请的投喂点，等待审批', 'https://picsum.photos/200/200?random=fp26', 'normal', 'pending', 0, 0, 0, 28.1567000, 112.9345000, 5, '小明', '2026-06-14 21:00:52', '2026-06-14 21:00:52');
INSERT INTO `feed_point` VALUES (27, '芙蓉区新商业区投喂点', '芙蓉区新商业中心', '新商业区的投喂点申请', 'https://picsum.photos/200/200?random=fp27', 'normal', 'pending', 0, 0, 0, 28.1892000, 112.9654000, 6, '小红', '2026-06-14 21:00:52', '2026-06-14 21:00:52');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名（登录账号）',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码（加密存储）',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user' COMMENT '角色：admin（管理员）、volunteer（志愿者）、user（普通用户）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像URL',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `lastLoginTime` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `lastLoginIp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系地址',
  `wechat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号',
  `isVolunteerApproved` tinyint NULL DEFAULT 0 COMMENT '志愿者是否审核通过（仅志愿者角色有效）：0-待审核，1-已通过，2-已拒绝',
  `volunteerApplyTime` datetime NULL DEFAULT NULL COMMENT '志愿者申请时间',
  `volunteerReason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '申请志愿者理由',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  INDEX `idx_user_username`(`username` ASC) USING BTREE,
  INDEX `idx_user_role`(`role` ASC) USING BTREE,
  INDEX `idx_user_status`(`status` ASC) USING BTREE,
  INDEX `idx_user_phone`(`phone` ASC) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '管理员', '13800138000', 'admin@example.com', 'admin', 'https://api.dicebear.com/7.x/avataaars/svg?seed=admin', 1, '2024-01-01 08:00:00', '2026-06-14 20:42:27', '2024-06-12 10:30:00', '192.168.1.100', '长沙市岳麓区', 'admin_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, 'volunteer1', '123456', '张三', '13800138001', 'zhangsan@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhangsan', 1, '2024-01-10 09:00:00', '2026-06-14 20:48:31', '2024-06-11 15:45:00', '192.168.1.101', '长沙市芙蓉区', 'zhangsan_wx', 1, '2024-01-10 09:00:00', '热爱动物，有多年救助经验');
INSERT INTO `user` VALUES (3, 'volunteer2', '123456', '李四', '13800138002', 'lisi@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lisi', 1, '2024-02-15 14:00:00', '2026-06-14 20:50:08', '2024-06-10 09:20:00', '192.168.1.102', '长沙市天心区', 'lisi_wx', 1, '2024-02-15 14:00:00', '动物医学专业毕业，希望帮助更多流浪动物');
INSERT INTO `user` VALUES (4, 'volunteer3', '123456', '王五', '13800138003', 'wangwu@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wangwu', 1, '2024-03-01 10:00:00', '2026-06-14 20:50:08', '2024-06-09 14:30:00', '192.168.1.103', '长沙市开福区', 'wangwu_wx', 0, '2024-03-01 10:00:00', '喜欢小动物，想贡献自己的力量');
INSERT INTO `user` VALUES (5, 'volunteer4', '123456', '赵六', '13800138004', 'zhaoliu@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhaoliu', 1, '2024-04-10 11:00:00', '2026-06-14 20:50:08', '2024-06-08 16:15:00', '192.168.1.104', '长沙市雨花区', 'zhaoliu_wx', 1, '2024-04-10 11:00:00', '有爱心，愿意参与动物救助工作');
INSERT INTO `user` VALUES (6, 'user1', '123456', '小明', '13800138005', 'xiaoming@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaoming', 1, '2024-01-15 08:30:00', '2026-06-14 20:50:08', '2024-06-12 08:00:00', '192.168.1.105', '长沙市岳麓区', 'xiaoming_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 'user2', '123456', '小红', '13800138006', 'xiaohong@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaohong', 1, '2024-02-20 10:00:00', '2026-06-14 20:50:08', '2024-06-11 12:30:00', '192.168.1.106', '长沙市芙蓉区', 'xiaohong_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (8, 'user3', '123456', '小刚', '13800138007', 'xiaogang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaogang', 1, '2024-03-05 14:00:00', '2026-06-14 20:50:08', '2024-06-10 10:15:00', '192.168.1.107', '长沙市天心区', 'xiaogang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (9, 'user4', '123456', '小丽', '13800138008', 'xiaoli@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaoli', 1, '2024-04-10 09:00:00', '2026-06-14 20:50:08', '2024-06-09 15:00:00', '192.168.1.108', '长沙市开福区', 'xiaoli_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (10, 'user5', '123456', '小华', '13800138009', 'xiaohua@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaohua', 1, '2024-05-01 11:00:00', '2026-06-14 20:50:08', '2024-06-08 09:45:00', '192.168.1.109', '长沙市雨花区', 'xiaohua_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (11, 'user6', '123456', '小强', '13800138010', 'xiaoqiang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiaoqiang', 1, '2024-05-15 16:00:00', '2026-06-14 20:50:08', '2024-06-07 14:20:00', '192.168.1.110', '长沙市岳麓区', 'xiaoqiang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (12, 'volunteer5', '123456', '刘芳', '13800138011', 'liufang@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=liufang', 1, '2024-05-01 09:00:00', '2026-06-14 20:50:08', '2024-06-11 11:30:00', '192.168.1.111', '长沙市岳麓区麓谷', 'liufang_wx', 1, '2024-05-01 09:00:00', '热爱动物保护事业');
INSERT INTO `user` VALUES (13, 'volunteer6', '123456', '陈明', '13800138012', 'chenming@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=chenming', 1, '2024-05-05 10:00:00', '2026-06-14 20:50:08', '2024-06-10 15:45:00', '192.168.1.112', '长沙市芙蓉区五一广场', 'chenming_wx', 1, '2024-05-05 10:00:00', '有救助流浪动物经验');
INSERT INTO `user` VALUES (14, 'volunteer7', '123456', '赵丽', '13800138013', 'zhaoli@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhaoli', 1, '2024-05-10 11:00:00', '2026-06-14 20:50:08', '2024-06-09 16:20:00', '192.168.1.113', '长沙市天心区书院路', 'zhaoli_wx', 1, '2024-05-10 11:00:00', '希望帮助更多流浪动物');
INSERT INTO `user` VALUES (15, 'volunteer8', '123456', '孙伟', '13800138014', 'sunwei@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=sunwei', 1, '2024-05-15 08:00:00', '2026-06-14 20:50:08', '2024-06-08 09:30:00', '192.168.1.114', '长沙市开福区四方坪', 'sunwei_wx', 0, '2024-05-15 08:00:00', '动物爱好者，愿意奉献时间');
INSERT INTO `user` VALUES (16, 'volunteer9', '123456', '周婷', '13800138015', 'zhouting@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhouting', 1, '2024-05-20 14:00:00', '2026-06-14 20:50:08', '2024-06-07 14:15:00', '192.168.1.115', '长沙市雨花区高桥', 'zhouting_wx', 1, '2024-05-20 14:00:00', '喜欢小动物，想参与救助');
INSERT INTO `user` VALUES (17, 'volunteer10', '123456', '吴强', '13800138016', 'wuqiang@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wuqiang', 1, '2024-05-25 09:00:00', '2026-06-14 20:50:08', '2024-06-06 11:00:00', '192.168.1.116', '长沙市岳麓区大学城', 'wuqiang_wx', 1, '2024-05-25 09:00:00', '热爱公益事业');
INSERT INTO `user` VALUES (18, 'volunteer11', '123456', '郑琳', '13800138017', 'zhenglin@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhenglin', 1, '2024-05-30 10:00:00', '2026-06-14 20:50:08', '2024-06-05 17:30:00', '192.168.1.117', '长沙市芙蓉区马王堆', 'zhenglin_wx', 0, '2024-05-30 10:00:00', '希望成为志愿者帮助动物');
INSERT INTO `user` VALUES (19, 'volunteer12', '123456', '黄勇', '13800138018', 'huangyong@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=huangyong', 1, '2024-06-01 11:00:00', '2026-06-14 20:50:08', '2024-06-04 10:20:00', '192.168.1.118', '长沙市天心区侯家塘', 'huangyong_wx', 1, '2024-06-01 11:00:00', '有爱心，愿意付出');
INSERT INTO `user` VALUES (20, 'volunteer13', '123456', '林涛', '13800138019', 'lintao@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lintao', 1, '2024-06-05 08:30:00', '2026-06-14 20:50:08', '2024-06-03 15:00:00', '192.168.1.119', '长沙市开福区湘江世纪城', 'lintao_wx', 1, '2024-06-05 08:30:00', '动物保护志愿者');
INSERT INTO `user` VALUES (21, 'volunteer14', '123456', '何敏', '13800138020', 'hemin@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=hemin', 1, '2024-06-08 09:00:00', '2026-06-14 20:50:08', '2024-06-02 12:45:00', '192.168.1.120', '长沙市雨花区香樟路', 'hemin_wx', 0, '2024-06-08 09:00:00', '想参与动物救助工作');
INSERT INTO `user` VALUES (22, 'volunteer15', '123456', '罗婷', '13800138021', 'luoting@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=luoting', 1, '2024-06-10 10:00:00', '2026-06-14 20:50:08', '2024-06-01 16:30:00', '192.168.1.121', '长沙市岳麓区金星大道', 'luoting_wx', 1, '2024-06-10 10:00:00', '关爱流浪动物');
INSERT INTO `user` VALUES (23, 'volunteer16', '123456', '谢刚', '13800138022', 'xiegang@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiegang', 1, '2024-06-11 08:00:00', '2026-06-14 20:50:08', '2024-06-12 08:30:00', '192.168.1.122', '长沙市芙蓉区解放西路', 'xiegang_wx', 1, '2024-06-11 08:00:00', '愿意帮助流浪动物');
INSERT INTO `user` VALUES (24, 'volunteer17', '123456', '唐娜', '13800138023', 'tangna@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=tangna', 1, '2024-06-12 09:00:00', '2026-06-14 20:50:08', '2024-06-12 09:30:00', '192.168.1.123', '长沙市天心区南门口', 'tangna_wx', 0, '2024-06-12 09:00:00', '申请成为志愿者');
INSERT INTO `user` VALUES (25, 'volunteer18', '123456', '韩雪', '13800138024', 'hanxue@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=hanxue', 1, '2024-06-05 14:00:00', '2026-06-14 20:50:08', '2024-06-09 14:00:00', '192.168.1.124', '长沙市开福区伍家岭', 'hanxue_wx', 1, '2024-06-05 14:00:00', '热爱动物保护');
INSERT INTO `user` VALUES (26, 'volunteer19', '123456', '曹鹏', '13800138025', 'caopeng@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=caopeng', 1, '2024-06-08 16:00:00', '2026-06-14 20:50:08', '2024-06-10 16:30:00', '192.168.1.125', '长沙市雨花区红星', 'caopeng_wx', 1, '2024-06-08 16:00:00', '有宠物护理经验');
INSERT INTO `user` VALUES (27, 'volunteer20', '123456', '许丽', '13800138026', 'xuli@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xuli', 1, '2024-06-10 11:00:00', '2026-06-14 20:50:08', '2024-06-11 10:00:00', '192.168.1.126', '长沙市岳麓区梅溪湖', 'xuli_wx', 0, '2024-06-10 11:00:00', '希望加入志愿者队伍');
INSERT INTO `user` VALUES (28, 'volunteer21', '123456', '邓磊', '13800138027', 'denglei@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=denglei', 1, '2024-06-11 14:00:00', '2026-06-14 20:50:08', '2024-06-11 15:30:00', '192.168.1.127', '长沙市芙蓉区火车站', 'denglei_wx', 1, '2024-06-11 14:00:00', '喜欢帮助流浪动物');
INSERT INTO `user` VALUES (29, 'volunteer22', '123456', '彭燕', '13800138028', 'pengyan@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=pengyan', 1, '2024-06-12 08:00:00', '2026-06-14 20:50:08', '2024-06-12 08:30:00', '192.168.1.128', '长沙市天心区坡子街', 'pengyan_wx', 1, '2024-06-12 08:00:00', '爱护小动物');
INSERT INTO `user` VALUES (30, 'volunteer23', '123456', '曾敏', '13800138029', 'zengmin@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zengmin', 1, '2024-06-05 09:00:00', '2026-06-14 20:50:08', '2024-06-08 09:45:00', '192.168.1.129', '长沙市开福区湘江中路', 'zengmin_wx', 0, '2024-06-05 09:00:00', '申请志愿者');
INSERT INTO `user` VALUES (31, 'volunteer24', '123456', '蒋华', '13800138030', 'jianghua@example.com', 'volunteer', 'https://api.dicebear.com/7.x/avataaars/svg?seed=jianghua', 1, '2024-06-08 10:00:00', '2026-06-14 20:50:08', '2024-06-09 14:00:00', '192.168.1.130', '长沙市雨花区万家丽', 'jianghua_wx', 1, '2024-06-08 10:00:00', '参与流浪动物救助');
INSERT INTO `user` VALUES (32, 'user7', '123456', '周明', '13800138031', 'zhouming@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhouming', 1, '2024-05-10 10:00:00', '2026-06-14 20:50:08', '2024-06-11 09:00:00', '192.168.1.131', '长沙市岳麓区望城坡', 'zhouming_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (33, 'user8', '123456', '吴芳', '13800138032', 'wufang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=wufang', 1, '2024-05-15 11:00:00', '2026-06-14 20:50:08', '2024-06-10 14:30:00', '192.168.1.132', '长沙市芙蓉区东塘', 'wufang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (34, 'user9', '123456', '郑伟', '13800138033', 'zhengwei@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhengwei', 1, '2024-05-20 09:00:00', '2026-06-14 20:50:08', '2024-06-09 16:00:00', '192.168.1.133', '长沙市天心区新开铺', 'zhengwei_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (35, 'user10', '123456', '黄丽', '13800138034', 'huangli@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=huangli', 1, '2024-05-25 14:00:00', '2026-06-14 20:50:08', '2024-06-08 11:30:00', '192.168.1.134', '长沙市开福区伍家岭', 'huangli_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (36, 'user11', '123456', '林涛', '13800138035', 'lintao_user@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lintao_user', 1, '2024-05-30 10:00:00', '2026-06-14 20:50:08', '2024-06-07 13:00:00', '192.168.1.135', '长沙市雨花区井湾子', 'lintao_user_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (37, 'user12', '123456', '何欣', '13800138036', 'hexin@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=hexin', 1, '2024-06-01 09:00:00', '2026-06-14 20:50:08', '2024-06-06 10:45:00', '192.168.1.136', '长沙市岳麓区麓山南路', 'hexin_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (38, 'user13', '123456', '罗涛', '13800138037', 'luotao@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=luotao', 1, '2024-06-05 11:00:00', '2026-06-14 20:50:08', '2024-06-05 15:00:00', '192.168.1.137', '长沙市芙蓉区解放东路', 'luotao_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (39, 'user14', '123456', '谢敏', '13800138038', 'xiemin@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xiemin', 1, '2024-06-08 08:00:00', '2026-06-14 20:50:08', '2024-06-04 14:30:00', '192.168.1.138', '长沙市天心区黄兴南路', 'xiemin_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (40, 'user15', '123456', '唐杰', '13800138039', 'tangjie@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=tangjie', 1, '2024-06-10 10:00:00', '2026-06-14 20:50:08', '2024-06-03 12:00:00', '192.168.1.139', '长沙市开福区东风路', 'tangjie_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (41, 'user16', '123456', '韩芳', '13800138040', 'hanfang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=hanfang', 1, '2024-06-11 09:00:00', '2026-06-14 20:50:08', '2024-06-02 16:00:00', '192.168.1.140', '长沙市雨花区劳动路', 'hanfang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (42, 'user17', '123456', '曹丽', '13800138041', 'caoli@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=caoli', 1, '2024-06-12 08:00:00', '2026-06-14 20:50:08', '2024-06-01 10:30:00', '192.168.1.141', '长沙市岳麓区银盆岭', 'caoli_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (43, 'user18', '123456', '许强', '13800138042', 'xuqiang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=xuqiang', 1, '2024-05-15 14:00:00', '2026-06-14 20:50:08', '2024-05-30 15:00:00', '192.168.1.142', '长沙市芙蓉区朝阳路', 'xuqiang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (44, 'user19', '123456', '邓萍', '13800138043', 'dengping@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=dengping', 1, '2024-05-20 10:00:00', '2026-06-14 20:50:08', '2024-05-28 11:00:00', '192.168.1.143', '长沙市天心区友谊路', 'dengping_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (45, 'user20', '123456', '彭伟', '13800138044', 'pengwei@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=pengwei', 1, '2024-05-25 09:00:00', '2026-06-14 20:50:08', '2024-05-26 10:00:00', '192.168.1.144', '长沙市开福区三一大道', 'pengwei_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (46, 'user21', '123456', '曾丽', '13800138045', 'zengli@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zengli', 1, '2024-05-30 14:00:00', '2026-06-14 20:50:08', '2024-06-01 09:00:00', '192.168.1.145', '长沙市雨花区湘府路', 'zengli_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (47, 'user22', '123456', '蒋敏', '13800138046', 'jiangmin@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=jiangmin', 1, '2024-06-01 11:00:00', '2026-06-14 20:50:08', '2024-06-02 14:00:00', '192.168.1.146', '长沙市岳麓区桐梓坡', 'jiangmin_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (48, 'user23', '123456', '杨军', '13800138047', 'yangjun@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=yangjun', 1, '2024-06-05 08:30:00', '2026-06-14 20:50:08', '2024-06-03 10:00:00', '192.168.1.147', '长沙市芙蓉区五一大道', 'yangjun_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (49, 'user24', '123456', '朱婷', '13800138048', 'zhuting@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=zhuting', 1, '2024-06-08 10:00:00', '2026-06-14 20:50:08', '2024-06-04 15:30:00', '192.168.1.148', '长沙市天心区劳动西路', 'zhuting_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (50, 'user25', '123456', '吕芳', '13800138049', 'lfang@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=lfang', 1, '2024-06-10 11:00:00', '2026-06-14 20:50:08', '2024-06-05 09:00:00', '192.168.1.149', '长沙市开福区芙蓉北路', 'lfang_wx', NULL, NULL, NULL);
INSERT INTO `user` VALUES (51, 'user26', '123456', '冯丽', '13800138050', 'fengli@example.com', 'user', 'https://api.dicebear.com/7.x/avataaars/svg?seed=fengli', 1, '2024-06-11 10:00:00', '2026-06-14 20:50:08', '2024-06-06 11:30:00', '192.168.1.150', '长沙市雨花区韶山南路', 'fengli_wx', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
