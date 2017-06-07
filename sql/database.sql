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

-- 向用户表中添加 email 字段
ALTER TABLE t_user ADD email VARCHAR(50) NOT NULL COMMENT '邮箱';
-- 修改用户表中 name（昵称） 字段为唯一字段
ALTER TABLE t_user ADD UNIQUE(name);
-- 向用户表中添加 sex 字段
ALTER TABLE t_user ADD sex INT COMMENT '性别（0：女；1：男）';
-- 向用户表中添加 address 字段
ALTER TABLE t_user ADD address VARCHAR(200) COMMENT '住址';

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
