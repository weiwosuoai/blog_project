------------------------------------- Exception 数据表 ----------------------------------------
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
--------------------------------------------------------------------------------------------------

-- 用户表 Create on 2017-03-14 by Allen.
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
	id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL COMMENT '用户名',
	password VARCHAR(100) NOT NULL COMMENT '密码',
	create_time TIMESTAMP NOT NULL DEFAULT NOW(),
	update_time TIMESTAMP NOT NULL DEFAULT NOW(),
	remark VARCHAR(500) COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 文章表 Create on 2017-03-14 by Allen.
DROP TABLE IF EXISTS t_article;
CREATE TABLE t_article (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(500) NOT NULL COMMENT '文章标题',
	category INT NOT NULL COMMENT '所属分类',
	file_name VARCHAR(500) NOT NULL COMMENT '文章原始文件名称',
	file_path VARCHAR(500) NOT NULL COMMENT '文章存储路径',
	create_time TIMESTAMP NOT NULL DEFAULT NOW(),
	update_time TIMESTAMP NOT NULL,
	remark VARCHAR(500)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 文章表中添加文章创建者字段 Create on 2017-03-18 by Allen.
ALTER TABLE t_article ADD create_user_id INT NOT NULL;

-- 文章表中添加文章被浏览数字段 Create on 2017-03-28 by Allen.
ALTER TABLE t_article ADD be_viewd_num INT NOT NULL DEFAULT 1;


