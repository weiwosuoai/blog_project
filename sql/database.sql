--                           Exception 数据表
-- 数据库规范说明 TODO
-- SQL 语句规范说明 TODO
--
--
--
--
--
--
--
--
--
--
--

-- 用户表 Create on 2017-03-14 by Allen.
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
  id          INT(10)      NOT NULL AUTO_INCREMENT,
  name        VARCHAR(100) NOT NULL COMMENT '用户名',
  password    VARCHAR(100) NOT NULL COMMENT '密码',
  create_time TIMESTAMP    NOT NULL DEFAULT NOW(),
  update_time TIMESTAMP    NOT NULL DEFAULT NOW(),
  remark      VARCHAR(500) COMMENT '备注',
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 文章表 Create on 2017-03-14 by Allen.
DROP TABLE IF EXISTS t_article;
CREATE TABLE t_article (
  id          INT          NOT NULL AUTO_INCREMENT,
  title       VARCHAR(500) NOT NULL COMMENT '文章标题',
  file_name   VARCHAR(500) NOT NULL COMMENT '文章原始文件名称',
  file_path   VARCHAR(500) NOT NULL COMMENT '文章存储路径',
  create_time TIMESTAMP    NOT NULL DEFAULT NOW(),
  update_time TIMESTAMP    NOT NULL,
  remark      VARCHAR(500),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 文章表中添加文章创建者字段 Create on 2017-03-18 by Allen.
ALTER TABLE t_article ADD create_user_id INT NOT NULL COMMENT '创建者id';

-- 文章表中添加文章被浏览数字段 Create on 2017-03-28 by Allen.
ALTER TABLE t_article ADD be_viewd_num INT NOT NULL DEFAULT 1 COMMENT '被浏览次数';

-- 文章表中添加标签字段 Create on 2017-05-15 by Allen.
ALTER TABLE t_article ADD content TEXT NOT NULL COMMENT '文章内容';

-- 删除 file_path,file_name,tag_ids,category 字段
ALTER TABLE t_article DROP COLUMN file_path;
ALTER TABLE t_article DROP COLUMN file_name;
ALTER TABLE t_article DROP COLUMN tag_ids;
ALTER TABLE t_article DROP COLUMN category;

-- 分类表 Create on 2017-03-30 by Allen.
DROP TABLE IF EXISTS t_category;
CREATE TABLE t_category (
  id             INT          NOT NULL AUTO_INCREMENT,
  name           VARCHAR(500) NOT NULL COMMENT '分类名称',
  create_time    TIMESTAMP    NOT NULL DEFAULT NOW(),
  update_time    TIMESTAMP    NOT NULL DEFAULT NOW(),
  create_user_id INT          NOT NULL COMMENT '创建者id',
  remark         VARCHAR(500),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 文章分类映射表 Create on 2017-05-14 by Allen.
DROP TABLE IF EXISTS t_article_category_mapper;
CREATE TABLE t_article_category_mapper (
  id             INT          NOT NULL AUTO_INCREMENT,
  article_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 文章标签映射表 Create on 2017-05-14 by Allen.
DROP TABLE IF EXISTS t_article_tag_mapper;
CREATE TABLE t_article_tag_mapper (
  id             INT          NOT NULL AUTO_INCREMENT,
  article_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 标签表 Create on 2017-03-30 by Allen.
DROP TABLE IF EXISTS t_tag;
CREATE TABLE t_tag (
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(200) NOT NULL COMMENT '分类名称',
  create_time TIMESTAMP    NOT NULL DEFAULT NOW(),
  update_time TIMESTAMP    NOT NULL DEFAULT NOW(),
  remark      VARCHAR(500),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

-- 添加文章分类  Create on 2017-03-30 by Allen.
INSERT INTO t_category (name, create_user_id) VALUES ('java', 1);
INSERT INTO t_category (name, create_user_id) VALUES ('android', 1);
INSERT INTO t_category (name, create_user_id) VALUES ('db', 1);

-- 添加常用的标签  Create on 2017-03-30 by Allen.
INSERT INTO t_tag (name) VALUES ('java');
INSERT INTO t_tag (name) VALUES ('mysql');
INSERT INTO t_tag (name) VALUES ('tomcat');
INSERT INTO t_tag (name) VALUES ('eclipse');
INSERT INTO t_tag (name) VALUES ('android');
INSERT INTO t_tag (name) VALUES ('性能优化');
INSERT INTO t_tag (name) VALUES ('url');
INSERT INTO t_tag (name) VALUES ('中文乱码');
INSERT INTO t_tag (name) VALUES ('maven');
INSERT INTO t_tag (name) VALUES ('android studio');
INSERT INTO t_tag (name) VALUES ('框架');
INSERT INTO t_tag (name) VALUES ('issue');
INSERT INTO t_tag (name) VALUES ('spring');
INSERT INTO t_tag (name) VALUES ('mybatis');
INSERT INTO t_tag (name) VALUES ('spring-mvc');

-- tmp TODO 待删除
INSERT INTO t_user(name, password) VALUES ('1030413319', '110011');
INSERT INTO t_user(name, password) VALUES ('1030413310', '111111');

DROP TABLE IF EXISTS t_person;
CREATE TABLE t_person (
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(200) NOT NULL,
  sex VARCHAR(5),
  birthday VARCHAR(100),
  origin VARCHAR(50),
  academy VARCHAR(500),
  grade VARCHAR(500),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

INSERT INTO t_person VALUES (1030413319, '江晖', '男', '1995.1.11', '安徽铜陵', '物联网学院', '计算机1303');
INSERT INTO t_person VALUES (1030413310, '王二', '男', '1995.1.11', '安徽安庆', '食品学院', '食品1303');

DROP TABLE IF EXISTS t_score;
CREATE TABLE t_score (
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(200) NOT NULL,
  score VARCHAR(50),
  credit VARCHAR(50),
  hour VARCHAR(50),
  type VARCHAR(50),
  belong_to_id VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

INSERT INTO t_score VALUES (1, '程序设计基础C', '4.0', '48', '45', '学科平台课程', '1030413319');
INSERT INTO t_score VALUES (2, '离散数学', '4.0', '48', '89', '学科平台课程', '1030413319');
INSERT INTO t_score VALUES (3, '高等数学', '4.0', '48', '46', '学科平台课程', '1030413319');
INSERT INTO t_score VALUES (4, '程序设计基础C', '4.0', '48', '99', '学科平台课程', '1030413310');
INSERT INTO t_score VALUES (5, '线性代数', '4.0', '48', '79', '学科平台课程', '1030413310');
INSERT INTO t_score VALUES (6, '高等数学', '4.0', '48', '61', '学科平台课程', '1030413310');

DROP TABLE IF EXISTS t_class_room;
CREATE TABLE t_class_room (
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(200) NOT NULL,
  place VARCHAR(50),
  time_available VARCHAR(50),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

INSERT INTO t_class_room VALUES (1, '2A101', '二教', '12');
INSERT INTO t_class_room VALUES (2, '2A101', '一教', '123');
INSERT INTO t_class_room VALUES (3, '2A101', '一教', '3');

DROP TABLE IF EXISTS t_book;
CREATE TABLE t_book (
  id          INT          NOT NULL AUTO_INCREMENT,
  name        VARCHAR(200) NOT NULL,
  borrow_time VARCHAR(50),
  return_time VARCHAR(50),
  is_over_due INT,
  type INT,
  belong_to_id VARCHAR(100),
  PRIMARY KEY (id)
) ENGINE = InnoDB DEFAULT CHARSET = UTF8;

INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('嫌疑人X的献身', '2017-4-24 16:19:14', '2017-7-24', '0', '1', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('白夜行', '2017-4-24 16:19:14', '2017-7-24', '0', '1', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('解忧杂货店', '2017-4-24 16:19:14', '2017-7-24', '0', '1', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('秘密', '2017-4-24 16:19:14', '2017-7-24', '0', '1', '1030413310');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('信', '2017-4-24 16:19:14', '2017-7-24', '0', '1', '1030413310');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('嫌疑人X的献身', '2017-4-24 16:19:14', '2017-5-24', '0', '0', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('解忧杂货店', '2017-4-24 16:19:14', '2017-5-24', '0', '0', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('白夜行', '2017-4-24 16:19:14', '2017-5-24', '0', '0', '1030413319');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('秘密', '2017-4-24 16:19:14', '2017-5-24', '0', '0', '1030413310');
INSERT INTO t_book(name, borrow_time, return_time, is_over_due, type, belong_to_id) VALUES ('信', '2017-4-24 16:19:14', '2017-5-24', '0', '0', '1030413310');

