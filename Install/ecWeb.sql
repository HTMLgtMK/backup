SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

-- 
--  Database: `db_ecWeb`
--	author:GT 
--	time:2017/05/17
--

-- 
--  表的结构 `tb_buyer` 买家表
-- 
CREATE TABLE IF NOT EXISTS `tb_buyer`(
	`id` INTEGER NOT NULL COMMENT "买家用户唯一标识",
	`name` CHAR(50) Not NULL COMMENT "买家实名",
	`nickname` VARCHAR(200) NULL COMMENT "昵称",
	`tel` CHAR(11) NULL COMMENT "买家联系方式",
	`mail` CHAR(20) NOT NULL COMMENT "买家邮箱，注册登陆用？",
	`pwd` VARCHAR(255) NOT NULL COMMENT "登陆密码,md5加密",
	`c_time` LONG  NOT NULL COMMENT "买家创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="买家表";

--
-- 表的结构`tb_seller` 卖家表
--
CREATE TABLE IF NOT EXISTS `tb_seller` (
	`id` INTEGER NOT NULL COMMENT "卖家唯一标识",
	`buyer_id` INTEGER NOT NULL COMMENT "买家身份id,外键",
	`level` SMALLINT NULL DEFAULT 1 COMMENT "卖家级别",
	`sell_count` INTEGER NULL DEFAULT 0 COMMENT "交易次数",
	`c_time` LONG NOT NULL COMMENT "卖家创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="卖家表";

-- 
-- 表的结构 `tb_store` 店铺表
--
CREATE TABLE IF NOT EXISTS `tb_store` (
	`id` INTEGER NOT NULL COMMENT "店铺唯一标识",
	`seller_id` INTEGER NOT NULL COMMENT "店铺主id,外键",
	`c_time` LONG NOT NULL COMMENT "店铺创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="店铺表";

--
-- 表的结构`tb_store_terms` 店铺内商品分类
--
CREATE TABLE IF NOT EXISTS `tb_store_terms`(
	`id` BIGINT NOT NULL COMMENT "分类唯一标识",
	`name` VARCHAR(100) NOT NULL COMMENT "分类名称",
	`parent_id` BIGINT NULL DEFAULT 0 COMMENT "上级分类id,默认0表示一级分类",
	`store_id` INTEGER NOT NULL COMMENT "店铺id,外键",
	`status` TINYINT NULL DEFAULT 1 COMMENT "启用状态,1:启用分类,0:停用分类",
	`c_time` LONG NOT NULL COMMENT "分类创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="店铺内商品分类表";

--
-- 表的结构`tb_goods` 商品表
--
CREATE TABLE IF NOT EXISTS `tb_goods`(
	`id` BIGINT NOT NULL COMMENT "商品唯一标识",
	`store_id` INTEGER NOT NULL COMMENT "商店id,外键",
	`name` VARCHAR(255) NOT NULL COMMENT "商品名称",
	`description` text NULL COMMENT "商品描述",
	`price` FLOAT NOT NULL COMMENT "商品单价",
	`cover` text NOT NULL COMMENT "商品封面",
	`smeta` text NULL COMMENT "资源等,使用json格式存储",
	`sell_count` INTEGER NULL DEFAULT 0 COMMENT "总销量",
	`term_id` BIGINT NOT NULL COMMENT "商品分类",
	`c_time` LONG NOT NULL COMMENT "创建商品时间"
)DEFAULT CHARSET=UTF8 COMMENT="商品表";

--
-- 表的结构 `tb_order` 订单表
--
CREATE TABLE IF NOT EXISTS `tb_order`(
	`id` BIGINT NOT NULL COMMENT "订单唯一标识",
	`buyer_id` INTEGER NOT NULL COMMENT "买家id,外键",
	`goods_id` BIGINT NOT NULL COMMENT "商品id,外键",
	`store_id` INTEGER NOT NULL COMMENT "店铺id,外键,可有可恶!!!",
	`num` INTEGER NOT NULL COMMENT "购买数量",
	`total` FLOAT NOT NULL COMMENT "交易总额",
	`message` TEXT NULL COMMENT "买家留言",
	`status` SMALLINT NOT NULL COMMENT "订单状态,0:发货,1:寄送中,2:以签收",
	`status_message` TEXT NULL COMMENT "订单状态消息,json格式数据",
	`c_time` LONG NOT NULL COMMENT "创建订单时间"
)DEFAULT CHARSET=UTF8 COMMENT="订单表";

--
-- 表的结构 `tb_cart` 购物车表
--
CREATE TABLE IF NOT EXISTS `tb_cart`(
	`id` BIGINT NOT NULL COMMENT "唯一标识",
	`goods_id` BIGINT NOT NULL COMMENT "商品id,外键",
	`num` INTEGER NOT NULL COMMENT "数量",
	`buyer_id` INTEGER NOT NULL COMMENT "买家id,外键",
	`c_time` LONG NOT NULL COMMENT "创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="购物车表";

--
-- 表的结构 `tb_admin` 管理员表
--
CREATE TABLE IF NOT EXISTS `tb_admin`(
	`id` INTEGER NOT NULL COMMENT "管理员唯一标识",
	`name` CHAR(50) NOT NULL COMMENT "管理员实名",
	`tel` CHAR(11) NULL COMMENT "管理员联系电话",
	`mail` VARCHAR(20) NOT NULL COMMENT "管理员登陆注册邮箱",
	`pwd` VARCHAR(255) NOT NULL COMMENT "管理员密码,md5加密",
	`c_time` LONG NOT NULL COMMENT "管理员创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="管理员表";

--
-- 表的结构 `tb_site_terms` 商城商品分类表
--
CREATE TABLE IF NOT EXISTS `tb_site_terms`(
	`id` INTEGER NOT NULL COMMENT "商城商品分类id",
	`name` VARCHAR(100) NOT NULL COMMENT "分类名称",
	`parent_id` BIGINT NULL DEFAULT 0 COMMENT "上级分类id,默认0表示一级分类",
	`status` TINYINT NULL DEFAULT 1 COMMENT "启用状态,1:启用分类,0:停用分类",
	`c_time` LONG NOT NULL COMMENT "分类创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="商城商品分类表";

--
-- 表的结构 `tb_slides` 首页轮播图表
--
CREATE TABLE IF NOT EXISTS `tb_slides`(
	`id` INTEGER NOT NULL COMMENT "轮播图id",
	`url` text NOT NULL COMMENT "轮播图url",
	`msg` text NULL COMMENT "附加消息",
	`status` TINYINT NULL DEFAULT 1 COMMENT "启用状态,1:启用,0:停用",
	`c_time` LONG NOT NULL COMMENT "创建时间"
)DEFAULT CHARSET=UTF8 COMMENT="首页轮播图表";

--
-- INDEX FOR `tb_buyer`
--
ALTER TABLE `tb_buyer` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_seller`
--
ALTER TABLE `tb_seller` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_store`
--
ALTER TABLE `tb_store` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_store_terms`
--
ALTER TABLE `tb_store_terms` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_goods`
--
ALTER TABLE `tb_goods` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_order`
--
ALTER TABLE `tb_order` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_cart`
--
ALTER TABLE `tb_cart` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_admin`
--
ALTER TABLE `tb_admin` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_site_terms`
--
ALTER TABLE `tb_site_terms` 
	ADD PRIMARY KEY (`id`);

--
-- INDEX FOR `tb_slides`
--
ALTER TABLE `tb_slides` 
	ADD PRIMARY KEY (`id`);
	
--
-- AUTO_INCREMENT for table `tb_buyer`
--
ALTER TABLE `tb_buyer` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_seller`
--
ALTER TABLE `tb_seller` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_store`
--
ALTER TABLE `tb_store` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_store_terms`
--
ALTER TABLE `tb_store_terms` 
	MODIFY `id` BIGINT AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_goods`
--
ALTER TABLE `tb_goods` 
	MODIFY `id` BIGINT AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order` 
	MODIFY `id` BIGINT AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_cart`
--
ALTER TABLE `tb_cart` 
	MODIFY `id` BIGINT AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tb_site_terms`
--
ALTER TABLE `tb_site_terms` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `tb_slides`
--
ALTER TABLE `tb_slides` 
	MODIFY `id` INTEGER AUTO_INCREMENT,AUTO_INCREMENT=1;
	
--
-- FOREIGN KEY for table `tb_seller`
--
ALTER TABLE `tb_seller` 
	ADD FOREIGN KEY (`buyer_id`) REFERENCES `tb_buyer`(`id`) 
	ON DELETE CASCADE ON UPDATE CASCADE;

--
-- FOREIGN KEY for table `tb_store`
--
ALTER TABLE `tb_store` 
	ADD FOREIGN KEY (`seller_id`) REFERENCES `tb_seller`(`id`) 
	ON DELETE CASCADE ON UPDATE CASCADE;
	
--
-- FOREIGN KEY for table `tb_store_terms`
--
ALTER TABLE `tb_store_terms` 
	ADD FOREIGN KEY (`store_id`) REFERENCES `tb_store`(`id`) 
	ON DELETE CASCADE ON UPDATE CASCADE;
	
--
-- FOREIGN KEY for table `tb_goods`
--
ALTER TABLE `tb_goods` 
	ADD FOREIGN KEY (`store_id`) REFERENCES `tb_store`(`id`) 
	ON DELETE CASCADE ON UPDATE CASCADE;
	
--
-- FOREIGN KEY for table `tb_order`
--
ALTER TABLE `tb_order` 
	ADD FOREIGN KEY (`goods_id`) REFERENCES `tb_goods`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD FOREIGN KEY (`buyer_id`) REFERENCES `tb_buyer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD FOREIGN KEY (`store_id`) REFERENCES `tb_store`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- FOREIGN KEY for table `tb_cart`
--
ALTER TABLE `tb_cart` 
	ADD FOREIGN KEY (`goods_id`) REFERENCES `tb_goods`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD FOREIGN KEY (`buyer_id`) REFERENCES `tb_buyer`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;