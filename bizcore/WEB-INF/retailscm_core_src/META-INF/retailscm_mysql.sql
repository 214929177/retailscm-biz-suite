-- BUILD WITH MODEL TIME 181218T0136
drop database  if exists retailscm;
create database retailscm;
alter  database retailscm  character set = utf8mb4  collate = utf8mb4_unicode_ci; -- 支持表情符号
use retailscm;

drop table  if exists retail_store_country_center_data;
create table retail_store_country_center_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(44)                              comment '名称',
	service_number      	varchar(36)                              comment '服务号码',
	founded             	date                                     comment '成立',
	web_site            	varchar(128)                             comment '网站',
	address             	varchar(56)                              comment '地址',
	operated_by         	varchar(16)                              comment '由',
	legal_representative	varchar(12)                              comment '法定代表人',
	description         	varchar(52)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists catalog_data;
create table catalog_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_one_category_data;
create table level_one_category_data (
	id                  	varchar(64)          not null            comment '序号',
	catalog             	varchar(48)                              comment '目录',
	name                	varchar(16)                              comment '名称',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_two_category_data;
create table level_two_category_data (
	id                  	varchar(64)          not null            comment '序号',
	parent_category     	varchar(48)                              comment '父类',
	name                	varchar(16)                              comment '名称',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_three_category_data;
create table level_three_category_data (
	id                  	varchar(64)          not null            comment '序号',
	parent_category     	varchar(48)                              comment '父类',
	name                	varchar(16)                              comment '名称',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists product_data;
create table product_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	parent_category     	varchar(48)                              comment '父类',
	origin              	varchar(8)                               comment '产地',
	remark              	varchar(88)                              comment '备注',
	brand               	varchar(92)                              comment '品牌',
	picture             	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists sku_data;
create table sku_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	size                	varchar(4)                               comment '大小',
	product             	varchar(48)                              comment '产品',
	barcode             	varchar(52)                              comment '条码',
	package_type        	varchar(16)                              comment '包装类型',
	net_content         	varchar(92)                              comment '净含量',
	price               	numeric(8,2)                             comment '价格',
	picture             	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '图片',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_province_center_data;
create table retail_store_province_center_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(44)                              comment '名称',
	founded             	date                                     comment '成立',
	country             	varchar(48)                              comment '国',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists province_center_department_data;
create table province_center_department_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(20)                              comment '名称',
	founded             	date                                     comment '成立',
	province_center     	varchar(48)                              comment '省中心',
	manager             	varchar(12)                              comment '经理',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists province_center_employee_data;
create table province_center_employee_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	mobile              	varchar(44)                              comment '手机',
	email               	varchar(256)                             comment '电子邮件',
	founded             	date                                     comment '成立',
	department          	varchar(48)                              comment '部门',
	province_center     	varchar(48)                              comment '省中心',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_city_service_center_data;
create table retail_store_city_service_center_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(36)                              comment '名称',
	founded             	date                                     comment '成立',
	belongs_to          	varchar(48)                              comment '属于',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists city_partner_data;
create table city_partner_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	mobile              	varchar(44)                              comment '手机',
	city_service_center 	varchar(48)                              comment '城市服务中心',
	description         	varchar(64)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists potential_customer_data;
create table potential_customer_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	mobile              	varchar(44)                              comment '手机',
	city_service_center 	varchar(48)                              comment '城市服务中心',
	city_partner        	varchar(48)                              comment '城市合伙人',
	description         	varchar(64)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists potential_customer_contact_person_data;
create table potential_customer_contact_person_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	mobile              	varchar(44)                              comment '手机',
	potential_customer  	varchar(48)                              comment '潜在的客户',
	description         	varchar(96)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists potential_customer_contact_data;
create table potential_customer_contact_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(40)                              comment '名称',
	contact_date        	date                                     comment '接触日期',
	contact_method      	varchar(16)                              comment '接触法',
	potential_customer  	varchar(48)                              comment '潜在的客户',
	city_partner        	varchar(48)                              comment '城市合伙人',
	contact_to          	varchar(48)                              comment '接触',
	description         	varchar(24)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists city_event_data;
create table city_event_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(28)                              comment '名称',
	mobile              	varchar(44)                              comment '手机',
	city_service_center 	varchar(48)                              comment '城市服务中心',
	description         	varchar(48)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists event_attendance_data;
create table event_attendance_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(36)                              comment '名称',
	potential_customer  	varchar(48)                              comment '潜在的客户',
	city_event          	varchar(48)                              comment '城市活动',
	description         	varchar(36)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_data;
create table retail_store_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	telephone           	varchar(44)                              comment '电话',
	owner               	varchar(8)                               comment '业主',
	retail_store_country_center	varchar(48)                              comment '双链小超全国运营中心',
	city_service_center 	varchar(48)                              comment '城市服务中心',
	creation            	varchar(48)                              comment '创建',
	investment_invitation	varchar(48)                              comment '招商',
	franchising         	varchar(48)                              comment '加盟',
	decoration          	varchar(48)                              comment '装修',
	opening             	varchar(48)                              comment '开业',
	closing             	varchar(48)                              comment '关闭',
	founded             	date                                     comment '成立',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	description         	varchar(84)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	current_status      	varchar(72)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_creation_data;
create table retail_store_creation_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(20)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_investment_invitation_data;
create table retail_store_investment_invitation_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(24)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_franchising_data;
create table retail_store_franchising_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(16)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_decoration_data;
create table retail_store_decoration_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(8)                               comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_opening_data;
create table retail_store_opening_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(8)                               comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_closing_data;
create table retail_store_closing_data (
	id                  	varchar(64)          not null            comment '序号',
	comment             	varchar(8)                               comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_member_data;
create table retail_store_member_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	mobile_phone        	varchar(44)                              comment '移动电话',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_data;
create table consumer_order_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	consumer            	varchar(48)                              comment '消费者',
	confirmation        	varchar(48)                              comment '确认',
	approval            	varchar(48)                              comment '验收',
	processing          	varchar(48)                              comment '处理',
	shipment            	varchar(48)                              comment '装运',
	delivery            	varchar(48)                              comment '送货',
	store               	varchar(48)                              comment '商场',
	last_update_time    	datetime                                 comment '最后更新时间',
	current_status      	varchar(36)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_confirmation_data;
create table consumer_order_confirmation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	confirm_time        	date                                     comment '确认时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_approval_data;
create table consumer_order_approval_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	approve_time        	date                                     comment '批准时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_processing_data;
create table consumer_order_processing_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	process_time        	date                                     comment '过程的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_shipment_data;
create table consumer_order_shipment_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	ship_time           	date                                     comment '船的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_delivery_data;
create table consumer_order_delivery_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	delivery_time       	date                                     comment '交货时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_line_item_data;
create table consumer_order_line_item_data (
	id                  	varchar(64)          not null            comment '序号',
	biz_order           	varchar(48)                              comment '订单',
	sku_id              	varchar(12)                              comment '产品ID',
	sku_name            	varchar(16)                              comment '产品名称',
	price               	numeric(5,2)                             comment '价格',
	quantity            	numeric(7,2)                             comment '数量',
	amount              	numeric(8,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_shipping_group_data;
create table consumer_order_shipping_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	amount              	numeric(7,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_payment_group_data;
create table consumer_order_payment_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	card_number         	varchar(68)                              comment '卡号码',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists consumer_order_price_adjustment_data;
create table consumer_order_price_adjustment_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	amount              	numeric(7,2)                             comment '金额',
	provider            	varchar(16)                              comment '供应商',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_member_coupon_data;
create table retail_store_member_coupon_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	number              	varchar(28)                              comment '数',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists member_wishlist_data;
create table member_wishlist_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists member_reward_point_data;
create table member_reward_point_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	point               	int                                      comment '点',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists member_reward_point_redemption_data;
create table member_reward_point_redemption_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	point               	int                                      comment '点',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists member_wishlist_product_data;
create table member_wishlist_product_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(20)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_member_address_data;
create table retail_store_member_address_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	mobile_phone        	varchar(44)                              comment '移动电话',
	address             	varchar(56)                              comment '地址',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_member_gift_card_data;
create table retail_store_member_gift_card_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	owner               	varchar(48)                              comment '业主',
	number              	varchar(28)                              comment '数',
	remain              	numeric(7,2)                             comment '保持',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_member_gift_card_consume_record_data;
create table retail_store_member_gift_card_consume_record_data (
	id                  	varchar(64)          not null            comment '序号',
	occure_time         	date                                     comment '发生时间',
	owner               	varchar(48)                              comment '业主',
	biz_order           	varchar(48)                              comment '订单',
	number              	varchar(28)                              comment '数',
	amount              	numeric(6,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_supplier_data;
create table goods_supplier_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(12)                              comment '名称',
	supply_product      	varchar(16)                              comment '供应产品',
	belong_to           	varchar(48)                              comment '属于',
	contact_number      	varchar(44)                              comment '联系电话',
	description         	varchar(72)                              comment '描述',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supplier_product_data;
create table supplier_product_data (
	id                  	varchar(64)          not null            comment '序号',
	product_name        	varchar(16)                              comment '品名',
	product_description 	varchar(52)                              comment '产品描述',
	product_unit        	varchar(8)                               comment '产品单元',
	supplier            	varchar(48)                              comment '供应商',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists product_supply_duration_data;
create table product_supply_duration_data (
	id                  	varchar(64)          not null            comment '序号',
	quantity            	int                                      comment '数量',
	duration            	varchar(8)                               comment '持续时间',
	price               	numeric(8,2)                             comment '价格',
	product             	varchar(48)                              comment '产品',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_data;
create table supply_order_data (
	id                  	varchar(64)          not null            comment '序号',
	buyer               	varchar(48)                              comment '买方',
	seller              	varchar(48)                              comment '卖方',
	title               	varchar(40)                              comment '头衔',
	total_amount        	numeric(14,2)                            comment '总金额',
	confirmation        	varchar(48)                              comment '确认',
	approval            	varchar(48)                              comment '验收',
	processing          	varchar(48)                              comment '处理',
	picking             	varchar(48)                              comment '捡货',
	shipment            	varchar(48)                              comment '装运',
	delivery            	varchar(48)                              comment '送货',
	last_update_time    	datetime                                 comment '最后更新时间',
	current_status      	varchar(36)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_confirmation_data;
create table supply_order_confirmation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	confirm_time        	date                                     comment '确认时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_approval_data;
create table supply_order_approval_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	approve_time        	date                                     comment '批准时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_processing_data;
create table supply_order_processing_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	process_time        	date                                     comment '过程的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_picking_data;
create table supply_order_picking_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	process_time        	date                                     comment '过程的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_shipment_data;
create table supply_order_shipment_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	ship_time           	date                                     comment '船的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_delivery_data;
create table supply_order_delivery_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	delivery_time       	date                                     comment '交货时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_line_item_data;
create table supply_order_line_item_data (
	id                  	varchar(64)          not null            comment '序号',
	biz_order           	varchar(48)                              comment '订单',
	sku_id              	varchar(12)                              comment '产品ID',
	sku_name            	varchar(16)                              comment '产品名称',
	amount              	numeric(5,2)                             comment '金额',
	quantity            	int                                      comment '数量',
	unit_of_measurement 	varchar(8)                               comment '测量单位',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_shipping_group_data;
create table supply_order_shipping_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(40)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	amount              	numeric(5,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supply_order_payment_group_data;
create table supply_order_payment_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	card_number         	varchar(68)                              comment '卡号码',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_data;
create table retail_store_order_data (
	id                  	varchar(64)          not null            comment '序号',
	buyer               	varchar(48)                              comment '买方',
	seller              	varchar(48)                              comment '卖方',
	title               	varchar(56)                              comment '头衔',
	total_amount        	numeric(14,2)                            comment '总金额',
	confirmation        	varchar(48)                              comment '确认',
	approval            	varchar(48)                              comment '验收',
	processing          	varchar(48)                              comment '处理',
	picking             	varchar(48)                              comment '捡货',
	shipment            	varchar(48)                              comment '装运',
	delivery            	varchar(48)                              comment '送货',
	last_update_time    	datetime                                 comment '最后更新时间',
	current_status      	varchar(36)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_confirmation_data;
create table retail_store_order_confirmation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	confirm_time        	date                                     comment '确认时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_approval_data;
create table retail_store_order_approval_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	approve_time        	date                                     comment '批准时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_processing_data;
create table retail_store_order_processing_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	process_time        	date                                     comment '过程的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_picking_data;
create table retail_store_order_picking_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	process_time        	date                                     comment '过程的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_shipment_data;
create table retail_store_order_shipment_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	ship_time           	date                                     comment '船的时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_delivery_data;
create table retail_store_order_delivery_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	delivery_time       	date                                     comment '交货时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_line_item_data;
create table retail_store_order_line_item_data (
	id                  	varchar(64)          not null            comment '序号',
	biz_order           	varchar(48)                              comment '订单',
	sku_id              	varchar(12)                              comment '产品ID',
	sku_name            	varchar(16)                              comment '产品名称',
	amount              	numeric(5,2)                             comment '金额',
	quantity            	int                                      comment '数量',
	unit_of_measurement 	varchar(8)                               comment '测量单位',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_shipping_group_data;
create table retail_store_order_shipping_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(40)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	amount              	numeric(5,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists retail_store_order_payment_group_data;
create table retail_store_order_payment_group_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	biz_order           	varchar(48)                              comment '订单',
	card_number         	varchar(68)                              comment '卡号码',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists warehouse_data;
create table warehouse_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(44)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(36)                              comment '总面积',
	owner               	varchar(48)                              comment '业主',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists storage_space_data;
create table storage_space_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(56)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(28)                              comment '总面积',
	warehouse           	varchar(48)                              comment '仓库',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists smart_pallet_data;
create table smart_pallet_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(104)                             comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(28)                              comment '总面积',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	warehouse           	varchar(48)                              comment '仓库',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_shelf_data;
create table goods_shelf_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(64)                              comment '位置',
	storage_space       	varchar(48)                              comment '存货区',
	supplier_space      	varchar(48)                              comment '供应商的空间',
	damage_space        	varchar(48)                              comment '残次货物存放区',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_shelf_stock_count_data;
create table goods_shelf_stock_count_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	count_time          	date                                     comment '计数时间',
	summary             	varchar(72)                              comment '概览',
	shelf               	varchar(48)                              comment '架',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists stock_count_issue_track_data;
create table stock_count_issue_track_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	count_time          	date                                     comment '计数时间',
	summary             	varchar(40)                              comment '概览',
	stock_count         	varchar(48)                              comment '盘点',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_allocation_data;
create table goods_allocation_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(84)                              comment '位置',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	goods_shelf         	varchar(48)                              comment '货架',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_data;
create table goods_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	rfid                	varchar(28)                              comment 'RFID',
	uom                 	varchar(4)                               comment '计量单位',
	max_package         	int                                      comment '最大包装',
	expire_time         	date                                     comment '到期时间',
	sku                 	varchar(48)                              comment 'SKU',
	receiving_space     	varchar(48)                              comment '收货区',
	goods_allocation    	varchar(48)                              comment '货位',
	smart_pallet        	varchar(48)                              comment '智能托盘',
	shipping_space      	varchar(48)                              comment '发货区',
	transport_task      	varchar(48)                              comment '运输任务',
	retail_store        	varchar(48)                              comment '双链小超',
	biz_order           	varchar(48)                              comment '订单',
	retail_store_order  	varchar(48)                              comment '生超的订单',
	packaging           	varchar(48)                              comment '包装',
	current_status      	varchar(24)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_packaging_data;
create table goods_packaging_data (
	id                  	varchar(64)          not null            comment '序号',
	package_name        	varchar(12)                              comment '包的名字',
	rfid                	varchar(28)                              comment 'RFID',
	package_time        	date                                     comment '包的时间',
	description         	varchar(36)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists goods_movement_data;
create table goods_movement_data (
	id                  	varchar(64)          not null            comment '序号',
	move_time           	datetime                                 comment '移动时间',
	facility            	varchar(16)                              comment '设施',
	facility_id         	varchar(16)                              comment '设备ID',
	from_ip             	varchar(48)                              comment '从IP',
	user_agent          	varchar(444)                             comment '用户代理',
	session_id          	varchar(80)                              comment '会话ID',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	goods               	varchar(48)                              comment '货物',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists supplier_space_data;
create table supplier_space_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(76)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(28)                              comment '总面积',
	warehouse           	varchar(48)                              comment '仓库',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists receiving_space_data;
create table receiving_space_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(64)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	description         	varchar(52)                              comment '描述',
	total_area          	varchar(28)                              comment '总面积',
	warehouse           	varchar(48)                              comment '仓库',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists shipping_space_data;
create table shipping_space_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(56)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(28)                              comment '总面积',
	warehouse           	varchar(48)                              comment '仓库',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	description         	varchar(52)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists damage_space_data;
create table damage_space_data (
	id                  	varchar(64)          not null            comment '序号',
	location            	varchar(80)                              comment '位置',
	contact_number      	varchar(44)                              comment '联系电话',
	total_area          	varchar(28)                              comment '总面积',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	warehouse           	varchar(48)                              comment '仓库',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists warehouse_asset_data;
create table warehouse_asset_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(20)                              comment '名称',
	position            	varchar(40)                              comment '位置',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists transport_fleet_data;
create table transport_fleet_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(28)                              comment '名称',
	contact_number      	varchar(44)                              comment '联系电话',
	owner               	varchar(48)                              comment '业主',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists transport_truck_data;
create table transport_truck_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	plate_number        	varchar(16)                              comment '车牌号码',
	contact_number      	varchar(44)                              comment '联系电话',
	vehicle_license_number	varchar(24)                              comment '汽车牌照号码',
	engine_number       	varchar(28)                              comment '发动机号',
	make_date           	date                                     comment '制造日期',
	mileage             	varchar(24)                              comment '里程',
	body_color          	varchar(8)                               comment '车身颜色',
	owner               	varchar(48)                              comment '业主',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists truck_driver_data;
create table truck_driver_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	driver_license_number	varchar(44)                              comment '驾驶执照号码',
	contact_number      	varchar(44)                              comment '联系电话',
	belongs_to          	varchar(48)                              comment '属于',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists transport_task_data;
create table transport_task_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	start               	varchar(20)                              comment '开始',
	begin_time          	date                                     comment '开始时间',
	end                 	varchar(48)                              comment '结束',
	driver              	varchar(48)                              comment '司机',
	truck               	varchar(48)                              comment '卡车',
	belongs_to          	varchar(48)                              comment '属于',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists transport_task_track_data;
create table transport_task_track_data (
	id                  	varchar(64)          not null            comment '序号',
	track_time          	date                                     comment '跟踪时间',
	latitude            	numeric(9,6)                             comment '纬度',
	longitude           	numeric(10,6)                            comment '经度',
	movement            	varchar(48)                              comment '运动',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists account_set_data;
create table account_set_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(24)                              comment '名称',
	year_set            	varchar(20)                              comment '年组',
	effective_date      	date                                     comment '生效日期',
	accounting_system   	varchar(28)                              comment '会计制度',
	domestic_currency_code	varchar(12)                              comment '本币代码',
	domestic_currency_name	varchar(12)                              comment '本币名称',
	opening_bank        	varchar(16)                              comment '开户银行',
	account_number      	varchar(56)                              comment '帐户号码',
	country_center      	varchar(48)                              comment '全国运营中心',
	retail_store        	varchar(48)                              comment '双链小超',
	goods_supplier      	varchar(48)                              comment '产品供应商',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_subject_data;
create table accounting_subject_data (
	id                  	varchar(64)          not null            comment '序号',
	accounting_subject_code	varchar(24)                              comment '会计科目代码',
	accounting_subject_name	varchar(16)                              comment '会计科目名称',
	accounting_subject_class_code	int                                      comment '会计科目类别代码',
	accounting_subject_class_name	varchar(24)                              comment '会计科目类别名称',
	account_set         	varchar(48)                              comment '账套',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_period_data;
create table accounting_period_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(32)                              comment '名称',
	start_date          	date                                     comment '开始日期',
	end_date            	date                                     comment '结束日期',
	account_set         	varchar(48)                              comment '账套',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_type_data;
create table accounting_document_type_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	description         	varchar(280)                             comment '描述',
	accounting_period   	varchar(48)                              comment '会计期间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_data;
create table accounting_document_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	accounting_document_date	date                                     comment '会计凭证日期',
	accounting_period   	varchar(48)                              comment '会计期间',
	document_type       	varchar(48)                              comment '文档类型',
	creation            	varchar(48)                              comment '创建',
	confirmation        	varchar(48)                              comment '确认',
	auditing            	varchar(48)                              comment '审计',
	posting             	varchar(48)                              comment '过账',
	current_status      	varchar(36)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_creation_data;
create table accounting_document_creation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(16)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_confirmation_data;
create table accounting_document_confirmation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(16)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_auditing_data;
create table accounting_document_auditing_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(60)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_posting_data;
create table accounting_document_posting_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(60)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists original_voucher_data;
create table original_voucher_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(28)                              comment '头衔',
	made_by             	varchar(12)                              comment '由',
	received_by         	varchar(12)                              comment '受',
	voucher_type        	varchar(16)                              comment '凭证类型',
	voucher_image       	varchar(512) CHARACTER SET ascii COLLATE ascii_general_ci                     comment '凭证图像',
	belongs_to          	varchar(48)                              comment '属于',
	creation            	varchar(48)                              comment '创建',
	confirmation        	varchar(48)                              comment '确认',
	auditing            	varchar(48)                              comment '审计',
	current_status      	varchar(36)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists original_voucher_creation_data;
create table original_voucher_creation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(16)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists original_voucher_confirmation_data;
create table original_voucher_confirmation_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(16)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists original_voucher_auditing_data;
create table original_voucher_auditing_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(16)                              comment '谁',
	comments            	varchar(60)                              comment '评论',
	make_date           	date                                     comment '制造日期',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists accounting_document_line_data;
create table accounting_document_line_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	code                	varchar(24)                              comment '代码',
	direct              	varchar(4)                               comment '直接',
	amount              	numeric(10,2)                            comment '金额',
	belongs_to          	varchar(48)                              comment '属于',
	accounting_subject  	varchar(48)                              comment '会计科目',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_one_department_data;
create table level_one_department_data (
	id                  	varchar(64)          not null            comment '序号',
	belongs_to          	varchar(48)                              comment '属于',
	name                	varchar(20)                              comment '名称',
	description         	varchar(72)                              comment '描述',
	manager             	varchar(12)                              comment '经理',
	founded             	date                                     comment '成立',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_two_department_data;
create table level_two_department_data (
	id                  	varchar(64)          not null            comment '序号',
	belongs_to          	varchar(48)                              comment '属于',
	name                	varchar(40)                              comment '名称',
	description         	varchar(72)                              comment '描述',
	founded             	date                                     comment '成立',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists level_three_department_data;
create table level_three_department_data (
	id                  	varchar(64)          not null            comment '序号',
	belongs_to          	varchar(48)                              comment '属于',
	name                	varchar(52)                              comment '名称',
	description         	varchar(72)                              comment '描述',
	founded             	date                                     comment '成立',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists skill_type_data;
create table skill_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(20)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	description         	varchar(24)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists responsibility_type_data;
create table responsibility_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(20)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	base_description    	varchar(16)                              comment '基本描述',
	detail_description  	varchar(116)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists termination_reason_data;
create table termination_reason_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(28)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	description         	varchar(36)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists termination_type_data;
create table termination_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(28)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	base_description    	varchar(16)                              comment '基本描述',
	detail_description  	varchar(248)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists occupation_type_data;
create table occupation_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(24)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	description         	varchar(28)                              comment '描述',
	detail_description  	varchar(244)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists leave_type_data;
create table leave_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(24)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	description         	varchar(16)                              comment '描述',
	detail_description  	varchar(244)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists salary_grade_data;
create table salary_grade_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(24)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	name                	varchar(16)                              comment '名称',
	detail_description  	varchar(244)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists interview_type_data;
create table interview_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(32)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	description         	varchar(24)                              comment '描述',
	detail_description  	varchar(244)                             comment '详细描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists training_course_type_data;
create table training_course_type_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(16)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	name                	varchar(16)                              comment '名称',
	description         	varchar(64)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists public_holiday_data;
create table public_holiday_data (
	id                  	varchar(64)          not null            comment '序号',
	code                	varchar(16)                              comment '代码',
	company             	varchar(48)                              comment '公司',
	name                	varchar(12)                              comment '名称',
	description         	varchar(40)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists termination_data;
create table termination_data (
	id                  	varchar(64)          not null            comment '序号',
	reason              	varchar(48)                              comment '原因',
	type                	varchar(48)                              comment '类型',
	comment             	varchar(16)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists view_data;
create table view_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	assessment          	varchar(40)                              comment '评估',
	interview_time      	date                                     comment '面试时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_data;
create table employee_data (
	id                  	varchar(64)          not null            comment '序号',
	company             	varchar(48)                              comment '公司',
	title               	varchar(12)                              comment '头衔',
	department          	varchar(48)                              comment '部门',
	family_name         	varchar(4)                               comment '姓',
	given_name          	varchar(8)                               comment '名',
	email               	varchar(256)                             comment '电子邮件',
	city                	varchar(8)                               comment '城市',
	address             	varchar(28)                              comment '地址',
	cell_phone          	varchar(44)                              comment '手机',
	occupation          	varchar(48)                              comment '职业',
	responsible_for     	varchar(48)                              comment '负责',
	current_salary_grade	varchar(48)                              comment '目前工资等级',
	salary_account      	varchar(60)                              comment '工资账户',
	job_application     	varchar(48)                              comment '工作申请',
	profession_interview	varchar(48)                              comment '专业面试',
	hr_interview        	varchar(48)                              comment '人力资源部面试',
	offer_approval      	varchar(48)                              comment '审批工作要约',
	offer_acceptance    	varchar(48)                              comment '接受工作要约',
	employee_boarding   	varchar(48)                              comment '员工入职',
	termination         	varchar(48)                              comment '雇佣终止',
	last_update_time    	datetime                                 comment '最后更新时间',
	current_status      	varchar(88)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists job_application_data;
create table job_application_data (
	id                  	varchar(64)          not null            comment '序号',
	application_time    	date                                     comment '申请时间',
	who                 	varchar(20)                              comment '谁',
	comments            	varchar(124)                             comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists profession_interview_data;
create table profession_interview_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	interview_time      	date                                     comment '面试时间',
	comments            	varchar(60)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists hr_interview_data;
create table hr_interview_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(20)                              comment '谁',
	interview_time      	date                                     comment '面试时间',
	comments            	varchar(52)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists offer_approval_data;
create table offer_approval_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	approve_time        	date                                     comment '批准时间',
	comments            	varchar(40)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists offer_acceptance_data;
create table offer_acceptance_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(12)                              comment '谁',
	accept_time         	date                                     comment '接受时间',
	comments            	varchar(40)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_boarding_data;
create table employee_boarding_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(20)                              comment '谁',
	employ_time         	date                                     comment '使用时间',
	comments            	varchar(44)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists instructor_data;
create table instructor_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	family_name         	varchar(4)                               comment '姓',
	given_name          	varchar(8)                               comment '名',
	cell_phone          	varchar(44)                              comment '手机',
	email               	varchar(256)                             comment '电子邮件',
	company             	varchar(48)                              comment '公司',
	introduction        	varchar(60)                              comment '介绍',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists company_training_data;
create table company_training_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	company             	varchar(48)                              comment '公司',
	instructor          	varchar(48)                              comment '讲师',
	training_course_type	varchar(48)                              comment '培训课程类型',
	time_start          	date                                     comment '时间开始',
	duration_hours      	int                                      comment '持续时间',
	last_update_time    	datetime                                 comment '最后更新时间',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists scoring_data;
create table scoring_data (
	id                  	varchar(64)          not null            comment '序号',
	scored_by           	varchar(12)                              comment '由谁打分',
	score               	int                                      comment '分数',
	comment             	varchar(36)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_company_training_data;
create table employee_company_training_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	training            	varchar(48)                              comment '训练',
	scoring             	varchar(48)                              comment '评分',
	current_status      	varchar(24)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_skill_data;
create table employee_skill_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	skill_type          	varchar(48)                              comment '技能类型',
	description         	varchar(28)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_performance_data;
create table employee_performance_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	performance_comment 	varchar(28)                              comment '绩效评价',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_work_experience_data;
create table employee_work_experience_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	start               	date                                     comment '开始',
	end                 	date                                     comment '结束',
	company             	varchar(32)                              comment '公司',
	description         	varchar(84)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_leave_data;
create table employee_leave_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(48)                              comment '谁',
	type                	varchar(48)                              comment '类型',
	leave_duration_hour 	int                                      comment '请假时长',
	remark              	varchar(44)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_interview_data;
create table employee_interview_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	interview_type      	varchar(48)                              comment '面试类型',
	remark              	varchar(40)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_attendance_data;
create table employee_attendance_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	enter_time          	date                                     comment '进入时间',
	leave_time          	date                                     comment '离开的时候',
	duration_hours      	int                                      comment '持续时间',
	remark              	varchar(28)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_qualifier_data;
create table employee_qualifier_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	qualified_time      	date                                     comment '合格的时间',
	type                	varchar(20)                              comment '类型',
	level               	varchar(8)                               comment '水平',
	remark              	varchar(36)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_education_data;
create table employee_education_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	complete_time       	date                                     comment '完成时间',
	type                	varchar(16)                              comment '类型',
	remark              	varchar(36)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_award_data;
create table employee_award_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	complete_time       	date                                     comment '完成时间',
	type                	varchar(20)                              comment '类型',
	remark              	varchar(36)                              comment '备注',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists employee_salary_sheet_data;
create table employee_salary_sheet_data (
	id                  	varchar(64)          not null            comment '序号',
	employee            	varchar(48)                              comment '员工',
	current_salary_grade	varchar(48)                              comment '目前工资等级',
	base_salary         	numeric(8,2)                             comment '基本工资',
	bonus               	numeric(8,2)                             comment '奖金',
	reward              	numeric(8,2)                             comment '奖励',
	personal_tax        	numeric(7,2)                             comment '个人所得税',
	social_security     	numeric(8,2)                             comment '社会保险',
	housing_found       	numeric(8,2)                             comment '住房公积金',
	job_insurance       	numeric(5,2)                             comment '失业保险',
	paying_off          	varchar(48)                              comment '工资支付',
	current_status      	varchar(32)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists paying_off_data;
create table paying_off_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(8)                               comment '谁',
	paid_for            	varchar(48)                              comment '支付',
	paid_time           	date                                     comment '支付时间',
	amount              	numeric(8,2)                             comment '金额',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists user_domain_data;
create table user_domain_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(16)                              comment '名称',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists user_white_list_data;
create table user_white_list_data (
	id                  	varchar(64)          not null            comment '序号',
	user_identity       	varchar(40)                              comment '用户身份',
	user_special_functions	varchar(200)                             comment '用户特殊功能',
	domain              	varchar(48)                              comment '域',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists sec_user_data;
create table sec_user_data (
	id                  	varchar(64)          not null            comment '序号',
	login               	varchar(20)                              comment '登录',
	mobile              	varchar(11)                              comment '手机',
	email               	varchar(76)                              comment '电子邮件',
	pwd                 	varchar(64)                              comment 'PWD',
	verification_code   	int                                      comment '验证码',
	verification_code_expire	datetime                                 comment '验证码过期',
	last_login_time     	datetime                                 comment '最后登录时间',
	domain              	varchar(48)                              comment '域',
	blocking            	varchar(48)                              comment '屏蔽',
	current_status      	varchar(28)                              comment '当前状态',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists sec_user_blocking_data;
create table sec_user_blocking_data (
	id                  	varchar(64)          not null            comment '序号',
	who                 	varchar(52)                              comment '谁',
	block_time          	datetime                                 comment '块时间',
	comments            	varchar(96)                              comment '评论',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists user_app_data;
create table user_app_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(300)                             comment '头衔',
	sec_user            	varchar(48)                              comment 'SEC的用户',
	app_icon            	varchar(36)                              comment '应用程序图标',
	full_access         	tinyint                                  comment '完全访问',
	permission          	varchar(16)                              comment '许可',
	object_type         	varchar(108)                             comment '对象类型',
	object_id           	varchar(40)                              comment '对象ID',
	location            	varchar(48)                              comment '位置',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists list_access_data;
create table list_access_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(200)                             comment '名称',
	internal_name       	varchar(200)                             comment '内部名称',
	read_permission     	tinyint                                  comment '读权限',
	create_permission   	tinyint                                  comment '创建权限',
	delete_permission   	tinyint                                  comment '删除权限',
	update_permission   	tinyint                                  comment '更新许可',
	execution_permission	tinyint                                  comment '执行权限',
	app                 	varchar(48)                              comment '应用程序',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists object_access_data;
create table object_access_data (
	id                  	varchar(64)          not null            comment '序号',
	name                	varchar(28)                              comment '名称',
	object_type         	varchar(112)                             comment '对象类型',
	list1               	varchar(80)                              comment '表',
	list2               	varchar(80)                              comment '清单',
	list3               	varchar(80)                              comment '目录3',
	list4               	varchar(80)                              comment '清单',
	list5               	varchar(80)                              comment '列表6',
	list6               	varchar(80)                              comment 'list6',
	list7               	varchar(80)                              comment 'list7',
	list8               	varchar(80)                              comment 'list8',
	list9               	varchar(80)                              comment 'list9',
	app                 	varchar(48)                              comment '应用程序',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists login_history_data;
create table login_history_data (
	id                  	varchar(64)          not null            comment '序号',
	login_time          	datetime                                 comment '登录时间',
	from_ip             	varchar(44)                              comment '从IP',
	description         	varchar(16)                              comment '描述',
	sec_user            	varchar(48)                              comment 'SEC的用户',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists generic_form_data;
create table generic_form_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(20)                              comment '头衔',
	description         	varchar(48)                              comment '描述',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists form_message_data;
create table form_message_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(24)                              comment '头衔',
	form                	varchar(48)                              comment '形式',
	level               	varchar(28)                              comment '水平',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists form_field_message_data;
create table form_field_message_data (
	id                  	varchar(64)          not null            comment '序号',
	title               	varchar(16)                              comment '头衔',
	parameter_name      	varchar(16)                              comment '参数名称',
	form                	varchar(48)                              comment '形式',
	level               	varchar(28)                              comment '水平',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists form_field_data;
create table form_field_data (
	id                  	varchar(64)          not null            comment '序号',
	label               	varchar(12)                              comment '标签',
	locale_key          	varchar(44)                              comment '语言环境的关键',
	parameter_name      	varchar(16)                              comment '参数名称',
	type                	varchar(36)                              comment '类型',
	form                	varchar(48)                              comment '形式',
	placeholder         	varchar(48)                              comment '占位符',
	default_value       	varchar(12)                              comment '默认值',
	description         	varchar(48)                              comment '描述',
	field_group         	varchar(16)                              comment '字段组',
	minimum_value       	varchar(60)                              comment '最小值',
	maximum_value       	varchar(72)                              comment '最大值',
	required            	tinyint                                  comment '要求',
	disabled            	tinyint                                  comment '禁用',
	custom_rendering    	tinyint                                  comment '自定义渲染',
	candidate_values    	varchar(12)                              comment '候选人的价值观',
	suggest_values      	varchar(12)                              comment '建议值',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;

drop table  if exists form_action_data;
create table form_action_data (
	id                  	varchar(64)          not null            comment '序号',
	label               	varchar(8)                               comment '标签',
	locale_key          	varchar(16)                              comment '语言环境的关键',
	action_key          	varchar(24)                              comment '行动的关键',
	level               	varchar(28)                              comment '水平',
	url                 	varchar(168)                             comment 'url',
	form                	varchar(48)                              comment '形式',
	version             	int                                      comment '版本',
	primary key(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE = utf8mb4_unicode_ci ;






	
insert into retail_store_country_center_data values ('RSCC000001','双链小超中国国运营中心','4000-800-','2018-12-26','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦','双链集团','张喜来','中国中心正式成立，恭喜恭喜','1');
insert into retail_store_country_center_data values ('RSCC000002','双链小超美国国运营中心','4000-800-0002','2017-08-19','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦0002','双链集团0002','张喜来','中国中心正式成立，恭喜恭喜0002','1');
insert into retail_store_country_center_data values ('RSCC000003','双链小超日本国运营中心','4000-800-0003','2017-05-26','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦0003','双链集团0003','张喜来','中国中心正式成立，恭喜恭喜0003','1');
insert into retail_store_country_center_data values ('RSCC000004','双链小超泰国国运营中心','4000-800-0004','2018-10-02','https://www.doublechaintech.com/','四川省成都市天府新区双链大厦0004','双链集团0004','张喜来','中国中心正式成立，恭喜恭喜0004','1');

	
insert into catalog_data values ('C000001','水果蔬菜','RSCC000001','1');
insert into catalog_data values ('C000002','肉禽蛋奶','RSCC000001','1');
insert into catalog_data values ('C000003','冷热速食','RSCC000001','1');
insert into catalog_data values ('C000004','休闲食品','RSCC000002','1');
insert into catalog_data values ('C000005','酒水饮料','RSCC000002','1');
insert into catalog_data values ('C000006','粮油调味','RSCC000003','1');
insert into catalog_data values ('C000007','清洁日化','RSCC000003','1');
insert into catalog_data values ('C000008','家居用品','RSCC000003','1');
insert into catalog_data values ('C000009','鲜花蛋糕','RSCC000004','1');
insert into catalog_data values ('C000010','医药健康','RSCC000004','1');

	
insert into level_one_category_data values ('LOC000001','C000001','水果蔬菜','1');
insert into level_one_category_data values ('LOC000002','C000002','肉禽蛋奶','1');
insert into level_one_category_data values ('LOC000003','C000003','冷热速食','1');
insert into level_one_category_data values ('LOC000004','C000004','休闲食品','1');
insert into level_one_category_data values ('LOC000005','C000005','酒水饮料','1');
insert into level_one_category_data values ('LOC000006','C000006','粮油调味','1');
insert into level_one_category_data values ('LOC000007','C000007','清洁日化','1');
insert into level_one_category_data values ('LOC000008','C000008','家居用品','1');
insert into level_one_category_data values ('LOC000009','C000009','鲜花蛋糕','1');
insert into level_one_category_data values ('LOC000010','C000010','医药健康','1');

	
insert into level_two_category_data values ('LTC000001','LOC000001','水果蔬菜','1');
insert into level_two_category_data values ('LTC000002','LOC000002','肉禽蛋奶','1');
insert into level_two_category_data values ('LTC000003','LOC000003','冷热速食','1');
insert into level_two_category_data values ('LTC000004','LOC000004','休闲食品','1');
insert into level_two_category_data values ('LTC000005','LOC000005','酒水饮料','1');
insert into level_two_category_data values ('LTC000006','LOC000006','粮油调味','1');
insert into level_two_category_data values ('LTC000007','LOC000007','清洁日化','1');
insert into level_two_category_data values ('LTC000008','LOC000008','家居用品','1');
insert into level_two_category_data values ('LTC000009','LOC000009','鲜花蛋糕','1');
insert into level_two_category_data values ('LTC000010','LOC000010','医药健康','1');

	
insert into level_three_category_data values ('LTC000001','LTC000001','水果蔬菜','1');
insert into level_three_category_data values ('LTC000002','LTC000001','肉禽蛋奶','1');
insert into level_three_category_data values ('LTC000003','LTC000002','冷热速食','1');
insert into level_three_category_data values ('LTC000004','LTC000002','休闲食品','1');
insert into level_three_category_data values ('LTC000005','LTC000003','酒水饮料','1');
insert into level_three_category_data values ('LTC000006','LTC000004','粮油调味','1');
insert into level_three_category_data values ('LTC000007','LTC000004','清洁日化','1');
insert into level_three_category_data values ('LTC000008','LTC000005','家居用品','1');
insert into level_three_category_data values ('LTC000009','LTC000006','鲜花蛋糕','1');
insert into level_three_category_data values ('LTC000010','LTC000006','医药健康','1');
insert into level_three_category_data values ('LTC000011','LTC000007','水果蔬菜','1');
insert into level_three_category_data values ('LTC000012','LTC000007','肉禽蛋奶','1');
insert into level_three_category_data values ('LTC000013','LTC000008','冷热速食','1');
insert into level_three_category_data values ('LTC000014','LTC000009','休闲食品','1');
insert into level_three_category_data values ('LTC000015','LTC000009','酒水饮料','1');
insert into level_three_category_data values ('LTC000016','LTC000010','粮油调味','1');

	
insert into product_data values ('P000001','啤酒','LTC000001','四川','可口可乐，销售百年的糖水，获得了全世界额青睐','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品','this is a looooooooooog.jpg','2018-12-30 04:02:51','1');
insert into product_data values ('P000002','可乐','LTC000001','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0002','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0002','this is a looooooooooog.jpg','2019-01-13 00:11:16','1');
insert into product_data values ('P000003','久久鸭','LTC000002','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0003','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0003','this is a looooooooooog.jpg','2019-01-15 06:46:25','1');
insert into product_data values ('P000004','啤酒','LTC000002','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0004','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0004','this is a looooooooooog.jpg','2018-12-29 03:42:04','1');
insert into product_data values ('P000005','可乐','LTC000003','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0005','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0005','this is a looooooooooog.jpg','2019-01-17 08:04:26','1');
insert into product_data values ('P000006','久久鸭','LTC000003','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0006','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0006','this is a looooooooooog.jpg','2019-01-03 09:02:18','1');
insert into product_data values ('P000007','啤酒','LTC000004','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0007','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0007','this is a looooooooooog.jpg','2019-01-10 06:57:57','1');
insert into product_data values ('P000008','可乐','LTC000004','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0008','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0008','this is a looooooooooog.jpg','2019-01-08 23:39:08','1');
insert into product_data values ('P000009','久久鸭','LTC000005','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0009','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0009','this is a looooooooooog.jpg','2019-01-10 10:59:55','1');
insert into product_data values ('P000010','啤酒','LTC000005','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0010','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0010','this is a looooooooooog.jpg','2019-01-08 21:59:52','1');
insert into product_data values ('P000011','可乐','LTC000006','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0011','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0011','this is a looooooooooog.jpg','2019-01-15 03:39:21','1');
insert into product_data values ('P000012','久久鸭','LTC000006','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0012','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0012','this is a looooooooooog.jpg','2018-12-30 13:43:43','1');
insert into product_data values ('P000013','啤酒','LTC000007','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0013','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0013','this is a looooooooooog.jpg','2019-01-09 13:44:17','1');
insert into product_data values ('P000014','可乐','LTC000007','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0014','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0014','this is a looooooooooog.jpg','2019-01-02 13:53:50','1');
insert into product_data values ('P000015','久久鸭','LTC000008','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0015','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0015','this is a looooooooooog.jpg','2019-01-13 02:03:40','1');
insert into product_data values ('P000016','啤酒','LTC000008','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0016','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0016','this is a looooooooooog.jpg','2019-01-07 04:50:43','1');
insert into product_data values ('P000017','可乐','LTC000009','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0017','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0017','this is a looooooooooog.jpg','2019-01-08 12:01:46','1');
insert into product_data values ('P000018','久久鸭','LTC000009','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0018','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0018','this is a looooooooooog.jpg','2019-01-09 22:13:44','1');
insert into product_data values ('P000019','啤酒','LTC000010','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0019','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0019','this is a looooooooooog.jpg','2019-01-10 00:39:10','1');
insert into product_data values ('P000020','可乐','LTC000010','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0020','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0020','this is a looooooooooog.jpg','2019-01-04 04:18:51','1');
insert into product_data values ('P000021','久久鸭','LTC000011','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0021','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0021','this is a looooooooooog.jpg','2019-01-01 05:55:25','1');
insert into product_data values ('P000022','啤酒','LTC000011','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0022','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0022','this is a looooooooooog.jpg','2019-01-12 05:31:23','1');
insert into product_data values ('P000023','可乐','LTC000012','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0023','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0023','this is a looooooooooog.jpg','2019-01-04 01:47:29','1');
insert into product_data values ('P000024','久久鸭','LTC000012','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0024','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0024','this is a looooooooooog.jpg','2019-01-18 07:34:05','1');
insert into product_data values ('P000025','啤酒','LTC000013','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0025','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0025','this is a looooooooooog.jpg','2019-01-17 09:56:55','1');
insert into product_data values ('P000026','可乐','LTC000013','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0026','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0026','this is a looooooooooog.jpg','2019-01-03 12:46:02','1');
insert into product_data values ('P000027','久久鸭','LTC000014','江苏','可口可乐，销售百年的糖水，获得了全世界额青睐0027','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0027','this is a looooooooooog.jpg','2019-01-05 20:36:53','1');
insert into product_data values ('P000028','啤酒','LTC000014','安徽','可口可乐，销售百年的糖水，获得了全世界额青睐0028','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0028','this is a looooooooooog.jpg','2018-12-27 22:19:41','1');
insert into product_data values ('P000029','可乐','LTC000015','日本','可口可乐，销售百年的糖水，获得了全世界额青睐0029','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0029','this is a looooooooooog.jpg','2019-01-02 03:41:38','1');
insert into product_data values ('P000030','久久鸭','LTC000015','法国','可口可乐，销售百年的糖水，获得了全世界额青睐0030','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0030','this is a looooooooooog.jpg','2019-01-12 21:51:12','1');
insert into product_data values ('P000031','啤酒','LTC000016','四川','可口可乐，销售百年的糖水，获得了全世界额青睐0031','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0031','this is a looooooooooog.jpg','2019-01-01 09:09:01','1');
insert into product_data values ('P000032','可乐','LTC000016','广东','可口可乐，销售百年的糖水，获得了全世界额青睐0032','品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品牌品0032','this is a looooooooooog.jpg','2018-12-28 13:50:05','1');

	
insert into sku_data values ('S000001','可乐-大罐的','大','P000001','TM00000000001','包装类型','包装数量等信息,包装数量等信息,包装数量等信息','1099.14','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000002','可乐-大罐的0002','中','P000001','TM000000000010002','包装类型0002','包装数量等信息,包装数量等信息,包装数量等信息0002','1094.50','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000003','可乐-大罐的0003','小','P000002','TM000000000010003','包装类型0003','包装数量等信息,包装数量等信息,包装数量等信息0003','1209.70','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000004','可乐-大罐的0004','大','P000002','TM000000000010004','包装类型0004','包装数量等信息,包装数量等信息,包装数量等信息0004','1257.06','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000005','可乐-大罐的0005','中','P000003','TM000000000010005','包装类型0005','包装数量等信息,包装数量等信息,包装数量等信息0005','979.89','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000006','可乐-大罐的0006','小','P000003','TM000000000010006','包装类型0006','包装数量等信息,包装数量等信息,包装数量等信息0006','944.14','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000007','可乐-大罐的0007','大','P000004','TM000000000010007','包装类型0007','包装数量等信息,包装数量等信息,包装数量等信息0007','1248.96','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000008','可乐-大罐的0008','中','P000004','TM000000000010008','包装类型0008','包装数量等信息,包装数量等信息,包装数量等信息0008','1121.99','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000009','可乐-大罐的0009','小','P000005','TM000000000010009','包装类型0009','包装数量等信息,包装数量等信息,包装数量等信息0009','1282.52','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000010','可乐-大罐的0010','大','P000005','TM000000000010010','包装类型0010','包装数量等信息,包装数量等信息,包装数量等信息0010','1283.84','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000011','可乐-大罐的0011','中','P000006','TM000000000010011','包装类型0011','包装数量等信息,包装数量等信息,包装数量等信息0011','930.05','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000012','可乐-大罐的0012','小','P000006','TM000000000010012','包装类型0012','包装数量等信息,包装数量等信息,包装数量等信息0012','1235.01','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000013','可乐-大罐的0013','大','P000007','TM000000000010013','包装类型0013','包装数量等信息,包装数量等信息,包装数量等信息0013','1260.84','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000014','可乐-大罐的0014','中','P000007','TM000000000010014','包装类型0014','包装数量等信息,包装数量等信息,包装数量等信息0014','1174.26','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000015','可乐-大罐的0015','小','P000008','TM000000000010015','包装类型0015','包装数量等信息,包装数量等信息,包装数量等信息0015','1304.51','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000016','可乐-大罐的0016','大','P000008','TM000000000010016','包装类型0016','包装数量等信息,包装数量等信息,包装数量等信息0016','988.95','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000017','可乐-大罐的0017','中','P000009','TM000000000010017','包装类型0017','包装数量等信息,包装数量等信息,包装数量等信息0017','1008.75','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000018','可乐-大罐的0018','小','P000009','TM000000000010018','包装类型0018','包装数量等信息,包装数量等信息,包装数量等信息0018','1123.83','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000019','可乐-大罐的0019','大','P000010','TM000000000010019','包装类型0019','包装数量等信息,包装数量等信息,包装数量等信息0019','1101.66','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000020','可乐-大罐的0020','中','P000010','TM000000000010020','包装类型0020','包装数量等信息,包装数量等信息,包装数量等信息0020','1159.52','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000021','可乐-大罐的0021','小','P000011','TM000000000010021','包装类型0021','包装数量等信息,包装数量等信息,包装数量等信息0021','967.36','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000022','可乐-大罐的0022','大','P000011','TM000000000010022','包装类型0022','包装数量等信息,包装数量等信息,包装数量等信息0022','1321.03','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000023','可乐-大罐的0023','中','P000012','TM000000000010023','包装类型0023','包装数量等信息,包装数量等信息,包装数量等信息0023','1319.10','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000024','可乐-大罐的0024','小','P000012','TM000000000010024','包装类型0024','包装数量等信息,包装数量等信息,包装数量等信息0024','1213.69','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000025','可乐-大罐的0025','大','P000013','TM000000000010025','包装类型0025','包装数量等信息,包装数量等信息,包装数量等信息0025','1084.35','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000026','可乐-大罐的0026','中','P000013','TM000000000010026','包装类型0026','包装数量等信息,包装数量等信息,包装数量等信息0026','1219.84','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000027','可乐-大罐的0027','小','P000014','TM000000000010027','包装类型0027','包装数量等信息,包装数量等信息,包装数量等信息0027','1303.06','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000028','可乐-大罐的0028','大','P000014','TM000000000010028','包装类型0028','包装数量等信息,包装数量等信息,包装数量等信息0028','974.66','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000029','可乐-大罐的0029','中','P000015','TM000000000010029','包装类型0029','包装数量等信息,包装数量等信息,包装数量等信息0029','978.56','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000030','可乐-大罐的0030','小','P000015','TM000000000010030','包装类型0030','包装数量等信息,包装数量等信息,包装数量等信息0030','1055.51','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000031','可乐-大罐的0031','大','P000016','TM000000000010031','包装类型0031','包装数量等信息,包装数量等信息,包装数量等信息0031','1295.87','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000032','可乐-大罐的0032','中','P000016','TM000000000010032','包装类型0032','包装数量等信息,包装数量等信息,包装数量等信息0032','1316.22','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000033','可乐-大罐的0033','小','P000017','TM000000000010033','包装类型0033','包装数量等信息,包装数量等信息,包装数量等信息0033','1012.36','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000034','可乐-大罐的0034','大','P000017','TM000000000010034','包装类型0034','包装数量等信息,包装数量等信息,包装数量等信息0034','1065.40','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000035','可乐-大罐的0035','中','P000018','TM000000000010035','包装类型0035','包装数量等信息,包装数量等信息,包装数量等信息0035','1076.67','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000036','可乐-大罐的0036','小','P000018','TM000000000010036','包装类型0036','包装数量等信息,包装数量等信息,包装数量等信息0036','1168.80','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000037','可乐-大罐的0037','大','P000019','TM000000000010037','包装类型0037','包装数量等信息,包装数量等信息,包装数量等信息0037','1272.71','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000038','可乐-大罐的0038','中','P000019','TM000000000010038','包装类型0038','包装数量等信息,包装数量等信息,包装数量等信息0038','935.97','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000039','可乐-大罐的0039','小','P000020','TM000000000010039','包装类型0039','包装数量等信息,包装数量等信息,包装数量等信息0039','990.56','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000040','可乐-大罐的0040','大','P000020','TM000000000010040','包装类型0040','包装数量等信息,包装数量等信息,包装数量等信息0040','1286.67','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000041','可乐-大罐的0041','中','P000021','TM000000000010041','包装类型0041','包装数量等信息,包装数量等信息,包装数量等信息0041','1032.96','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000042','可乐-大罐的0042','小','P000021','TM000000000010042','包装类型0042','包装数量等信息,包装数量等信息,包装数量等信息0042','1238.80','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000043','可乐-大罐的0043','大','P000022','TM000000000010043','包装类型0043','包装数量等信息,包装数量等信息,包装数量等信息0043','1272.23','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000044','可乐-大罐的0044','中','P000022','TM000000000010044','包装类型0044','包装数量等信息,包装数量等信息,包装数量等信息0044','1311.15','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000045','可乐-大罐的0045','小','P000023','TM000000000010045','包装类型0045','包装数量等信息,包装数量等信息,包装数量等信息0045','1020.96','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000046','可乐-大罐的0046','大','P000023','TM000000000010046','包装类型0046','包装数量等信息,包装数量等信息,包装数量等信息0046','1147.78','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000047','可乐-大罐的0047','中','P000024','TM000000000010047','包装类型0047','包装数量等信息,包装数量等信息,包装数量等信息0047','998.97','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000048','可乐-大罐的0048','小','P000024','TM000000000010048','包装类型0048','包装数量等信息,包装数量等信息,包装数量等信息0048','1021.83','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000049','可乐-大罐的0049','大','P000025','TM000000000010049','包装类型0049','包装数量等信息,包装数量等信息,包装数量等信息0049','1180.15','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000050','可乐-大罐的0050','中','P000025','TM000000000010050','包装类型0050','包装数量等信息,包装数量等信息,包装数量等信息0050','1131.35','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000051','可乐-大罐的0051','小','P000026','TM000000000010051','包装类型0051','包装数量等信息,包装数量等信息,包装数量等信息0051','993.10','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000052','可乐-大罐的0052','大','P000026','TM000000000010052','包装类型0052','包装数量等信息,包装数量等信息,包装数量等信息0052','1164.88','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000053','可乐-大罐的0053','中','P000027','TM000000000010053','包装类型0053','包装数量等信息,包装数量等信息,包装数量等信息0053','928.55','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000054','可乐-大罐的0054','小','P000027','TM000000000010054','包装类型0054','包装数量等信息,包装数量等信息,包装数量等信息0054','1198.74','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000055','可乐-大罐的0055','大','P000028','TM000000000010055','包装类型0055','包装数量等信息,包装数量等信息,包装数量等信息0055','1242.18','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000056','可乐-大罐的0056','中','P000028','TM000000000010056','包装类型0056','包装数量等信息,包装数量等信息,包装数量等信息0056','1050.26','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000057','可乐-大罐的0057','小','P000029','TM000000000010057','包装类型0057','包装数量等信息,包装数量等信息,包装数量等信息0057','1142.87','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000058','可乐-大罐的0058','大','P000029','TM000000000010058','包装类型0058','包装数量等信息,包装数量等信息,包装数量等信息0058','946.02','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000059','可乐-大罐的0059','中','P000030','TM000000000010059','包装类型0059','包装数量等信息,包装数量等信息,包装数量等信息0059','955.83','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000060','可乐-大罐的0060','小','P000030','TM000000000010060','包装类型0060','包装数量等信息,包装数量等信息,包装数量等信息0060','1279.73','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000061','可乐-大罐的0061','大','P000031','TM000000000010061','包装类型0061','包装数量等信息,包装数量等信息,包装数量等信息0061','1041.95','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000062','可乐-大罐的0062','中','P000031','TM000000000010062','包装类型0062','包装数量等信息,包装数量等信息,包装数量等信息0062','1120.59','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000063','可乐-大罐的0063','小','P000032','TM000000000010063','包装类型0063','包装数量等信息,包装数量等信息,包装数量等信息0063','1060.06','this is a loooooooooooooooog.jpg','1');
insert into sku_data values ('S000064','可乐-大罐的0064','大','P000032','TM000000000010064','包装类型0064','包装数量等信息,包装数量等信息,包装数量等信息0064','1201.01','this is a loooooooooooooooog.jpg','1');

	
insert into retail_store_province_center_data values ('RSPC000001','双链小超四川省运营中心','2018-02-19','RSCC000001','2019-01-07 20:00:05','1');
insert into retail_store_province_center_data values ('RSPC000002','双链小超北京运营中心','2018-11-18','RSCC000003','2019-01-11 08:18:03','1');

	
insert into province_center_department_data values ('PCD000001','供应链部','2018-03-21','RSPC000001','刘强','1');
insert into province_center_department_data values ('PCD000002','采购部','2018-01-29','RSPC000001','王德宏','1');
insert into province_center_department_data values ('PCD000003','管理部','2018-01-31','RSPC000001','刘强','1');
insert into province_center_department_data values ('PCD000004','财务部','2016-02-13','RSPC000001','王德宏','1');
insert into province_center_department_data values ('PCD000005','法务部','2017-01-20','RSPC000002','刘强','1');
insert into province_center_department_data values ('PCD000006','市场部','2018-08-18','RSPC000002','王德宏','1');
insert into province_center_department_data values ('PCD000007','人力资源部','2016-12-11','RSPC000002','刘强','1');

	
insert into province_center_employee_data values ('PCE000001','刘强','13999998888','wangdehong@yatang.cn','2019-01-04','PCD000001','RSPC000001','1');
insert into province_center_employee_data values ('PCE000002','王德宏','13900000002','liuqiang@yatang.cn','2017-04-03','PCD000001','RSPC000001','1');
insert into province_center_employee_data values ('PCE000003','刘强','13900000003','wangdehong@yatang.cn','2017-04-06','PCD000002','RSPC000001','1');
insert into province_center_employee_data values ('PCE000004','王德宏','13900000004','liuqiang@yatang.cn','2017-04-04','PCD000003','RSPC000001','1');
insert into province_center_employee_data values ('PCE000005','刘强','13900000005','wangdehong@yatang.cn','2016-08-19','PCD000004','RSPC000002','1');
insert into province_center_employee_data values ('PCE000006','王德宏','13900000006','liuqiang@yatang.cn','2018-02-24','PCD000005','RSPC000002','1');
insert into province_center_employee_data values ('PCE000007','刘强','13900000007','wangdehong@yatang.cn','2018-01-25','PCD000006','RSPC000002','1');
insert into province_center_employee_data values ('PCE000008','王德宏','13900000008','liuqiang@yatang.cn','2017-06-12','PCD000007','RSPC000002','1');

	
insert into retail_store_city_service_center_data values ('RSCSC000001','双链小超成都办事处','2016-07-12','RSPC000001','2019-01-06 07:02:30','1');
insert into retail_store_city_service_center_data values ('RSCSC000002','双链小超绵阳办事处','2016-01-30','RSPC000001','2018-12-30 17:45:08','1');
insert into retail_store_city_service_center_data values ('RSCSC000003','双链小超巴中办事处','2016-05-07','RSPC000002','2018-12-28 01:56:55','1');
insert into retail_store_city_service_center_data values ('RSCSC000004','双链小超成都办事处','2017-02-28','RSPC000002','2019-01-10 01:32:17','1');

	
insert into city_partner_data values ('CP000001','曾倩','13677778888','RSCSC000001','负责开拓市场，具有极强的开拓能力','2018-12-31 21:14:33','1');
insert into city_partner_data values ('CP000002','黄风格','13900000002','RSCSC000001','负责开拓市场，具有极强的开拓能力0002','2019-01-15 15:03:53','1');
insert into city_partner_data values ('CP000003','郭超','13900000003','RSCSC000002','负责开拓市场，具有极强的开拓能力0003','2019-01-06 22:23:07','1');
insert into city_partner_data values ('CP000004','曾倩','13900000004','RSCSC000002','负责开拓市场，具有极强的开拓能力0004','2019-01-14 23:16:51','1');
insert into city_partner_data values ('CP000005','黄风格','13900000005','RSCSC000003','负责开拓市场，具有极强的开拓能力0005','2019-01-02 07:00:48','1');
insert into city_partner_data values ('CP000006','郭超','13900000006','RSCSC000003','负责开拓市场，具有极强的开拓能力0006','2019-01-01 11:16:59','1');
insert into city_partner_data values ('CP000007','曾倩','13900000007','RSCSC000004','负责开拓市场，具有极强的开拓能力0007','2019-01-16 14:56:41','1');
insert into city_partner_data values ('CP000008','黄风格','13900000008','RSCSC000004','负责开拓市场，具有极强的开拓能力0008','2019-01-10 09:41:03','1');

	
insert into potential_customer_data values ('PC000001','曾倩','13677778888','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力','2019-01-14 18:39:01','1');
insert into potential_customer_data values ('PC000002','黄风格','13900000002','RSCSC000001','CP000001','负责开拓市场，具有极强的开拓能力0002','2019-01-11 15:19:52','1');
insert into potential_customer_data values ('PC000003','郭超','13900000003','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0003','2019-01-04 07:13:31','1');
insert into potential_customer_data values ('PC000004','曾倩','13900000004','RSCSC000001','CP000002','负责开拓市场，具有极强的开拓能力0004','2019-01-02 17:29:27','1');
insert into potential_customer_data values ('PC000005','黄风格','13900000005','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0005','2019-01-14 07:36:46','1');
insert into potential_customer_data values ('PC000006','郭超','13900000006','RSCSC000002','CP000003','负责开拓市场，具有极强的开拓能力0006','2019-01-13 00:50:06','1');
insert into potential_customer_data values ('PC000007','曾倩','13900000007','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0007','2019-01-17 07:59:20','1');
insert into potential_customer_data values ('PC000008','黄风格','13900000008','RSCSC000002','CP000004','负责开拓市场，具有极强的开拓能力0008','2019-01-17 00:32:55','1');
insert into potential_customer_data values ('PC000009','郭超','13900000009','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0009','2019-01-13 02:28:54','1');
insert into potential_customer_data values ('PC000010','曾倩','13900000010','RSCSC000003','CP000005','负责开拓市场，具有极强的开拓能力0010','2019-01-10 05:51:20','1');
insert into potential_customer_data values ('PC000011','黄风格','13900000011','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0011','2019-01-17 02:11:26','1');
insert into potential_customer_data values ('PC000012','郭超','13900000012','RSCSC000003','CP000006','负责开拓市场，具有极强的开拓能力0012','2019-01-14 15:40:45','1');
insert into potential_customer_data values ('PC000013','曾倩','13900000013','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0013','2019-01-16 11:52:15','1');
insert into potential_customer_data values ('PC000014','黄风格','13900000014','RSCSC000004','CP000007','负责开拓市场，具有极强的开拓能力0014','2019-01-07 19:21:38','1');
insert into potential_customer_data values ('PC000015','郭超','13900000015','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0015','2018-12-31 14:25:23','1');
insert into potential_customer_data values ('PC000016','曾倩','13900000016','RSCSC000004','CP000008','负责开拓市场，具有极强的开拓能力0016','2019-01-06 09:57:37','1');

	
insert into potential_customer_contact_person_data values ('PCCP000001','赵先生','13677778888','PC000001','这人在决策中战友较大的权重，密切观察中.....','1');
insert into potential_customer_contact_person_data values ('PCCP000002','赵先生0002','13900000002','PC000001','这人在决策中战友较大的权重，密切观察中.....0002','1');
insert into potential_customer_contact_person_data values ('PCCP000003','赵先生0003','13900000003','PC000002','这人在决策中战友较大的权重，密切观察中.....0003','1');
insert into potential_customer_contact_person_data values ('PCCP000004','赵先生0004','13900000004','PC000002','这人在决策中战友较大的权重，密切观察中.....0004','1');
insert into potential_customer_contact_person_data values ('PCCP000005','赵先生0005','13900000005','PC000003','这人在决策中战友较大的权重，密切观察中.....0005','1');
insert into potential_customer_contact_person_data values ('PCCP000006','赵先生0006','13900000006','PC000003','这人在决策中战友较大的权重，密切观察中.....0006','1');
insert into potential_customer_contact_person_data values ('PCCP000007','赵先生0007','13900000007','PC000004','这人在决策中战友较大的权重，密切观察中.....0007','1');
insert into potential_customer_contact_person_data values ('PCCP000008','赵先生0008','13900000008','PC000004','这人在决策中战友较大的权重，密切观察中.....0008','1');
insert into potential_customer_contact_person_data values ('PCCP000009','赵先生0009','13900000009','PC000005','这人在决策中战友较大的权重，密切观察中.....0009','1');
insert into potential_customer_contact_person_data values ('PCCP000010','赵先生0010','13900000010','PC000005','这人在决策中战友较大的权重，密切观察中.....0010','1');
insert into potential_customer_contact_person_data values ('PCCP000011','赵先生0011','13900000011','PC000006','这人在决策中战友较大的权重，密切观察中.....0011','1');
insert into potential_customer_contact_person_data values ('PCCP000012','赵先生0012','13900000012','PC000006','这人在决策中战友较大的权重，密切观察中.....0012','1');
insert into potential_customer_contact_person_data values ('PCCP000013','赵先生0013','13900000013','PC000007','这人在决策中战友较大的权重，密切观察中.....0013','1');
insert into potential_customer_contact_person_data values ('PCCP000014','赵先生0014','13900000014','PC000007','这人在决策中战友较大的权重，密切观察中.....0014','1');
insert into potential_customer_contact_person_data values ('PCCP000015','赵先生0015','13900000015','PC000008','这人在决策中战友较大的权重，密切观察中.....0015','1');
insert into potential_customer_contact_person_data values ('PCCP000016','赵先生0016','13900000016','PC000008','这人在决策中战友较大的权重，密切观察中.....0016','1');
insert into potential_customer_contact_person_data values ('PCCP000017','赵先生0017','13900000017','PC000009','这人在决策中战友较大的权重，密切观察中.....0017','1');
insert into potential_customer_contact_person_data values ('PCCP000018','赵先生0018','13900000018','PC000009','这人在决策中战友较大的权重，密切观察中.....0018','1');
insert into potential_customer_contact_person_data values ('PCCP000019','赵先生0019','13900000019','PC000010','这人在决策中战友较大的权重，密切观察中.....0019','1');
insert into potential_customer_contact_person_data values ('PCCP000020','赵先生0020','13900000020','PC000010','这人在决策中战友较大的权重，密切观察中.....0020','1');
insert into potential_customer_contact_person_data values ('PCCP000021','赵先生0021','13900000021','PC000011','这人在决策中战友较大的权重，密切观察中.....0021','1');
insert into potential_customer_contact_person_data values ('PCCP000022','赵先生0022','13900000022','PC000011','这人在决策中战友较大的权重，密切观察中.....0022','1');
insert into potential_customer_contact_person_data values ('PCCP000023','赵先生0023','13900000023','PC000012','这人在决策中战友较大的权重，密切观察中.....0023','1');
insert into potential_customer_contact_person_data values ('PCCP000024','赵先生0024','13900000024','PC000012','这人在决策中战友较大的权重，密切观察中.....0024','1');
insert into potential_customer_contact_person_data values ('PCCP000025','赵先生0025','13900000025','PC000013','这人在决策中战友较大的权重，密切观察中.....0025','1');
insert into potential_customer_contact_person_data values ('PCCP000026','赵先生0026','13900000026','PC000013','这人在决策中战友较大的权重，密切观察中.....0026','1');
insert into potential_customer_contact_person_data values ('PCCP000027','赵先生0027','13900000027','PC000014','这人在决策中战友较大的权重，密切观察中.....0027','1');
insert into potential_customer_contact_person_data values ('PCCP000028','赵先生0028','13900000028','PC000014','这人在决策中战友较大的权重，密切观察中.....0028','1');
insert into potential_customer_contact_person_data values ('PCCP000029','赵先生0029','13900000029','PC000015','这人在决策中战友较大的权重，密切观察中.....0029','1');
insert into potential_customer_contact_person_data values ('PCCP000030','赵先生0030','13900000030','PC000015','这人在决策中战友较大的权重，密切观察中.....0030','1');
insert into potential_customer_contact_person_data values ('PCCP000031','赵先生0031','13900000031','PC000016','这人在决策中战友较大的权重，密切观察中.....0031','1');
insert into potential_customer_contact_person_data values ('PCCP000032','赵先生0032','13900000032','PC000016','这人在决策中战友较大的权重，密切观察中.....0032','1');

	
insert into potential_customer_contact_data values ('PCC000001','和连载客户的联系记录','2018-02-02','电话','PC000001','CP000001','PCCP000001','转化希望很大','2019-01-16 06:42:40','1');
insert into potential_customer_contact_data values ('PCC000002','和连载客户的联系记录0002','2018-05-26','短信','PC000001','CP000001','PCCP000001','转化希望很大0002','2019-01-15 09:59:33','1');
insert into potential_customer_contact_data values ('PCC000003','和连载客户的联系记录0003','2016-10-15','登门拜访','PC000001','CP000001','PCCP000002','转化希望很大0003','2019-01-06 19:34:29','1');
insert into potential_customer_contact_data values ('PCC000004','和连载客户的联系记录0004','2018-08-19','活动聊天','PC000001','CP000001','PCCP000002','转化希望很大0004','2019-01-10 05:50:09','1');
insert into potential_customer_contact_data values ('PCC000005','和连载客户的联系记录0005','2016-09-01','电话','PC000002','CP000001','PCCP000003','转化希望很大0005','2018-12-29 03:32:13','1');
insert into potential_customer_contact_data values ('PCC000006','和连载客户的联系记录0006','2017-06-18','短信','PC000002','CP000001','PCCP000003','转化希望很大0006','2019-01-04 11:42:31','1');
insert into potential_customer_contact_data values ('PCC000007','和连载客户的联系记录0007','2016-08-23','登门拜访','PC000002','CP000001','PCCP000004','转化希望很大0007','2019-01-08 19:04:04','1');
insert into potential_customer_contact_data values ('PCC000008','和连载客户的联系记录0008','2018-01-14','活动聊天','PC000002','CP000001','PCCP000004','转化希望很大0008','2019-01-06 09:54:05','1');
insert into potential_customer_contact_data values ('PCC000009','和连载客户的联系记录0009','2017-02-11','电话','PC000003','CP000002','PCCP000005','转化希望很大0009','2019-01-02 19:36:52','1');
insert into potential_customer_contact_data values ('PCC000010','和连载客户的联系记录0010','2016-09-16','短信','PC000003','CP000002','PCCP000005','转化希望很大0010','2019-01-01 00:25:15','1');
insert into potential_customer_contact_data values ('PCC000011','和连载客户的联系记录0011','2016-07-15','登门拜访','PC000003','CP000002','PCCP000006','转化希望很大0011','2019-01-16 22:01:09','1');
insert into potential_customer_contact_data values ('PCC000012','和连载客户的联系记录0012','2017-04-24','活动聊天','PC000003','CP000002','PCCP000006','转化希望很大0012','2019-01-13 14:40:55','1');
insert into potential_customer_contact_data values ('PCC000013','和连载客户的联系记录0013','2016-11-08','电话','PC000004','CP000002','PCCP000007','转化希望很大0013','2019-01-07 20:01:38','1');
insert into potential_customer_contact_data values ('PCC000014','和连载客户的联系记录0014','2018-02-22','短信','PC000004','CP000002','PCCP000007','转化希望很大0014','2018-12-30 00:41:34','1');
insert into potential_customer_contact_data values ('PCC000015','和连载客户的联系记录0015','2016-07-18','登门拜访','PC000004','CP000002','PCCP000008','转化希望很大0015','2019-01-10 19:19:59','1');
insert into potential_customer_contact_data values ('PCC000016','和连载客户的联系记录0016','2017-08-13','活动聊天','PC000004','CP000002','PCCP000008','转化希望很大0016','2019-01-06 12:00:44','1');
insert into potential_customer_contact_data values ('PCC000017','和连载客户的联系记录0017','2017-06-20','电话','PC000005','CP000003','PCCP000009','转化希望很大0017','2019-01-10 08:25:19','1');
insert into potential_customer_contact_data values ('PCC000018','和连载客户的联系记录0018','2016-10-04','短信','PC000005','CP000003','PCCP000009','转化希望很大0018','2019-01-05 14:08:50','1');
insert into potential_customer_contact_data values ('PCC000019','和连载客户的联系记录0019','2018-05-25','登门拜访','PC000005','CP000003','PCCP000010','转化希望很大0019','2019-01-05 05:00:12','1');
insert into potential_customer_contact_data values ('PCC000020','和连载客户的联系记录0020','2018-08-29','活动聊天','PC000005','CP000003','PCCP000010','转化希望很大0020','2018-12-27 21:32:41','1');
insert into potential_customer_contact_data values ('PCC000021','和连载客户的联系记录0021','2017-10-16','电话','PC000006','CP000003','PCCP000011','转化希望很大0021','2019-01-04 13:53:03','1');
insert into potential_customer_contact_data values ('PCC000022','和连载客户的联系记录0022','2016-05-11','短信','PC000006','CP000003','PCCP000011','转化希望很大0022','2019-01-17 07:09:24','1');
insert into potential_customer_contact_data values ('PCC000023','和连载客户的联系记录0023','2018-08-31','登门拜访','PC000006','CP000003','PCCP000012','转化希望很大0023','2019-01-13 17:55:42','1');
insert into potential_customer_contact_data values ('PCC000024','和连载客户的联系记录0024','2018-02-27','活动聊天','PC000006','CP000003','PCCP000012','转化希望很大0024','2019-01-18 14:18:50','1');
insert into potential_customer_contact_data values ('PCC000025','和连载客户的联系记录0025','2017-06-05','电话','PC000007','CP000004','PCCP000013','转化希望很大0025','2019-01-08 05:38:40','1');
insert into potential_customer_contact_data values ('PCC000026','和连载客户的联系记录0026','2018-03-30','短信','PC000007','CP000004','PCCP000013','转化希望很大0026','2019-01-14 21:41:54','1');
insert into potential_customer_contact_data values ('PCC000027','和连载客户的联系记录0027','2018-04-25','登门拜访','PC000007','CP000004','PCCP000014','转化希望很大0027','2019-01-04 08:59:22','1');
insert into potential_customer_contact_data values ('PCC000028','和连载客户的联系记录0028','2018-04-05','活动聊天','PC000007','CP000004','PCCP000014','转化希望很大0028','2018-12-30 19:25:30','1');
insert into potential_customer_contact_data values ('PCC000029','和连载客户的联系记录0029','2016-07-23','电话','PC000008','CP000004','PCCP000015','转化希望很大0029','2018-12-28 10:19:57','1');
insert into potential_customer_contact_data values ('PCC000030','和连载客户的联系记录0030','2018-12-15','短信','PC000008','CP000004','PCCP000015','转化希望很大0030','2019-01-17 13:08:35','1');
insert into potential_customer_contact_data values ('PCC000031','和连载客户的联系记录0031','2018-06-18','登门拜访','PC000008','CP000004','PCCP000016','转化希望很大0031','2019-01-04 09:24:27','1');
insert into potential_customer_contact_data values ('PCC000032','和连载客户的联系记录0032','2017-03-02','活动聊天','PC000008','CP000004','PCCP000016','转化希望很大0032','2019-01-16 10:08:00','1');
insert into potential_customer_contact_data values ('PCC000033','和连载客户的联系记录0033','2016-10-01','电话','PC000009','CP000005','PCCP000017','转化希望很大0033','2019-01-09 02:41:35','1');
insert into potential_customer_contact_data values ('PCC000034','和连载客户的联系记录0034','2018-04-11','短信','PC000009','CP000005','PCCP000017','转化希望很大0034','2019-01-02 16:32:24','1');
insert into potential_customer_contact_data values ('PCC000035','和连载客户的联系记录0035','2017-10-20','登门拜访','PC000009','CP000005','PCCP000018','转化希望很大0035','2019-01-14 14:59:50','1');
insert into potential_customer_contact_data values ('PCC000036','和连载客户的联系记录0036','2018-12-15','活动聊天','PC000009','CP000005','PCCP000018','转化希望很大0036','2019-01-01 04:58:36','1');
insert into potential_customer_contact_data values ('PCC000037','和连载客户的联系记录0037','2016-02-10','电话','PC000010','CP000005','PCCP000019','转化希望很大0037','2019-01-18 16:04:47','1');
insert into potential_customer_contact_data values ('PCC000038','和连载客户的联系记录0038','2018-04-09','短信','PC000010','CP000005','PCCP000019','转化希望很大0038','2019-01-06 23:10:00','1');
insert into potential_customer_contact_data values ('PCC000039','和连载客户的联系记录0039','2019-01-12','登门拜访','PC000010','CP000005','PCCP000020','转化希望很大0039','2019-01-11 01:07:51','1');
insert into potential_customer_contact_data values ('PCC000040','和连载客户的联系记录0040','2017-04-05','活动聊天','PC000010','CP000005','PCCP000020','转化希望很大0040','2019-01-04 10:13:54','1');
insert into potential_customer_contact_data values ('PCC000041','和连载客户的联系记录0041','2016-12-16','电话','PC000011','CP000006','PCCP000021','转化希望很大0041','2019-01-16 01:38:32','1');
insert into potential_customer_contact_data values ('PCC000042','和连载客户的联系记录0042','2018-12-23','短信','PC000011','CP000006','PCCP000021','转化希望很大0042','2019-01-05 23:42:18','1');
insert into potential_customer_contact_data values ('PCC000043','和连载客户的联系记录0043','2016-04-11','登门拜访','PC000011','CP000006','PCCP000022','转化希望很大0043','2019-01-11 00:13:38','1');
insert into potential_customer_contact_data values ('PCC000044','和连载客户的联系记录0044','2017-04-15','活动聊天','PC000011','CP000006','PCCP000022','转化希望很大0044','2019-01-04 07:45:17','1');
insert into potential_customer_contact_data values ('PCC000045','和连载客户的联系记录0045','2016-12-15','电话','PC000012','CP000006','PCCP000023','转化希望很大0045','2019-01-08 13:19:26','1');
insert into potential_customer_contact_data values ('PCC000046','和连载客户的联系记录0046','2017-02-02','短信','PC000012','CP000006','PCCP000023','转化希望很大0046','2019-01-08 18:36:50','1');
insert into potential_customer_contact_data values ('PCC000047','和连载客户的联系记录0047','2017-04-18','登门拜访','PC000012','CP000006','PCCP000024','转化希望很大0047','2019-01-11 12:11:07','1');
insert into potential_customer_contact_data values ('PCC000048','和连载客户的联系记录0048','2017-06-07','活动聊天','PC000012','CP000006','PCCP000024','转化希望很大0048','2019-01-01 14:04:28','1');
insert into potential_customer_contact_data values ('PCC000049','和连载客户的联系记录0049','2018-04-08','电话','PC000013','CP000007','PCCP000025','转化希望很大0049','2019-01-11 23:10:57','1');
insert into potential_customer_contact_data values ('PCC000050','和连载客户的联系记录0050','2017-09-15','短信','PC000013','CP000007','PCCP000025','转化希望很大0050','2018-12-28 16:27:38','1');
insert into potential_customer_contact_data values ('PCC000051','和连载客户的联系记录0051','2016-12-29','登门拜访','PC000013','CP000007','PCCP000026','转化希望很大0051','2019-01-06 14:22:23','1');
insert into potential_customer_contact_data values ('PCC000052','和连载客户的联系记录0052','2016-05-23','活动聊天','PC000013','CP000007','PCCP000026','转化希望很大0052','2018-12-29 12:48:21','1');
insert into potential_customer_contact_data values ('PCC000053','和连载客户的联系记录0053','2018-04-03','电话','PC000014','CP000007','PCCP000027','转化希望很大0053','2019-01-10 12:33:10','1');
insert into potential_customer_contact_data values ('PCC000054','和连载客户的联系记录0054','2018-12-30','短信','PC000014','CP000007','PCCP000027','转化希望很大0054','2019-01-07 04:22:42','1');
insert into potential_customer_contact_data values ('PCC000055','和连载客户的联系记录0055','2016-07-11','登门拜访','PC000014','CP000007','PCCP000028','转化希望很大0055','2019-01-11 20:23:28','1');
insert into potential_customer_contact_data values ('PCC000056','和连载客户的联系记录0056','2016-07-11','活动聊天','PC000014','CP000007','PCCP000028','转化希望很大0056','2019-01-16 17:50:29','1');
insert into potential_customer_contact_data values ('PCC000057','和连载客户的联系记录0057','2017-09-26','电话','PC000015','CP000008','PCCP000029','转化希望很大0057','2019-01-01 21:33:50','1');
insert into potential_customer_contact_data values ('PCC000058','和连载客户的联系记录0058','2017-05-23','短信','PC000015','CP000008','PCCP000029','转化希望很大0058','2019-01-05 03:48:55','1');
insert into potential_customer_contact_data values ('PCC000059','和连载客户的联系记录0059','2018-01-05','登门拜访','PC000015','CP000008','PCCP000030','转化希望很大0059','2019-01-07 06:37:31','1');
insert into potential_customer_contact_data values ('PCC000060','和连载客户的联系记录0060','2018-12-08','活动聊天','PC000015','CP000008','PCCP000030','转化希望很大0060','2019-01-05 17:47:56','1');
insert into potential_customer_contact_data values ('PCC000061','和连载客户的联系记录0061','2017-11-08','电话','PC000016','CP000008','PCCP000031','转化希望很大0061','2019-01-08 21:19:51','1');
insert into potential_customer_contact_data values ('PCC000062','和连载客户的联系记录0062','2018-08-02','短信','PC000016','CP000008','PCCP000031','转化希望很大0062','2019-01-12 12:08:23','1');
insert into potential_customer_contact_data values ('PCC000063','和连载客户的联系记录0063','2018-08-26','登门拜访','PC000016','CP000008','PCCP000032','转化希望很大0063','2018-12-31 09:48:06','1');
insert into potential_customer_contact_data values ('PCC000064','和连载客户的联系记录0064','2018-06-15','活动聊天','PC000016','CP000008','PCCP000032','转化希望很大0064','2019-01-04 12:22:38','1');

	
insert into city_event_data values ('CE000001','小超见面会','13677778888','RSCSC000001','给大家讲解小超的发展蓝图','2018-12-27 22:13:22','1');
insert into city_event_data values ('CE000002','双链小超说明会','13900000002','RSCSC000001','给大家讲解小超的发展蓝图0002','2019-01-10 05:19:48','1');
insert into city_event_data values ('CE000003','小超见面会','13900000003','RSCSC000002','给大家讲解小超的发展蓝图0003','2018-12-31 01:48:57','1');
insert into city_event_data values ('CE000004','双链小超说明会','13900000004','RSCSC000002','给大家讲解小超的发展蓝图0004','2019-01-04 04:28:07','1');
insert into city_event_data values ('CE000005','小超见面会','13900000005','RSCSC000003','给大家讲解小超的发展蓝图0005','2019-01-01 19:44:39','1');
insert into city_event_data values ('CE000006','双链小超说明会','13900000006','RSCSC000003','给大家讲解小超的发展蓝图0006','2018-12-31 11:45:56','1');
insert into city_event_data values ('CE000007','小超见面会','13900000007','RSCSC000004','给大家讲解小超的发展蓝图0007','2018-12-31 05:31:58','1');
insert into city_event_data values ('CE000008','双链小超说明会','13900000008','RSCSC000004','给大家讲解小超的发展蓝图0008','2019-01-03 07:29:48','1');

	
insert into event_attendance_data values ('EA000001','小超见面会参加信息','PC000001','CE000001','体会不错，考虑加盟','1');
insert into event_attendance_data values ('EA000002','小超见面会参加信息0002','PC000001','CE000001','体会不错，考虑加盟0002','1');
insert into event_attendance_data values ('EA000003','小超见面会参加信息0003','PC000002','CE000001','体会不错，考虑加盟0003','1');
insert into event_attendance_data values ('EA000004','小超见面会参加信息0004','PC000002','CE000001','体会不错，考虑加盟0004','1');
insert into event_attendance_data values ('EA000005','小超见面会参加信息0005','PC000003','CE000002','体会不错，考虑加盟0005','1');
insert into event_attendance_data values ('EA000006','小超见面会参加信息0006','PC000003','CE000002','体会不错，考虑加盟0006','1');
insert into event_attendance_data values ('EA000007','小超见面会参加信息0007','PC000004','CE000002','体会不错，考虑加盟0007','1');
insert into event_attendance_data values ('EA000008','小超见面会参加信息0008','PC000004','CE000002','体会不错，考虑加盟0008','1');
insert into event_attendance_data values ('EA000009','小超见面会参加信息0009','PC000005','CE000003','体会不错，考虑加盟0009','1');
insert into event_attendance_data values ('EA000010','小超见面会参加信息0010','PC000005','CE000003','体会不错，考虑加盟0010','1');
insert into event_attendance_data values ('EA000011','小超见面会参加信息0011','PC000006','CE000003','体会不错，考虑加盟0011','1');
insert into event_attendance_data values ('EA000012','小超见面会参加信息0012','PC000006','CE000003','体会不错，考虑加盟0012','1');
insert into event_attendance_data values ('EA000013','小超见面会参加信息0013','PC000007','CE000004','体会不错，考虑加盟0013','1');
insert into event_attendance_data values ('EA000014','小超见面会参加信息0014','PC000007','CE000004','体会不错，考虑加盟0014','1');
insert into event_attendance_data values ('EA000015','小超见面会参加信息0015','PC000008','CE000004','体会不错，考虑加盟0015','1');
insert into event_attendance_data values ('EA000016','小超见面会参加信息0016','PC000008','CE000004','体会不错，考虑加盟0016','1');
insert into event_attendance_data values ('EA000017','小超见面会参加信息0017','PC000009','CE000005','体会不错，考虑加盟0017','1');
insert into event_attendance_data values ('EA000018','小超见面会参加信息0018','PC000009','CE000005','体会不错，考虑加盟0018','1');
insert into event_attendance_data values ('EA000019','小超见面会参加信息0019','PC000010','CE000005','体会不错，考虑加盟0019','1');
insert into event_attendance_data values ('EA000020','小超见面会参加信息0020','PC000010','CE000005','体会不错，考虑加盟0020','1');
insert into event_attendance_data values ('EA000021','小超见面会参加信息0021','PC000011','CE000006','体会不错，考虑加盟0021','1');
insert into event_attendance_data values ('EA000022','小超见面会参加信息0022','PC000011','CE000006','体会不错，考虑加盟0022','1');
insert into event_attendance_data values ('EA000023','小超见面会参加信息0023','PC000012','CE000006','体会不错，考虑加盟0023','1');
insert into event_attendance_data values ('EA000024','小超见面会参加信息0024','PC000012','CE000006','体会不错，考虑加盟0024','1');
insert into event_attendance_data values ('EA000025','小超见面会参加信息0025','PC000013','CE000007','体会不错，考虑加盟0025','1');
insert into event_attendance_data values ('EA000026','小超见面会参加信息0026','PC000013','CE000007','体会不错，考虑加盟0026','1');
insert into event_attendance_data values ('EA000027','小超见面会参加信息0027','PC000014','CE000007','体会不错，考虑加盟0027','1');
insert into event_attendance_data values ('EA000028','小超见面会参加信息0028','PC000014','CE000007','体会不错，考虑加盟0028','1');
insert into event_attendance_data values ('EA000029','小超见面会参加信息0029','PC000015','CE000008','体会不错，考虑加盟0029','1');
insert into event_attendance_data values ('EA000030','小超见面会参加信息0030','PC000015','CE000008','体会不错，考虑加盟0030','1');
insert into event_attendance_data values ('EA000031','小超见面会参加信息0031','PC000016','CE000008','体会不错，考虑加盟0031','1');
insert into event_attendance_data values ('EA000032','小超见面会参加信息0032','PC000016','CE000008','体会不错，考虑加盟0032','1');

	
insert into retail_store_data values ('RS000001','中和社区小超','02887654321','吕刚','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-09','41.76633115482908','130.25532245002097','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让','2019-01-16 13:29:01','CREATED','1');
insert into retail_store_data values ('RS000002','华阳社区小超','028876543210002','吕刚0002','RSCC000001','RSCSC000001',NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-24','41.163660100287004','129.9060551758139','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0002','2019-01-09 20:17:01','INVESTMENT_INVITED','1');
insert into retail_store_data values ('RS000003','大源社区小超','028876543210003','吕刚0003','RSCC000002','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-19','40.12456273743261','129.34148570871187','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0003','2019-01-15 04:24:01','FRANCHISED','1');
insert into retail_store_data values ('RS000004','中和社区小超','028876543210004','吕刚0004','RSCC000002','RSCSC000002',NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-09','41.70167437053856','129.33120704177162','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0004','2018-12-28 07:34:00','DECORATED','1');
insert into retail_store_data values ('RS000005','华阳社区小超','028876543210005','吕刚0005','RSCC000003','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02','42.21365188926671','129.79020026514596','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0005','2019-01-02 12:51:33','OPENNED','1');
insert into retail_store_data values ('RS000006','大源社区小超','028876543210006','吕刚0006','RSCC000003','RSCSC000003',NULL,NULL,NULL,NULL,NULL,NULL,'2016-03-18','42.24670476729525','129.67042993987474','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0006','2019-01-08 10:09:04','CLOSED','1');
insert into retail_store_data values ('RS000007','中和社区小超','028876543210007','吕刚0007','RSCC000004','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-14','40.99759315979954','131.8642798996692','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0007','2019-01-18 12:05:55','CREATED','1');
insert into retail_store_data values ('RS000008','华阳社区小超','028876543210008','吕刚0008','RSCC000004','RSCSC000004',NULL,NULL,NULL,NULL,NULL,NULL,'2016-10-11','42.180232244715235','131.11613553014982','啤酒饮料矿泉水，香肠瓜子方便面, 请让一让0008','2019-01-16 02:56:04','INVESTMENT_INVITED','1');

	
insert into retail_store_creation_data values ('RSC000001','已经建好了','1');

	
insert into retail_store_investment_invitation_data values ('RSII000001','欢迎前来咨询','1');

	
insert into retail_store_franchising_data values ('RSF000001','谢谢加盟','1');

	
insert into retail_store_decoration_data values ('RSD000001','装修','1');

	
insert into retail_store_opening_data values ('RSO000001','装修','1');

	
insert into retail_store_closing_data values ('RSC000001','关闭','1');

	
insert into retail_store_member_data values ('RSM000001','李亚青','18099887766','RSCC000001','1');
insert into retail_store_member_data values ('RSM000002','李亚青0002','13900000002','RSCC000003','1');

	
insert into consumer_order_data values ('CO000001','消费订单','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-01-05 17:30:56','CONFIRMED','1');
insert into consumer_order_data values ('CO000002','消费订单0002','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000001','2019-01-18 04:16:47','APPROVED','1');
insert into consumer_order_data values ('CO000003','消费订单0003','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2018-12-29 12:54:47','PROCESSED','1');
insert into consumer_order_data values ('CO000004','消费订单0004','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000002','2018-12-29 09:34:51','SHIPPED','1');
insert into consumer_order_data values ('CO000005','消费订单0005','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2019-01-03 17:10:57','DELIVERED','1');
insert into consumer_order_data values ('CO000006','消费订单0006','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000003','2018-12-31 20:06:06','CONFIRMED','1');
insert into consumer_order_data values ('CO000007','消费订单0007','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-01-12 14:20:01','APPROVED','1');
insert into consumer_order_data values ('CO000008','消费订单0008','RSM000001',NULL,NULL,NULL,NULL,NULL,'RS000004','2019-01-01 10:43:55','PROCESSED','1');
insert into consumer_order_data values ('CO000009','消费订单0009','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2019-01-06 23:54:26','SHIPPED','1');
insert into consumer_order_data values ('CO000010','消费订单0010','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000005','2018-12-31 18:19:48','DELIVERED','1');
insert into consumer_order_data values ('CO000011','消费订单0011','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2018-12-31 21:58:02','CONFIRMED','1');
insert into consumer_order_data values ('CO000012','消费订单0012','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000006','2019-01-06 08:37:57','APPROVED','1');
insert into consumer_order_data values ('CO000013','消费订单0013','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-01-12 19:41:05','PROCESSED','1');
insert into consumer_order_data values ('CO000014','消费订单0014','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000007','2019-01-07 05:07:24','SHIPPED','1');
insert into consumer_order_data values ('CO000015','消费订单0015','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-01-12 17:55:46','DELIVERED','1');
insert into consumer_order_data values ('CO000016','消费订单0016','RSM000002',NULL,NULL,NULL,NULL,NULL,'RS000008','2019-01-13 09:52:33','CONFIRMED','1');

	
insert into consumer_order_confirmation_data values ('COC000001','确认者','2018-01-04','1');

	
insert into consumer_order_approval_data values ('COA000001','批准者','2017-09-12','1');

	
insert into consumer_order_processing_data values ('COP000001','处理者','2016-11-17','1');

	
insert into consumer_order_shipment_data values ('COS000001','运货者','2017-10-23','1');

	
insert into consumer_order_delivery_data values ('COD000001','送货者','2018-09-14','1');

	
insert into consumer_order_line_item_data values ('COLI000001','CO000001','SKU','大瓶可乐','5.47','813.59','9097.45','1');
insert into consumer_order_line_item_data values ('COLI000002','CO000001','SKU0002','大瓶可乐0002','4.64','780.37','7864.65','1');
insert into consumer_order_line_item_data values ('COLI000003','CO000002','SKU0003','大瓶可乐0003','5.12','932.19','9672.89','1');
insert into consumer_order_line_item_data values ('COLI000004','CO000002','SKU0004','大瓶可乐0004','4.77','981.44','7718.18','1');
insert into consumer_order_line_item_data values ('COLI000005','CO000003','SKU0005','大瓶可乐0005','4.53','840.47','7186.06','1');
insert into consumer_order_line_item_data values ('COLI000006','CO000003','SKU0006','大瓶可乐0006','5.62','842.89','9689.77','1');
insert into consumer_order_line_item_data values ('COLI000007','CO000004','SKU0007','大瓶可乐0007','5.77','928.54','7195.72','1');
insert into consumer_order_line_item_data values ('COLI000008','CO000004','SKU0008','大瓶可乐0008','5.02','883.81','8136.64','1');
insert into consumer_order_line_item_data values ('COLI000009','CO000005','SKU0009','大瓶可乐0009','5.09','884.22','8442.03','1');
insert into consumer_order_line_item_data values ('COLI000010','CO000005','SKU0010','大瓶可乐0010','4.62','989.33','9572.75','1');
insert into consumer_order_line_item_data values ('COLI000011','CO000006','SKU0011','大瓶可乐0011','4.97','838.72','9268.50','1');
insert into consumer_order_line_item_data values ('COLI000012','CO000006','SKU0012','大瓶可乐0012','4.51','763.39','9071.73','1');
insert into consumer_order_line_item_data values ('COLI000013','CO000007','SKU0013','大瓶可乐0013','5.65','843.90','8320.06','1');
insert into consumer_order_line_item_data values ('COLI000014','CO000007','SKU0014','大瓶可乐0014','4.94','982.50','8665.98','1');
insert into consumer_order_line_item_data values ('COLI000015','CO000008','SKU0015','大瓶可乐0015','5.35','893.98','7322.06','1');
insert into consumer_order_line_item_data values ('COLI000016','CO000008','SKU0016','大瓶可乐0016','5.31','831.64','8866.91','1');
insert into consumer_order_line_item_data values ('COLI000017','CO000009','SKU0017','大瓶可乐0017','4.79','824.81','9763.38','1');
insert into consumer_order_line_item_data values ('COLI000018','CO000009','SKU0018','大瓶可乐0018','5.10','791.70','8652.43','1');
insert into consumer_order_line_item_data values ('COLI000019','CO000010','SKU0019','大瓶可乐0019','4.59','800.61','9298.86','1');
insert into consumer_order_line_item_data values ('COLI000020','CO000010','SKU0020','大瓶可乐0020','5.40','924.50','9550.53','1');
insert into consumer_order_line_item_data values ('COLI000021','CO000011','SKU0021','大瓶可乐0021','5.33','750.96','8121.39','1');
insert into consumer_order_line_item_data values ('COLI000022','CO000011','SKU0022','大瓶可乐0022','4.26','938.00','7504.03','1');
insert into consumer_order_line_item_data values ('COLI000023','CO000012','SKU0023','大瓶可乐0023','5.56','733.20','7448.49','1');
insert into consumer_order_line_item_data values ('COLI000024','CO000012','SKU0024','大瓶可乐0024','5.48','916.03','9915.37','1');
insert into consumer_order_line_item_data values ('COLI000025','CO000013','SKU0025','大瓶可乐0025','5.40','846.72','7436.35','1');
insert into consumer_order_line_item_data values ('COLI000026','CO000013','SKU0026','大瓶可乐0026','4.34','720.18','8947.28','1');
insert into consumer_order_line_item_data values ('COLI000027','CO000014','SKU0027','大瓶可乐0027','4.42','808.33','8135.21','1');
insert into consumer_order_line_item_data values ('COLI000028','CO000014','SKU0028','大瓶可乐0028','5.89','854.75','9772.28','1');
insert into consumer_order_line_item_data values ('COLI000029','CO000015','SKU0029','大瓶可乐0029','4.49','951.12','9692.31','1');
insert into consumer_order_line_item_data values ('COLI000030','CO000015','SKU0030','大瓶可乐0030','5.83','870.86','9921.81','1');
insert into consumer_order_line_item_data values ('COLI000031','CO000016','SKU0031','大瓶可乐0031','4.35','834.87','8595.24','1');
insert into consumer_order_line_item_data values ('COLI000032','CO000016','SKU0032','大瓶可乐0032','4.58','945.10','8254.20','1');

	
insert into consumer_order_shipping_group_data values ('COSG000001','送货到刘强家','CO000001','533.86','1');
insert into consumer_order_shipping_group_data values ('COSG000002','送货到刘强家0002','CO000001','451.07','1');
insert into consumer_order_shipping_group_data values ('COSG000003','送货到刘强家0003','CO000002','469.87','1');
insert into consumer_order_shipping_group_data values ('COSG000004','送货到刘强家0004','CO000002','467.73','1');
insert into consumer_order_shipping_group_data values ('COSG000005','送货到刘强家0005','CO000003','556.74','1');
insert into consumer_order_shipping_group_data values ('COSG000006','送货到刘强家0006','CO000003','470.05','1');
insert into consumer_order_shipping_group_data values ('COSG000007','送货到刘强家0007','CO000004','586.94','1');
insert into consumer_order_shipping_group_data values ('COSG000008','送货到刘强家0008','CO000004','473.94','1');
insert into consumer_order_shipping_group_data values ('COSG000009','送货到刘强家0009','CO000005','597.87','1');
insert into consumer_order_shipping_group_data values ('COSG000010','送货到刘强家0010','CO000005','483.17','1');
insert into consumer_order_shipping_group_data values ('COSG000011','送货到刘强家0011','CO000006','434.30','1');
insert into consumer_order_shipping_group_data values ('COSG000012','送货到刘强家0012','CO000006','561.59','1');
insert into consumer_order_shipping_group_data values ('COSG000013','送货到刘强家0013','CO000007','563.52','1');
insert into consumer_order_shipping_group_data values ('COSG000014','送货到刘强家0014','CO000007','560.00','1');
insert into consumer_order_shipping_group_data values ('COSG000015','送货到刘强家0015','CO000008','488.84','1');
insert into consumer_order_shipping_group_data values ('COSG000016','送货到刘强家0016','CO000008','581.04','1');
insert into consumer_order_shipping_group_data values ('COSG000017','送货到刘强家0017','CO000009','450.38','1');
insert into consumer_order_shipping_group_data values ('COSG000018','送货到刘强家0018','CO000009','586.21','1');
insert into consumer_order_shipping_group_data values ('COSG000019','送货到刘强家0019','CO000010','478.51','1');
insert into consumer_order_shipping_group_data values ('COSG000020','送货到刘强家0020','CO000010','454.18','1');
insert into consumer_order_shipping_group_data values ('COSG000021','送货到刘强家0021','CO000011','562.58','1');
insert into consumer_order_shipping_group_data values ('COSG000022','送货到刘强家0022','CO000011','434.08','1');
insert into consumer_order_shipping_group_data values ('COSG000023','送货到刘强家0023','CO000012','580.81','1');
insert into consumer_order_shipping_group_data values ('COSG000024','送货到刘强家0024','CO000012','515.06','1');
insert into consumer_order_shipping_group_data values ('COSG000025','送货到刘强家0025','CO000013','535.15','1');
insert into consumer_order_shipping_group_data values ('COSG000026','送货到刘强家0026','CO000013','496.48','1');
insert into consumer_order_shipping_group_data values ('COSG000027','送货到刘强家0027','CO000014','484.14','1');
insert into consumer_order_shipping_group_data values ('COSG000028','送货到刘强家0028','CO000014','592.87','1');
insert into consumer_order_shipping_group_data values ('COSG000029','送货到刘强家0029','CO000015','518.63','1');
insert into consumer_order_shipping_group_data values ('COSG000030','送货到刘强家0030','CO000015','541.84','1');
insert into consumer_order_shipping_group_data values ('COSG000031','送货到刘强家0031','CO000016','567.88','1');
insert into consumer_order_shipping_group_data values ('COSG000032','送货到刘强家0032','CO000016','531.25','1');

	
insert into consumer_order_payment_group_data values ('COPG000001','信用卡','CO000001','4111 1111 1111 - ','1');
insert into consumer_order_payment_group_data values ('COPG000002','支付宝','CO000001','4111 1111 1111 - 0002','1');
insert into consumer_order_payment_group_data values ('COPG000003','微信支付','CO000002','4111 1111 1111 - 0003','1');
insert into consumer_order_payment_group_data values ('COPG000004','信用卡','CO000002','4111 1111 1111 - 0004','1');
insert into consumer_order_payment_group_data values ('COPG000005','支付宝','CO000003','4111 1111 1111 - 0005','1');
insert into consumer_order_payment_group_data values ('COPG000006','微信支付','CO000003','4111 1111 1111 - 0006','1');
insert into consumer_order_payment_group_data values ('COPG000007','信用卡','CO000004','4111 1111 1111 - 0007','1');
insert into consumer_order_payment_group_data values ('COPG000008','支付宝','CO000004','4111 1111 1111 - 0008','1');
insert into consumer_order_payment_group_data values ('COPG000009','微信支付','CO000005','4111 1111 1111 - 0009','1');
insert into consumer_order_payment_group_data values ('COPG000010','信用卡','CO000005','4111 1111 1111 - 0010','1');
insert into consumer_order_payment_group_data values ('COPG000011','支付宝','CO000006','4111 1111 1111 - 0011','1');
insert into consumer_order_payment_group_data values ('COPG000012','微信支付','CO000006','4111 1111 1111 - 0012','1');
insert into consumer_order_payment_group_data values ('COPG000013','信用卡','CO000007','4111 1111 1111 - 0013','1');
insert into consumer_order_payment_group_data values ('COPG000014','支付宝','CO000007','4111 1111 1111 - 0014','1');
insert into consumer_order_payment_group_data values ('COPG000015','微信支付','CO000008','4111 1111 1111 - 0015','1');
insert into consumer_order_payment_group_data values ('COPG000016','信用卡','CO000008','4111 1111 1111 - 0016','1');
insert into consumer_order_payment_group_data values ('COPG000017','支付宝','CO000009','4111 1111 1111 - 0017','1');
insert into consumer_order_payment_group_data values ('COPG000018','微信支付','CO000009','4111 1111 1111 - 0018','1');
insert into consumer_order_payment_group_data values ('COPG000019','信用卡','CO000010','4111 1111 1111 - 0019','1');
insert into consumer_order_payment_group_data values ('COPG000020','支付宝','CO000010','4111 1111 1111 - 0020','1');
insert into consumer_order_payment_group_data values ('COPG000021','微信支付','CO000011','4111 1111 1111 - 0021','1');
insert into consumer_order_payment_group_data values ('COPG000022','信用卡','CO000011','4111 1111 1111 - 0022','1');
insert into consumer_order_payment_group_data values ('COPG000023','支付宝','CO000012','4111 1111 1111 - 0023','1');
insert into consumer_order_payment_group_data values ('COPG000024','微信支付','CO000012','4111 1111 1111 - 0024','1');
insert into consumer_order_payment_group_data values ('COPG000025','信用卡','CO000013','4111 1111 1111 - 0025','1');
insert into consumer_order_payment_group_data values ('COPG000026','支付宝','CO000013','4111 1111 1111 - 0026','1');
insert into consumer_order_payment_group_data values ('COPG000027','微信支付','CO000014','4111 1111 1111 - 0027','1');
insert into consumer_order_payment_group_data values ('COPG000028','信用卡','CO000014','4111 1111 1111 - 0028','1');
insert into consumer_order_payment_group_data values ('COPG000029','支付宝','CO000015','4111 1111 1111 - 0029','1');
insert into consumer_order_payment_group_data values ('COPG000030','微信支付','CO000015','4111 1111 1111 - 0030','1');
insert into consumer_order_payment_group_data values ('COPG000031','信用卡','CO000016','4111 1111 1111 - 0031','1');
insert into consumer_order_payment_group_data values ('COPG000032','支付宝','CO000016','4111 1111 1111 - 0032','1');

	
insert into consumer_order_price_adjustment_data values ('COPA000001','端午促销','CO000001','449.87','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000002','端午促销0002','CO000001','477.76','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000003','端午促销0003','CO000002','550.48','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000004','端午促销0004','CO000002','509.02','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000005','端午促销0005','CO000003','545.48','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000006','端午促销0006','CO000003','557.14','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000007','端午促销0007','CO000004','559.92','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000008','端午促销0008','CO000004','524.66','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000009','端午促销0009','CO000005','468.26','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000010','端午促销0010','CO000005','444.53','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000011','端午促销0011','CO000006','438.15','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000012','端午促销0012','CO000006','591.54','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000013','端午促销0013','CO000007','512.44','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000014','端午促销0014','CO000007','440.58','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000015','端午促销0015','CO000008','480.03','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000016','端午促销0016','CO000008','441.97','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000017','端午促销0017','CO000009','430.86','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000018','端午促销0018','CO000009','539.74','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000019','端午促销0019','CO000010','488.11','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000020','端午促销0020','CO000010','476.63','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000021','端午促销0021','CO000011','426.55','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000022','端午促销0022','CO000011','510.64','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000023','端午促销0023','CO000012','457.26','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000024','端午促销0024','CO000012','460.58','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000025','端午促销0025','CO000013','512.42','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000026','端午促销0026','CO000013','559.24','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000027','端午促销0027','CO000014','547.89','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000028','端午促销0028','CO000014','479.53','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000029','端午促销0029','CO000015','585.68','小超老板','1');
insert into consumer_order_price_adjustment_data values ('COPA000030','端午促销0030','CO000015','503.16','广告赞助','1');
insert into consumer_order_price_adjustment_data values ('COPA000031','端午促销0031','CO000016','422.80','供货商','1');
insert into consumer_order_price_adjustment_data values ('COPA000032','端午促销0032','CO000016','588.24','小超老板','1');

	
insert into retail_store_member_coupon_data values ('RSMC000001','优惠券','RSM000001','CP00001','1');
insert into retail_store_member_coupon_data values ('RSMC000002','优惠券0002','RSM000001','CP000010002','1');
insert into retail_store_member_coupon_data values ('RSMC000003','优惠券0003','RSM000002','CP000010003','1');
insert into retail_store_member_coupon_data values ('RSMC000004','优惠券0004','RSM000002','CP000010004','1');

	
insert into member_wishlist_data values ('MW000001','每周购买清单','RSM000001','1');
insert into member_wishlist_data values ('MW000002','每月购买清单','RSM000001','1');
insert into member_wishlist_data values ('MW000003','每周购买清单','RSM000002','1');
insert into member_wishlist_data values ('MW000004','每月购买清单','RSM000002','1');

	
insert into member_reward_point_data values ('MRP000001','购买积分','20','RSM000001','1');
insert into member_reward_point_data values ('MRP000002','每月购买清单','15','RSM000001','1');
insert into member_reward_point_data values ('MRP000003','购买积分','20','RSM000002','1');
insert into member_reward_point_data values ('MRP000004','每月购买清单','19','RSM000002','1');

	
insert into member_reward_point_redemption_data values ('MRPR000001','积分换锅','16','RSM000001','1');
insert into member_reward_point_redemption_data values ('MRPR000002','积分换刀','15','RSM000001','1');
insert into member_reward_point_redemption_data values ('MRPR000003','积分换锅','17','RSM000002','1');
insert into member_reward_point_redemption_data values ('MRPR000004','积分换刀','19','RSM000002','1');

	
insert into member_wishlist_product_data values ('MWP000001','农夫山泉','MW000001','1');
insert into member_wishlist_product_data values ('MWP000002','利箭口香糖','MW000001','1');
insert into member_wishlist_product_data values ('MWP000003','农夫山泉','MW000002','1');
insert into member_wishlist_product_data values ('MWP000004','利箭口香糖','MW000002','1');
insert into member_wishlist_product_data values ('MWP000005','农夫山泉','MW000003','1');
insert into member_wishlist_product_data values ('MWP000006','利箭口香糖','MW000003','1');
insert into member_wishlist_product_data values ('MWP000007','农夫山泉','MW000004','1');
insert into member_wishlist_product_data values ('MWP000008','利箭口香糖','MW000004','1');

	
insert into retail_store_member_address_data values ('RSMA000001','家里','RSM000001','18099887766','四川省成都市科学城北路33号','1');
insert into retail_store_member_address_data values ('RSMA000002','办公室','RSM000001','13900000002','四川省成都市科学城北路33号0002','1');
insert into retail_store_member_address_data values ('RSMA000003','出差临时地址','RSM000002','13900000003','四川省成都市科学城北路33号0003','1');
insert into retail_store_member_address_data values ('RSMA000004','家里','RSM000002','13900000004','四川省成都市科学城北路33号0004','1');

	
insert into retail_store_member_gift_card_data values ('RSMGC000001','礼品卡','RSM000001','CP00001','163.60','1');
insert into retail_store_member_gift_card_data values ('RSMGC000002','礼品卡0002','RSM000001','CP000010002','172.52','1');
insert into retail_store_member_gift_card_data values ('RSMGC000003','礼品卡0003','RSM000002','CP000010003','197.08','1');
insert into retail_store_member_gift_card_data values ('RSMGC000004','礼品卡0004','RSM000002','CP000010004','185.98','1');

	
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000001','2016-10-02','RSMGC000001','CO000001','GF00001','15.83','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000002','2017-05-10','RSMGC000001','CO000001','GF000010002','15.29','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000003','2018-09-15','RSMGC000001','CO000002','GF000010003','20.45','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000004','2018-06-28','RSMGC000001','CO000002','GF000010004','18.27','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000005','2017-05-01','RSMGC000001','CO000003','GF000010005','15.27','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000006','2018-04-17','RSMGC000001','CO000003','GF000010006','18.29','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000007','2017-01-22','RSMGC000001','CO000004','GF000010007','18.92','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000008','2016-03-10','RSMGC000001','CO000004','GF000010008','19.10','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000009','2017-10-21','RSMGC000002','CO000005','GF000010009','19.53','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000010','2017-07-30','RSMGC000002','CO000005','GF000010010','17.24','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000011','2017-09-21','RSMGC000002','CO000006','GF000010011','20.60','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000012','2018-09-25','RSMGC000002','CO000006','GF000010012','19.94','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000013','2018-12-26','RSMGC000002','CO000007','GF000010013','14.91','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000014','2016-11-06','RSMGC000002','CO000007','GF000010014','18.42','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000015','2018-02-25','RSMGC000002','CO000008','GF000010015','17.93','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000016','2018-11-08','RSMGC000002','CO000008','GF000010016','20.35','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000017','2018-12-20','RSMGC000003','CO000009','GF000010017','16.29','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000018','2018-01-09','RSMGC000003','CO000009','GF000010018','20.35','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000019','2016-09-12','RSMGC000003','CO000010','GF000010019','20.71','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000020','2017-04-06','RSMGC000003','CO000010','GF000010020','19.18','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000021','2017-03-02','RSMGC000003','CO000011','GF000010021','18.39','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000022','2018-02-08','RSMGC000003','CO000011','GF000010022','15.81','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000023','2017-12-13','RSMGC000003','CO000012','GF000010023','18.13','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000024','2017-05-27','RSMGC000003','CO000012','GF000010024','16.64','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000025','2018-02-27','RSMGC000004','CO000013','GF000010025','19.30','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000026','2017-09-25','RSMGC000004','CO000013','GF000010026','15.10','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000027','2018-06-11','RSMGC000004','CO000014','GF000010027','15.99','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000028','2016-05-28','RSMGC000004','CO000014','GF000010028','16.00','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000029','2016-10-26','RSMGC000004','CO000015','GF000010029','19.45','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000030','2016-12-04','RSMGC000004','CO000015','GF000010030','20.21','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000031','2019-01-06','RSMGC000004','CO000016','GF000010031','16.99','1');
insert into retail_store_member_gift_card_consume_record_data values ('RSMGCCR000032','2018-08-24','RSMGC000004','CO000016','GF000010032','19.87','1');

	
insert into goods_supplier_data values ('GS000001','宝洁','洗护用品','RSCC000001','18677889999','啤酒饮料矿泉水，香肠瓜子方便面都提供','2019-01-17 23:44:46','1');
insert into goods_supplier_data values ('GS000002','中粮','食品','RSCC000002','13900000002','啤酒饮料矿泉水，香肠瓜子方便面都提供0002','2019-01-08 22:13:38','1');
insert into goods_supplier_data values ('GS000003','福临门','植物油','RSCC000003','13900000003','啤酒饮料矿泉水，香肠瓜子方便面都提供0003','2019-01-04 22:38:06','1');

	
insert into supplier_product_data values ('SP000001','黑人牙膏','最好的黑人牙膏，只卖3块喽','件','GS000001','1');
insert into supplier_product_data values ('SP000002','黑人牙膏0002','最好的黑人牙膏，只卖3块喽0002','公斤','GS000001','1');
insert into supplier_product_data values ('SP000003','黑人牙膏0003','最好的黑人牙膏，只卖3块喽0003','米','GS000002','1');
insert into supplier_product_data values ('SP000004','黑人牙膏0004','最好的黑人牙膏，只卖3块喽0004','件','GS000003','1');

	
insert into product_supply_duration_data values ('PSD000001','100','现货','7821.49','SP000001','1');
insert into product_supply_duration_data values ('PSD000002','200','两天','8049.92','SP000001','1');
insert into product_supply_duration_data values ('PSD000003','500','三天','8643.63','SP000002','1');
insert into product_supply_duration_data values ('PSD000004','100','一周','8173.74','SP000002','1');
insert into product_supply_duration_data values ('PSD000005','200','现货','9905.04','SP000003','1');
insert into product_supply_duration_data values ('PSD000006','500','两天','8553.53','SP000003','1');
insert into product_supply_duration_data values ('PSD000007','100','三天','7822.22','SP000004','1');
insert into product_supply_duration_data values ('PSD000008','200','一周','9236.45','SP000004','1');

	
insert into supply_order_data values ('SO000001','RSCC000001','GS000001','双链给供货商下的订单','2125479424.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-11 11:42:32','CONFIRMED','1');
insert into supply_order_data values ('SO000002','RSCC000002','GS000001','双链给供货商下的订单0002','2292071936.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-09 11:08:46','APPROVED','1');
insert into supply_order_data values ('SO000003','RSCC000003','GS000002','双链给供货商下的订单0003','2241636608.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-17 18:08:34','PROCESSED','1');
insert into supply_order_data values ('SO000004','RSCC000004','GS000003','双链给供货商下的订单0004','2910407936.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-06 23:05:42','PICKED','1');

	
insert into supply_order_confirmation_data values ('SOC000001','确认者','2016-03-06','1');

	
insert into supply_order_approval_data values ('SOA000001','批准者','2017-05-22','1');

	
insert into supply_order_processing_data values ('SOP000001','处理者','2018-11-09','1');

	
insert into supply_order_picking_data values ('SOP000001','处理者','2017-07-22','1');

	
insert into supply_order_shipment_data values ('SOS000001','运货者','2018-08-31','1');

	
insert into supply_order_delivery_data values ('SOD000001','送货者','2017-06-30','1');

	
insert into supply_order_line_item_data values ('SOLI000001','SO000001','SKU','大瓶可乐','5.64','8375','件','1');
insert into supply_order_line_item_data values ('SOLI000002','SO000001','SKU0002','大瓶可乐0002','5.71','9583','公斤','1');
insert into supply_order_line_item_data values ('SOLI000003','SO000002','SKU0003','大瓶可乐0003','5.75','7383','米','1');
insert into supply_order_line_item_data values ('SOLI000004','SO000002','SKU0004','大瓶可乐0004','5.65','9595','件','1');
insert into supply_order_line_item_data values ('SOLI000005','SO000003','SKU0005','大瓶可乐0005','5.14','9534','公斤','1');
insert into supply_order_line_item_data values ('SOLI000006','SO000003','SKU0006','大瓶可乐0006','4.18','7301','米','1');
insert into supply_order_line_item_data values ('SOLI000007','SO000004','SKU0007','大瓶可乐0007','5.26','8967','件','1');
insert into supply_order_line_item_data values ('SOLI000008','SO000004','SKU0008','大瓶可乐0008','5.51','9774','公斤','1');

	
insert into supply_order_shipping_group_data values ('SOSG000001','送货到双链成都2号仓','SO000001','5.07','1');
insert into supply_order_shipping_group_data values ('SOSG000002','送货到双链成都2号仓0002','SO000001','5.84','1');
insert into supply_order_shipping_group_data values ('SOSG000003','送货到双链成都2号仓0003','SO000002','5.17','1');
insert into supply_order_shipping_group_data values ('SOSG000004','送货到双链成都2号仓0004','SO000002','4.28','1');
insert into supply_order_shipping_group_data values ('SOSG000005','送货到双链成都2号仓0005','SO000003','4.62','1');
insert into supply_order_shipping_group_data values ('SOSG000006','送货到双链成都2号仓0006','SO000003','5.07','1');
insert into supply_order_shipping_group_data values ('SOSG000007','送货到双链成都2号仓0007','SO000004','4.94','1');
insert into supply_order_shipping_group_data values ('SOSG000008','送货到双链成都2号仓0008','SO000004','5.64','1');

	
insert into supply_order_payment_group_data values ('SOPG000001','付款办法','SO000001','4111 1111 1111 - ','1');
insert into supply_order_payment_group_data values ('SOPG000002','付款办法0002','SO000001','4111 1111 1111 - 0002','1');
insert into supply_order_payment_group_data values ('SOPG000003','付款办法0003','SO000002','4111 1111 1111 - 0003','1');
insert into supply_order_payment_group_data values ('SOPG000004','付款办法0004','SO000002','4111 1111 1111 - 0004','1');
insert into supply_order_payment_group_data values ('SOPG000005','付款办法0005','SO000003','4111 1111 1111 - 0005','1');
insert into supply_order_payment_group_data values ('SOPG000006','付款办法0006','SO000003','4111 1111 1111 - 0006','1');
insert into supply_order_payment_group_data values ('SOPG000007','付款办法0007','SO000004','4111 1111 1111 - 0007','1');
insert into supply_order_payment_group_data values ('SOPG000008','付款办法0008','SO000004','4111 1111 1111 - 0008','1');

	
insert into retail_store_order_data values ('RSO000001','RS000001','RSCC000001','双链小超给双链供应链下的订单','2490620416.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-16 23:39:15','CONFIRMED','1');
insert into retail_store_order_data values ('RSO000002','RS000001','RSCC000001','双链小超给双链供应链下的订单0002','2894300416.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-13 21:30:25','APPROVED','1');
insert into retail_store_order_data values ('RSO000003','RS000002','RSCC000001','双链小超给双链供应链下的订单0003','2764038912.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-09 09:39:35','PROCESSED','1');
insert into retail_store_order_data values ('RSO000004','RS000002','RSCC000001','双链小超给双链供应链下的订单0004','2415272704.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-01 05:12:35','PICKED','1');
insert into retail_store_order_data values ('RSO000005','RS000003','RSCC000002','双链小超给双链供应链下的订单0005','2217231872.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-11 12:06:08','SHIPPED','1');
insert into retail_store_order_data values ('RSO000006','RS000003','RSCC000002','双链小超给双链供应链下的订单0006','2824012544.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-16 00:59:40','DELIVERED','1');
insert into retail_store_order_data values ('RSO000007','RS000004','RSCC000002','双链小超给双链供应链下的订单0007','2994094080.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-12 13:02:57','CONFIRMED','1');
insert into retail_store_order_data values ('RSO000008','RS000004','RSCC000002','双链小超给双链供应链下的订单0008','2811537664.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-01 02:26:22','APPROVED','1');
insert into retail_store_order_data values ('RSO000009','RS000005','RSCC000003','双链小超给双链供应链下的订单0009','2602851840.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-10 04:44:51','PROCESSED','1');
insert into retail_store_order_data values ('RSO000010','RS000005','RSCC000003','双链小超给双链供应链下的订单0010','2123682432.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-12 21:29:10','PICKED','1');
insert into retail_store_order_data values ('RSO000011','RS000006','RSCC000003','双链小超给双链供应链下的订单0011','2655328256.00',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-30 15:46:55','SHIPPED','1');
insert into retail_store_order_data values ('RSO000012','RS000006','RSCC000003','双链小超给双链供应链下的订单0012','2193504000.00',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-29 12:34:58','DELIVERED','1');
insert into retail_store_order_data values ('RSO000013','RS000007','RSCC000004','双链小超给双链供应链下的订单0013','2901373952.00',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-29 18:36:24','CONFIRMED','1');
insert into retail_store_order_data values ('RSO000014','RS000007','RSCC000004','双链小超给双链供应链下的订单0014','2460975104.00',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-29 00:07:58','APPROVED','1');
insert into retail_store_order_data values ('RSO000015','RS000008','RSCC000004','双链小超给双链供应链下的订单0015','2146683392.00',NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-28 08:47:26','PROCESSED','1');
insert into retail_store_order_data values ('RSO000016','RS000008','RSCC000004','双链小超给双链供应链下的订单0016','2621060096.00',NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-04 21:55:41','PICKED','1');

	
insert into retail_store_order_confirmation_data values ('RSOC000001','确认者','2018-11-10','1');

	
insert into retail_store_order_approval_data values ('RSOA000001','批准者','2016-06-10','1');

	
insert into retail_store_order_processing_data values ('RSOP000001','处理者','2016-05-07','1');

	
insert into retail_store_order_picking_data values ('RSOP000001','处理者','2017-03-29','1');

	
insert into retail_store_order_shipment_data values ('RSOS000001','运货者','2018-03-24','1');

	
insert into retail_store_order_delivery_data values ('RSOD000001','送货者','2016-06-18','1');

	
insert into retail_store_order_line_item_data values ('RSOLI000001','RSO000001','SKU','大瓶可乐','2.84','9153','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000002','RSO000001','SKU0002','大瓶可乐0002','3.50','7010','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000003','RSO000002','SKU0003','大瓶可乐0003','3.00','7954','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000004','RSO000002','SKU0004','大瓶可乐0004','2.89','8641','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000005','RSO000003','SKU0005','大瓶可乐0005','3.44','9693','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000006','RSO000003','SKU0006','大瓶可乐0006','2.92','9635','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000007','RSO000004','SKU0007','大瓶可乐0007','3.18','9080','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000008','RSO000004','SKU0008','大瓶可乐0008','3.76','9290','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000009','RSO000005','SKU0009','大瓶可乐0009','3.95','9236','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000010','RSO000005','SKU0010','大瓶可乐0010','3.35','9918','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000011','RSO000006','SKU0011','大瓶可乐0011','2.88','7653','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000012','RSO000006','SKU0012','大瓶可乐0012','3.74','8259','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000013','RSO000007','SKU0013','大瓶可乐0013','3.24','8234','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000014','RSO000007','SKU0014','大瓶可乐0014','3.72','9574','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000015','RSO000008','SKU0015','大瓶可乐0015','3.47','9592','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000016','RSO000008','SKU0016','大瓶可乐0016','2.89','9941','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000017','RSO000009','SKU0017','大瓶可乐0017','3.29','7764','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000018','RSO000009','SKU0018','大瓶可乐0018','3.42','8029','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000019','RSO000010','SKU0019','大瓶可乐0019','3.48','8459','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000020','RSO000010','SKU0020','大瓶可乐0020','3.09','7063','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000021','RSO000011','SKU0021','大瓶可乐0021','2.99','7964','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000022','RSO000011','SKU0022','大瓶可乐0022','3.35','7552','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000023','RSO000012','SKU0023','大瓶可乐0023','3.48','7893','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000024','RSO000012','SKU0024','大瓶可乐0024','2.95','9796','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000025','RSO000013','SKU0025','大瓶可乐0025','2.99','8003','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000026','RSO000013','SKU0026','大瓶可乐0026','3.23','9150','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000027','RSO000014','SKU0027','大瓶可乐0027','3.04','8437','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000028','RSO000014','SKU0028','大瓶可乐0028','3.96','8517','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000029','RSO000015','SKU0029','大瓶可乐0029','3.33','8857','公斤','1');
insert into retail_store_order_line_item_data values ('RSOLI000030','RSO000015','SKU0030','大瓶可乐0030','3.21','8552','米','1');
insert into retail_store_order_line_item_data values ('RSOLI000031','RSO000016','SKU0031','大瓶可乐0031','2.80','9127','件','1');
insert into retail_store_order_line_item_data values ('RSOLI000032','RSO000016','SKU0032','大瓶可乐0032','3.11','9652','公斤','1');

	
insert into retail_store_order_shipping_group_data values ('RSOSG000001','送货到双链中和社区店','RSO000001','4.26','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000002','送货到双链中和社区店0002','RSO000001','4.41','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000003','送货到双链中和社区店0003','RSO000002','5.51','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000004','送货到双链中和社区店0004','RSO000002','5.89','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000005','送货到双链中和社区店0005','RSO000003','4.98','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000006','送货到双链中和社区店0006','RSO000003','4.47','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000007','送货到双链中和社区店0007','RSO000004','4.61','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000008','送货到双链中和社区店0008','RSO000004','4.37','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000009','送货到双链中和社区店0009','RSO000005','5.93','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000010','送货到双链中和社区店0010','RSO000005','5.00','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000011','送货到双链中和社区店0011','RSO000006','4.94','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000012','送货到双链中和社区店0012','RSO000006','4.50','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000013','送货到双链中和社区店0013','RSO000007','5.09','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000014','送货到双链中和社区店0014','RSO000007','4.60','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000015','送货到双链中和社区店0015','RSO000008','5.72','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000016','送货到双链中和社区店0016','RSO000008','4.51','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000017','送货到双链中和社区店0017','RSO000009','4.28','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000018','送货到双链中和社区店0018','RSO000009','5.26','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000019','送货到双链中和社区店0019','RSO000010','4.76','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000020','送货到双链中和社区店0020','RSO000010','4.30','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000021','送货到双链中和社区店0021','RSO000011','5.31','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000022','送货到双链中和社区店0022','RSO000011','4.40','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000023','送货到双链中和社区店0023','RSO000012','5.64','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000024','送货到双链中和社区店0024','RSO000012','5.23','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000025','送货到双链中和社区店0025','RSO000013','5.55','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000026','送货到双链中和社区店0026','RSO000013','5.54','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000027','送货到双链中和社区店0027','RSO000014','5.01','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000028','送货到双链中和社区店0028','RSO000014','5.96','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000029','送货到双链中和社区店0029','RSO000015','5.22','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000030','送货到双链中和社区店0030','RSO000015','5.91','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000031','送货到双链中和社区店0031','RSO000016','5.33','1');
insert into retail_store_order_shipping_group_data values ('RSOSG000032','送货到双链中和社区店0032','RSO000016','4.82','1');

	
insert into retail_store_order_payment_group_data values ('RSOPG000001','付款办法','RSO000001','4111 1111 1111 - ','1');
insert into retail_store_order_payment_group_data values ('RSOPG000002','付款办法0002','RSO000001','4111 1111 1111 - 0002','1');
insert into retail_store_order_payment_group_data values ('RSOPG000003','付款办法0003','RSO000002','4111 1111 1111 - 0003','1');
insert into retail_store_order_payment_group_data values ('RSOPG000004','付款办法0004','RSO000002','4111 1111 1111 - 0004','1');
insert into retail_store_order_payment_group_data values ('RSOPG000005','付款办法0005','RSO000003','4111 1111 1111 - 0005','1');
insert into retail_store_order_payment_group_data values ('RSOPG000006','付款办法0006','RSO000003','4111 1111 1111 - 0006','1');
insert into retail_store_order_payment_group_data values ('RSOPG000007','付款办法0007','RSO000004','4111 1111 1111 - 0007','1');
insert into retail_store_order_payment_group_data values ('RSOPG000008','付款办法0008','RSO000004','4111 1111 1111 - 0008','1');
insert into retail_store_order_payment_group_data values ('RSOPG000009','付款办法0009','RSO000005','4111 1111 1111 - 0009','1');
insert into retail_store_order_payment_group_data values ('RSOPG000010','付款办法0010','RSO000005','4111 1111 1111 - 0010','1');
insert into retail_store_order_payment_group_data values ('RSOPG000011','付款办法0011','RSO000006','4111 1111 1111 - 0011','1');
insert into retail_store_order_payment_group_data values ('RSOPG000012','付款办法0012','RSO000006','4111 1111 1111 - 0012','1');
insert into retail_store_order_payment_group_data values ('RSOPG000013','付款办法0013','RSO000007','4111 1111 1111 - 0013','1');
insert into retail_store_order_payment_group_data values ('RSOPG000014','付款办法0014','RSO000007','4111 1111 1111 - 0014','1');
insert into retail_store_order_payment_group_data values ('RSOPG000015','付款办法0015','RSO000008','4111 1111 1111 - 0015','1');
insert into retail_store_order_payment_group_data values ('RSOPG000016','付款办法0016','RSO000008','4111 1111 1111 - 0016','1');
insert into retail_store_order_payment_group_data values ('RSOPG000017','付款办法0017','RSO000009','4111 1111 1111 - 0017','1');
insert into retail_store_order_payment_group_data values ('RSOPG000018','付款办法0018','RSO000009','4111 1111 1111 - 0018','1');
insert into retail_store_order_payment_group_data values ('RSOPG000019','付款办法0019','RSO000010','4111 1111 1111 - 0019','1');
insert into retail_store_order_payment_group_data values ('RSOPG000020','付款办法0020','RSO000010','4111 1111 1111 - 0020','1');
insert into retail_store_order_payment_group_data values ('RSOPG000021','付款办法0021','RSO000011','4111 1111 1111 - 0021','1');
insert into retail_store_order_payment_group_data values ('RSOPG000022','付款办法0022','RSO000011','4111 1111 1111 - 0022','1');
insert into retail_store_order_payment_group_data values ('RSOPG000023','付款办法0023','RSO000012','4111 1111 1111 - 0023','1');
insert into retail_store_order_payment_group_data values ('RSOPG000024','付款办法0024','RSO000012','4111 1111 1111 - 0024','1');
insert into retail_store_order_payment_group_data values ('RSOPG000025','付款办法0025','RSO000013','4111 1111 1111 - 0025','1');
insert into retail_store_order_payment_group_data values ('RSOPG000026','付款办法0026','RSO000013','4111 1111 1111 - 0026','1');
insert into retail_store_order_payment_group_data values ('RSOPG000027','付款办法0027','RSO000014','4111 1111 1111 - 0027','1');
insert into retail_store_order_payment_group_data values ('RSOPG000028','付款办法0028','RSO000014','4111 1111 1111 - 0028','1');
insert into retail_store_order_payment_group_data values ('RSOPG000029','付款办法0029','RSO000015','4111 1111 1111 - 0029','1');
insert into retail_store_order_payment_group_data values ('RSOPG000030','付款办法0030','RSO000015','4111 1111 1111 - 0030','1');
insert into retail_store_order_payment_group_data values ('RSOPG000031','付款办法0031','RSO000016','4111 1111 1111 - 0031','1');
insert into retail_store_order_payment_group_data values ('RSOPG000032','付款办法0032','RSO000016','4111 1111 1111 - 0032','1');

	
insert into warehouse_data values ('W000001','成都龙泉驿飞鹤路20号','02887654321','187672平方米','RSCC000001','40.04439665049193','131.00419502899925','2019-01-09 02:53:47','1');
insert into warehouse_data values ('W000002','成都龙泉驿飞鹤路20号0002','028876543210002','187672平方米0002','RSCC000003','41.36196140775565','131.05092918300107','2019-01-16 13:54:21','1');

	
insert into storage_space_data values ('SS000001','成都龙泉驿飞鹤路20号存货区','02887654321','1876平方米','W000001','42.236226551346356','131.09323846645242','1');
insert into storage_space_data values ('SS000002','成都龙泉驿飞鹤路20号存货区0002','028876543210002','1876平方米0002','W000001','41.97056279437594','130.15442489196306','1');
insert into storage_space_data values ('SS000003','成都龙泉驿飞鹤路20号存货区0003','028876543210003','1876平方米0003','W000002','40.53583306094309','131.61157499530762','1');
insert into storage_space_data values ('SS000004','成都龙泉驿飞鹤路20号存货区0004','028876543210004','1876平方米0004','W000002','39.954651335783964','129.89974196518662','1');

	
insert into smart_pallet_data values ('SP000001','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等','02887654321','1876平方米','39.82188129734216','130.39579152259788','W000001','1');
insert into smart_pallet_data values ('SP000002','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0002','028876543210002','1876平方米0002','39.81782688821822','131.00242601082465','W000001','1');
insert into smart_pallet_data values ('SP000003','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0003','028876543210003','1876平方米0003','39.95438824128794','129.49202961873783','W000002','1');
insert into smart_pallet_data values ('SP000004','成都龙泉驿飞鹤路20号移动区域，比如过道，货运通道等0004','028876543210004','1876平方米0004','42.401816730745544','131.05260968196947','W000002','1');

	
insert into goods_shelf_data values ('GS000001','成都龙泉驿飞鹤路20号存货区货架','SS000001','SS000001','DS000001','1');
insert into goods_shelf_data values ('GS000002','成都龙泉驿飞鹤路20号存货区货架0002','SS000001','SS000001','DS000001','1');
insert into goods_shelf_data values ('GS000003','成都龙泉驿飞鹤路20号存货区货架0003','SS000002','SS000002','DS000002','1');
insert into goods_shelf_data values ('GS000004','成都龙泉驿飞鹤路20号存货区货架0004','SS000002','SS000002','DS000002','1');
insert into goods_shelf_data values ('GS000005','成都龙泉驿飞鹤路20号存货区货架0005','SS000003','SS000003','DS000003','1');
insert into goods_shelf_data values ('GS000006','成都龙泉驿飞鹤路20号存货区货架0006','SS000003','SS000003','DS000003','1');
insert into goods_shelf_data values ('GS000007','成都龙泉驿飞鹤路20号存货区货架0007','SS000004','SS000004','DS000004','1');
insert into goods_shelf_data values ('GS000008','成都龙泉驿飞鹤路20号存货区货架0008','SS000004','SS000004','DS000004','1');

	
insert into goods_shelf_stock_count_data values ('GSSC000001','每日盘点','2018-04-30','使用先进的rfid技术，没有任何错误','GS000001','1');
insert into goods_shelf_stock_count_data values ('GSSC000002','每周盘点','2016-03-30','使用先进的rfid技术，没有任何错误0002','GS000001','1');
insert into goods_shelf_stock_count_data values ('GSSC000003','每月盘点','2017-01-26','使用先进的rfid技术，没有任何错误0003','GS000002','1');
insert into goods_shelf_stock_count_data values ('GSSC000004','年终盘点','2017-05-29','使用先进的rfid技术，没有任何错误0004','GS000002','1');
insert into goods_shelf_stock_count_data values ('GSSC000005','每日盘点','2017-02-23','使用先进的rfid技术，没有任何错误0005','GS000003','1');
insert into goods_shelf_stock_count_data values ('GSSC000006','每周盘点','2016-03-12','使用先进的rfid技术，没有任何错误0006','GS000003','1');
insert into goods_shelf_stock_count_data values ('GSSC000007','每月盘点','2017-12-12','使用先进的rfid技术，没有任何错误0007','GS000004','1');
insert into goods_shelf_stock_count_data values ('GSSC000008','年终盘点','2016-07-02','使用先进的rfid技术，没有任何错误0008','GS000004','1');
insert into goods_shelf_stock_count_data values ('GSSC000009','每日盘点','2017-07-24','使用先进的rfid技术，没有任何错误0009','GS000005','1');
insert into goods_shelf_stock_count_data values ('GSSC000010','每周盘点','2018-02-12','使用先进的rfid技术，没有任何错误0010','GS000005','1');
insert into goods_shelf_stock_count_data values ('GSSC000011','每月盘点','2017-11-26','使用先进的rfid技术，没有任何错误0011','GS000006','1');
insert into goods_shelf_stock_count_data values ('GSSC000012','年终盘点','2018-11-21','使用先进的rfid技术，没有任何错误0012','GS000006','1');
insert into goods_shelf_stock_count_data values ('GSSC000013','每日盘点','2016-03-28','使用先进的rfid技术，没有任何错误0013','GS000007','1');
insert into goods_shelf_stock_count_data values ('GSSC000014','每周盘点','2016-11-14','使用先进的rfid技术，没有任何错误0014','GS000007','1');
insert into goods_shelf_stock_count_data values ('GSSC000015','每月盘点','2017-03-03','使用先进的rfid技术，没有任何错误0015','GS000008','1');
insert into goods_shelf_stock_count_data values ('GSSC000016','年终盘点','2016-08-03','使用先进的rfid技术，没有任何错误0016','GS000008','1');

	
insert into stock_count_issue_track_data values ('SCIT000001','盘点差错','2018-07-29','发现错误已经修正完成','GSSC000001','1');
insert into stock_count_issue_track_data values ('SCIT000002','盘点差错0002','2017-10-23','发现错误已经修正完成0002','GSSC000001','1');
insert into stock_count_issue_track_data values ('SCIT000003','盘点差错0003','2018-12-27','发现错误已经修正完成0003','GSSC000002','1');
insert into stock_count_issue_track_data values ('SCIT000004','盘点差错0004','2018-08-11','发现错误已经修正完成0004','GSSC000002','1');
insert into stock_count_issue_track_data values ('SCIT000005','盘点差错0005','2016-11-26','发现错误已经修正完成0005','GSSC000003','1');
insert into stock_count_issue_track_data values ('SCIT000006','盘点差错0006','2017-08-03','发现错误已经修正完成0006','GSSC000003','1');
insert into stock_count_issue_track_data values ('SCIT000007','盘点差错0007','2016-06-20','发现错误已经修正完成0007','GSSC000004','1');
insert into stock_count_issue_track_data values ('SCIT000008','盘点差错0008','2018-07-13','发现错误已经修正完成0008','GSSC000004','1');
insert into stock_count_issue_track_data values ('SCIT000009','盘点差错0009','2017-06-02','发现错误已经修正完成0009','GSSC000005','1');
insert into stock_count_issue_track_data values ('SCIT000010','盘点差错0010','2017-05-08','发现错误已经修正完成0010','GSSC000005','1');
insert into stock_count_issue_track_data values ('SCIT000011','盘点差错0011','2017-01-18','发现错误已经修正完成0011','GSSC000006','1');
insert into stock_count_issue_track_data values ('SCIT000012','盘点差错0012','2017-07-18','发现错误已经修正完成0012','GSSC000006','1');
insert into stock_count_issue_track_data values ('SCIT000013','盘点差错0013','2016-08-21','发现错误已经修正完成0013','GSSC000007','1');
insert into stock_count_issue_track_data values ('SCIT000014','盘点差错0014','2016-12-09','发现错误已经修正完成0014','GSSC000007','1');
insert into stock_count_issue_track_data values ('SCIT000015','盘点差错0015','2018-08-11','发现错误已经修正完成0015','GSSC000008','1');
insert into stock_count_issue_track_data values ('SCIT000016','盘点差错0016','2017-10-30','发现错误已经修正完成0016','GSSC000008','1');
insert into stock_count_issue_track_data values ('SCIT000017','盘点差错0017','2016-02-09','发现错误已经修正完成0017','GSSC000009','1');
insert into stock_count_issue_track_data values ('SCIT000018','盘点差错0018','2016-05-17','发现错误已经修正完成0018','GSSC000009','1');
insert into stock_count_issue_track_data values ('SCIT000019','盘点差错0019','2016-03-09','发现错误已经修正完成0019','GSSC000010','1');
insert into stock_count_issue_track_data values ('SCIT000020','盘点差错0020','2016-02-28','发现错误已经修正完成0020','GSSC000010','1');
insert into stock_count_issue_track_data values ('SCIT000021','盘点差错0021','2018-10-28','发现错误已经修正完成0021','GSSC000011','1');
insert into stock_count_issue_track_data values ('SCIT000022','盘点差错0022','2018-03-08','发现错误已经修正完成0022','GSSC000011','1');
insert into stock_count_issue_track_data values ('SCIT000023','盘点差错0023','2017-05-14','发现错误已经修正完成0023','GSSC000012','1');
insert into stock_count_issue_track_data values ('SCIT000024','盘点差错0024','2018-10-02','发现错误已经修正完成0024','GSSC000012','1');
insert into stock_count_issue_track_data values ('SCIT000025','盘点差错0025','2018-04-14','发现错误已经修正完成0025','GSSC000013','1');
insert into stock_count_issue_track_data values ('SCIT000026','盘点差错0026','2018-11-01','发现错误已经修正完成0026','GSSC000013','1');
insert into stock_count_issue_track_data values ('SCIT000027','盘点差错0027','2016-12-24','发现错误已经修正完成0027','GSSC000014','1');
insert into stock_count_issue_track_data values ('SCIT000028','盘点差错0028','2016-07-01','发现错误已经修正完成0028','GSSC000014','1');
insert into stock_count_issue_track_data values ('SCIT000029','盘点差错0029','2016-01-25','发现错误已经修正完成0029','GSSC000015','1');
insert into stock_count_issue_track_data values ('SCIT000030','盘点差错0030','2017-08-21','发现错误已经修正完成0030','GSSC000015','1');
insert into stock_count_issue_track_data values ('SCIT000031','盘点差错0031','2017-03-10','发现错误已经修正完成0031','GSSC000016','1');
insert into stock_count_issue_track_data values ('SCIT000032','盘点差错0032','2016-08-01','发现错误已经修正完成0032','GSSC000016','1');

	
insert into goods_allocation_data values ('GA000001','成都龙泉驿飞鹤路20号存货区货架20号货位','41.67794221651225','129.38228842219422','GS000001','1');
insert into goods_allocation_data values ('GA000002','成都龙泉驿飞鹤路20号存货区货架20号货位0002','42.75205033447753','129.87851342678897','GS000001','1');
insert into goods_allocation_data values ('GA000003','成都龙泉驿飞鹤路20号存货区货架20号货位0003','42.65004106890131','129.5463182554055','GS000002','1');
insert into goods_allocation_data values ('GA000004','成都龙泉驿飞鹤路20号存货区货架20号货位0004','40.144321194829146','129.78809262277193','GS000002','1');
insert into goods_allocation_data values ('GA000005','成都龙泉驿飞鹤路20号存货区货架20号货位0005','41.58247709289876','132.06871200288847','GS000003','1');
insert into goods_allocation_data values ('GA000006','成都龙泉驿飞鹤路20号存货区货架20号货位0006','39.80397971298613','129.8653980407481','GS000003','1');
insert into goods_allocation_data values ('GA000007','成都龙泉驿飞鹤路20号存货区货架20号货位0007','42.340933549644156','131.00239341680705','GS000004','1');
insert into goods_allocation_data values ('GA000008','成都龙泉驿飞鹤路20号存货区货架20号货位0008','39.80409278960848','130.6270547133211','GS000004','1');
insert into goods_allocation_data values ('GA000009','成都龙泉驿飞鹤路20号存货区货架20号货位0009','39.80622796342008','130.63355705572496','GS000005','1');
insert into goods_allocation_data values ('GA000010','成都龙泉驿飞鹤路20号存货区货架20号货位0010','41.42495022239884','129.64529826657238','GS000005','1');
insert into goods_allocation_data values ('GA000011','成都龙泉驿飞鹤路20号存货区货架20号货位0011','42.758424151765446','130.9528874432512','GS000006','1');
insert into goods_allocation_data values ('GA000012','成都龙泉驿飞鹤路20号存货区货架20号货位0012','41.7665584166029','130.15624825833697','GS000006','1');
insert into goods_allocation_data values ('GA000013','成都龙泉驿飞鹤路20号存货区货架20号货位0013','40.738146871375555','131.3712159861598','GS000007','1');
insert into goods_allocation_data values ('GA000014','成都龙泉驿飞鹤路20号存货区货架20号货位0014','41.786319306512155','130.786748989567','GS000007','1');
insert into goods_allocation_data values ('GA000015','成都龙泉驿飞鹤路20号存货区货架20号货位0015','39.890195256556986','132.26161570850726','GS000008','1');
insert into goods_allocation_data values ('GA000016','成都龙泉驿飞鹤路20号存货区货架20号货位0016','39.79384635964567','130.55160338073583','GS000008','1');

	
insert into goods_data values ('G000001','可口可乐','RF99192','件','8','2018-01-25','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED','1');
insert into goods_data values ('G000002','可口可乐0002','RF991920002','箱','10','2016-10-15','S000001','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0002','1');
insert into goods_data values ('G000003','可口可乐0003','RF991920003','件','10','2016-02-20','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0003','1');
insert into goods_data values ('G000004','可口可乐0004','RF991920004','箱','10','2016-12-27','S000002','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0004','1');
insert into goods_data values ('G000005','可口可乐0005','RF991920005','件','10','2018-01-19','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0005','1');
insert into goods_data values ('G000006','可口可乐0006','RF991920006','箱','10','2016-06-01','S000003','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0006','1');
insert into goods_data values ('G000007','可口可乐0007','RF991920007','件','9','2016-11-11','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0007','1');
insert into goods_data values ('G000008','可口可乐0008','RF991920008','箱','10','2018-12-18','S000004','RS000001','GA000001','SP000001','SS000001','TT000001','RS000001','SO000001','RSO000001',NULL,'PACKED0008','1');
insert into goods_data values ('G000009','可口可乐0009','RF991920009','件','10','2018-01-13','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0009','1');
insert into goods_data values ('G000010','可口可乐0010','RF991920010','箱','9','2017-05-27','S000005','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0010','1');
insert into goods_data values ('G000011','可口可乐0011','RF991920011','件','10','2017-05-17','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0011','1');
insert into goods_data values ('G000012','可口可乐0012','RF991920012','箱','9','2017-07-07','S000006','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0012','1');
insert into goods_data values ('G000013','可口可乐0013','RF991920013','件','10','2016-10-11','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0013','1');
insert into goods_data values ('G000014','可口可乐0014','RF991920014','箱','8','2018-07-19','S000007','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0014','1');
insert into goods_data values ('G000015','可口可乐0015','RF991920015','件','10','2017-08-09','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0015','1');
insert into goods_data values ('G000016','可口可乐0016','RF991920016','箱','10','2018-03-28','S000008','RS000001','GA000002','SP000001','SS000001','TT000002','RS000001','SO000001','RSO000002',NULL,'PACKED0016','1');
insert into goods_data values ('G000017','可口可乐0017','RF991920017','件','9','2018-07-14','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0017','1');
insert into goods_data values ('G000018','可口可乐0018','RF991920018','箱','8','2019-01-17','S000009','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0018','1');
insert into goods_data values ('G000019','可口可乐0019','RF991920019','件','10','2018-05-31','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0019','1');
insert into goods_data values ('G000020','可口可乐0020','RF991920020','箱','8','2018-10-25','S000010','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0020','1');
insert into goods_data values ('G000021','可口可乐0021','RF991920021','件','9','2016-09-01','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0021','1');
insert into goods_data values ('G000022','可口可乐0022','RF991920022','箱','9','2016-05-29','S000011','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0022','1');
insert into goods_data values ('G000023','可口可乐0023','RF991920023','件','9','2017-05-15','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0023','1');
insert into goods_data values ('G000024','可口可乐0024','RF991920024','箱','10','2016-04-19','S000012','RS000001','GA000003','SP000001','SS000001','TT000003','RS000002','SO000001','RSO000003',NULL,'PACKED0024','1');
insert into goods_data values ('G000025','可口可乐0025','RF991920025','件','8','2018-01-19','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0025','1');
insert into goods_data values ('G000026','可口可乐0026','RF991920026','箱','9','2016-07-05','S000013','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0026','1');
insert into goods_data values ('G000027','可口可乐0027','RF991920027','件','9','2017-11-20','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0027','1');
insert into goods_data values ('G000028','可口可乐0028','RF991920028','箱','10','2017-07-11','S000014','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0028','1');
insert into goods_data values ('G000029','可口可乐0029','RF991920029','件','9','2016-10-01','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0029','1');
insert into goods_data values ('G000030','可口可乐0030','RF991920030','箱','8','2016-03-26','S000015','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0030','1');
insert into goods_data values ('G000031','可口可乐0031','RF991920031','件','8','2016-01-29','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0031','1');
insert into goods_data values ('G000032','可口可乐0032','RF991920032','箱','8','2018-01-25','S000016','RS000001','GA000004','SP000001','SS000001','TT000004','RS000002','SO000001','RSO000004',NULL,'PACKED0032','1');
insert into goods_data values ('G000033','可口可乐0033','RF991920033','件','9','2018-05-19','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0033','1');
insert into goods_data values ('G000034','可口可乐0034','RF991920034','箱','8','2018-12-23','S000017','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0034','1');
insert into goods_data values ('G000035','可口可乐0035','RF991920035','件','9','2017-07-30','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0035','1');
insert into goods_data values ('G000036','可口可乐0036','RF991920036','箱','8','2017-10-17','S000018','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0036','1');
insert into goods_data values ('G000037','可口可乐0037','RF991920037','件','8','2016-02-15','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0037','1');
insert into goods_data values ('G000038','可口可乐0038','RF991920038','箱','10','2018-01-06','S000019','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0038','1');
insert into goods_data values ('G000039','可口可乐0039','RF991920039','件','10','2017-03-27','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0039','1');
insert into goods_data values ('G000040','可口可乐0040','RF991920040','箱','9','2018-12-14','S000020','RS000002','GA000005','SP000002','SS000002','TT000005','RS000003','SO000002','RSO000005',NULL,'PACKED0040','1');
insert into goods_data values ('G000041','可口可乐0041','RF991920041','件','9','2018-03-31','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0041','1');
insert into goods_data values ('G000042','可口可乐0042','RF991920042','箱','9','2018-06-12','S000021','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0042','1');
insert into goods_data values ('G000043','可口可乐0043','RF991920043','件','9','2016-05-09','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0043','1');
insert into goods_data values ('G000044','可口可乐0044','RF991920044','箱','9','2016-05-18','S000022','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0044','1');
insert into goods_data values ('G000045','可口可乐0045','RF991920045','件','9','2017-09-10','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0045','1');
insert into goods_data values ('G000046','可口可乐0046','RF991920046','箱','8','2016-04-01','S000023','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0046','1');
insert into goods_data values ('G000047','可口可乐0047','RF991920047','件','10','2017-12-06','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0047','1');
insert into goods_data values ('G000048','可口可乐0048','RF991920048','箱','8','2017-03-11','S000024','RS000002','GA000006','SP000002','SS000002','TT000006','RS000003','SO000002','RSO000006',NULL,'PACKED0048','1');
insert into goods_data values ('G000049','可口可乐0049','RF991920049','件','9','2017-01-07','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0049','1');
insert into goods_data values ('G000050','可口可乐0050','RF991920050','箱','8','2018-08-30','S000025','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0050','1');
insert into goods_data values ('G000051','可口可乐0051','RF991920051','件','10','2016-01-30','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0051','1');
insert into goods_data values ('G000052','可口可乐0052','RF991920052','箱','9','2017-02-18','S000026','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0052','1');
insert into goods_data values ('G000053','可口可乐0053','RF991920053','件','9','2018-10-04','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0053','1');
insert into goods_data values ('G000054','可口可乐0054','RF991920054','箱','9','2016-12-06','S000027','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0054','1');
insert into goods_data values ('G000055','可口可乐0055','RF991920055','件','8','2017-07-17','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0055','1');
insert into goods_data values ('G000056','可口可乐0056','RF991920056','箱','10','2017-05-15','S000028','RS000002','GA000007','SP000002','SS000002','TT000007','RS000004','SO000002','RSO000007',NULL,'PACKED0056','1');
insert into goods_data values ('G000057','可口可乐0057','RF991920057','件','8','2018-01-09','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0057','1');
insert into goods_data values ('G000058','可口可乐0058','RF991920058','箱','10','2018-02-03','S000029','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0058','1');
insert into goods_data values ('G000059','可口可乐0059','RF991920059','件','10','2017-01-03','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0059','1');
insert into goods_data values ('G000060','可口可乐0060','RF991920060','箱','8','2016-06-05','S000030','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0060','1');
insert into goods_data values ('G000061','可口可乐0061','RF991920061','件','8','2016-11-26','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0061','1');
insert into goods_data values ('G000062','可口可乐0062','RF991920062','箱','9','2018-05-19','S000031','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0062','1');
insert into goods_data values ('G000063','可口可乐0063','RF991920063','件','8','2016-08-28','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0063','1');
insert into goods_data values ('G000064','可口可乐0064','RF991920064','箱','8','2017-08-04','S000032','RS000002','GA000008','SP000002','SS000002','TT000008','RS000004','SO000002','RSO000008',NULL,'PACKED0064','1');
insert into goods_data values ('G000065','可口可乐0065','RF991920065','件','10','2017-12-08','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0065','1');
insert into goods_data values ('G000066','可口可乐0066','RF991920066','箱','9','2017-06-04','S000033','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0066','1');
insert into goods_data values ('G000067','可口可乐0067','RF991920067','件','10','2016-02-07','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0067','1');
insert into goods_data values ('G000068','可口可乐0068','RF991920068','箱','9','2017-12-06','S000034','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0068','1');
insert into goods_data values ('G000069','可口可乐0069','RF991920069','件','10','2017-10-09','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0069','1');
insert into goods_data values ('G000070','可口可乐0070','RF991920070','箱','8','2017-04-17','S000035','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0070','1');
insert into goods_data values ('G000071','可口可乐0071','RF991920071','件','10','2016-09-12','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0071','1');
insert into goods_data values ('G000072','可口可乐0072','RF991920072','箱','8','2017-10-12','S000036','RS000003','GA000009','SP000003','SS000003','TT000009','RS000005','SO000003','RSO000009',NULL,'PACKED0072','1');
insert into goods_data values ('G000073','可口可乐0073','RF991920073','件','9','2016-10-09','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0073','1');
insert into goods_data values ('G000074','可口可乐0074','RF991920074','箱','8','2017-02-01','S000037','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0074','1');
insert into goods_data values ('G000075','可口可乐0075','RF991920075','件','10','2018-11-06','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0075','1');
insert into goods_data values ('G000076','可口可乐0076','RF991920076','箱','8','2018-04-28','S000038','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0076','1');
insert into goods_data values ('G000077','可口可乐0077','RF991920077','件','10','2016-02-26','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0077','1');
insert into goods_data values ('G000078','可口可乐0078','RF991920078','箱','10','2017-08-09','S000039','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0078','1');
insert into goods_data values ('G000079','可口可乐0079','RF991920079','件','9','2018-10-17','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0079','1');
insert into goods_data values ('G000080','可口可乐0080','RF991920080','箱','8','2017-08-26','S000040','RS000003','GA000010','SP000003','SS000003','TT000010','RS000005','SO000003','RSO000010',NULL,'PACKED0080','1');
insert into goods_data values ('G000081','可口可乐0081','RF991920081','件','10','2016-12-15','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0081','1');
insert into goods_data values ('G000082','可口可乐0082','RF991920082','箱','9','2018-04-25','S000041','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0082','1');
insert into goods_data values ('G000083','可口可乐0083','RF991920083','件','10','2018-01-11','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0083','1');
insert into goods_data values ('G000084','可口可乐0084','RF991920084','箱','9','2016-05-26','S000042','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0084','1');
insert into goods_data values ('G000085','可口可乐0085','RF991920085','件','9','2017-11-28','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0085','1');
insert into goods_data values ('G000086','可口可乐0086','RF991920086','箱','8','2016-08-14','S000043','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0086','1');
insert into goods_data values ('G000087','可口可乐0087','RF991920087','件','8','2017-04-28','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0087','1');
insert into goods_data values ('G000088','可口可乐0088','RF991920088','箱','8','2017-11-02','S000044','RS000003','GA000011','SP000003','SS000003','TT000011','RS000006','SO000003','RSO000011',NULL,'PACKED0088','1');
insert into goods_data values ('G000089','可口可乐0089','RF991920089','件','9','2018-12-29','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0089','1');
insert into goods_data values ('G000090','可口可乐0090','RF991920090','箱','10','2017-03-16','S000045','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0090','1');
insert into goods_data values ('G000091','可口可乐0091','RF991920091','件','8','2018-12-15','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0091','1');
insert into goods_data values ('G000092','可口可乐0092','RF991920092','箱','8','2017-01-27','S000046','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0092','1');
insert into goods_data values ('G000093','可口可乐0093','RF991920093','件','10','2017-04-05','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0093','1');
insert into goods_data values ('G000094','可口可乐0094','RF991920094','箱','9','2017-11-26','S000047','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0094','1');
insert into goods_data values ('G000095','可口可乐0095','RF991920095','件','8','2016-09-16','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0095','1');
insert into goods_data values ('G000096','可口可乐0096','RF991920096','箱','8','2016-08-27','S000048','RS000003','GA000012','SP000003','SS000003','TT000012','RS000006','SO000003','RSO000012',NULL,'PACKED0096','1');
insert into goods_data values ('G000097','可口可乐0097','RF991920097','件','8','2018-03-23','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0097','1');
insert into goods_data values ('G000098','可口可乐0098','RF991920098','箱','10','2017-05-09','S000049','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0098','1');
insert into goods_data values ('G000099','可口可乐0099','RF991920099','件','8','2016-09-02','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0099','1');
insert into goods_data values ('G000100','可口可乐0100','RF991920100','箱','9','2016-10-18','S000050','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0100','1');
insert into goods_data values ('G000101','可口可乐0101','RF991920101','件','8','2017-11-19','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0101','1');
insert into goods_data values ('G000102','可口可乐0102','RF991920102','箱','9','2018-06-24','S000051','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0102','1');
insert into goods_data values ('G000103','可口可乐0103','RF991920103','件','10','2018-11-28','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0103','1');
insert into goods_data values ('G000104','可口可乐0104','RF991920104','箱','8','2019-01-08','S000052','RS000004','GA000013','SP000004','SS000004','TT000013','RS000007','SO000004','RSO000013',NULL,'PACKED0104','1');
insert into goods_data values ('G000105','可口可乐0105','RF991920105','件','9','2016-03-03','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0105','1');
insert into goods_data values ('G000106','可口可乐0106','RF991920106','箱','8','2017-06-18','S000053','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0106','1');
insert into goods_data values ('G000107','可口可乐0107','RF991920107','件','8','2016-08-09','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0107','1');
insert into goods_data values ('G000108','可口可乐0108','RF991920108','箱','9','2016-11-13','S000054','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0108','1');
insert into goods_data values ('G000109','可口可乐0109','RF991920109','件','10','2018-05-21','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0109','1');
insert into goods_data values ('G000110','可口可乐0110','RF991920110','箱','10','2016-10-13','S000055','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0110','1');
insert into goods_data values ('G000111','可口可乐0111','RF991920111','件','9','2016-02-16','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0111','1');
insert into goods_data values ('G000112','可口可乐0112','RF991920112','箱','10','2017-01-17','S000056','RS000004','GA000014','SP000004','SS000004','TT000014','RS000007','SO000004','RSO000014',NULL,'PACKED0112','1');
insert into goods_data values ('G000113','可口可乐0113','RF991920113','件','8','2017-12-20','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0113','1');
insert into goods_data values ('G000114','可口可乐0114','RF991920114','箱','8','2017-07-07','S000057','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0114','1');
insert into goods_data values ('G000115','可口可乐0115','RF991920115','件','8','2016-03-21','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0115','1');
insert into goods_data values ('G000116','可口可乐0116','RF991920116','箱','10','2018-02-22','S000058','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0116','1');
insert into goods_data values ('G000117','可口可乐0117','RF991920117','件','10','2017-07-31','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0117','1');
insert into goods_data values ('G000118','可口可乐0118','RF991920118','箱','9','2018-11-25','S000059','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0118','1');
insert into goods_data values ('G000119','可口可乐0119','RF991920119','件','9','2017-03-26','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0119','1');
insert into goods_data values ('G000120','可口可乐0120','RF991920120','箱','8','2018-10-02','S000060','RS000004','GA000015','SP000004','SS000004','TT000015','RS000008','SO000004','RSO000015',NULL,'PACKED0120','1');
insert into goods_data values ('G000121','可口可乐0121','RF991920121','件','10','2017-05-25','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0121','1');
insert into goods_data values ('G000122','可口可乐0122','RF991920122','箱','10','2017-12-17','S000061','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0122','1');
insert into goods_data values ('G000123','可口可乐0123','RF991920123','件','9','2018-02-02','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0123','1');
insert into goods_data values ('G000124','可口可乐0124','RF991920124','箱','10','2016-08-31','S000062','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0124','1');
insert into goods_data values ('G000125','可口可乐0125','RF991920125','件','8','2017-02-12','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0125','1');
insert into goods_data values ('G000126','可口可乐0126','RF991920126','箱','9','2017-08-04','S000063','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0126','1');
insert into goods_data values ('G000127','可口可乐0127','RF991920127','件','10','2016-05-29','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0127','1');
insert into goods_data values ('G000128','可口可乐0128','RF991920128','箱','10','2018-06-18','S000064','RS000004','GA000016','SP000004','SS000004','TT000016','RS000008','SO000004','RSO000016',NULL,'PACKED0128','1');

	
insert into goods_packaging_data values ('GP000001','王煜东','RF99192','2017-10-12','打包完成，准备起运','1');

	
insert into goods_movement_data values ('GM000001','2019-01-18 06:21:26','仓库货位','仓库货位','192.168.20.1','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405','FTYUIOLJYT^*(PLKJYT)','41.35933661960697','129.66764168818804','G000001','1');
insert into goods_movement_data values ('GM000002','2019-01-04 16:32:57','卡车','卡车','192.168.20.10002','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050002','FTYUIOLJYT^*(PLKJYT)0002','42.7016479297229','131.09267402964508','G000001','1');
insert into goods_movement_data values ('GM000003','2019-01-01 07:13:51','小超','小超','192.168.20.10003','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050003','FTYUIOLJYT^*(PLKJYT)0003','41.96289033483485','130.2001943563336','G000002','1');
insert into goods_movement_data values ('GM000004','2019-01-14 15:24:49','仓库货位','仓库货位','192.168.20.10004','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050004','FTYUIOLJYT^*(PLKJYT)0004','41.29045672389023','130.20065322490854','G000002','1');
insert into goods_movement_data values ('GM000005','2018-12-31 01:17:03','卡车','卡车','192.168.20.10005','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050005','FTYUIOLJYT^*(PLKJYT)0005','42.37623021543317','131.54016496832782','G000003','1');
insert into goods_movement_data values ('GM000006','2019-01-11 14:18:46','小超','小超','192.168.20.10006','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050006','FTYUIOLJYT^*(PLKJYT)0006','41.480952724785695','130.00333955716187','G000003','1');
insert into goods_movement_data values ('GM000007','2019-01-14 19:43:52','仓库货位','仓库货位','192.168.20.10007','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050007','FTYUIOLJYT^*(PLKJYT)0007','41.792232830877595','131.55705848570915','G000004','1');
insert into goods_movement_data values ('GM000008','2019-01-06 12:48:37','卡车','卡车','192.168.20.10008','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050008','FTYUIOLJYT^*(PLKJYT)0008','41.24485960169772','130.09271609368133','G000004','1');
insert into goods_movement_data values ('GM000009','2019-01-05 14:00:21','小超','小超','192.168.20.10009','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050009','FTYUIOLJYT^*(PLKJYT)0009','42.55859874709669','131.78273543331275','G000005','1');
insert into goods_movement_data values ('GM000010','2019-01-11 12:31:02','仓库货位','仓库货位','192.168.20.10010','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050010','FTYUIOLJYT^*(PLKJYT)0010','42.31165060259722','130.31923061816397','G000005','1');
insert into goods_movement_data values ('GM000011','2019-01-14 12:11:21','卡车','卡车','192.168.20.10011','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050011','FTYUIOLJYT^*(PLKJYT)0011','42.72439788767044','132.155355651325','G000006','1');
insert into goods_movement_data values ('GM000012','2019-01-15 20:47:19','小超','小超','192.168.20.10012','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050012','FTYUIOLJYT^*(PLKJYT)0012','42.688224039796445','131.31879453207938','G000006','1');
insert into goods_movement_data values ('GM000013','2019-01-09 16:02:47','仓库货位','仓库货位','192.168.20.10013','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050013','FTYUIOLJYT^*(PLKJYT)0013','42.003432150744544','131.23892761169046','G000007','1');
insert into goods_movement_data values ('GM000014','2019-01-08 22:47:53','卡车','卡车','192.168.20.10014','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050014','FTYUIOLJYT^*(PLKJYT)0014','42.571004309144364','130.2606835176804','G000007','1');
insert into goods_movement_data values ('GM000015','2019-01-08 18:46:59','小超','小超','192.168.20.10015','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050015','FTYUIOLJYT^*(PLKJYT)0015','40.75706691066592','131.48306075609625','G000008','1');
insert into goods_movement_data values ('GM000016','2018-12-30 18:12:39','仓库货位','仓库货位','192.168.20.10016','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050016','FTYUIOLJYT^*(PLKJYT)0016','40.19412007361316','131.14589742110124','G000008','1');
insert into goods_movement_data values ('GM000017','2019-01-14 02:10:55','卡车','卡车','192.168.20.10017','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050017','FTYUIOLJYT^*(PLKJYT)0017','39.85552631561048','131.24385533862224','G000009','1');
insert into goods_movement_data values ('GM000018','2019-01-02 09:14:01','小超','小超','192.168.20.10018','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050018','FTYUIOLJYT^*(PLKJYT)0018','39.94883996774138','129.4146082196043','G000009','1');
insert into goods_movement_data values ('GM000019','2019-01-15 16:45:07','仓库货位','仓库货位','192.168.20.10019','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050019','FTYUIOLJYT^*(PLKJYT)0019','42.63436922822277','131.61929004968857','G000010','1');
insert into goods_movement_data values ('GM000020','2019-01-14 12:42:13','卡车','卡车','192.168.20.10020','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050020','FTYUIOLJYT^*(PLKJYT)0020','41.316323386266625','131.94279628688344','G000010','1');
insert into goods_movement_data values ('GM000021','2018-12-28 09:28:19','小超','小超','192.168.20.10021','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050021','FTYUIOLJYT^*(PLKJYT)0021','40.73817843233832','130.36312463239304','G000011','1');
insert into goods_movement_data values ('GM000022','2019-01-04 09:40:25','仓库货位','仓库货位','192.168.20.10022','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050022','FTYUIOLJYT^*(PLKJYT)0022','40.964483596051565','130.80699522407465','G000011','1');
insert into goods_movement_data values ('GM000023','2019-01-05 18:22:05','卡车','卡车','192.168.20.10023','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050023','FTYUIOLJYT^*(PLKJYT)0023','42.13073398386524','129.635504078174','G000012','1');
insert into goods_movement_data values ('GM000024','2019-01-08 16:37:51','小超','小超','192.168.20.10024','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050024','FTYUIOLJYT^*(PLKJYT)0024','40.91002274544966','130.63533683818454','G000012','1');
insert into goods_movement_data values ('GM000025','2019-01-04 23:40:02','仓库货位','仓库货位','192.168.20.10025','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050025','FTYUIOLJYT^*(PLKJYT)0025','39.972568961735746','130.9845233170215','G000013','1');
insert into goods_movement_data values ('GM000026','2019-01-07 06:32:52','卡车','卡车','192.168.20.10026','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050026','FTYUIOLJYT^*(PLKJYT)0026','40.7812424475535','129.93400183416742','G000013','1');
insert into goods_movement_data values ('GM000027','2019-01-17 03:56:43','小超','小超','192.168.20.10027','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050027','FTYUIOLJYT^*(PLKJYT)0027','42.52340718742427','130.7925168187844','G000014','1');
insert into goods_movement_data values ('GM000028','2019-01-01 13:37:12','仓库货位','仓库货位','192.168.20.10028','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050028','FTYUIOLJYT^*(PLKJYT)0028','41.231972684188236','132.05009337176253','G000014','1');
insert into goods_movement_data values ('GM000029','2019-01-16 02:24:10','卡车','卡车','192.168.20.10029','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050029','FTYUIOLJYT^*(PLKJYT)0029','41.647263849261044','130.4784198074514','G000015','1');
insert into goods_movement_data values ('GM000030','2019-01-11 10:14:00','小超','小超','192.168.20.10030','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050030','FTYUIOLJYT^*(PLKJYT)0030','41.95090907447509','130.30230666925115','G000015','1');
insert into goods_movement_data values ('GM000031','2019-01-09 14:54:10','仓库货位','仓库货位','192.168.20.10031','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050031','FTYUIOLJYT^*(PLKJYT)0031','42.38879854492484','129.7409826028854','G000016','1');
insert into goods_movement_data values ('GM000032','2019-01-08 08:13:02','卡车','卡车','192.168.20.10032','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050032','FTYUIOLJYT^*(PLKJYT)0032','39.93595396989487','130.2551605518085','G000016','1');
insert into goods_movement_data values ('GM000033','2019-01-03 06:54:46','小超','小超','192.168.20.10033','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050033','FTYUIOLJYT^*(PLKJYT)0033','40.28579128136239','130.22780530926084','G000017','1');
insert into goods_movement_data values ('GM000034','2019-01-14 12:11:30','仓库货位','仓库货位','192.168.20.10034','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050034','FTYUIOLJYT^*(PLKJYT)0034','40.91510025815828','129.93469697254227','G000017','1');
insert into goods_movement_data values ('GM000035','2019-01-12 18:55:29','卡车','卡车','192.168.20.10035','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050035','FTYUIOLJYT^*(PLKJYT)0035','42.49746694066037','129.59611940754218','G000018','1');
insert into goods_movement_data values ('GM000036','2019-01-07 18:34:42','小超','小超','192.168.20.10036','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050036','FTYUIOLJYT^*(PLKJYT)0036','42.60236776430114','130.3652781083273','G000018','1');
insert into goods_movement_data values ('GM000037','2019-01-09 17:53:46','仓库货位','仓库货位','192.168.20.10037','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050037','FTYUIOLJYT^*(PLKJYT)0037','41.20302254808029','131.32012384809235','G000019','1');
insert into goods_movement_data values ('GM000038','2019-01-05 06:36:50','卡车','卡车','192.168.20.10038','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050038','FTYUIOLJYT^*(PLKJYT)0038','40.69082939641822','129.85837344506174','G000019','1');
insert into goods_movement_data values ('GM000039','2019-01-11 10:14:02','小超','小超','192.168.20.10039','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050039','FTYUIOLJYT^*(PLKJYT)0039','40.378455224024464','131.82676197642573','G000020','1');
insert into goods_movement_data values ('GM000040','2019-01-06 03:59:37','仓库货位','仓库货位','192.168.20.10040','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050040','FTYUIOLJYT^*(PLKJYT)0040','41.86949775477429','131.79312794559644','G000020','1');
insert into goods_movement_data values ('GM000041','2019-01-15 07:50:15','卡车','卡车','192.168.20.10041','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050041','FTYUIOLJYT^*(PLKJYT)0041','42.64010839546155','132.09049589610342','G000021','1');
insert into goods_movement_data values ('GM000042','2019-01-15 15:23:36','小超','小超','192.168.20.10042','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050042','FTYUIOLJYT^*(PLKJYT)0042','42.17454747465979','130.81123417669588','G000021','1');
insert into goods_movement_data values ('GM000043','2018-12-28 20:09:36','仓库货位','仓库货位','192.168.20.10043','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050043','FTYUIOLJYT^*(PLKJYT)0043','40.07583102612005','131.3744252164379','G000022','1');
insert into goods_movement_data values ('GM000044','2019-01-13 13:56:29','卡车','卡车','192.168.20.10044','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050044','FTYUIOLJYT^*(PLKJYT)0044','42.56893705470551','129.59954618824924','G000022','1');
insert into goods_movement_data values ('GM000045','2018-12-27 18:43:59','小超','小超','192.168.20.10045','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050045','FTYUIOLJYT^*(PLKJYT)0045','42.42299710332317','132.0096526966766','G000023','1');
insert into goods_movement_data values ('GM000046','2019-01-02 06:43:06','仓库货位','仓库货位','192.168.20.10046','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050046','FTYUIOLJYT^*(PLKJYT)0046','41.91197241135772','129.27541999690632','G000023','1');
insert into goods_movement_data values ('GM000047','2019-01-10 20:07:06','卡车','卡车','192.168.20.10047','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050047','FTYUIOLJYT^*(PLKJYT)0047','41.72869003996502','131.2998932945987','G000024','1');
insert into goods_movement_data values ('GM000048','2018-12-28 02:24:08','小超','小超','192.168.20.10048','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050048','FTYUIOLJYT^*(PLKJYT)0048','40.50888711332039','130.42253778708903','G000024','1');
insert into goods_movement_data values ('GM000049','2019-01-06 07:35:54','仓库货位','仓库货位','192.168.20.10049','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050049','FTYUIOLJYT^*(PLKJYT)0049','41.20108282081055','129.6198580950793','G000025','1');
insert into goods_movement_data values ('GM000050','2019-01-04 19:37:08','卡车','卡车','192.168.20.10050','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050050','FTYUIOLJYT^*(PLKJYT)0050','42.00036449989593','130.47767945339194','G000025','1');
insert into goods_movement_data values ('GM000051','2019-01-03 16:01:34','小超','小超','192.168.20.10051','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050051','FTYUIOLJYT^*(PLKJYT)0051','40.8705266705817','130.54293658553175','G000026','1');
insert into goods_movement_data values ('GM000052','2018-12-29 05:36:25','仓库货位','仓库货位','192.168.20.10052','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050052','FTYUIOLJYT^*(PLKJYT)0052','41.69649674679744','130.44838191519807','G000026','1');
insert into goods_movement_data values ('GM000053','2019-01-03 05:07:37','卡车','卡车','192.168.20.10053','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050053','FTYUIOLJYT^*(PLKJYT)0053','41.290307396104396','130.33830736618754','G000027','1');
insert into goods_movement_data values ('GM000054','2019-01-10 17:48:44','小超','小超','192.168.20.10054','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050054','FTYUIOLJYT^*(PLKJYT)0054','42.01548895517852','131.18263182843597','G000027','1');
insert into goods_movement_data values ('GM000055','2018-12-28 04:51:56','仓库货位','仓库货位','192.168.20.10055','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050055','FTYUIOLJYT^*(PLKJYT)0055','41.76477446561595','132.07509400876157','G000028','1');
insert into goods_movement_data values ('GM000056','2019-01-05 21:59:18','卡车','卡车','192.168.20.10056','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050056','FTYUIOLJYT^*(PLKJYT)0056','39.84412052417735','130.02776343244983','G000028','1');
insert into goods_movement_data values ('GM000057','2019-01-13 21:26:46','小超','小超','192.168.20.10057','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050057','FTYUIOLJYT^*(PLKJYT)0057','40.76906113015976','129.96995144055865','G000029','1');
insert into goods_movement_data values ('GM000058','2019-01-14 15:23:19','仓库货位','仓库货位','192.168.20.10058','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050058','FTYUIOLJYT^*(PLKJYT)0058','41.48734455789994','131.94778399437794','G000029','1');
insert into goods_movement_data values ('GM000059','2019-01-11 00:10:03','卡车','卡车','192.168.20.10059','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050059','FTYUIOLJYT^*(PLKJYT)0059','41.67046782147886','130.82604453747143','G000030','1');
insert into goods_movement_data values ('GM000060','2019-01-09 04:41:20','小超','小超','192.168.20.10060','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050060','FTYUIOLJYT^*(PLKJYT)0060','39.96433662146356','130.83576472639754','G000030','1');
insert into goods_movement_data values ('GM000061','2019-01-10 03:03:34','仓库货位','仓库货位','192.168.20.10061','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050061','FTYUIOLJYT^*(PLKJYT)0061','41.755501724934405','130.70040757724135','G000031','1');
insert into goods_movement_data values ('GM000062','2019-01-14 21:02:45','卡车','卡车','192.168.20.10062','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050062','FTYUIOLJYT^*(PLKJYT)0062','42.486823545183455','130.00817673948367','G000031','1');
insert into goods_movement_data values ('GM000063','2019-01-08 17:37:09','小超','小超','192.168.20.10063','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050063','FTYUIOLJYT^*(PLKJYT)0063','41.6653751573866','131.27092750466642','G000032','1');
insert into goods_movement_data values ('GM000064','2019-01-01 22:43:41','仓库货位','仓库货位','192.168.20.10064','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050064','FTYUIOLJYT^*(PLKJYT)0064','40.72477511907199','129.9267006121915','G000032','1');
insert into goods_movement_data values ('GM000065','2018-12-28 03:59:40','卡车','卡车','192.168.20.10065','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050065','FTYUIOLJYT^*(PLKJYT)0065','42.73143461955926','130.1745780148852','G000033','1');
insert into goods_movement_data values ('GM000066','2019-01-13 06:18:52','小超','小超','192.168.20.10066','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050066','FTYUIOLJYT^*(PLKJYT)0066','40.329801284694994','131.11381236622768','G000033','1');
insert into goods_movement_data values ('GM000067','2019-01-05 07:12:50','仓库货位','仓库货位','192.168.20.10067','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050067','FTYUIOLJYT^*(PLKJYT)0067','42.543601836574815','129.47905686824691','G000034','1');
insert into goods_movement_data values ('GM000068','2019-01-06 16:27:52','卡车','卡车','192.168.20.10068','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050068','FTYUIOLJYT^*(PLKJYT)0068','40.00626851668085','129.64317781125914','G000034','1');
insert into goods_movement_data values ('GM000069','2019-01-10 16:15:46','小超','小超','192.168.20.10069','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050069','FTYUIOLJYT^*(PLKJYT)0069','41.370671063955044','130.0078084636157','G000035','1');
insert into goods_movement_data values ('GM000070','2019-01-05 09:20:44','仓库货位','仓库货位','192.168.20.10070','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050070','FTYUIOLJYT^*(PLKJYT)0070','41.25574298164192','129.45453634215772','G000035','1');
insert into goods_movement_data values ('GM000071','2018-12-30 08:20:47','卡车','卡车','192.168.20.10071','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050071','FTYUIOLJYT^*(PLKJYT)0071','42.350558858603556','129.7438118349833','G000036','1');
insert into goods_movement_data values ('GM000072','2019-01-02 06:17:30','小超','小超','192.168.20.10072','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050072','FTYUIOLJYT^*(PLKJYT)0072','39.78654800374012','132.10340750338253','G000036','1');
insert into goods_movement_data values ('GM000073','2019-01-11 19:37:19','仓库货位','仓库货位','192.168.20.10073','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050073','FTYUIOLJYT^*(PLKJYT)0073','41.57880280261681','129.72387914932494','G000037','1');
insert into goods_movement_data values ('GM000074','2019-01-18 11:18:27','卡车','卡车','192.168.20.10074','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050074','FTYUIOLJYT^*(PLKJYT)0074','42.19475012120599','129.27482211909606','G000037','1');
insert into goods_movement_data values ('GM000075','2019-01-04 21:48:43','小超','小超','192.168.20.10075','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050075','FTYUIOLJYT^*(PLKJYT)0075','40.320343565366684','129.63907058033155','G000038','1');
insert into goods_movement_data values ('GM000076','2019-01-10 05:46:51','仓库货位','仓库货位','192.168.20.10076','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050076','FTYUIOLJYT^*(PLKJYT)0076','40.056668355960625','131.91170032628014','G000038','1');
insert into goods_movement_data values ('GM000077','2019-01-14 07:04:12','卡车','卡车','192.168.20.10077','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050077','FTYUIOLJYT^*(PLKJYT)0077','41.35660779735802','129.6678340988197','G000039','1');
insert into goods_movement_data values ('GM000078','2019-01-10 01:43:21','小超','小超','192.168.20.10078','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050078','FTYUIOLJYT^*(PLKJYT)0078','42.4000529287438','130.90492839595456','G000039','1');
insert into goods_movement_data values ('GM000079','2019-01-14 17:00:31','仓库货位','仓库货位','192.168.20.10079','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050079','FTYUIOLJYT^*(PLKJYT)0079','42.33897508239227','130.47938997501322','G000040','1');
insert into goods_movement_data values ('GM000080','2019-01-05 23:20:41','卡车','卡车','192.168.20.10080','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050080','FTYUIOLJYT^*(PLKJYT)0080','39.96855708416956','131.81421899544085','G000040','1');
insert into goods_movement_data values ('GM000081','2019-01-15 03:43:37','小超','小超','192.168.20.10081','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050081','FTYUIOLJYT^*(PLKJYT)0081','42.66082227302455','130.90161230610744','G000041','1');
insert into goods_movement_data values ('GM000082','2019-01-01 15:41:57','仓库货位','仓库货位','192.168.20.10082','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050082','FTYUIOLJYT^*(PLKJYT)0082','40.79229457021951','129.71517482438804','G000041','1');
insert into goods_movement_data values ('GM000083','2019-01-08 01:21:03','卡车','卡车','192.168.20.10083','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050083','FTYUIOLJYT^*(PLKJYT)0083','40.57157684060314','129.69922206148541','G000042','1');
insert into goods_movement_data values ('GM000084','2019-01-06 13:07:17','小超','小超','192.168.20.10084','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050084','FTYUIOLJYT^*(PLKJYT)0084','41.809543115285884','132.25546422483094','G000042','1');
insert into goods_movement_data values ('GM000085','2019-01-16 11:33:30','仓库货位','仓库货位','192.168.20.10085','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050085','FTYUIOLJYT^*(PLKJYT)0085','42.653790091102906','129.45665704764667','G000043','1');
insert into goods_movement_data values ('GM000086','2019-01-17 13:38:40','卡车','卡车','192.168.20.10086','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050086','FTYUIOLJYT^*(PLKJYT)0086','41.33753591176235','131.93660230206171','G000043','1');
insert into goods_movement_data values ('GM000087','2019-01-01 22:23:01','小超','小超','192.168.20.10087','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050087','FTYUIOLJYT^*(PLKJYT)0087','42.562497045069655','129.6107911659555','G000044','1');
insert into goods_movement_data values ('GM000088','2018-12-30 02:34:45','仓库货位','仓库货位','192.168.20.10088','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050088','FTYUIOLJYT^*(PLKJYT)0088','42.70343193203118','130.1806167548723','G000044','1');
insert into goods_movement_data values ('GM000089','2019-01-12 02:21:46','卡车','卡车','192.168.20.10089','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050089','FTYUIOLJYT^*(PLKJYT)0089','40.60752214676237','129.5901413297017','G000045','1');
insert into goods_movement_data values ('GM000090','2019-01-14 01:49:33','小超','小超','192.168.20.10090','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050090','FTYUIOLJYT^*(PLKJYT)0090','41.66274749642932','129.3840606635836','G000045','1');
insert into goods_movement_data values ('GM000091','2019-01-06 22:33:07','仓库货位','仓库货位','192.168.20.10091','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050091','FTYUIOLJYT^*(PLKJYT)0091','41.944505197615115','129.35084364040037','G000046','1');
insert into goods_movement_data values ('GM000092','2019-01-03 02:07:41','卡车','卡车','192.168.20.10092','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050092','FTYUIOLJYT^*(PLKJYT)0092','42.147654072663876','131.9747574021841','G000046','1');
insert into goods_movement_data values ('GM000093','2019-01-01 21:00:10','小超','小超','192.168.20.10093','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050093','FTYUIOLJYT^*(PLKJYT)0093','41.25797320833781','131.87015588474176','G000047','1');
insert into goods_movement_data values ('GM000094','2018-12-30 12:55:08','仓库货位','仓库货位','192.168.20.10094','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050094','FTYUIOLJYT^*(PLKJYT)0094','42.400639842167664','129.8667876495069','G000047','1');
insert into goods_movement_data values ('GM000095','2019-01-06 08:24:50','卡车','卡车','192.168.20.10095','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050095','FTYUIOLJYT^*(PLKJYT)0095','40.87660258392816','129.5833166316584','G000048','1');
insert into goods_movement_data values ('GM000096','2019-01-12 04:22:22','小超','小超','192.168.20.10096','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050096','FTYUIOLJYT^*(PLKJYT)0096','40.612226888373726','130.13213540908575','G000048','1');
insert into goods_movement_data values ('GM000097','2019-01-10 05:58:04','仓库货位','仓库货位','192.168.20.10097','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050097','FTYUIOLJYT^*(PLKJYT)0097','42.59186650189971','130.00016969036338','G000049','1');
insert into goods_movement_data values ('GM000098','2019-01-09 18:37:22','卡车','卡车','192.168.20.10098','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050098','FTYUIOLJYT^*(PLKJYT)0098','40.45002034198937','129.47681704760745','G000049','1');
insert into goods_movement_data values ('GM000099','2019-01-03 21:29:30','小超','小超','192.168.20.10099','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050099','FTYUIOLJYT^*(PLKJYT)0099','40.46963280096839','129.6880600342212','G000050','1');
insert into goods_movement_data values ('GM000100','2019-01-04 09:58:23','仓库货位','仓库货位','192.168.20.10100','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050100','FTYUIOLJYT^*(PLKJYT)0100','41.4487271144463','132.1070535262093','G000050','1');
insert into goods_movement_data values ('GM000101','2019-01-09 21:52:02','卡车','卡车','192.168.20.10101','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050101','FTYUIOLJYT^*(PLKJYT)0101','39.891169086102096','129.28428236516913','G000051','1');
insert into goods_movement_data values ('GM000102','2019-01-01 00:20:06','小超','小超','192.168.20.10102','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050102','FTYUIOLJYT^*(PLKJYT)0102','40.43845003810757','132.0070786674143','G000051','1');
insert into goods_movement_data values ('GM000103','2019-01-03 02:56:59','仓库货位','仓库货位','192.168.20.10103','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050103','FTYUIOLJYT^*(PLKJYT)0103','41.754775552769715','129.73507921086627','G000052','1');
insert into goods_movement_data values ('GM000104','2018-12-30 01:22:38','卡车','卡车','192.168.20.10104','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050104','FTYUIOLJYT^*(PLKJYT)0104','42.286186827694955','131.81258687932703','G000052','1');
insert into goods_movement_data values ('GM000105','2019-01-02 06:43:10','小超','小超','192.168.20.10105','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050105','FTYUIOLJYT^*(PLKJYT)0105','41.35934625674974','130.53224894696916','G000053','1');
insert into goods_movement_data values ('GM000106','2019-01-05 13:58:28','仓库货位','仓库货位','192.168.20.10106','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050106','FTYUIOLJYT^*(PLKJYT)0106','41.18081028014956','129.46882354544778','G000053','1');
insert into goods_movement_data values ('GM000107','2019-01-13 19:14:02','卡车','卡车','192.168.20.10107','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050107','FTYUIOLJYT^*(PLKJYT)0107','42.20215741848928','129.51935468257852','G000054','1');
insert into goods_movement_data values ('GM000108','2018-12-30 21:47:01','小超','小超','192.168.20.10108','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050108','FTYUIOLJYT^*(PLKJYT)0108','41.925781956628924','129.40425103639774','G000054','1');
insert into goods_movement_data values ('GM000109','2019-01-13 05:08:56','仓库货位','仓库货位','192.168.20.10109','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050109','FTYUIOLJYT^*(PLKJYT)0109','39.80879501032749','131.006969093775','G000055','1');
insert into goods_movement_data values ('GM000110','2019-01-11 10:30:27','卡车','卡车','192.168.20.10110','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050110','FTYUIOLJYT^*(PLKJYT)0110','39.840474455494835','130.05203454307912','G000055','1');
insert into goods_movement_data values ('GM000111','2019-01-18 13:33:42','小超','小超','192.168.20.10111','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050111','FTYUIOLJYT^*(PLKJYT)0111','41.405210077270546','131.31312891684271','G000056','1');
insert into goods_movement_data values ('GM000112','2019-01-11 22:55:28','仓库货位','仓库货位','192.168.20.10112','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050112','FTYUIOLJYT^*(PLKJYT)0112','41.487397535595775','129.31288356284261','G000056','1');
insert into goods_movement_data values ('GM000113','2019-01-02 06:01:43','卡车','卡车','192.168.20.10113','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050113','FTYUIOLJYT^*(PLKJYT)0113','41.70038047961435','130.7270931921149','G000057','1');
insert into goods_movement_data values ('GM000114','2018-12-28 19:21:58','小超','小超','192.168.20.10114','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050114','FTYUIOLJYT^*(PLKJYT)0114','39.81911672653296','129.9027529085082','G000057','1');
insert into goods_movement_data values ('GM000115','2018-12-29 13:26:22','仓库货位','仓库货位','192.168.20.10115','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050115','FTYUIOLJYT^*(PLKJYT)0115','40.31105581867519','129.78063735975243','G000058','1');
insert into goods_movement_data values ('GM000116','2019-01-13 14:30:32','卡车','卡车','192.168.20.10116','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050116','FTYUIOLJYT^*(PLKJYT)0116','40.20861139055916','130.97440112284647','G000058','1');
insert into goods_movement_data values ('GM000117','2018-12-30 09:42:11','小超','小超','192.168.20.10117','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050117','FTYUIOLJYT^*(PLKJYT)0117','40.293773533731354','132.05360855131786','G000059','1');
insert into goods_movement_data values ('GM000118','2019-01-13 05:22:29','仓库货位','仓库货位','192.168.20.10118','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050118','FTYUIOLJYT^*(PLKJYT)0118','41.12677462773088','131.77777691785099','G000059','1');
insert into goods_movement_data values ('GM000119','2018-12-28 00:29:31','卡车','卡车','192.168.20.10119','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050119','FTYUIOLJYT^*(PLKJYT)0119','42.29809800707317','131.69459604509464','G000060','1');
insert into goods_movement_data values ('GM000120','2019-01-14 04:21:22','小超','小超','192.168.20.10120','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050120','FTYUIOLJYT^*(PLKJYT)0120','41.85035141270254','129.34374246137','G000060','1');
insert into goods_movement_data values ('GM000121','2019-01-14 14:53:53','仓库货位','仓库货位','192.168.20.10121','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050121','FTYUIOLJYT^*(PLKJYT)0121','40.79130959322595','132.01173096888562','G000061','1');
insert into goods_movement_data values ('GM000122','2019-01-02 08:35:11','卡车','卡车','192.168.20.10122','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050122','FTYUIOLJYT^*(PLKJYT)0122','40.11561939874867','130.97996098348773','G000061','1');
insert into goods_movement_data values ('GM000123','2019-01-13 11:43:41','小超','小超','192.168.20.10123','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050123','FTYUIOLJYT^*(PLKJYT)0123','42.47914354330005','131.69434504890745','G000062','1');
insert into goods_movement_data values ('GM000124','2019-01-09 07:49:59','仓库货位','仓库货位','192.168.20.10124','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050124','FTYUIOLJYT^*(PLKJYT)0124','40.12344122662112','132.07620759254962','G000062','1');
insert into goods_movement_data values ('GM000125','2019-01-17 09:10:07','卡车','卡车','192.168.20.10125','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050125','FTYUIOLJYT^*(PLKJYT)0125','41.138363870121516','130.22813573232054','G000063','1');
insert into goods_movement_data values ('GM000126','2018-12-27 23:23:35','小超','小超','192.168.20.10126','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050126','FTYUIOLJYT^*(PLKJYT)0126','39.99897303513312','130.97636718039516','G000063','1');
insert into goods_movement_data values ('GM000127','2019-01-13 09:25:09','仓库货位','仓库货位','192.168.20.10127','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050127','FTYUIOLJYT^*(PLKJYT)0127','40.84178116437537','131.3323819858828','G000064','1');
insert into goods_movement_data values ('GM000128','2019-01-13 11:22:01','卡车','卡车','192.168.20.10128','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050128','FTYUIOLJYT^*(PLKJYT)0128','41.91645985456712','132.2115500843487','G000064','1');
insert into goods_movement_data values ('GM000129','2019-01-17 07:40:09','小超','小超','192.168.20.10129','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050129','FTYUIOLJYT^*(PLKJYT)0129','40.57976053417937','129.69852602577072','G000065','1');
insert into goods_movement_data values ('GM000130','2018-12-30 04:25:40','仓库货位','仓库货位','192.168.20.10130','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050130','FTYUIOLJYT^*(PLKJYT)0130','40.52144775692551','129.756795724956','G000065','1');
insert into goods_movement_data values ('GM000131','2018-12-27 19:33:48','卡车','卡车','192.168.20.10131','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050131','FTYUIOLJYT^*(PLKJYT)0131','40.22738999001983','130.0691061959687','G000066','1');
insert into goods_movement_data values ('GM000132','2018-12-28 07:07:29','小超','小超','192.168.20.10132','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050132','FTYUIOLJYT^*(PLKJYT)0132','40.37780318526543','131.30457823346077','G000066','1');
insert into goods_movement_data values ('GM000133','2018-12-29 10:42:47','仓库货位','仓库货位','192.168.20.10133','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050133','FTYUIOLJYT^*(PLKJYT)0133','41.16450666383731','130.84174451500894','G000067','1');
insert into goods_movement_data values ('GM000134','2018-12-31 18:04:39','卡车','卡车','192.168.20.10134','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050134','FTYUIOLJYT^*(PLKJYT)0134','42.496667993936676','131.30174270120273','G000067','1');
insert into goods_movement_data values ('GM000135','2019-01-13 10:06:19','小超','小超','192.168.20.10135','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050135','FTYUIOLJYT^*(PLKJYT)0135','40.69604928470626','129.69493005514695','G000068','1');
insert into goods_movement_data values ('GM000136','2018-12-30 20:51:46','仓库货位','仓库货位','192.168.20.10136','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050136','FTYUIOLJYT^*(PLKJYT)0136','42.08354411546533','130.21067096155554','G000068','1');
insert into goods_movement_data values ('GM000137','2019-01-01 21:52:28','卡车','卡车','192.168.20.10137','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050137','FTYUIOLJYT^*(PLKJYT)0137','42.14016653162588','130.44409752741473','G000069','1');
insert into goods_movement_data values ('GM000138','2019-01-05 10:43:45','小超','小超','192.168.20.10138','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050138','FTYUIOLJYT^*(PLKJYT)0138','42.68587399350874','131.49660722870013','G000069','1');
insert into goods_movement_data values ('GM000139','2019-01-18 15:37:52','仓库货位','仓库货位','192.168.20.10139','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050139','FTYUIOLJYT^*(PLKJYT)0139','40.526769929773856','130.88450039413473','G000070','1');
insert into goods_movement_data values ('GM000140','2019-01-15 01:13:33','卡车','卡车','192.168.20.10140','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050140','FTYUIOLJYT^*(PLKJYT)0140','42.607651073677346','132.1555099354735','G000070','1');
insert into goods_movement_data values ('GM000141','2018-12-31 06:01:28','小超','小超','192.168.20.10141','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050141','FTYUIOLJYT^*(PLKJYT)0141','41.583463239564104','130.1512699512368','G000071','1');
insert into goods_movement_data values ('GM000142','2019-01-17 06:56:00','仓库货位','仓库货位','192.168.20.10142','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050142','FTYUIOLJYT^*(PLKJYT)0142','40.65378752354482','130.45299536552625','G000071','1');
insert into goods_movement_data values ('GM000143','2018-12-30 08:48:01','卡车','卡车','192.168.20.10143','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050143','FTYUIOLJYT^*(PLKJYT)0143','39.960865942563125','132.21960705932534','G000072','1');
insert into goods_movement_data values ('GM000144','2019-01-09 16:01:37','小超','小超','192.168.20.10144','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050144','FTYUIOLJYT^*(PLKJYT)0144','39.80233464234699','131.29548010764867','G000072','1');
insert into goods_movement_data values ('GM000145','2019-01-09 20:19:17','仓库货位','仓库货位','192.168.20.10145','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050145','FTYUIOLJYT^*(PLKJYT)0145','41.675220917321894','131.12517186998815','G000073','1');
insert into goods_movement_data values ('GM000146','2019-01-03 13:42:29','卡车','卡车','192.168.20.10146','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050146','FTYUIOLJYT^*(PLKJYT)0146','39.80746108128586','131.4782388405491','G000073','1');
insert into goods_movement_data values ('GM000147','2019-01-15 11:53:09','小超','小超','192.168.20.10147','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050147','FTYUIOLJYT^*(PLKJYT)0147','40.81093335491195','130.05544471183293','G000074','1');
insert into goods_movement_data values ('GM000148','2019-01-11 06:52:20','仓库货位','仓库货位','192.168.20.10148','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050148','FTYUIOLJYT^*(PLKJYT)0148','41.99375193865681','131.7085887210542','G000074','1');
insert into goods_movement_data values ('GM000149','2019-01-15 23:58:06','卡车','卡车','192.168.20.10149','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050149','FTYUIOLJYT^*(PLKJYT)0149','42.74553027012101','129.3492672002577','G000075','1');
insert into goods_movement_data values ('GM000150','2019-01-12 16:01:43','小超','小超','192.168.20.10150','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050150','FTYUIOLJYT^*(PLKJYT)0150','40.799413751285584','130.87077188388844','G000075','1');
insert into goods_movement_data values ('GM000151','2019-01-07 10:28:21','仓库货位','仓库货位','192.168.20.10151','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050151','FTYUIOLJYT^*(PLKJYT)0151','40.22880217295677','131.04922663364735','G000076','1');
insert into goods_movement_data values ('GM000152','2019-01-07 10:17:43','卡车','卡车','192.168.20.10152','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050152','FTYUIOLJYT^*(PLKJYT)0152','40.10201196090753','129.645400418129','G000076','1');
insert into goods_movement_data values ('GM000153','2018-12-30 18:55:41','小超','小超','192.168.20.10153','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050153','FTYUIOLJYT^*(PLKJYT)0153','42.58904814539443','130.83839674122015','G000077','1');
insert into goods_movement_data values ('GM000154','2019-01-03 07:55:59','仓库货位','仓库货位','192.168.20.10154','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050154','FTYUIOLJYT^*(PLKJYT)0154','39.85819579045757','129.31178266991105','G000077','1');
insert into goods_movement_data values ('GM000155','2019-01-12 18:50:05','卡车','卡车','192.168.20.10155','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050155','FTYUIOLJYT^*(PLKJYT)0155','42.25297408993897','132.02073757517323','G000078','1');
insert into goods_movement_data values ('GM000156','2019-01-17 04:32:45','小超','小超','192.168.20.10156','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050156','FTYUIOLJYT^*(PLKJYT)0156','41.404383316314885','130.91538558121806','G000078','1');
insert into goods_movement_data values ('GM000157','2019-01-07 20:07:49','仓库货位','仓库货位','192.168.20.10157','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050157','FTYUIOLJYT^*(PLKJYT)0157','41.58061157095619','129.68781851193336','G000079','1');
insert into goods_movement_data values ('GM000158','2018-12-29 22:26:58','卡车','卡车','192.168.20.10158','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050158','FTYUIOLJYT^*(PLKJYT)0158','42.39760821811348','129.8725784997325','G000079','1');
insert into goods_movement_data values ('GM000159','2019-01-17 03:56:20','小超','小超','192.168.20.10159','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050159','FTYUIOLJYT^*(PLKJYT)0159','42.23946032740835','131.0712468351659','G000080','1');
insert into goods_movement_data values ('GM000160','2019-01-06 03:08:02','仓库货位','仓库货位','192.168.20.10160','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050160','FTYUIOLJYT^*(PLKJYT)0160','40.27681845183394','131.48622714969494','G000080','1');
insert into goods_movement_data values ('GM000161','2018-12-30 16:01:49','卡车','卡车','192.168.20.10161','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050161','FTYUIOLJYT^*(PLKJYT)0161','41.80787199270968','131.4811486574562','G000081','1');
insert into goods_movement_data values ('GM000162','2018-12-27 23:16:40','小超','小超','192.168.20.10162','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050162','FTYUIOLJYT^*(PLKJYT)0162','41.450139636583344','130.56237855690128','G000081','1');
insert into goods_movement_data values ('GM000163','2019-01-03 21:37:58','仓库货位','仓库货位','192.168.20.10163','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050163','FTYUIOLJYT^*(PLKJYT)0163','40.919578546717005','131.5502913953548','G000082','1');
insert into goods_movement_data values ('GM000164','2019-01-09 17:57:10','卡车','卡车','192.168.20.10164','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050164','FTYUIOLJYT^*(PLKJYT)0164','40.77136824680859','129.73202942604453','G000082','1');
insert into goods_movement_data values ('GM000165','2019-01-18 14:40:18','小超','小超','192.168.20.10165','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050165','FTYUIOLJYT^*(PLKJYT)0165','40.78042842833595','132.06809909499782','G000083','1');
insert into goods_movement_data values ('GM000166','2018-12-30 00:17:30','仓库货位','仓库货位','192.168.20.10166','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050166','FTYUIOLJYT^*(PLKJYT)0166','40.07077047152829','129.90277022156255','G000083','1');
insert into goods_movement_data values ('GM000167','2019-01-04 03:10:06','卡车','卡车','192.168.20.10167','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050167','FTYUIOLJYT^*(PLKJYT)0167','41.62416883657022','131.52917090669402','G000084','1');
insert into goods_movement_data values ('GM000168','2018-12-27 23:31:02','小超','小超','192.168.20.10168','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050168','FTYUIOLJYT^*(PLKJYT)0168','41.31577358510485','129.2810203527404','G000084','1');
insert into goods_movement_data values ('GM000169','2019-01-17 02:17:18','仓库货位','仓库货位','192.168.20.10169','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050169','FTYUIOLJYT^*(PLKJYT)0169','42.27396235241876','131.12036557890772','G000085','1');
insert into goods_movement_data values ('GM000170','2019-01-09 20:36:25','卡车','卡车','192.168.20.10170','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050170','FTYUIOLJYT^*(PLKJYT)0170','39.864127513755406','130.23283926350277','G000085','1');
insert into goods_movement_data values ('GM000171','2019-01-17 07:09:36','小超','小超','192.168.20.10171','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050171','FTYUIOLJYT^*(PLKJYT)0171','42.16583677710072','129.91558603672414','G000086','1');
insert into goods_movement_data values ('GM000172','2019-01-15 19:55:32','仓库货位','仓库货位','192.168.20.10172','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050172','FTYUIOLJYT^*(PLKJYT)0172','41.156478392407635','131.08423905125127','G000086','1');
insert into goods_movement_data values ('GM000173','2019-01-02 13:18:51','卡车','卡车','192.168.20.10173','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050173','FTYUIOLJYT^*(PLKJYT)0173','42.52314849358148','132.17773459471962','G000087','1');
insert into goods_movement_data values ('GM000174','2019-01-10 14:25:43','小超','小超','192.168.20.10174','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050174','FTYUIOLJYT^*(PLKJYT)0174','41.2010603762051','129.32300699797682','G000087','1');
insert into goods_movement_data values ('GM000175','2019-01-02 11:49:30','仓库货位','仓库货位','192.168.20.10175','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050175','FTYUIOLJYT^*(PLKJYT)0175','41.979228920447106','130.22568536929202','G000088','1');
insert into goods_movement_data values ('GM000176','2019-01-10 10:48:20','卡车','卡车','192.168.20.10176','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050176','FTYUIOLJYT^*(PLKJYT)0176','40.407523403260804','131.1538459561084','G000088','1');
insert into goods_movement_data values ('GM000177','2018-12-28 12:54:26','小超','小超','192.168.20.10177','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050177','FTYUIOLJYT^*(PLKJYT)0177','42.28864253616895','130.10643576840116','G000089','1');
insert into goods_movement_data values ('GM000178','2019-01-16 15:20:27','仓库货位','仓库货位','192.168.20.10178','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050178','FTYUIOLJYT^*(PLKJYT)0178','42.51004641603692','130.40588221168625','G000089','1');
insert into goods_movement_data values ('GM000179','2019-01-11 00:03:05','卡车','卡车','192.168.20.10179','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050179','FTYUIOLJYT^*(PLKJYT)0179','42.38399588609334','131.31787295248208','G000090','1');
insert into goods_movement_data values ('GM000180','2019-01-03 21:20:53','小超','小超','192.168.20.10180','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050180','FTYUIOLJYT^*(PLKJYT)0180','40.71523739650144','130.40309420067763','G000090','1');
insert into goods_movement_data values ('GM000181','2019-01-06 13:40:43','仓库货位','仓库货位','192.168.20.10181','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050181','FTYUIOLJYT^*(PLKJYT)0181','42.291216237312995','130.0079788474622','G000091','1');
insert into goods_movement_data values ('GM000182','2019-01-15 12:54:24','卡车','卡车','192.168.20.10182','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050182','FTYUIOLJYT^*(PLKJYT)0182','41.25441552277898','129.91895667236955','G000091','1');
insert into goods_movement_data values ('GM000183','2019-01-05 10:19:51','小超','小超','192.168.20.10183','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050183','FTYUIOLJYT^*(PLKJYT)0183','40.25599541595684','131.08706406889735','G000092','1');
insert into goods_movement_data values ('GM000184','2018-12-31 11:42:49','仓库货位','仓库货位','192.168.20.10184','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050184','FTYUIOLJYT^*(PLKJYT)0184','40.60235554747516','131.15964746708588','G000092','1');
insert into goods_movement_data values ('GM000185','2019-01-15 15:17:56','卡车','卡车','192.168.20.10185','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050185','FTYUIOLJYT^*(PLKJYT)0185','40.130137625836284','131.6391738465933','G000093','1');
insert into goods_movement_data values ('GM000186','2019-01-02 00:14:40','小超','小超','192.168.20.10186','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050186','FTYUIOLJYT^*(PLKJYT)0186','40.83822469442246','131.0967498013246','G000093','1');
insert into goods_movement_data values ('GM000187','2019-01-05 17:03:22','仓库货位','仓库货位','192.168.20.10187','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050187','FTYUIOLJYT^*(PLKJYT)0187','39.96943762322272','132.21866273193936','G000094','1');
insert into goods_movement_data values ('GM000188','2019-01-13 12:41:47','卡车','卡车','192.168.20.10188','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050188','FTYUIOLJYT^*(PLKJYT)0188','42.51515542533723','131.2198281402862','G000094','1');
insert into goods_movement_data values ('GM000189','2019-01-03 04:59:56','小超','小超','192.168.20.10189','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050189','FTYUIOLJYT^*(PLKJYT)0189','42.08316475018607','131.33274599994104','G000095','1');
insert into goods_movement_data values ('GM000190','2018-12-29 21:48:55','仓库货位','仓库货位','192.168.20.10190','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050190','FTYUIOLJYT^*(PLKJYT)0190','40.72169526051409','132.04902760509074','G000095','1');
insert into goods_movement_data values ('GM000191','2018-12-28 01:42:36','卡车','卡车','192.168.20.10191','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050191','FTYUIOLJYT^*(PLKJYT)0191','42.20607157816465','130.60837119480485','G000096','1');
insert into goods_movement_data values ('GM000192','2019-01-15 19:28:25','小超','小超','192.168.20.10192','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050192','FTYUIOLJYT^*(PLKJYT)0192','42.46341077380401','131.76352950084217','G000096','1');
insert into goods_movement_data values ('GM000193','2019-01-14 12:42:12','仓库货位','仓库货位','192.168.20.10193','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050193','FTYUIOLJYT^*(PLKJYT)0193','42.12204549969518','131.2429156336433','G000097','1');
insert into goods_movement_data values ('GM000194','2019-01-12 18:11:16','卡车','卡车','192.168.20.10194','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050194','FTYUIOLJYT^*(PLKJYT)0194','42.47146364885921','130.11699887669675','G000097','1');
insert into goods_movement_data values ('GM000195','2018-12-28 04:29:27','小超','小超','192.168.20.10195','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050195','FTYUIOLJYT^*(PLKJYT)0195','42.117161623384725','131.96702608748365','G000098','1');
insert into goods_movement_data values ('GM000196','2019-01-15 00:47:43','仓库货位','仓库货位','192.168.20.10196','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050196','FTYUIOLJYT^*(PLKJYT)0196','40.9154259348621','132.05792206940302','G000098','1');
insert into goods_movement_data values ('GM000197','2019-01-17 22:14:03','卡车','卡车','192.168.20.10197','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050197','FTYUIOLJYT^*(PLKJYT)0197','40.070191101768906','131.48152608536134','G000099','1');
insert into goods_movement_data values ('GM000198','2019-01-13 10:40:31','小超','小超','192.168.20.10198','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050198','FTYUIOLJYT^*(PLKJYT)0198','41.32148235432087','131.11091059867428','G000099','1');
insert into goods_movement_data values ('GM000199','2018-12-29 17:29:51','仓库货位','仓库货位','192.168.20.10199','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050199','FTYUIOLJYT^*(PLKJYT)0199','40.36990058372375','131.44899366137673','G000100','1');
insert into goods_movement_data values ('GM000200','2019-01-10 19:05:06','卡车','卡车','192.168.20.10200','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050200','FTYUIOLJYT^*(PLKJYT)0200','40.28912299105282','129.64273387295063','G000100','1');
insert into goods_movement_data values ('GM000201','2019-01-12 04:29:44','小超','小超','192.168.20.10201','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050201','FTYUIOLJYT^*(PLKJYT)0201','42.07821131975034','129.35776270795628','G000101','1');
insert into goods_movement_data values ('GM000202','2019-01-09 07:49:27','仓库货位','仓库货位','192.168.20.10202','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050202','FTYUIOLJYT^*(PLKJYT)0202','40.077241969642465','129.50024108384417','G000101','1');
insert into goods_movement_data values ('GM000203','2019-01-04 10:09:58','卡车','卡车','192.168.20.10203','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050203','FTYUIOLJYT^*(PLKJYT)0203','40.81205470669356','130.86824051106763','G000102','1');
insert into goods_movement_data values ('GM000204','2019-01-03 20:23:07','小超','小超','192.168.20.10204','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050204','FTYUIOLJYT^*(PLKJYT)0204','40.96511616325335','129.6107833601215','G000102','1');
insert into goods_movement_data values ('GM000205','2019-01-16 00:35:50','仓库货位','仓库货位','192.168.20.10205','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050205','FTYUIOLJYT^*(PLKJYT)0205','41.498275915763266','129.4882165125566','G000103','1');
insert into goods_movement_data values ('GM000206','2019-01-01 15:47:44','卡车','卡车','192.168.20.10206','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050206','FTYUIOLJYT^*(PLKJYT)0206','40.85907376949926','129.7517123657228','G000103','1');
insert into goods_movement_data values ('GM000207','2019-01-17 20:22:28','小超','小超','192.168.20.10207','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050207','FTYUIOLJYT^*(PLKJYT)0207','40.84703379402198','130.19803437312353','G000104','1');
insert into goods_movement_data values ('GM000208','2019-01-11 17:08:57','仓库货位','仓库货位','192.168.20.10208','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050208','FTYUIOLJYT^*(PLKJYT)0208','40.23891803003099','129.67458993858273','G000104','1');
insert into goods_movement_data values ('GM000209','2019-01-13 00:05:40','卡车','卡车','192.168.20.10209','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050209','FTYUIOLJYT^*(PLKJYT)0209','39.79978770864334','130.0040085178587','G000105','1');
insert into goods_movement_data values ('GM000210','2019-01-09 14:08:13','小超','小超','192.168.20.10210','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050210','FTYUIOLJYT^*(PLKJYT)0210','40.24962543122069','131.79061475463027','G000105','1');
insert into goods_movement_data values ('GM000211','2019-01-02 07:45:07','仓库货位','仓库货位','192.168.20.10211','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050211','FTYUIOLJYT^*(PLKJYT)0211','40.12622889322861','130.58831296365744','G000106','1');
insert into goods_movement_data values ('GM000212','2019-01-08 06:41:59','卡车','卡车','192.168.20.10212','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050212','FTYUIOLJYT^*(PLKJYT)0212','40.02688259267579','129.94328850938453','G000106','1');
insert into goods_movement_data values ('GM000213','2019-01-05 15:55:37','小超','小超','192.168.20.10213','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050213','FTYUIOLJYT^*(PLKJYT)0213','40.38662854620341','131.4479000578796','G000107','1');
insert into goods_movement_data values ('GM000214','2019-01-13 11:38:31','仓库货位','仓库货位','192.168.20.10214','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050214','FTYUIOLJYT^*(PLKJYT)0214','40.88619142820964','129.9974622537716','G000107','1');
insert into goods_movement_data values ('GM000215','2019-01-12 11:36:27','卡车','卡车','192.168.20.10215','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050215','FTYUIOLJYT^*(PLKJYT)0215','39.83635781366318','132.07909745743947','G000108','1');
insert into goods_movement_data values ('GM000216','2019-01-01 18:59:11','小超','小超','192.168.20.10216','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050216','FTYUIOLJYT^*(PLKJYT)0216','40.444203376797425','129.72372015788306','G000108','1');
insert into goods_movement_data values ('GM000217','2019-01-07 02:00:05','仓库货位','仓库货位','192.168.20.10217','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050217','FTYUIOLJYT^*(PLKJYT)0217','41.05026057584496','131.22677637332248','G000109','1');
insert into goods_movement_data values ('GM000218','2019-01-15 13:35:43','卡车','卡车','192.168.20.10218','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050218','FTYUIOLJYT^*(PLKJYT)0218','42.420412017447745','131.2447706185585','G000109','1');
insert into goods_movement_data values ('GM000219','2018-12-27 19:45:29','小超','小超','192.168.20.10219','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050219','FTYUIOLJYT^*(PLKJYT)0219','40.686707625796046','131.53891062628495','G000110','1');
insert into goods_movement_data values ('GM000220','2018-12-31 17:02:46','仓库货位','仓库货位','192.168.20.10220','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050220','FTYUIOLJYT^*(PLKJYT)0220','42.583242366760146','130.20547169943453','G000110','1');
insert into goods_movement_data values ('GM000221','2019-01-08 12:31:18','卡车','卡车','192.168.20.10221','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050221','FTYUIOLJYT^*(PLKJYT)0221','42.32323978688497','129.66360121246865','G000111','1');
insert into goods_movement_data values ('GM000222','2019-01-17 06:04:10','小超','小超','192.168.20.10222','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050222','FTYUIOLJYT^*(PLKJYT)0222','40.05594468691841','130.2277714045321','G000111','1');
insert into goods_movement_data values ('GM000223','2019-01-11 12:21:49','仓库货位','仓库货位','192.168.20.10223','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050223','FTYUIOLJYT^*(PLKJYT)0223','40.68456100528003','132.11399723100251','G000112','1');
insert into goods_movement_data values ('GM000224','2019-01-10 20:43:51','卡车','卡车','192.168.20.10224','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050224','FTYUIOLJYT^*(PLKJYT)0224','39.9366795937585','130.59178277228062','G000112','1');
insert into goods_movement_data values ('GM000225','2019-01-07 04:53:04','小超','小超','192.168.20.10225','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050225','FTYUIOLJYT^*(PLKJYT)0225','42.1842231121181','131.77790148887485','G000113','1');
insert into goods_movement_data values ('GM000226','2019-01-07 16:40:14','仓库货位','仓库货位','192.168.20.10226','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050226','FTYUIOLJYT^*(PLKJYT)0226','41.56904409900653','129.74815137470355','G000113','1');
insert into goods_movement_data values ('GM000227','2019-01-02 03:53:59','卡车','卡车','192.168.20.10227','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050227','FTYUIOLJYT^*(PLKJYT)0227','40.926743013057006','131.63723041141947','G000114','1');
insert into goods_movement_data values ('GM000228','2019-01-14 19:11:23','小超','小超','192.168.20.10228','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050228','FTYUIOLJYT^*(PLKJYT)0228','41.932432421431386','130.09664121460173','G000114','1');
insert into goods_movement_data values ('GM000229','2019-01-15 01:03:28','仓库货位','仓库货位','192.168.20.10229','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050229','FTYUIOLJYT^*(PLKJYT)0229','40.408321598760075','131.9150514969921','G000115','1');
insert into goods_movement_data values ('GM000230','2019-01-18 09:03:36','卡车','卡车','192.168.20.10230','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050230','FTYUIOLJYT^*(PLKJYT)0230','40.817575267061216','131.6714281405484','G000115','1');
insert into goods_movement_data values ('GM000231','2019-01-10 16:58:07','小超','小超','192.168.20.10231','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050231','FTYUIOLJYT^*(PLKJYT)0231','40.931121429251995','132.01492120181126','G000116','1');
insert into goods_movement_data values ('GM000232','2019-01-03 01:54:09','仓库货位','仓库货位','192.168.20.10232','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050232','FTYUIOLJYT^*(PLKJYT)0232','41.97600456598628','130.2430315654159','G000116','1');
insert into goods_movement_data values ('GM000233','2019-01-13 04:14:12','卡车','卡车','192.168.20.10233','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050233','FTYUIOLJYT^*(PLKJYT)0233','42.35567788961076','131.24208778479064','G000117','1');
insert into goods_movement_data values ('GM000234','2019-01-12 01:03:32','小超','小超','192.168.20.10234','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050234','FTYUIOLJYT^*(PLKJYT)0234','42.25081925020126','129.99634722364505','G000117','1');
insert into goods_movement_data values ('GM000235','2019-01-13 23:01:14','仓库货位','仓库货位','192.168.20.10235','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050235','FTYUIOLJYT^*(PLKJYT)0235','40.48404445785838','131.58533865980561','G000118','1');
insert into goods_movement_data values ('GM000236','2019-01-09 23:44:11','卡车','卡车','192.168.20.10236','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050236','FTYUIOLJYT^*(PLKJYT)0236','41.23088693560143','131.06820378310647','G000118','1');
insert into goods_movement_data values ('GM000237','2019-01-02 21:24:48','小超','小超','192.168.20.10237','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050237','FTYUIOLJYT^*(PLKJYT)0237','40.1464176427453','129.93149557414299','G000119','1');
insert into goods_movement_data values ('GM000238','2019-01-01 04:00:58','仓库货位','仓库货位','192.168.20.10238','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050238','FTYUIOLJYT^*(PLKJYT)0238','40.845516499929616','129.84870922605407','G000119','1');
insert into goods_movement_data values ('GM000239','2019-01-14 17:59:15','卡车','卡车','192.168.20.10239','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050239','FTYUIOLJYT^*(PLKJYT)0239','42.58809635523484','130.82457916344225','G000120','1');
insert into goods_movement_data values ('GM000240','2019-01-15 13:45:02','小超','小超','192.168.20.10240','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050240','FTYUIOLJYT^*(PLKJYT)0240','42.10884207892911','131.1689753310467','G000120','1');
insert into goods_movement_data values ('GM000241','2019-01-17 19:31:22','仓库货位','仓库货位','192.168.20.10241','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050241','FTYUIOLJYT^*(PLKJYT)0241','39.98164996654348','131.5643707459852','G000121','1');
insert into goods_movement_data values ('GM000242','2019-01-10 10:45:26','卡车','卡车','192.168.20.10242','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050242','FTYUIOLJYT^*(PLKJYT)0242','42.21293036471796','131.2423083975866','G000121','1');
insert into goods_movement_data values ('GM000243','2019-01-11 13:20:38','小超','小超','192.168.20.10243','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050243','FTYUIOLJYT^*(PLKJYT)0243','40.859200119661864','131.56351277201443','G000122','1');
insert into goods_movement_data values ('GM000244','2019-01-15 17:06:40','仓库货位','仓库货位','192.168.20.10244','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050244','FTYUIOLJYT^*(PLKJYT)0244','40.089365060520834','130.00347902479015','G000122','1');
insert into goods_movement_data values ('GM000245','2019-01-15 02:13:24','卡车','卡车','192.168.20.10245','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050245','FTYUIOLJYT^*(PLKJYT)0245','40.837963499181626','130.9005688380412','G000123','1');
insert into goods_movement_data values ('GM000246','2019-01-02 23:39:14','小超','小超','192.168.20.10246','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050246','FTYUIOLJYT^*(PLKJYT)0246','41.34729714863736','130.13618862694457','G000123','1');
insert into goods_movement_data values ('GM000247','2019-01-09 15:11:27','仓库货位','仓库货位','192.168.20.10247','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050247','FTYUIOLJYT^*(PLKJYT)0247','40.64299623049684','130.07386973403132','G000124','1');
insert into goods_movement_data values ('GM000248','2018-12-30 04:27:59','卡车','卡车','192.168.20.10248','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050248','FTYUIOLJYT^*(PLKJYT)0248','40.04132620015875','130.50541780392416','G000124','1');
insert into goods_movement_data values ('GM000249','2018-12-29 23:20:40','小超','小超','192.168.20.10249','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050249','FTYUIOLJYT^*(PLKJYT)0249','39.88689010683617','130.6859179174234','G000125','1');
insert into goods_movement_data values ('GM000250','2019-01-16 11:32:13','仓库货位','仓库货位','192.168.20.10250','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050250','FTYUIOLJYT^*(PLKJYT)0250','40.61786672460541','129.66019538039035','G000125','1');
insert into goods_movement_data values ('GM000251','2019-01-06 15:37:33','卡车','卡车','192.168.20.10251','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050251','FTYUIOLJYT^*(PLKJYT)0251','42.19757267114271','131.98211474699144','G000126','1');
insert into goods_movement_data values ('GM000252','2018-12-29 03:07:51','小超','小超','192.168.20.10252','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050252','FTYUIOLJYT^*(PLKJYT)0252','42.679759243731155','129.862784945169','G000126','1');
insert into goods_movement_data values ('GM000253','2019-01-15 03:34:53','仓库货位','仓库货位','192.168.20.10253','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050253','FTYUIOLJYT^*(PLKJYT)0253','40.77107917675072','130.59527833316736','G000127','1');
insert into goods_movement_data values ('GM000254','2018-12-31 09:32:53','卡车','卡车','192.168.20.10254','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050254','FTYUIOLJYT^*(PLKJYT)0254','42.14482262929712','131.37982522714236','G000127','1');
insert into goods_movement_data values ('GM000255','2019-01-05 13:29:13','小超','小超','192.168.20.10255','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050255','FTYUIOLJYT^*(PLKJYT)0255','41.52302238025036','131.97659458607131','G000128','1');
insert into goods_movement_data values ('GM000256','2018-12-31 08:09:47','仓库货位','仓库货位','192.168.20.10256','Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B4050256','FTYUIOLJYT^*(PLKJYT)0256','40.15697209960809','132.2651585525847','G000128','1');

	
insert into supplier_space_data values ('SS000001','成都龙泉驿飞鹤路20号供货商独立管理区','02887654321','1876平方米','W000001','40.34885079273859','130.80222175124644','1');
insert into supplier_space_data values ('SS000002','成都龙泉驿飞鹤路20号供货商独立管理区0002','028876543210002','1876平方米0002','W000001','40.24842782137285','131.1677075507685','1');
insert into supplier_space_data values ('SS000003','成都龙泉驿飞鹤路20号供货商独立管理区0003','028876543210003','1876平方米0003','W000002','42.64370728557327','132.12664948738632','1');
insert into supplier_space_data values ('SS000004','成都龙泉驿飞鹤路20号供货商独立管理区0004','028876543210004','1876平方米0004','W000002','41.23494562564324','131.3047200602462','1');

	
insert into receiving_space_data values ('RS000001','成都龙泉驿飞鹤路20号仓库卸货区','02887654321','每个收货区可以供一辆车卸货','1876平方米','W000001','41.18975915915956','131.71449119146132','1');
insert into receiving_space_data values ('RS000002','成都龙泉驿飞鹤路20号仓库卸货区0002','028876543210002','每个收货区可以供一辆车卸货0002','1876平方米0002','W000001','42.05961662050275','130.53207506975141','1');
insert into receiving_space_data values ('RS000003','成都龙泉驿飞鹤路20号仓库卸货区0003','028876543210003','每个收货区可以供一辆车卸货0003','1876平方米0003','W000002','41.364712288998824','130.76114482609523','1');
insert into receiving_space_data values ('RS000004','成都龙泉驿飞鹤路20号仓库卸货区0004','028876543210004','每个收货区可以供一辆车卸货0004','1876平方米0004','W000002','39.95434770433727','131.78528636624125','1');

	
insert into shipping_space_data values ('SS000001','成都龙泉驿飞鹤路20号装货区','02887654321','1876平方米','W000001','42.17356311195295','130.23211047807035','每个收货区可以供一辆车装货','1');
insert into shipping_space_data values ('SS000002','成都龙泉驿飞鹤路20号装货区0002','028876543210002','1876平方米0002','W000001','41.7800549517652','130.5057213473254','每个收货区可以供一辆车装货0002','1');
insert into shipping_space_data values ('SS000003','成都龙泉驿飞鹤路20号装货区0003','028876543210003','1876平方米0003','W000002','41.43398259124801','131.72450007353183','每个收货区可以供一辆车装货0003','1');
insert into shipping_space_data values ('SS000004','成都龙泉驿飞鹤路20号装货区0004','028876543210004','1876平方米0004','W000002','42.262065116219915','131.79963740054188','每个收货区可以供一辆车装货0004','1');

	
insert into damage_space_data values ('DS000001','成都龙泉驿飞鹤路20号仓库损坏货物堆放区','02887654321','1876平方米','39.92073760272525','130.1616909621227','W000001','1');
insert into damage_space_data values ('DS000002','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0002','028876543210002','1876平方米0002','41.55477903177824','130.07731973335092','W000001','1');
insert into damage_space_data values ('DS000003','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0003','028876543210003','1876平方米0003','41.98083696114166','129.97026313323084','W000002','1');
insert into damage_space_data values ('DS000004','成都龙泉驿飞鹤路20号仓库损坏货物堆放区0004','028876543210004','1876平方米0004','42.09210730476939','130.2780033859739','W000002','1');

	
insert into warehouse_asset_data values ('WA000001','叉车','备用件存放区设备库房','W000001','1');
insert into warehouse_asset_data values ('WA000002','托盘','备用件存放区设备库房0002','W000001','1');
insert into warehouse_asset_data values ('WA000003','传送带备件','备用件存放区设备库房0003','W000002','1');
insert into warehouse_asset_data values ('WA000004','叉车','备用件存放区设备库房0004','W000002','1');

	
insert into transport_fleet_data values ('TF000001','双链先锋号车队','02887654321','RSCC000001','2019-01-07 14:53:03','1');
insert into transport_fleet_data values ('TF000002','双链先锋号车队0002','028876543210002','RSCC000003','2018-12-31 02:40:47','1');

	
insert into transport_truck_data values ('TT000001','运货卡车','川AK5','02887654321','VL9198','EN00102','2017-06-11','100万公里','红色','TF000001','1');
insert into transport_truck_data values ('TT000002','运货卡车0002','川AK50002','028876543210002','VL91980002','EN001020002','2016-08-21','100万公里0002','蓝色','TF000001','1');
insert into transport_truck_data values ('TT000003','运货卡车0003','川AK50003','028876543210003','VL91980003','EN001020003','2017-01-28','100万公里0003','白色','TF000002','1');
insert into transport_truck_data values ('TT000004','运货卡车0004','川AK50004','028876543210004','VL91980004','EN001020004','2016-08-20','100万公里0004','灰色','TF000002','1');

	
insert into truck_driver_data values ('TD000001','运货卡车司机','51099887733','18777778888','TF000001','1');
insert into truck_driver_data values ('TD000002','运货卡车司机0002','510998877330002','13900000002','TF000001','1');
insert into truck_driver_data values ('TD000003','运货卡车司机0003','510998877330003','13900000003','TF000002','1');
insert into truck_driver_data values ('TD000004','运货卡车司机0004','510998877330004','13900000004','TF000002','1');

	
insert into transport_task_data values ('TT000001','货运记录','双链二号仓','2018-06-14','RS000001','TD000001','TT000001','TF000001','40.06185818748583','130.2909508987161','1');
insert into transport_task_data values ('TT000002','货运记录0002','双链二号仓0002','2017-06-01','RS000001','TD000001','TT000001','TF000001','40.790787652144076','131.33371637571975','1');
insert into transport_task_data values ('TT000003','货运记录0003','双链二号仓0003','2016-02-15','RS000002','TD000001','TT000001','TF000001','41.471200908222286','129.3873289960333','1');
insert into transport_task_data values ('TT000004','货运记录0004','双链二号仓0004','2018-02-16','RS000002','TD000001','TT000001','TF000001','40.68531879326519','131.32585174899884','1');
insert into transport_task_data values ('TT000005','货运记录0005','双链二号仓0005','2018-07-25','RS000003','TD000002','TT000002','TF000001','42.072837642475044','130.99138790634635','1');
insert into transport_task_data values ('TT000006','货运记录0006','双链二号仓0006','2016-10-07','RS000003','TD000002','TT000002','TF000001','41.70999969019253','131.31921230861516','1');
insert into transport_task_data values ('TT000007','货运记录0007','双链二号仓0007','2018-08-04','RS000004','TD000002','TT000002','TF000001','40.62191262630367','132.22031524948542','1');
insert into transport_task_data values ('TT000008','货运记录0008','双链二号仓0008','2016-06-03','RS000004','TD000002','TT000002','TF000001','42.114865492328164','130.22534399309578','1');
insert into transport_task_data values ('TT000009','货运记录0009','双链二号仓0009','2017-12-30','RS000005','TD000003','TT000003','TF000002','40.71567244372676','131.55789823602993','1');
insert into transport_task_data values ('TT000010','货运记录0010','双链二号仓0010','2018-06-06','RS000005','TD000003','TT000003','TF000002','41.11933727451354','131.47334713488135','1');
insert into transport_task_data values ('TT000011','货运记录0011','双链二号仓0011','2018-05-05','RS000006','TD000003','TT000003','TF000002','40.47021502808851','130.74728459553788','1');
insert into transport_task_data values ('TT000012','货运记录0012','双链二号仓0012','2016-02-05','RS000006','TD000003','TT000003','TF000002','40.20611067972881','129.72156780762458','1');
insert into transport_task_data values ('TT000013','货运记录0013','双链二号仓0013','2017-12-05','RS000007','TD000004','TT000004','TF000002','42.20239002789328','130.57031638236828','1');
insert into transport_task_data values ('TT000014','货运记录0014','双链二号仓0014','2017-07-27','RS000007','TD000004','TT000004','TF000002','40.47477497698354','129.65608967801256','1');
insert into transport_task_data values ('TT000015','货运记录0015','双链二号仓0015','2016-03-19','RS000008','TD000004','TT000004','TF000002','40.96052691011413','129.40704166361692','1');
insert into transport_task_data values ('TT000016','货运记录0016','双链二号仓0016','2016-10-08','RS000008','TD000004','TT000004','TF000002','42.62258213027056','129.5509791837338','1');

	
insert into transport_task_track_data values ('TTT000001','2017-12-24','31.75608827462123','104.1871012821315','TT000001','1');
insert into transport_task_track_data values ('TTT000002','2017-04-09','32.860174155874404','105.66768464212062','TT000001','1');
insert into transport_task_track_data values ('TTT000003','2017-03-09','31.189070310504064','104.98846548941317','TT000002','1');
insert into transport_task_track_data values ('TTT000004','2018-05-09','31.402041360756257','104.37324640327715','TT000002','1');
insert into transport_task_track_data values ('TTT000005','2017-02-28','30.17520212961003','105.77678177810834','TT000003','1');
insert into transport_task_track_data values ('TTT000006','2018-01-12','31.882545342776535','103.48517149348095','TT000003','1');
insert into transport_task_track_data values ('TTT000007','2016-11-24','31.01682701624556','104.02165558379487','TT000004','1');
insert into transport_task_track_data values ('TTT000008','2016-03-02','30.30290548072706','105.3490464041998','TT000004','1');
insert into transport_task_track_data values ('TTT000009','2016-11-18','30.10491512854006','105.78175176661453','TT000005','1');
insert into transport_task_track_data values ('TTT000010','2017-04-30','32.10106306625454','105.63824160829012','TT000005','1');
insert into transport_task_track_data values ('TTT000011','2018-05-13','30.633125659114175','105.28761175413074','TT000006','1');
insert into transport_task_track_data values ('TTT000012','2018-10-08','31.761281174761567','103.68515670499883','TT000006','1');
insert into transport_task_track_data values ('TTT000013','2016-09-07','32.5314013781604','103.7344488394628','TT000007','1');
insert into transport_task_track_data values ('TTT000014','2016-06-04','30.674218819871093','104.23309349898922','TT000007','1');
insert into transport_task_track_data values ('TTT000015','2016-09-21','31.073335398337928','105.33474436674568','TT000008','1');
insert into transport_task_track_data values ('TTT000016','2017-03-01','32.72844327008111','105.87767060180485','TT000008','1');
insert into transport_task_track_data values ('TTT000017','2018-08-09','32.16605103422983','105.42451284547255','TT000009','1');
insert into transport_task_track_data values ('TTT000018','2016-06-26','29.9437787481626','103.90681540999903','TT000009','1');
insert into transport_task_track_data values ('TTT000019','2016-10-24','32.54873921099638','103.7971974054119','TT000010','1');
insert into transport_task_track_data values ('TTT000020','2016-10-02','30.771001044814835','103.3611574298872','TT000010','1');
insert into transport_task_track_data values ('TTT000021','2018-04-18','31.07563875354813','103.23556988348595','TT000011','1');
insert into transport_task_track_data values ('TTT000022','2016-07-10','30.995832902449315','103.46019081779698','TT000011','1');
insert into transport_task_track_data values ('TTT000023','2018-07-10','32.338588657986975','105.65814188176226','TT000012','1');
insert into transport_task_track_data values ('TTT000024','2017-06-11','32.715736449078044','103.44008264864976','TT000012','1');
insert into transport_task_track_data values ('TTT000025','2016-03-22','32.568907676074446','104.82897012973348','TT000013','1');
insert into transport_task_track_data values ('TTT000026','2018-01-04','31.276545646925417','104.27081465110712','TT000013','1');
insert into transport_task_track_data values ('TTT000027','2016-09-10','30.3519804095219','103.588004392696','TT000014','1');
insert into transport_task_track_data values ('TTT000028','2017-06-23','30.236549500024662','104.93591652876569','TT000014','1');
insert into transport_task_track_data values ('TTT000029','2017-02-11','32.072387469667966','103.13605735529131','TT000015','1');
insert into transport_task_track_data values ('TTT000030','2018-09-20','31.195378065632035','103.31797137136182','TT000015','1');
insert into transport_task_track_data values ('TTT000031','2016-05-05','32.39266552453225','103.59997114213662','TT000016','1');
insert into transport_task_track_data values ('TTT000032','2017-10-08','32.21423004294288','104.41605254754523','TT000016','1');

	
insert into account_set_data values ('AS000001','账套2017','2017年','2016-12-31','企业会计制度','RMB','人民币','招商银行','33265805054885','RSCC000001','RS000001','GS000001','2019-01-02 19:56:29','1');
insert into account_set_data values ('AS000002','账套2018','2018年','2018-08-02','小企业会计制度','USD','美元','工商银行','332658050548850002','RSCC000001','RS000001','GS000001','2019-01-02 20:18:55','1');
insert into account_set_data values ('AS000003','账套2019','2019年','2016-09-06','合伙制会计制度','RMB','人民币','招商银行','332658050548850003','RSCC000001','RS000002','GS000001','2018-12-29 16:35:14','1');
insert into account_set_data values ('AS000004','账套2017','2017年','2016-08-01','企业会计制度','USD','美元','工商银行','332658050548850004','RSCC000001','RS000002','GS000001','2019-01-18 09:57:08','1');
insert into account_set_data values ('AS000005','账套2018','2018年','2016-01-23','小企业会计制度','RMB','人民币','招商银行','332658050548850005','RSCC000002','RS000003','GS000001','2019-01-11 19:14:15','1');
insert into account_set_data values ('AS000006','账套2019','2019年','2017-10-23','合伙制会计制度','USD','美元','工商银行','332658050548850006','RSCC000002','RS000003','GS000001','2019-01-01 18:42:21','1');
insert into account_set_data values ('AS000007','账套2017','2017年','2016-10-04','企业会计制度','RMB','人民币','招商银行','332658050548850007','RSCC000002','RS000004','GS000002','2019-01-02 18:35:31','1');
insert into account_set_data values ('AS000008','账套2018','2018年','2018-06-13','小企业会计制度','USD','美元','工商银行','332658050548850008','RSCC000002','RS000004','GS000002','2019-01-03 14:45:58','1');
insert into account_set_data values ('AS000009','账套2019','2019年','2017-07-07','合伙制会计制度','RMB','人民币','招商银行','332658050548850009','RSCC000003','RS000005','GS000002','2019-01-16 23:10:55','1');
insert into account_set_data values ('AS000010','账套2017','2017年','2017-06-10','企业会计制度','USD','美元','工商银行','332658050548850010','RSCC000003','RS000005','GS000002','2019-01-12 23:46:51','1');
insert into account_set_data values ('AS000011','账套2018','2018年','2016-05-11','小企业会计制度','RMB','人民币','招商银行','332658050548850011','RSCC000003','RS000006','GS000002','2019-01-18 15:07:49','1');
insert into account_set_data values ('AS000012','账套2019','2019年','2016-08-20','合伙制会计制度','USD','美元','工商银行','332658050548850012','RSCC000003','RS000006','GS000003','2019-01-08 22:38:07','1');
insert into account_set_data values ('AS000013','账套2017','2017年','2018-01-15','企业会计制度','RMB','人民币','招商银行','332658050548850013','RSCC000004','RS000007','GS000003','2019-01-14 17:01:04','1');
insert into account_set_data values ('AS000014','账套2018','2018年','2017-07-02','小企业会计制度','USD','美元','工商银行','332658050548850014','RSCC000004','RS000007','GS000003','2019-01-05 09:38:18','1');
insert into account_set_data values ('AS000015','账套2019','2019年','2016-10-21','合伙制会计制度','RMB','人民币','招商银行','332658050548850015','RSCC000004','RS000008','GS000003','2019-01-02 01:33:28','1');
insert into account_set_data values ('AS000016','账套2017','2017年','2017-02-18','企业会计制度','USD','美元','工商银行','332658050548850016','RSCC000004','RS000008','GS000003','2019-01-07 20:53:34','1');

	
insert into accounting_subject_data values ('AS000001','AS9999','银行存款','1','资产类','AS000001','1');
insert into accounting_subject_data values ('AS000002','AS99990002','银行存款0002','2','负债类','AS000001','1');
insert into accounting_subject_data values ('AS000003','AS99990003','银行存款0003','3','共同类','AS000002','1');
insert into accounting_subject_data values ('AS000004','AS99990004','银行存款0004','4','所有者权益类','AS000002','1');
insert into accounting_subject_data values ('AS000005','AS99990005','银行存款0005','5','成本类','AS000003','1');
insert into accounting_subject_data values ('AS000006','AS99990006','银行存款0006','6','损益类','AS000003','1');
insert into accounting_subject_data values ('AS000007','AS99990007','银行存款0007','1','资产类','AS000004','1');
insert into accounting_subject_data values ('AS000008','AS99990008','银行存款0008','2','负债类','AS000004','1');
insert into accounting_subject_data values ('AS000009','AS99990009','银行存款0009','3','共同类','AS000005','1');
insert into accounting_subject_data values ('AS000010','AS99990010','银行存款0010','4','所有者权益类','AS000005','1');
insert into accounting_subject_data values ('AS000011','AS99990011','银行存款0011','5','成本类','AS000006','1');
insert into accounting_subject_data values ('AS000012','AS99990012','银行存款0012','6','损益类','AS000006','1');
insert into accounting_subject_data values ('AS000013','AS99990013','银行存款0013','1','资产类','AS000007','1');
insert into accounting_subject_data values ('AS000014','AS99990014','银行存款0014','2','负债类','AS000007','1');
insert into accounting_subject_data values ('AS000015','AS99990015','银行存款0015','3','共同类','AS000008','1');
insert into accounting_subject_data values ('AS000016','AS99990016','银行存款0016','4','所有者权益类','AS000008','1');
insert into accounting_subject_data values ('AS000017','AS99990017','银行存款0017','5','成本类','AS000009','1');
insert into accounting_subject_data values ('AS000018','AS99990018','银行存款0018','6','损益类','AS000009','1');
insert into accounting_subject_data values ('AS000019','AS99990019','银行存款0019','1','资产类','AS000010','1');
insert into accounting_subject_data values ('AS000020','AS99990020','银行存款0020','2','负债类','AS000010','1');
insert into accounting_subject_data values ('AS000021','AS99990021','银行存款0021','3','共同类','AS000011','1');
insert into accounting_subject_data values ('AS000022','AS99990022','银行存款0022','4','所有者权益类','AS000011','1');
insert into accounting_subject_data values ('AS000023','AS99990023','银行存款0023','5','成本类','AS000012','1');
insert into accounting_subject_data values ('AS000024','AS99990024','银行存款0024','6','损益类','AS000012','1');
insert into accounting_subject_data values ('AS000025','AS99990025','银行存款0025','1','资产类','AS000013','1');
insert into accounting_subject_data values ('AS000026','AS99990026','银行存款0026','2','负债类','AS000013','1');
insert into accounting_subject_data values ('AS000027','AS99990027','银行存款0027','3','共同类','AS000014','1');
insert into accounting_subject_data values ('AS000028','AS99990028','银行存款0028','4','所有者权益类','AS000014','1');
insert into accounting_subject_data values ('AS000029','AS99990029','银行存款0029','5','成本类','AS000015','1');
insert into accounting_subject_data values ('AS000030','AS99990030','银行存款0030','6','损益类','AS000015','1');
insert into accounting_subject_data values ('AS000031','AS99990031','银行存款0031','1','资产类','AS000016','1');
insert into accounting_subject_data values ('AS000032','AS99990032','银行存款0032','2','负债类','AS000016','1');

	
insert into accounting_period_data values ('AP000001','2017年1月','2017-09-29','2017-03-09','AS000001','1');
insert into accounting_period_data values ('AP000002','2017年2月','2018-12-31','2018-07-15','AS000001','1');
insert into accounting_period_data values ('AP000003','2017年3月','2017-12-19','2016-01-26','AS000002','1');
insert into accounting_period_data values ('AP000004','2017年4月','2018-01-03','2017-03-11','AS000002','1');
insert into accounting_period_data values ('AP000005','2017年5月','2016-11-17','2017-08-09','AS000003','1');
insert into accounting_period_data values ('AP000006','2017年6月','2017-02-07','2018-09-23','AS000003','1');
insert into accounting_period_data values ('AP000007','2017年7月','2016-11-12','2017-06-16','AS000004','1');
insert into accounting_period_data values ('AP000008','2017年8月','2017-10-02','2017-10-22','AS000004','1');
insert into accounting_period_data values ('AP000009','2017年9月','2016-08-03','2018-08-08','AS000005','1');
insert into accounting_period_data values ('AP000010','2017年10月','2016-03-02','2017-05-17','AS000005','1');
insert into accounting_period_data values ('AP000011','2017年11月','2018-01-25','2016-10-24','AS000006','1');
insert into accounting_period_data values ('AP000012','2017年12月','2016-03-19','2016-06-25','AS000006','1');
insert into accounting_period_data values ('AP000013','2017年1月','2017-08-13','2018-12-24','AS000007','1');
insert into accounting_period_data values ('AP000014','2017年2月','2016-06-15','2016-05-19','AS000007','1');
insert into accounting_period_data values ('AP000015','2017年3月','2018-07-27','2018-11-13','AS000008','1');
insert into accounting_period_data values ('AP000016','2017年4月','2016-09-19','2018-02-05','AS000008','1');
insert into accounting_period_data values ('AP000017','2017年5月','2017-07-12','2016-03-01','AS000009','1');
insert into accounting_period_data values ('AP000018','2017年6月','2016-01-23','2017-10-15','AS000009','1');
insert into accounting_period_data values ('AP000019','2017年7月','2017-09-25','2016-06-24','AS000010','1');
insert into accounting_period_data values ('AP000020','2017年8月','2017-11-21','2016-08-18','AS000010','1');
insert into accounting_period_data values ('AP000021','2017年9月','2016-11-17','2017-07-31','AS000011','1');
insert into accounting_period_data values ('AP000022','2017年10月','2018-05-24','2016-07-21','AS000011','1');
insert into accounting_period_data values ('AP000023','2017年11月','2016-06-14','2018-07-21','AS000012','1');
insert into accounting_period_data values ('AP000024','2017年12月','2017-04-19','2018-12-05','AS000012','1');
insert into accounting_period_data values ('AP000025','2017年1月','2018-05-27','2017-06-26','AS000013','1');
insert into accounting_period_data values ('AP000026','2017年2月','2018-03-28','2018-05-17','AS000013','1');
insert into accounting_period_data values ('AP000027','2017年3月','2018-08-04','2018-02-27','AS000014','1');
insert into accounting_period_data values ('AP000028','2017年4月','2016-11-22','2017-01-31','AS000014','1');
insert into accounting_period_data values ('AP000029','2017年5月','2016-02-21','2018-09-09','AS000015','1');
insert into accounting_period_data values ('AP000030','2017年6月','2018-03-22','2017-07-12','AS000015','1');
insert into accounting_period_data values ('AP000031','2017年7月','2018-06-08','2018-03-04','AS000016','1');
insert into accounting_period_data values ('AP000032','2017年8月','2017-11-25','2017-02-17','AS000016','1');

	
insert into accounting_document_type_data values ('ADT000001','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。','AS000001','1');
insert into accounting_document_type_data values ('ADT000002','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0002','AS000001','1');
insert into accounting_document_type_data values ('ADT000003','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0003','AS000002','1');
insert into accounting_document_type_data values ('ADT000004','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0004','AS000002','1');
insert into accounting_document_type_data values ('ADT000005','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0005','AS000003','1');
insert into accounting_document_type_data values ('ADT000006','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0006','AS000003','1');
insert into accounting_document_type_data values ('ADT000007','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0007','AS000004','1');
insert into accounting_document_type_data values ('ADT000008','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0008','AS000004','1');
insert into accounting_document_type_data values ('ADT000009','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0009','AS000005','1');
insert into accounting_document_type_data values ('ADT000010','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0010','AS000005','1');
insert into accounting_document_type_data values ('ADT000011','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0011','AS000006','1');
insert into accounting_document_type_data values ('ADT000012','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0012','AS000006','1');
insert into accounting_document_type_data values ('ADT000013','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0013','AS000007','1');
insert into accounting_document_type_data values ('ADT000014','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0014','AS000007','1');
insert into accounting_document_type_data values ('ADT000015','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0015','AS000008','1');
insert into accounting_document_type_data values ('ADT000016','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0016','AS000008','1');
insert into accounting_document_type_data values ('ADT000017','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0017','AS000009','1');
insert into accounting_document_type_data values ('ADT000018','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0018','AS000009','1');
insert into accounting_document_type_data values ('ADT000019','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0019','AS000010','1');
insert into accounting_document_type_data values ('ADT000020','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0020','AS000010','1');
insert into accounting_document_type_data values ('ADT000021','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0021','AS000011','1');
insert into accounting_document_type_data values ('ADT000022','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0022','AS000011','1');
insert into accounting_document_type_data values ('ADT000023','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0023','AS000012','1');
insert into accounting_document_type_data values ('ADT000024','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0024','AS000012','1');
insert into accounting_document_type_data values ('ADT000025','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0025','AS000013','1');
insert into accounting_document_type_data values ('ADT000026','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0026','AS000013','1');
insert into accounting_document_type_data values ('ADT000027','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0027','AS000014','1');
insert into accounting_document_type_data values ('ADT000028','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0028','AS000014','1');
insert into accounting_document_type_data values ('ADT000029','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0029','AS000015','1');
insert into accounting_document_type_data values ('ADT000030','付款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0030','AS000015','1');
insert into accounting_document_type_data values ('ADT000031','记账凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0031','AS000016','1');
insert into accounting_document_type_data values ('ADT000032','收款凭证','又称记账凭单，是会计人员根据审核无误的原始凭证按照经济业务事项的内容加以分类，并据以确定会计分录后所填制的会计凭证。它是登记账簿的直接依据。0032','AS000016','1');

	
insert into accounting_document_data values ('AD000001','记账凭证','2017-01-26','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000002','记账凭证0002','2017-06-10','AP000001','ADT000001',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000003','记账凭证0003','2017-04-04','AP000002','ADT000002',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000004','记账凭证0004','2017-04-29','AP000002','ADT000002',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000005','记账凭证0005','2018-08-18','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000006','记账凭证0006','2016-08-07','AP000003','ADT000003',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000007','记账凭证0007','2017-08-16','AP000004','ADT000004',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000008','记账凭证0008','2016-08-19','AP000004','ADT000004',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000009','记账凭证0009','2018-09-04','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000010','记账凭证0010','2017-05-13','AP000005','ADT000005',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000011','记账凭证0011','2018-03-29','AP000006','ADT000006',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000012','记账凭证0012','2017-08-20','AP000006','ADT000006',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000013','记账凭证0013','2018-11-12','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000014','记账凭证0014','2016-05-07','AP000007','ADT000007',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000015','记账凭证0015','2018-04-26','AP000008','ADT000008',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000016','记账凭证0016','2016-05-28','AP000008','ADT000008',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000017','记账凭证0017','2016-07-02','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000018','记账凭证0018','2016-03-18','AP000009','ADT000009',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000019','记账凭证0019','2016-02-01','AP000010','ADT000010',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000020','记账凭证0020','2017-07-30','AP000010','ADT000010',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000021','记账凭证0021','2018-04-25','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000022','记账凭证0022','2017-01-26','AP000011','ADT000011',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000023','记账凭证0023','2017-01-26','AP000012','ADT000012',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000024','记账凭证0024','2017-06-03','AP000012','ADT000012',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000025','记账凭证0025','2017-08-22','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000026','记账凭证0026','2017-11-24','AP000013','ADT000013',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000027','记账凭证0027','2017-11-23','AP000014','ADT000014',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000028','记账凭证0028','2016-04-29','AP000014','ADT000014',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000029','记账凭证0029','2018-07-19','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000030','记账凭证0030','2016-06-07','AP000015','ADT000015',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000031','记账凭证0031','2018-05-31','AP000016','ADT000016',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000032','记账凭证0032','2017-09-03','AP000016','ADT000016',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000033','记账凭证0033','2018-09-24','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000034','记账凭证0034','2018-01-03','AP000017','ADT000017',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000035','记账凭证0035','2018-11-01','AP000018','ADT000018',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000036','记账凭证0036','2016-08-29','AP000018','ADT000018',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000037','记账凭证0037','2017-06-11','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000038','记账凭证0038','2018-11-08','AP000019','ADT000019',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000039','记账凭证0039','2019-01-12','AP000020','ADT000020',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000040','记账凭证0040','2018-07-06','AP000020','ADT000020',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000041','记账凭证0041','2018-10-26','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000042','记账凭证0042','2016-10-03','AP000021','ADT000021',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000043','记账凭证0043','2016-12-30','AP000022','ADT000022',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000044','记账凭证0044','2018-08-31','AP000022','ADT000022',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000045','记账凭证0045','2018-04-29','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000046','记账凭证0046','2017-08-12','AP000023','ADT000023',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000047','记账凭证0047','2016-10-23','AP000024','ADT000024',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000048','记账凭证0048','2017-09-28','AP000024','ADT000024',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000049','记账凭证0049','2018-04-06','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000050','记账凭证0050','2018-02-07','AP000025','ADT000025',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000051','记账凭证0051','2016-05-06','AP000026','ADT000026',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000052','记账凭证0052','2018-09-25','AP000026','ADT000026',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000053','记账凭证0053','2016-04-27','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000054','记账凭证0054','2018-11-08','AP000027','ADT000027',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000055','记账凭证0055','2016-02-11','AP000028','ADT000028',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000056','记账凭证0056','2018-07-06','AP000028','ADT000028',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000057','记账凭证0057','2018-07-02','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000058','记账凭证0058','2016-07-09','AP000029','ADT000029',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000059','记账凭证0059','2018-07-11','AP000030','ADT000030',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000060','记账凭证0060','2017-10-13','AP000030','ADT000030',NULL,NULL,NULL,NULL,'POSTED','1');
insert into accounting_document_data values ('AD000061','记账凭证0061','2017-09-10','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CREATED','1');
insert into accounting_document_data values ('AD000062','记账凭证0062','2017-11-22','AP000031','ADT000031',NULL,NULL,NULL,NULL,'CONFIRMED','1');
insert into accounting_document_data values ('AD000063','记账凭证0063','2017-01-04','AP000032','ADT000032',NULL,NULL,NULL,NULL,'AUDITED','1');
insert into accounting_document_data values ('AD000064','记账凭证0064','2017-10-06','AP000032','ADT000032',NULL,NULL,NULL,NULL,'POSTED','1');

	
insert into accounting_document_creation_data values ('ADC000001','财务会计','确认提交','2017-05-01','1');

	
insert into accounting_document_confirmation_data values ('ADC000001','财务会计','确认通过','2018-07-28','1');

	
insert into accounting_document_auditing_data values ('ADA000001','财务会计','审核通过，要都审核过了才通过哦','2017-02-08','1');

	
insert into accounting_document_posting_data values ('ADP000001','财务会计','审核通过，要都审核过了才通过哦','2016-04-23','1');

	
insert into original_voucher_data values ('OV000001','这是手写的发票','李亚青','本公司','原始凭证','goodthing.jpg','AD000001',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000002','这是手写的发票0002','李亚青0002','本公司0002','发票','goodthing.jpg','AD000001',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000003','这是手写的发票0003','李亚青0003','本公司0003','出库单','goodthing.jpg','AD000002',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000004','这是手写的发票0004','李亚青0004','本公司0004','入库单','goodthing.jpg','AD000002',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000005','这是手写的发票0005','李亚青0005','本公司0005','存款回执','goodthing.jpg','AD000003',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000006','这是手写的发票0006','李亚青0006','本公司0006','验收证明','goodthing.jpg','AD000003',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000007','这是手写的发票0007','李亚青0007','本公司0007','借款凭证','goodthing.jpg','AD000004',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000008','这是手写的发票0008','李亚青0008','本公司0008','原始凭证','goodthing.jpg','AD000004',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000009','这是手写的发票0009','李亚青0009','本公司0009','发票','goodthing.jpg','AD000005',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000010','这是手写的发票0010','李亚青0010','本公司0010','出库单','goodthing.jpg','AD000005',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000011','这是手写的发票0011','李亚青0011','本公司0011','入库单','goodthing.jpg','AD000006',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000012','这是手写的发票0012','李亚青0012','本公司0012','存款回执','goodthing.jpg','AD000006',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000013','这是手写的发票0013','李亚青0013','本公司0013','验收证明','goodthing.jpg','AD000007',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000014','这是手写的发票0014','李亚青0014','本公司0014','借款凭证','goodthing.jpg','AD000007',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000015','这是手写的发票0015','李亚青0015','本公司0015','原始凭证','goodthing.jpg','AD000008',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000016','这是手写的发票0016','李亚青0016','本公司0016','发票','goodthing.jpg','AD000008',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000017','这是手写的发票0017','李亚青0017','本公司0017','出库单','goodthing.jpg','AD000009',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000018','这是手写的发票0018','李亚青0018','本公司0018','入库单','goodthing.jpg','AD000009',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000019','这是手写的发票0019','李亚青0019','本公司0019','存款回执','goodthing.jpg','AD000010',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000020','这是手写的发票0020','李亚青0020','本公司0020','验收证明','goodthing.jpg','AD000010',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000021','这是手写的发票0021','李亚青0021','本公司0021','借款凭证','goodthing.jpg','AD000011',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000022','这是手写的发票0022','李亚青0022','本公司0022','原始凭证','goodthing.jpg','AD000011',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000023','这是手写的发票0023','李亚青0023','本公司0023','发票','goodthing.jpg','AD000012',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000024','这是手写的发票0024','李亚青0024','本公司0024','出库单','goodthing.jpg','AD000012',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000025','这是手写的发票0025','李亚青0025','本公司0025','入库单','goodthing.jpg','AD000013',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000026','这是手写的发票0026','李亚青0026','本公司0026','存款回执','goodthing.jpg','AD000013',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000027','这是手写的发票0027','李亚青0027','本公司0027','验收证明','goodthing.jpg','AD000014',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000028','这是手写的发票0028','李亚青0028','本公司0028','借款凭证','goodthing.jpg','AD000014',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000029','这是手写的发票0029','李亚青0029','本公司0029','原始凭证','goodthing.jpg','AD000015',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000030','这是手写的发票0030','李亚青0030','本公司0030','发票','goodthing.jpg','AD000015',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000031','这是手写的发票0031','李亚青0031','本公司0031','出库单','goodthing.jpg','AD000016',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000032','这是手写的发票0032','李亚青0032','本公司0032','入库单','goodthing.jpg','AD000016',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000033','这是手写的发票0033','李亚青0033','本公司0033','存款回执','goodthing.jpg','AD000017',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000034','这是手写的发票0034','李亚青0034','本公司0034','验收证明','goodthing.jpg','AD000017',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000035','这是手写的发票0035','李亚青0035','本公司0035','借款凭证','goodthing.jpg','AD000018',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000036','这是手写的发票0036','李亚青0036','本公司0036','原始凭证','goodthing.jpg','AD000018',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000037','这是手写的发票0037','李亚青0037','本公司0037','发票','goodthing.jpg','AD000019',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000038','这是手写的发票0038','李亚青0038','本公司0038','出库单','goodthing.jpg','AD000019',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000039','这是手写的发票0039','李亚青0039','本公司0039','入库单','goodthing.jpg','AD000020',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000040','这是手写的发票0040','李亚青0040','本公司0040','存款回执','goodthing.jpg','AD000020',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000041','这是手写的发票0041','李亚青0041','本公司0041','验收证明','goodthing.jpg','AD000021',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000042','这是手写的发票0042','李亚青0042','本公司0042','借款凭证','goodthing.jpg','AD000021',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000043','这是手写的发票0043','李亚青0043','本公司0043','原始凭证','goodthing.jpg','AD000022',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000044','这是手写的发票0044','李亚青0044','本公司0044','发票','goodthing.jpg','AD000022',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000045','这是手写的发票0045','李亚青0045','本公司0045','出库单','goodthing.jpg','AD000023',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000046','这是手写的发票0046','李亚青0046','本公司0046','入库单','goodthing.jpg','AD000023',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000047','这是手写的发票0047','李亚青0047','本公司0047','存款回执','goodthing.jpg','AD000024',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000048','这是手写的发票0048','李亚青0048','本公司0048','验收证明','goodthing.jpg','AD000024',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000049','这是手写的发票0049','李亚青0049','本公司0049','借款凭证','goodthing.jpg','AD000025',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000050','这是手写的发票0050','李亚青0050','本公司0050','原始凭证','goodthing.jpg','AD000025',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000051','这是手写的发票0051','李亚青0051','本公司0051','发票','goodthing.jpg','AD000026',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000052','这是手写的发票0052','李亚青0052','本公司0052','出库单','goodthing.jpg','AD000026',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000053','这是手写的发票0053','李亚青0053','本公司0053','入库单','goodthing.jpg','AD000027',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000054','这是手写的发票0054','李亚青0054','本公司0054','存款回执','goodthing.jpg','AD000027',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000055','这是手写的发票0055','李亚青0055','本公司0055','验收证明','goodthing.jpg','AD000028',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000056','这是手写的发票0056','李亚青0056','本公司0056','借款凭证','goodthing.jpg','AD000028',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000057','这是手写的发票0057','李亚青0057','本公司0057','原始凭证','goodthing.jpg','AD000029',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000058','这是手写的发票0058','李亚青0058','本公司0058','发票','goodthing.jpg','AD000029',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000059','这是手写的发票0059','李亚青0059','本公司0059','出库单','goodthing.jpg','AD000030',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000060','这是手写的发票0060','李亚青0060','本公司0060','入库单','goodthing.jpg','AD000030',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000061','这是手写的发票0061','李亚青0061','本公司0061','存款回执','goodthing.jpg','AD000031',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000062','这是手写的发票0062','李亚青0062','本公司0062','验收证明','goodthing.jpg','AD000031',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000063','这是手写的发票0063','李亚青0063','本公司0063','借款凭证','goodthing.jpg','AD000032',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000064','这是手写的发票0064','李亚青0064','本公司0064','原始凭证','goodthing.jpg','AD000032',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000065','这是手写的发票0065','李亚青0065','本公司0065','发票','goodthing.jpg','AD000033',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000066','这是手写的发票0066','李亚青0066','本公司0066','出库单','goodthing.jpg','AD000033',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000067','这是手写的发票0067','李亚青0067','本公司0067','入库单','goodthing.jpg','AD000034',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000068','这是手写的发票0068','李亚青0068','本公司0068','存款回执','goodthing.jpg','AD000034',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000069','这是手写的发票0069','李亚青0069','本公司0069','验收证明','goodthing.jpg','AD000035',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000070','这是手写的发票0070','李亚青0070','本公司0070','借款凭证','goodthing.jpg','AD000035',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000071','这是手写的发票0071','李亚青0071','本公司0071','原始凭证','goodthing.jpg','AD000036',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000072','这是手写的发票0072','李亚青0072','本公司0072','发票','goodthing.jpg','AD000036',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000073','这是手写的发票0073','李亚青0073','本公司0073','出库单','goodthing.jpg','AD000037',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000074','这是手写的发票0074','李亚青0074','本公司0074','入库单','goodthing.jpg','AD000037',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000075','这是手写的发票0075','李亚青0075','本公司0075','存款回执','goodthing.jpg','AD000038',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000076','这是手写的发票0076','李亚青0076','本公司0076','验收证明','goodthing.jpg','AD000038',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000077','这是手写的发票0077','李亚青0077','本公司0077','借款凭证','goodthing.jpg','AD000039',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000078','这是手写的发票0078','李亚青0078','本公司0078','原始凭证','goodthing.jpg','AD000039',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000079','这是手写的发票0079','李亚青0079','本公司0079','发票','goodthing.jpg','AD000040',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000080','这是手写的发票0080','李亚青0080','本公司0080','出库单','goodthing.jpg','AD000040',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000081','这是手写的发票0081','李亚青0081','本公司0081','入库单','goodthing.jpg','AD000041',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000082','这是手写的发票0082','李亚青0082','本公司0082','存款回执','goodthing.jpg','AD000041',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000083','这是手写的发票0083','李亚青0083','本公司0083','验收证明','goodthing.jpg','AD000042',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000084','这是手写的发票0084','李亚青0084','本公司0084','借款凭证','goodthing.jpg','AD000042',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000085','这是手写的发票0085','李亚青0085','本公司0085','原始凭证','goodthing.jpg','AD000043',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000086','这是手写的发票0086','李亚青0086','本公司0086','发票','goodthing.jpg','AD000043',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000087','这是手写的发票0087','李亚青0087','本公司0087','出库单','goodthing.jpg','AD000044',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000088','这是手写的发票0088','李亚青0088','本公司0088','入库单','goodthing.jpg','AD000044',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000089','这是手写的发票0089','李亚青0089','本公司0089','存款回执','goodthing.jpg','AD000045',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000090','这是手写的发票0090','李亚青0090','本公司0090','验收证明','goodthing.jpg','AD000045',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000091','这是手写的发票0091','李亚青0091','本公司0091','借款凭证','goodthing.jpg','AD000046',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000092','这是手写的发票0092','李亚青0092','本公司0092','原始凭证','goodthing.jpg','AD000046',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000093','这是手写的发票0093','李亚青0093','本公司0093','发票','goodthing.jpg','AD000047',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000094','这是手写的发票0094','李亚青0094','本公司0094','出库单','goodthing.jpg','AD000047',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000095','这是手写的发票0095','李亚青0095','本公司0095','入库单','goodthing.jpg','AD000048',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000096','这是手写的发票0096','李亚青0096','本公司0096','存款回执','goodthing.jpg','AD000048',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000097','这是手写的发票0097','李亚青0097','本公司0097','验收证明','goodthing.jpg','AD000049',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000098','这是手写的发票0098','李亚青0098','本公司0098','借款凭证','goodthing.jpg','AD000049',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000099','这是手写的发票0099','李亚青0099','本公司0099','原始凭证','goodthing.jpg','AD000050',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000100','这是手写的发票0100','李亚青0100','本公司0100','发票','goodthing.jpg','AD000050',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000101','这是手写的发票0101','李亚青0101','本公司0101','出库单','goodthing.jpg','AD000051',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000102','这是手写的发票0102','李亚青0102','本公司0102','入库单','goodthing.jpg','AD000051',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000103','这是手写的发票0103','李亚青0103','本公司0103','存款回执','goodthing.jpg','AD000052',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000104','这是手写的发票0104','李亚青0104','本公司0104','验收证明','goodthing.jpg','AD000052',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000105','这是手写的发票0105','李亚青0105','本公司0105','借款凭证','goodthing.jpg','AD000053',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000106','这是手写的发票0106','李亚青0106','本公司0106','原始凭证','goodthing.jpg','AD000053',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000107','这是手写的发票0107','李亚青0107','本公司0107','发票','goodthing.jpg','AD000054',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000108','这是手写的发票0108','李亚青0108','本公司0108','出库单','goodthing.jpg','AD000054',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000109','这是手写的发票0109','李亚青0109','本公司0109','入库单','goodthing.jpg','AD000055',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000110','这是手写的发票0110','李亚青0110','本公司0110','存款回执','goodthing.jpg','AD000055',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000111','这是手写的发票0111','李亚青0111','本公司0111','验收证明','goodthing.jpg','AD000056',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000112','这是手写的发票0112','李亚青0112','本公司0112','借款凭证','goodthing.jpg','AD000056',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000113','这是手写的发票0113','李亚青0113','本公司0113','原始凭证','goodthing.jpg','AD000057',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000114','这是手写的发票0114','李亚青0114','本公司0114','发票','goodthing.jpg','AD000057',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000115','这是手写的发票0115','李亚青0115','本公司0115','出库单','goodthing.jpg','AD000058',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000116','这是手写的发票0116','李亚青0116','本公司0116','入库单','goodthing.jpg','AD000058',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000117','这是手写的发票0117','李亚青0117','本公司0117','存款回执','goodthing.jpg','AD000059',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000118','这是手写的发票0118','李亚青0118','本公司0118','验收证明','goodthing.jpg','AD000059',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000119','这是手写的发票0119','李亚青0119','本公司0119','借款凭证','goodthing.jpg','AD000060',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000120','这是手写的发票0120','李亚青0120','本公司0120','原始凭证','goodthing.jpg','AD000060',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000121','这是手写的发票0121','李亚青0121','本公司0121','发票','goodthing.jpg','AD000061',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000122','这是手写的发票0122','李亚青0122','本公司0122','出库单','goodthing.jpg','AD000061',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000123','这是手写的发票0123','李亚青0123','本公司0123','入库单','goodthing.jpg','AD000062',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000124','这是手写的发票0124','李亚青0124','本公司0124','存款回执','goodthing.jpg','AD000062',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000125','这是手写的发票0125','李亚青0125','本公司0125','验收证明','goodthing.jpg','AD000063',NULL,NULL,NULL,'CONFIRMED','1');
insert into original_voucher_data values ('OV000126','这是手写的发票0126','李亚青0126','本公司0126','借款凭证','goodthing.jpg','AD000063',NULL,NULL,NULL,'AUDITED','1');
insert into original_voucher_data values ('OV000127','这是手写的发票0127','李亚青0127','本公司0127','原始凭证','goodthing.jpg','AD000064',NULL,NULL,NULL,'CREATED','1');
insert into original_voucher_data values ('OV000128','这是手写的发票0128','李亚青0128','本公司0128','发票','goodthing.jpg','AD000064',NULL,NULL,NULL,'CONFIRMED','1');

	
insert into original_voucher_creation_data values ('OVC000001','财务会计','确认提交','2016-08-29','1');

	
insert into original_voucher_confirmation_data values ('OVC000001','财务会计','确认通过','2018-11-04','1');

	
insert into original_voucher_auditing_data values ('OVA000001','财务会计','审核通过，要都审核过了才通过哦','2018-11-15','1');

	
insert into accounting_document_line_data values ('ADL000001','收到存款','AS9999','借','918704.25','AD000001','AS000001','1');
insert into accounting_document_line_data values ('ADL000002','收到存款0002','AS99990002','贷','989117.19','AD000001','AS000001','1');
insert into accounting_document_line_data values ('ADL000003','收到存款0003','AS99990003','借','763982.94','AD000002','AS000001','1');
insert into accounting_document_line_data values ('ADL000004','收到存款0004','AS99990004','贷','840239.69','AD000002','AS000001','1');
insert into accounting_document_line_data values ('ADL000005','收到存款0005','AS99990005','借','921569.31','AD000003','AS000002','1');
insert into accounting_document_line_data values ('ADL000006','收到存款0006','AS99990006','贷','904430.50','AD000003','AS000002','1');
insert into accounting_document_line_data values ('ADL000007','收到存款0007','AS99990007','借','750159.88','AD000004','AS000002','1');
insert into accounting_document_line_data values ('ADL000008','收到存款0008','AS99990008','贷','746507.94','AD000004','AS000002','1');
insert into accounting_document_line_data values ('ADL000009','收到存款0009','AS99990009','借','696017.00','AD000005','AS000003','1');
insert into accounting_document_line_data values ('ADL000010','收到存款0010','AS99990010','贷','934698.56','AD000005','AS000003','1');
insert into accounting_document_line_data values ('ADL000011','收到存款0011','AS99990011','借','867077.31','AD000006','AS000003','1');
insert into accounting_document_line_data values ('ADL000012','收到存款0012','AS99990012','贷','892880.25','AD000006','AS000003','1');
insert into accounting_document_line_data values ('ADL000013','收到存款0013','AS99990013','借','783174.81','AD000007','AS000004','1');
insert into accounting_document_line_data values ('ADL000014','收到存款0014','AS99990014','贷','814605.00','AD000007','AS000004','1');
insert into accounting_document_line_data values ('ADL000015','收到存款0015','AS99990015','借','914657.19','AD000008','AS000004','1');
insert into accounting_document_line_data values ('ADL000016','收到存款0016','AS99990016','贷','919818.62','AD000008','AS000004','1');
insert into accounting_document_line_data values ('ADL000017','收到存款0017','AS99990017','借','839453.31','AD000009','AS000005','1');
insert into accounting_document_line_data values ('ADL000018','收到存款0018','AS99990018','贷','837742.62','AD000009','AS000005','1');
insert into accounting_document_line_data values ('ADL000019','收到存款0019','AS99990019','借','767478.75','AD000010','AS000005','1');
insert into accounting_document_line_data values ('ADL000020','收到存款0020','AS99990020','贷','921968.12','AD000010','AS000005','1');
insert into accounting_document_line_data values ('ADL000021','收到存款0021','AS99990021','借','964221.00','AD000011','AS000006','1');
insert into accounting_document_line_data values ('ADL000022','收到存款0022','AS99990022','贷','780565.81','AD000011','AS000006','1');
insert into accounting_document_line_data values ('ADL000023','收到存款0023','AS99990023','借','704602.31','AD000012','AS000006','1');
insert into accounting_document_line_data values ('ADL000024','收到存款0024','AS99990024','贷','764756.75','AD000012','AS000006','1');
insert into accounting_document_line_data values ('ADL000025','收到存款0025','AS99990025','借','947347.31','AD000013','AS000007','1');
insert into accounting_document_line_data values ('ADL000026','收到存款0026','AS99990026','贷','723272.75','AD000013','AS000007','1');
insert into accounting_document_line_data values ('ADL000027','收到存款0027','AS99990027','借','928997.31','AD000014','AS000007','1');
insert into accounting_document_line_data values ('ADL000028','收到存款0028','AS99990028','贷','844571.62','AD000014','AS000007','1');
insert into accounting_document_line_data values ('ADL000029','收到存款0029','AS99990029','借','916942.38','AD000015','AS000008','1');
insert into accounting_document_line_data values ('ADL000030','收到存款0030','AS99990030','贷','722524.38','AD000015','AS000008','1');
insert into accounting_document_line_data values ('ADL000031','收到存款0031','AS99990031','借','903550.06','AD000016','AS000008','1');
insert into accounting_document_line_data values ('ADL000032','收到存款0032','AS99990032','贷','980093.75','AD000016','AS000008','1');
insert into accounting_document_line_data values ('ADL000033','收到存款0033','AS99990033','借','796945.12','AD000017','AS000009','1');
insert into accounting_document_line_data values ('ADL000034','收到存款0034','AS99990034','贷','863405.19','AD000017','AS000009','1');
insert into accounting_document_line_data values ('ADL000035','收到存款0035','AS99990035','借','751963.75','AD000018','AS000009','1');
insert into accounting_document_line_data values ('ADL000036','收到存款0036','AS99990036','贷','711765.25','AD000018','AS000009','1');
insert into accounting_document_line_data values ('ADL000037','收到存款0037','AS99990037','借','772305.62','AD000019','AS000010','1');
insert into accounting_document_line_data values ('ADL000038','收到存款0038','AS99990038','贷','770807.44','AD000019','AS000010','1');
insert into accounting_document_line_data values ('ADL000039','收到存款0039','AS99990039','借','906823.94','AD000020','AS000010','1');
insert into accounting_document_line_data values ('ADL000040','收到存款0040','AS99990040','贷','740278.88','AD000020','AS000010','1');
insert into accounting_document_line_data values ('ADL000041','收到存款0041','AS99990041','借','724900.06','AD000021','AS000011','1');
insert into accounting_document_line_data values ('ADL000042','收到存款0042','AS99990042','贷','953230.38','AD000021','AS000011','1');
insert into accounting_document_line_data values ('ADL000043','收到存款0043','AS99990043','借','831464.38','AD000022','AS000011','1');
insert into accounting_document_line_data values ('ADL000044','收到存款0044','AS99990044','贷','752317.75','AD000022','AS000011','1');
insert into accounting_document_line_data values ('ADL000045','收到存款0045','AS99990045','借','853572.38','AD000023','AS000012','1');
insert into accounting_document_line_data values ('ADL000046','收到存款0046','AS99990046','贷','767482.44','AD000023','AS000012','1');
insert into accounting_document_line_data values ('ADL000047','收到存款0047','AS99990047','借','830757.06','AD000024','AS000012','1');
insert into accounting_document_line_data values ('ADL000048','收到存款0048','AS99990048','贷','970097.12','AD000024','AS000012','1');
insert into accounting_document_line_data values ('ADL000049','收到存款0049','AS99990049','借','919251.06','AD000025','AS000013','1');
insert into accounting_document_line_data values ('ADL000050','收到存款0050','AS99990050','贷','785219.25','AD000025','AS000013','1');
insert into accounting_document_line_data values ('ADL000051','收到存款0051','AS99990051','借','829030.44','AD000026','AS000013','1');
insert into accounting_document_line_data values ('ADL000052','收到存款0052','AS99990052','贷','986974.81','AD000026','AS000013','1');
insert into accounting_document_line_data values ('ADL000053','收到存款0053','AS99990053','借','752198.69','AD000027','AS000014','1');
insert into accounting_document_line_data values ('ADL000054','收到存款0054','AS99990054','贷','762863.56','AD000027','AS000014','1');
insert into accounting_document_line_data values ('ADL000055','收到存款0055','AS99990055','借','952645.12','AD000028','AS000014','1');
insert into accounting_document_line_data values ('ADL000056','收到存款0056','AS99990056','贷','853512.94','AD000028','AS000014','1');
insert into accounting_document_line_data values ('ADL000057','收到存款0057','AS99990057','借','831860.06','AD000029','AS000015','1');
insert into accounting_document_line_data values ('ADL000058','收到存款0058','AS99990058','贷','877029.00','AD000029','AS000015','1');
insert into accounting_document_line_data values ('ADL000059','收到存款0059','AS99990059','借','750643.94','AD000030','AS000015','1');
insert into accounting_document_line_data values ('ADL000060','收到存款0060','AS99990060','贷','852649.69','AD000030','AS000015','1');
insert into accounting_document_line_data values ('ADL000061','收到存款0061','AS99990061','借','770015.88','AD000031','AS000016','1');
insert into accounting_document_line_data values ('ADL000062','收到存款0062','AS99990062','贷','776312.50','AD000031','AS000016','1');
insert into accounting_document_line_data values ('ADL000063','收到存款0063','AS99990063','借','747520.44','AD000032','AS000016','1');
insert into accounting_document_line_data values ('ADL000064','收到存款0064','AS99990064','贷','887042.19','AD000032','AS000016','1');
insert into accounting_document_line_data values ('ADL000065','收到存款0065','AS99990065','借','736316.38','AD000033','AS000017','1');
insert into accounting_document_line_data values ('ADL000066','收到存款0066','AS99990066','贷','839920.56','AD000033','AS000017','1');
insert into accounting_document_line_data values ('ADL000067','收到存款0067','AS99990067','借','886721.06','AD000034','AS000017','1');
insert into accounting_document_line_data values ('ADL000068','收到存款0068','AS99990068','贷','982077.25','AD000034','AS000017','1');
insert into accounting_document_line_data values ('ADL000069','收到存款0069','AS99990069','借','742257.75','AD000035','AS000018','1');
insert into accounting_document_line_data values ('ADL000070','收到存款0070','AS99990070','贷','983944.19','AD000035','AS000018','1');
insert into accounting_document_line_data values ('ADL000071','收到存款0071','AS99990071','借','900622.62','AD000036','AS000018','1');
insert into accounting_document_line_data values ('ADL000072','收到存款0072','AS99990072','贷','787779.81','AD000036','AS000018','1');
insert into accounting_document_line_data values ('ADL000073','收到存款0073','AS99990073','借','853887.19','AD000037','AS000019','1');
insert into accounting_document_line_data values ('ADL000074','收到存款0074','AS99990074','贷','916013.69','AD000037','AS000019','1');
insert into accounting_document_line_data values ('ADL000075','收到存款0075','AS99990075','借','936844.81','AD000038','AS000019','1');
insert into accounting_document_line_data values ('ADL000076','收到存款0076','AS99990076','贷','901631.94','AD000038','AS000019','1');
insert into accounting_document_line_data values ('ADL000077','收到存款0077','AS99990077','借','974177.62','AD000039','AS000020','1');
insert into accounting_document_line_data values ('ADL000078','收到存款0078','AS99990078','贷','751019.94','AD000039','AS000020','1');
insert into accounting_document_line_data values ('ADL000079','收到存款0079','AS99990079','借','917676.75','AD000040','AS000020','1');
insert into accounting_document_line_data values ('ADL000080','收到存款0080','AS99990080','贷','966979.88','AD000040','AS000020','1');
insert into accounting_document_line_data values ('ADL000081','收到存款0081','AS99990081','借','814366.75','AD000041','AS000021','1');
insert into accounting_document_line_data values ('ADL000082','收到存款0082','AS99990082','贷','762362.75','AD000041','AS000021','1');
insert into accounting_document_line_data values ('ADL000083','收到存款0083','AS99990083','借','844998.88','AD000042','AS000021','1');
insert into accounting_document_line_data values ('ADL000084','收到存款0084','AS99990084','贷','876002.19','AD000042','AS000021','1');
insert into accounting_document_line_data values ('ADL000085','收到存款0085','AS99990085','借','750928.25','AD000043','AS000022','1');
insert into accounting_document_line_data values ('ADL000086','收到存款0086','AS99990086','贷','787392.44','AD000043','AS000022','1');
insert into accounting_document_line_data values ('ADL000087','收到存款0087','AS99990087','借','904776.38','AD000044','AS000022','1');
insert into accounting_document_line_data values ('ADL000088','收到存款0088','AS99990088','贷','775500.75','AD000044','AS000022','1');
insert into accounting_document_line_data values ('ADL000089','收到存款0089','AS99990089','借','957540.69','AD000045','AS000023','1');
insert into accounting_document_line_data values ('ADL000090','收到存款0090','AS99990090','贷','761709.75','AD000045','AS000023','1');
insert into accounting_document_line_data values ('ADL000091','收到存款0091','AS99990091','借','752320.19','AD000046','AS000023','1');
insert into accounting_document_line_data values ('ADL000092','收到存款0092','AS99990092','贷','920575.12','AD000046','AS000023','1');
insert into accounting_document_line_data values ('ADL000093','收到存款0093','AS99990093','借','785508.94','AD000047','AS000024','1');
insert into accounting_document_line_data values ('ADL000094','收到存款0094','AS99990094','贷','760647.69','AD000047','AS000024','1');
insert into accounting_document_line_data values ('ADL000095','收到存款0095','AS99990095','借','881828.25','AD000048','AS000024','1');
insert into accounting_document_line_data values ('ADL000096','收到存款0096','AS99990096','贷','896686.69','AD000048','AS000024','1');
insert into accounting_document_line_data values ('ADL000097','收到存款0097','AS99990097','借','972027.88','AD000049','AS000025','1');
insert into accounting_document_line_data values ('ADL000098','收到存款0098','AS99990098','贷','976482.19','AD000049','AS000025','1');
insert into accounting_document_line_data values ('ADL000099','收到存款0099','AS99990099','借','961062.62','AD000050','AS000025','1');
insert into accounting_document_line_data values ('ADL000100','收到存款0100','AS99990100','贷','907518.50','AD000050','AS000025','1');
insert into accounting_document_line_data values ('ADL000101','收到存款0101','AS99990101','借','761746.25','AD000051','AS000026','1');
insert into accounting_document_line_data values ('ADL000102','收到存款0102','AS99990102','贷','948014.75','AD000051','AS000026','1');
insert into accounting_document_line_data values ('ADL000103','收到存款0103','AS99990103','借','711696.81','AD000052','AS000026','1');
insert into accounting_document_line_data values ('ADL000104','收到存款0104','AS99990104','贷','867462.94','AD000052','AS000026','1');
insert into accounting_document_line_data values ('ADL000105','收到存款0105','AS99990105','借','789707.69','AD000053','AS000027','1');
insert into accounting_document_line_data values ('ADL000106','收到存款0106','AS99990106','贷','800353.69','AD000053','AS000027','1');
insert into accounting_document_line_data values ('ADL000107','收到存款0107','AS99990107','借','948848.81','AD000054','AS000027','1');
insert into accounting_document_line_data values ('ADL000108','收到存款0108','AS99990108','贷','869549.50','AD000054','AS000027','1');
insert into accounting_document_line_data values ('ADL000109','收到存款0109','AS99990109','借','859389.25','AD000055','AS000028','1');
insert into accounting_document_line_data values ('ADL000110','收到存款0110','AS99990110','贷','706796.12','AD000055','AS000028','1');
insert into accounting_document_line_data values ('ADL000111','收到存款0111','AS99990111','借','982355.81','AD000056','AS000028','1');
insert into accounting_document_line_data values ('ADL000112','收到存款0112','AS99990112','贷','735276.00','AD000056','AS000028','1');
insert into accounting_document_line_data values ('ADL000113','收到存款0113','AS99990113','借','864555.94','AD000057','AS000029','1');
insert into accounting_document_line_data values ('ADL000114','收到存款0114','AS99990114','贷','803811.00','AD000057','AS000029','1');
insert into accounting_document_line_data values ('ADL000115','收到存款0115','AS99990115','借','849180.31','AD000058','AS000029','1');
insert into accounting_document_line_data values ('ADL000116','收到存款0116','AS99990116','贷','827933.06','AD000058','AS000029','1');
insert into accounting_document_line_data values ('ADL000117','收到存款0117','AS99990117','借','940561.12','AD000059','AS000030','1');
insert into accounting_document_line_data values ('ADL000118','收到存款0118','AS99990118','贷','712328.56','AD000059','AS000030','1');
insert into accounting_document_line_data values ('ADL000119','收到存款0119','AS99990119','借','950833.88','AD000060','AS000030','1');
insert into accounting_document_line_data values ('ADL000120','收到存款0120','AS99990120','贷','947408.31','AD000060','AS000030','1');
insert into accounting_document_line_data values ('ADL000121','收到存款0121','AS99990121','借','967698.25','AD000061','AS000031','1');
insert into accounting_document_line_data values ('ADL000122','收到存款0122','AS99990122','贷','777524.88','AD000061','AS000031','1');
insert into accounting_document_line_data values ('ADL000123','收到存款0123','AS99990123','借','728052.38','AD000062','AS000031','1');
insert into accounting_document_line_data values ('ADL000124','收到存款0124','AS99990124','贷','880760.44','AD000062','AS000031','1');
insert into accounting_document_line_data values ('ADL000125','收到存款0125','AS99990125','借','794989.56','AD000063','AS000032','1');
insert into accounting_document_line_data values ('ADL000126','收到存款0126','AS99990126','贷','704642.94','AD000063','AS000032','1');
insert into accounting_document_line_data values ('ADL000127','收到存款0127','AS99990127','借','859614.25','AD000064','AS000032','1');
insert into accounting_document_line_data values ('ADL000128','收到存款0128','AS99990128','贷','726518.25','AD000064','AS000032','1');

	
insert into level_one_department_data values ('LOD000001','RSCC000001','供应链部','主要执行集团信息系统建设，维护，规划','刘强','2018-11-12','1');
insert into level_one_department_data values ('LOD000002','RSCC000001','采购部','主要执行集团信息系统建设，维护，规划0002','王德宏','2016-05-07','1');
insert into level_one_department_data values ('LOD000003','RSCC000002','管理部','主要执行集团信息系统建设，维护，规划0003','刘强','2016-09-14','1');
insert into level_one_department_data values ('LOD000004','RSCC000002','财务部','主要执行集团信息系统建设，维护，规划0004','王德宏','2018-09-03','1');
insert into level_one_department_data values ('LOD000005','RSCC000003','信息技术部','主要执行集团信息系统建设，维护，规划0005','刘强','2016-11-07','1');
insert into level_one_department_data values ('LOD000006','RSCC000003','法务部','主要执行集团信息系统建设，维护，规划0006','王德宏','2018-08-27','1');
insert into level_one_department_data values ('LOD000007','RSCC000004','市场部','主要执行集团信息系统建设，维护，规划0007','刘强','2018-09-08','1');
insert into level_one_department_data values ('LOD000008','RSCC000004','人力资源部','主要执行集团信息系统建设，维护，规划0008','王德宏','2018-06-19','1');

	
insert into level_two_department_data values ('LTD000001','LOD000001','信息系统部大数据部门','主要执行集团信息系统建设，维护，规划','2018-02-28','1');
insert into level_two_department_data values ('LTD000002','LOD000003','信息系统部大数据部门0002','主要执行集团信息系统建设，维护，规划0002','2016-12-29','1');
insert into level_two_department_data values ('LTD000003','LOD000005','信息系统部大数据部门0003','主要执行集团信息系统建设，维护，规划0003','2018-11-06','1');
insert into level_two_department_data values ('LTD000004','LOD000007','信息系统部大数据部门0004','主要执行集团信息系统建设，维护，规划0004','2018-10-21','1');

	
insert into level_three_department_data values ('LTD000001','LTD000001','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划','2018-02-27','1');
insert into level_three_department_data values ('LTD000002','LTD000001','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0002','2018-07-11','1');
insert into level_three_department_data values ('LTD000003','LTD000002','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0003','2018-11-30','1');
insert into level_three_department_data values ('LTD000004','LTD000002','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0004','2018-07-13','1');
insert into level_three_department_data values ('LTD000005','LTD000003','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0005','2017-09-10','1');
insert into level_three_department_data values ('LTD000006','LTD000003','信息系统部大数据解决方案组','主要执行集团信息系统建设，维护，规划0006','2019-01-17','1');
insert into level_three_department_data values ('LTD000007','LTD000004','信息系统部大数据清洗组','主要执行集团信息系统建设，维护，规划0007','2018-03-02','1');
insert into level_three_department_data values ('LTD000008','LTD000004','信息系统部大数据运算组','主要执行集团信息系统建设，维护，规划0008','2018-09-07','1');

	
insert into skill_type_data values ('ST000001','S0000','RSCC000001','JAVA编程','1');
insert into skill_type_data values ('ST000002','S00000002','RSCC000003','大数据','1');

	
insert into responsibility_type_data values ('RT000001','S0000','RSCC000001','合规管理','负责集团及其他分公司信息系统有效运作，并使集团在技术上领先','1');
insert into responsibility_type_data values ('RT000002','S00000002','RSCC000003','财务管理','负责集团及其他分公司信息系统有效运作，并使集团在技术上领先0002','1');

	
insert into termination_reason_data values ('TR000001','ETR0000','RSCC000001','业务发展，公司转型','1');
insert into termination_reason_data values ('TR000002','ETR00000002','RSCC000003','战略调整','1');

	
insert into termination_type_data values ('TT000001','ETT0000','RSCC000001','合同解除','这个终止原因的描述是这样的.................................................','1');
insert into termination_type_data values ('TT000002','ETT00000002','RSCC000003','辞职','这个终止原因的描述是这样的.................................................0002','1');

	
insert into occupation_type_data values ('OT000001','OT0000','RSCC000001','需求分析员','故事还得从遥远的古代开始.................................................','1');
insert into occupation_type_data values ('OT000002','OT00000002','RSCC000003','软件工程师','故事还得从遥远的古代开始.................................................0002','1');

	
insert into leave_type_data values ('LT000001','LT0000','RSCC000001','带薪年假','故事还得从遥远的古代开始.................................................','1');
insert into leave_type_data values ('LT000002','LT00000002','RSCC000003','病假','故事还得从遥远的古代开始.................................................0002','1');

	
insert into salary_grade_data values ('SG000001','SG0000','RSCC000001','一级薪资','故事还得从遥远的古代开始.................................................','1');
insert into salary_grade_data values ('SG000002','SG00000002','RSCC000003','二级薪资','故事还得从遥远的古代开始.................................................0002','1');

	
insert into interview_type_data values ('IT000001','INTRVW00','RSCC000001','特别情况面试','故事还得从遥远的古代开始.................................................','1');
insert into interview_type_data values ('IT000002','INTRVW000002','RSCC000003','离职面试','故事还得从遥远的古代开始.................................................0002','1');

	
insert into training_course_type_data values ('TCT000001','TC00','RSCC000001','入职培训','培训是提升个人和企业竞争力的法宝','1');
insert into training_course_type_data values ('TCT000002','TC000002','RSCC000003','售前培训','培训是提升个人和企业竞争力的法宝0002','1');

	
insert into public_holiday_data values ('PH000001','PH00','RSCC000001','元旦节','节日快乐，万事如意！','1');
insert into public_holiday_data values ('PH000002','PH000002','RSCC000003','春节','节日快乐，万事如意！0002','1');

	
insert into termination_data values ('T000001','TR000001','TT000001','员工离职','1');
insert into termination_data values ('T000002','TR000001','TT000001','员工离职0002','1');
insert into termination_data values ('T000003','TR000002','TT000002','员工离职0003','1');
insert into termination_data values ('T000004','TR000002','TT000002','员工离职0004','1');

	
insert into view_data values ('V000001','面试官','小伙子不错，值得培养','2016-11-14','1');

	
insert into employee_data values ('E000001','RSCC000001','程序员','LTD000001','张','文强','share@163.com','北京','学院路234号','18677778888','OT000001','RT000001','SG000001','6226 7788 9908 ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-14 12:23:23','JOB_APPLIED','1');
insert into employee_data values ('E000002','RSCC000001','程序员0002','LTD000001','王','大伟','2@qq.com','天津','学院路234号0002','13900000002','OT000001','RT000001','SG000001','6226 7788 9908 0002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-05 10:53:54','PASSED_WITH_PROFESSION','1');
insert into employee_data values ('E000003','RSCC000001','程序员0003','LTD000002','李','字章','3@qq.com','成都','学院路234号0003','13900000003','OT000001','RT000001','SG000001','6226 7788 9908 0003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-01 18:24:21','PASSED_BY_HR','1');
insert into employee_data values ('E000004','RSCC000001','程序员0004','LTD000002','贺','文强','4@qq.com','上海','学院路234号0004','13900000004','OT000001','RT000001','SG000001','6226 7788 9908 0004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-06 20:44:36','OFFER_APPROVED','1');
insert into employee_data values ('E000005','RSCC000002','程序员0005','LTD000003','张','大伟','5@qq.com','深圳','学院路234号0005','13900000005','OT000001','RT000001','SG000001','6226 7788 9908 0005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-14 17:11:19','OFFER_ACCEPTED','1');
insert into employee_data values ('E000006','RSCC000002','程序员0006','LTD000003','王','字章','6@qq.com','广州','学院路234号0006','13900000006','OT000001','RT000001','SG000001','6226 7788 9908 0006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-18 07:16:49','EMPLOYEE_BOARDED','1');
insert into employee_data values ('E000007','RSCC000002','程序员0007','LTD000004','李','文强','7@qq.com','西安','学院路234号0007','13900000007','OT000001','RT000001','SG000001','6226 7788 9908 0007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-28 21:52:15','TERMINATED','1');
insert into employee_data values ('E000008','RSCC000002','程序员0008','LTD000004','贺','大伟','8@qq.com','北京','学院路234号0008','13900000008','OT000001','RT000001','SG000001','6226 7788 9908 0008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-03 16:58:49','JOB_APPLIED','1');
insert into employee_data values ('E000009','RSCC000003','程序员0009','LTD000005','张','字章','9@qq.com','天津','学院路234号0009','13900000009','OT000002','RT000002','SG000002','6226 7788 9908 0009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-29 10:13:23','PASSED_WITH_PROFESSION','1');
insert into employee_data values ('E000010','RSCC000003','程序员0010','LTD000005','王','文强','10@qq.com','成都','学院路234号0010','13900000010','OT000002','RT000002','SG000002','6226 7788 9908 0010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-12-28 22:50:34','PASSED_BY_HR','1');
insert into employee_data values ('E000011','RSCC000003','程序员0011','LTD000006','李','大伟','11@qq.com','上海','学院路234号0011','13900000011','OT000002','RT000002','SG000002','6226 7788 9908 0011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-17 22:18:30','OFFER_APPROVED','1');
insert into employee_data values ('E000012','RSCC000003','程序员0012','LTD000006','贺','字章','12@qq.com','深圳','学院路234号0012','13900000012','OT000002','RT000002','SG000002','6226 7788 9908 0012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-17 10:57:13','OFFER_ACCEPTED','1');
insert into employee_data values ('E000013','RSCC000004','程序员0013','LTD000007','张','文强','13@qq.com','广州','学院路234号0013','13900000013','OT000002','RT000002','SG000002','6226 7788 9908 0013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-18 08:36:07','EMPLOYEE_BOARDED','1');
insert into employee_data values ('E000014','RSCC000004','程序员0014','LTD000007','王','大伟','14@qq.com','西安','学院路234号0014','13900000014','OT000002','RT000002','SG000002','6226 7788 9908 0014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-04 22:44:39','TERMINATED','1');
insert into employee_data values ('E000015','RSCC000004','程序员0015','LTD000008','李','字章','15@qq.com','北京','学院路234号0015','13900000015','OT000002','RT000002','SG000002','6226 7788 9908 0015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-08 03:58:47','JOB_APPLIED','1');
insert into employee_data values ('E000016','RSCC000004','程序员0016','LTD000008','贺','文强','16@qq.com','天津','学院路234号0016','13900000016','OT000002','RT000002','SG000002','6226 7788 9908 0016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-01-08 12:13:04','PASSED_WITH_PROFESSION','1');

	
insert into job_application_data values ('JA000001','2017-12-30','申请者本人','我觉得我符合职位要求，请给我一个机会为公司发展做出贡献，谢谢！','1');

	
insert into profession_interview_data values ('PI000001','技术部','2017-11-23','能力各方面表现不错，进入下一轮','1');

	
insert into hr_interview_data values ('HI000001','人力资源部','2017-10-12','软技能，责任感，气质不错啊','1');

	
insert into offer_approval_data values ('OA000001','总经理','2017-08-07','该员工发展潜力不错，','1');

	
insert into offer_acceptance_data values ('OA000001','申请者','2016-04-06','谢谢，我一个月内上班','1');

	
insert into employee_boarding_data values ('EB000001','人力资源部','2016-07-03','欢迎加入植物医生大家庭','1');

	
insert into instructor_data values ('I000001','高级讲师','张','文强','18699990000','instructor@gmail.com','RSCC000001','这是一个长长长长长长长长的介绍','2019-01-07 13:33:56','1');
insert into instructor_data values ('I000002','高级讲师0002','王','大伟','13900000002','2@qq.com','RSCC000003','这是一个长长长长长长长长的介绍0002','2019-01-04 03:38:10','1');

	
insert into company_training_data values ('CT000001','入职培训','RSCC000001','I000001','TCT000001','2016-09-10','3','2019-01-03 03:43:47','1');
insert into company_training_data values ('CT000002','入职培训0002','RSCC000002','I000001','TCT000001','2018-02-17','3','2019-01-04 15:00:15','1');
insert into company_training_data values ('CT000003','入职培训0003','RSCC000003','I000002','TCT000002','2017-04-22','3','2019-01-17 12:48:26','1');
insert into company_training_data values ('CT000004','入职培训0004','RSCC000004','I000002','TCT000002','2018-01-24','3','2019-01-05 04:34:33','1');

	
insert into scoring_data values ('S000001','王志文','98','这个题做的真不错啊','1');

	
insert into employee_company_training_data values ('ECT000001','E000001','CT000001',NULL,'SCORED','1');
insert into employee_company_training_data values ('ECT000002','E000001','CT000001',NULL,'SCORED0002','1');
insert into employee_company_training_data values ('ECT000003','E000002','CT000001',NULL,'SCORED0003','1');
insert into employee_company_training_data values ('ECT000004','E000002','CT000001',NULL,'SCORED0004','1');
insert into employee_company_training_data values ('ECT000005','E000003','CT000001',NULL,'SCORED0005','1');
insert into employee_company_training_data values ('ECT000006','E000003','CT000001',NULL,'SCORED0006','1');
insert into employee_company_training_data values ('ECT000007','E000004','CT000001',NULL,'SCORED0007','1');
insert into employee_company_training_data values ('ECT000008','E000004','CT000001',NULL,'SCORED0008','1');
insert into employee_company_training_data values ('ECT000009','E000005','CT000002',NULL,'SCORED0009','1');
insert into employee_company_training_data values ('ECT000010','E000005','CT000002',NULL,'SCORED0010','1');
insert into employee_company_training_data values ('ECT000011','E000006','CT000002',NULL,'SCORED0011','1');
insert into employee_company_training_data values ('ECT000012','E000006','CT000002',NULL,'SCORED0012','1');
insert into employee_company_training_data values ('ECT000013','E000007','CT000002',NULL,'SCORED0013','1');
insert into employee_company_training_data values ('ECT000014','E000007','CT000002',NULL,'SCORED0014','1');
insert into employee_company_training_data values ('ECT000015','E000008','CT000002',NULL,'SCORED0015','1');
insert into employee_company_training_data values ('ECT000016','E000008','CT000002',NULL,'SCORED0016','1');
insert into employee_company_training_data values ('ECT000017','E000009','CT000003',NULL,'SCORED0017','1');
insert into employee_company_training_data values ('ECT000018','E000009','CT000003',NULL,'SCORED0018','1');
insert into employee_company_training_data values ('ECT000019','E000010','CT000003',NULL,'SCORED0019','1');
insert into employee_company_training_data values ('ECT000020','E000010','CT000003',NULL,'SCORED0020','1');
insert into employee_company_training_data values ('ECT000021','E000011','CT000003',NULL,'SCORED0021','1');
insert into employee_company_training_data values ('ECT000022','E000011','CT000003',NULL,'SCORED0022','1');
insert into employee_company_training_data values ('ECT000023','E000012','CT000003',NULL,'SCORED0023','1');
insert into employee_company_training_data values ('ECT000024','E000012','CT000003',NULL,'SCORED0024','1');
insert into employee_company_training_data values ('ECT000025','E000013','CT000004',NULL,'SCORED0025','1');
insert into employee_company_training_data values ('ECT000026','E000013','CT000004',NULL,'SCORED0026','1');
insert into employee_company_training_data values ('ECT000027','E000014','CT000004',NULL,'SCORED0027','1');
insert into employee_company_training_data values ('ECT000028','E000014','CT000004',NULL,'SCORED0028','1');
insert into employee_company_training_data values ('ECT000029','E000015','CT000004',NULL,'SCORED0029','1');
insert into employee_company_training_data values ('ECT000030','E000015','CT000004',NULL,'SCORED0030','1');
insert into employee_company_training_data values ('ECT000031','E000016','CT000004',NULL,'SCORED0031','1');
insert into employee_company_training_data values ('ECT000032','E000016','CT000004',NULL,'SCORED0032','1');

	
insert into employee_skill_data values ('ES000001','E000001','ST000001','高手高手高高手','1');
insert into employee_skill_data values ('ES000002','E000001','ST000001','高手高手高高手0002','1');
insert into employee_skill_data values ('ES000003','E000002','ST000001','高手高手高高手0003','1');
insert into employee_skill_data values ('ES000004','E000002','ST000001','高手高手高高手0004','1');
insert into employee_skill_data values ('ES000005','E000003','ST000001','高手高手高高手0005','1');
insert into employee_skill_data values ('ES000006','E000003','ST000001','高手高手高高手0006','1');
insert into employee_skill_data values ('ES000007','E000004','ST000001','高手高手高高手0007','1');
insert into employee_skill_data values ('ES000008','E000004','ST000001','高手高手高高手0008','1');
insert into employee_skill_data values ('ES000009','E000005','ST000001','高手高手高高手0009','1');
insert into employee_skill_data values ('ES000010','E000005','ST000001','高手高手高高手0010','1');
insert into employee_skill_data values ('ES000011','E000006','ST000001','高手高手高高手0011','1');
insert into employee_skill_data values ('ES000012','E000006','ST000001','高手高手高高手0012','1');
insert into employee_skill_data values ('ES000013','E000007','ST000001','高手高手高高手0013','1');
insert into employee_skill_data values ('ES000014','E000007','ST000001','高手高手高高手0014','1');
insert into employee_skill_data values ('ES000015','E000008','ST000001','高手高手高高手0015','1');
insert into employee_skill_data values ('ES000016','E000008','ST000001','高手高手高高手0016','1');
insert into employee_skill_data values ('ES000017','E000009','ST000002','高手高手高高手0017','1');
insert into employee_skill_data values ('ES000018','E000009','ST000002','高手高手高高手0018','1');
insert into employee_skill_data values ('ES000019','E000010','ST000002','高手高手高高手0019','1');
insert into employee_skill_data values ('ES000020','E000010','ST000002','高手高手高高手0020','1');
insert into employee_skill_data values ('ES000021','E000011','ST000002','高手高手高高手0021','1');
insert into employee_skill_data values ('ES000022','E000011','ST000002','高手高手高高手0022','1');
insert into employee_skill_data values ('ES000023','E000012','ST000002','高手高手高高手0023','1');
insert into employee_skill_data values ('ES000024','E000012','ST000002','高手高手高高手0024','1');
insert into employee_skill_data values ('ES000025','E000013','ST000002','高手高手高高手0025','1');
insert into employee_skill_data values ('ES000026','E000013','ST000002','高手高手高高手0026','1');
insert into employee_skill_data values ('ES000027','E000014','ST000002','高手高手高高手0027','1');
insert into employee_skill_data values ('ES000028','E000014','ST000002','高手高手高高手0028','1');
insert into employee_skill_data values ('ES000029','E000015','ST000002','高手高手高高手0029','1');
insert into employee_skill_data values ('ES000030','E000015','ST000002','高手高手高高手0030','1');
insert into employee_skill_data values ('ES000031','E000016','ST000002','高手高手高高手0031','1');
insert into employee_skill_data values ('ES000032','E000016','ST000002','高手高手高高手0032','1');

	
insert into employee_performance_data values ('EP000001','E000001','绩效大大的不错','1');
insert into employee_performance_data values ('EP000002','E000001','绩效大大的不错0002','1');
insert into employee_performance_data values ('EP000003','E000002','绩效大大的不错0003','1');
insert into employee_performance_data values ('EP000004','E000002','绩效大大的不错0004','1');
insert into employee_performance_data values ('EP000005','E000003','绩效大大的不错0005','1');
insert into employee_performance_data values ('EP000006','E000003','绩效大大的不错0006','1');
insert into employee_performance_data values ('EP000007','E000004','绩效大大的不错0007','1');
insert into employee_performance_data values ('EP000008','E000004','绩效大大的不错0008','1');
insert into employee_performance_data values ('EP000009','E000005','绩效大大的不错0009','1');
insert into employee_performance_data values ('EP000010','E000005','绩效大大的不错0010','1');
insert into employee_performance_data values ('EP000011','E000006','绩效大大的不错0011','1');
insert into employee_performance_data values ('EP000012','E000006','绩效大大的不错0012','1');
insert into employee_performance_data values ('EP000013','E000007','绩效大大的不错0013','1');
insert into employee_performance_data values ('EP000014','E000007','绩效大大的不错0014','1');
insert into employee_performance_data values ('EP000015','E000008','绩效大大的不错0015','1');
insert into employee_performance_data values ('EP000016','E000008','绩效大大的不错0016','1');
insert into employee_performance_data values ('EP000017','E000009','绩效大大的不错0017','1');
insert into employee_performance_data values ('EP000018','E000009','绩效大大的不错0018','1');
insert into employee_performance_data values ('EP000019','E000010','绩效大大的不错0019','1');
insert into employee_performance_data values ('EP000020','E000010','绩效大大的不错0020','1');
insert into employee_performance_data values ('EP000021','E000011','绩效大大的不错0021','1');
insert into employee_performance_data values ('EP000022','E000011','绩效大大的不错0022','1');
insert into employee_performance_data values ('EP000023','E000012','绩效大大的不错0023','1');
insert into employee_performance_data values ('EP000024','E000012','绩效大大的不错0024','1');
insert into employee_performance_data values ('EP000025','E000013','绩效大大的不错0025','1');
insert into employee_performance_data values ('EP000026','E000013','绩效大大的不错0026','1');
insert into employee_performance_data values ('EP000027','E000014','绩效大大的不错0027','1');
insert into employee_performance_data values ('EP000028','E000014','绩效大大的不错0028','1');
insert into employee_performance_data values ('EP000029','E000015','绩效大大的不错0029','1');
insert into employee_performance_data values ('EP000030','E000015','绩效大大的不错0030','1');
insert into employee_performance_data values ('EP000031','E000016','绩效大大的不错0031','1');
insert into employee_performance_data values ('EP000032','E000016','绩效大大的不错0032','1');

	
insert into employee_work_experience_data values ('EWE000001','E000001','2016-09-30','2017-03-06','丝芙兰化妆品公司','在此期间取得非常好的绩效，赢得了客户的信赖','1');
insert into employee_work_experience_data values ('EWE000002','E000001','2017-02-14','2016-07-03','丝芙兰化妆品公司0002','在此期间取得非常好的绩效，赢得了客户的信赖0002','1');
insert into employee_work_experience_data values ('EWE000003','E000002','2018-08-01','2016-04-19','丝芙兰化妆品公司0003','在此期间取得非常好的绩效，赢得了客户的信赖0003','1');
insert into employee_work_experience_data values ('EWE000004','E000002','2018-08-19','2017-08-16','丝芙兰化妆品公司0004','在此期间取得非常好的绩效，赢得了客户的信赖0004','1');
insert into employee_work_experience_data values ('EWE000005','E000003','2018-12-09','2017-07-28','丝芙兰化妆品公司0005','在此期间取得非常好的绩效，赢得了客户的信赖0005','1');
insert into employee_work_experience_data values ('EWE000006','E000003','2017-05-27','2018-04-28','丝芙兰化妆品公司0006','在此期间取得非常好的绩效，赢得了客户的信赖0006','1');
insert into employee_work_experience_data values ('EWE000007','E000004','2018-07-30','2018-08-22','丝芙兰化妆品公司0007','在此期间取得非常好的绩效，赢得了客户的信赖0007','1');
insert into employee_work_experience_data values ('EWE000008','E000004','2018-04-12','2017-08-18','丝芙兰化妆品公司0008','在此期间取得非常好的绩效，赢得了客户的信赖0008','1');
insert into employee_work_experience_data values ('EWE000009','E000005','2016-01-27','2017-08-15','丝芙兰化妆品公司0009','在此期间取得非常好的绩效，赢得了客户的信赖0009','1');
insert into employee_work_experience_data values ('EWE000010','E000005','2018-04-26','2016-03-04','丝芙兰化妆品公司0010','在此期间取得非常好的绩效，赢得了客户的信赖0010','1');
insert into employee_work_experience_data values ('EWE000011','E000006','2018-07-20','2018-04-02','丝芙兰化妆品公司0011','在此期间取得非常好的绩效，赢得了客户的信赖0011','1');
insert into employee_work_experience_data values ('EWE000012','E000006','2018-01-11','2017-06-26','丝芙兰化妆品公司0012','在此期间取得非常好的绩效，赢得了客户的信赖0012','1');
insert into employee_work_experience_data values ('EWE000013','E000007','2017-05-22','2017-09-18','丝芙兰化妆品公司0013','在此期间取得非常好的绩效，赢得了客户的信赖0013','1');
insert into employee_work_experience_data values ('EWE000014','E000007','2018-04-09','2016-05-24','丝芙兰化妆品公司0014','在此期间取得非常好的绩效，赢得了客户的信赖0014','1');
insert into employee_work_experience_data values ('EWE000015','E000008','2017-05-08','2017-05-17','丝芙兰化妆品公司0015','在此期间取得非常好的绩效，赢得了客户的信赖0015','1');
insert into employee_work_experience_data values ('EWE000016','E000008','2017-08-22','2017-10-06','丝芙兰化妆品公司0016','在此期间取得非常好的绩效，赢得了客户的信赖0016','1');
insert into employee_work_experience_data values ('EWE000017','E000009','2016-06-23','2018-07-26','丝芙兰化妆品公司0017','在此期间取得非常好的绩效，赢得了客户的信赖0017','1');
insert into employee_work_experience_data values ('EWE000018','E000009','2017-12-02','2016-03-19','丝芙兰化妆品公司0018','在此期间取得非常好的绩效，赢得了客户的信赖0018','1');
insert into employee_work_experience_data values ('EWE000019','E000010','2017-04-13','2016-12-31','丝芙兰化妆品公司0019','在此期间取得非常好的绩效，赢得了客户的信赖0019','1');
insert into employee_work_experience_data values ('EWE000020','E000010','2017-11-28','2017-09-19','丝芙兰化妆品公司0020','在此期间取得非常好的绩效，赢得了客户的信赖0020','1');
insert into employee_work_experience_data values ('EWE000021','E000011','2018-01-04','2016-03-23','丝芙兰化妆品公司0021','在此期间取得非常好的绩效，赢得了客户的信赖0021','1');
insert into employee_work_experience_data values ('EWE000022','E000011','2016-03-03','2018-03-11','丝芙兰化妆品公司0022','在此期间取得非常好的绩效，赢得了客户的信赖0022','1');
insert into employee_work_experience_data values ('EWE000023','E000012','2016-06-19','2018-12-21','丝芙兰化妆品公司0023','在此期间取得非常好的绩效，赢得了客户的信赖0023','1');
insert into employee_work_experience_data values ('EWE000024','E000012','2018-06-26','2017-05-31','丝芙兰化妆品公司0024','在此期间取得非常好的绩效，赢得了客户的信赖0024','1');
insert into employee_work_experience_data values ('EWE000025','E000013','2016-07-28','2016-12-22','丝芙兰化妆品公司0025','在此期间取得非常好的绩效，赢得了客户的信赖0025','1');
insert into employee_work_experience_data values ('EWE000026','E000013','2016-04-24','2017-10-16','丝芙兰化妆品公司0026','在此期间取得非常好的绩效，赢得了客户的信赖0026','1');
insert into employee_work_experience_data values ('EWE000027','E000014','2017-12-17','2017-03-07','丝芙兰化妆品公司0027','在此期间取得非常好的绩效，赢得了客户的信赖0027','1');
insert into employee_work_experience_data values ('EWE000028','E000014','2018-05-12','2016-08-26','丝芙兰化妆品公司0028','在此期间取得非常好的绩效，赢得了客户的信赖0028','1');
insert into employee_work_experience_data values ('EWE000029','E000015','2018-12-20','2019-01-06','丝芙兰化妆品公司0029','在此期间取得非常好的绩效，赢得了客户的信赖0029','1');
insert into employee_work_experience_data values ('EWE000030','E000015','2016-04-15','2016-10-19','丝芙兰化妆品公司0030','在此期间取得非常好的绩效，赢得了客户的信赖0030','1');
insert into employee_work_experience_data values ('EWE000031','E000016','2017-01-27','2016-08-03','丝芙兰化妆品公司0031','在此期间取得非常好的绩效，赢得了客户的信赖0031','1');
insert into employee_work_experience_data values ('EWE000032','E000016','2018-10-12','2017-04-05','丝芙兰化妆品公司0032','在此期间取得非常好的绩效，赢得了客户的信赖0032','1');

	
insert into employee_leave_data values ('EL000001','E000001','LT000001','8','请年假，出去耍！！！！','1');
insert into employee_leave_data values ('EL000002','E000001','LT000001','8','请年假，出去耍！！！！0002','1');
insert into employee_leave_data values ('EL000003','E000002','LT000001','7','请年假，出去耍！！！！0003','1');
insert into employee_leave_data values ('EL000004','E000002','LT000001','8','请年假，出去耍！！！！0004','1');
insert into employee_leave_data values ('EL000005','E000003','LT000001','6','请年假，出去耍！！！！0005','1');
insert into employee_leave_data values ('EL000006','E000003','LT000001','7','请年假，出去耍！！！！0006','1');
insert into employee_leave_data values ('EL000007','E000004','LT000001','8','请年假，出去耍！！！！0007','1');
insert into employee_leave_data values ('EL000008','E000004','LT000001','7','请年假，出去耍！！！！0008','1');
insert into employee_leave_data values ('EL000009','E000005','LT000001','8','请年假，出去耍！！！！0009','1');
insert into employee_leave_data values ('EL000010','E000005','LT000001','6','请年假，出去耍！！！！0010','1');
insert into employee_leave_data values ('EL000011','E000006','LT000001','8','请年假，出去耍！！！！0011','1');
insert into employee_leave_data values ('EL000012','E000006','LT000001','6','请年假，出去耍！！！！0012','1');
insert into employee_leave_data values ('EL000013','E000007','LT000001','6','请年假，出去耍！！！！0013','1');
insert into employee_leave_data values ('EL000014','E000007','LT000001','8','请年假，出去耍！！！！0014','1');
insert into employee_leave_data values ('EL000015','E000008','LT000001','8','请年假，出去耍！！！！0015','1');
insert into employee_leave_data values ('EL000016','E000008','LT000001','8','请年假，出去耍！！！！0016','1');
insert into employee_leave_data values ('EL000017','E000009','LT000002','6','请年假，出去耍！！！！0017','1');
insert into employee_leave_data values ('EL000018','E000009','LT000002','7','请年假，出去耍！！！！0018','1');
insert into employee_leave_data values ('EL000019','E000010','LT000002','8','请年假，出去耍！！！！0019','1');
insert into employee_leave_data values ('EL000020','E000010','LT000002','6','请年假，出去耍！！！！0020','1');
insert into employee_leave_data values ('EL000021','E000011','LT000002','7','请年假，出去耍！！！！0021','1');
insert into employee_leave_data values ('EL000022','E000011','LT000002','6','请年假，出去耍！！！！0022','1');
insert into employee_leave_data values ('EL000023','E000012','LT000002','7','请年假，出去耍！！！！0023','1');
insert into employee_leave_data values ('EL000024','E000012','LT000002','8','请年假，出去耍！！！！0024','1');
insert into employee_leave_data values ('EL000025','E000013','LT000002','8','请年假，出去耍！！！！0025','1');
insert into employee_leave_data values ('EL000026','E000013','LT000002','6','请年假，出去耍！！！！0026','1');
insert into employee_leave_data values ('EL000027','E000014','LT000002','7','请年假，出去耍！！！！0027','1');
insert into employee_leave_data values ('EL000028','E000014','LT000002','7','请年假，出去耍！！！！0028','1');
insert into employee_leave_data values ('EL000029','E000015','LT000002','7','请年假，出去耍！！！！0029','1');
insert into employee_leave_data values ('EL000030','E000015','LT000002','7','请年假，出去耍！！！！0030','1');
insert into employee_leave_data values ('EL000031','E000016','LT000002','6','请年假，出去耍！！！！0031','1');
insert into employee_leave_data values ('EL000032','E000016','LT000002','6','请年假，出去耍！！！！0032','1');

	
insert into employee_interview_data values ('EI000001','E000001','IT000001','结果不错，面试通过！','1');
insert into employee_interview_data values ('EI000002','E000001','IT000001','结果不错，面试通过！0002','1');
insert into employee_interview_data values ('EI000003','E000002','IT000001','结果不错，面试通过！0003','1');
insert into employee_interview_data values ('EI000004','E000002','IT000001','结果不错，面试通过！0004','1');
insert into employee_interview_data values ('EI000005','E000003','IT000001','结果不错，面试通过！0005','1');
insert into employee_interview_data values ('EI000006','E000003','IT000001','结果不错，面试通过！0006','1');
insert into employee_interview_data values ('EI000007','E000004','IT000001','结果不错，面试通过！0007','1');
insert into employee_interview_data values ('EI000008','E000004','IT000001','结果不错，面试通过！0008','1');
insert into employee_interview_data values ('EI000009','E000005','IT000001','结果不错，面试通过！0009','1');
insert into employee_interview_data values ('EI000010','E000005','IT000001','结果不错，面试通过！0010','1');
insert into employee_interview_data values ('EI000011','E000006','IT000001','结果不错，面试通过！0011','1');
insert into employee_interview_data values ('EI000012','E000006','IT000001','结果不错，面试通过！0012','1');
insert into employee_interview_data values ('EI000013','E000007','IT000001','结果不错，面试通过！0013','1');
insert into employee_interview_data values ('EI000014','E000007','IT000001','结果不错，面试通过！0014','1');
insert into employee_interview_data values ('EI000015','E000008','IT000001','结果不错，面试通过！0015','1');
insert into employee_interview_data values ('EI000016','E000008','IT000001','结果不错，面试通过！0016','1');
insert into employee_interview_data values ('EI000017','E000009','IT000002','结果不错，面试通过！0017','1');
insert into employee_interview_data values ('EI000018','E000009','IT000002','结果不错，面试通过！0018','1');
insert into employee_interview_data values ('EI000019','E000010','IT000002','结果不错，面试通过！0019','1');
insert into employee_interview_data values ('EI000020','E000010','IT000002','结果不错，面试通过！0020','1');
insert into employee_interview_data values ('EI000021','E000011','IT000002','结果不错，面试通过！0021','1');
insert into employee_interview_data values ('EI000022','E000011','IT000002','结果不错，面试通过！0022','1');
insert into employee_interview_data values ('EI000023','E000012','IT000002','结果不错，面试通过！0023','1');
insert into employee_interview_data values ('EI000024','E000012','IT000002','结果不错，面试通过！0024','1');
insert into employee_interview_data values ('EI000025','E000013','IT000002','结果不错，面试通过！0025','1');
insert into employee_interview_data values ('EI000026','E000013','IT000002','结果不错，面试通过！0026','1');
insert into employee_interview_data values ('EI000027','E000014','IT000002','结果不错，面试通过！0027','1');
insert into employee_interview_data values ('EI000028','E000014','IT000002','结果不错，面试通过！0028','1');
insert into employee_interview_data values ('EI000029','E000015','IT000002','结果不错，面试通过！0029','1');
insert into employee_interview_data values ('EI000030','E000015','IT000002','结果不错，面试通过！0030','1');
insert into employee_interview_data values ('EI000031','E000016','IT000002','结果不错，面试通过！0031','1');
insert into employee_interview_data values ('EI000032','E000016','IT000002','结果不错，面试通过！0032','1');

	
insert into employee_attendance_data values ('EA000001','E000001','2018-10-07','2016-06-14','7','今天状态不错啊','1');
insert into employee_attendance_data values ('EA000002','E000001','2017-02-04','2016-02-24','7','今天状态不错啊0002','1');
insert into employee_attendance_data values ('EA000003','E000002','2018-03-15','2016-12-25','8','今天状态不错啊0003','1');
insert into employee_attendance_data values ('EA000004','E000002','2016-06-17','2017-12-06','7','今天状态不错啊0004','1');
insert into employee_attendance_data values ('EA000005','E000003','2017-05-01','2018-10-21','7','今天状态不错啊0005','1');
insert into employee_attendance_data values ('EA000006','E000003','2016-09-10','2016-06-28','8','今天状态不错啊0006','1');
insert into employee_attendance_data values ('EA000007','E000004','2018-12-04','2018-05-26','6','今天状态不错啊0007','1');
insert into employee_attendance_data values ('EA000008','E000004','2018-09-10','2018-01-15','6','今天状态不错啊0008','1');
insert into employee_attendance_data values ('EA000009','E000005','2018-08-20','2017-12-09','8','今天状态不错啊0009','1');
insert into employee_attendance_data values ('EA000010','E000005','2019-01-07','2018-02-02','8','今天状态不错啊0010','1');
insert into employee_attendance_data values ('EA000011','E000006','2016-10-26','2016-03-13','8','今天状态不错啊0011','1');
insert into employee_attendance_data values ('EA000012','E000006','2016-09-28','2018-10-17','7','今天状态不错啊0012','1');
insert into employee_attendance_data values ('EA000013','E000007','2018-08-19','2016-12-03','7','今天状态不错啊0013','1');
insert into employee_attendance_data values ('EA000014','E000007','2018-07-23','2018-01-04','8','今天状态不错啊0014','1');
insert into employee_attendance_data values ('EA000015','E000008','2016-05-15','2016-08-16','7','今天状态不错啊0015','1');
insert into employee_attendance_data values ('EA000016','E000008','2017-02-17','2018-06-17','7','今天状态不错啊0016','1');
insert into employee_attendance_data values ('EA000017','E000009','2017-08-18','2017-10-31','7','今天状态不错啊0017','1');
insert into employee_attendance_data values ('EA000018','E000009','2016-12-02','2016-10-28','8','今天状态不错啊0018','1');
insert into employee_attendance_data values ('EA000019','E000010','2016-05-05','2018-12-04','6','今天状态不错啊0019','1');
insert into employee_attendance_data values ('EA000020','E000010','2018-11-08','2016-06-25','8','今天状态不错啊0020','1');
insert into employee_attendance_data values ('EA000021','E000011','2017-07-23','2017-12-04','8','今天状态不错啊0021','1');
insert into employee_attendance_data values ('EA000022','E000011','2016-08-20','2017-09-21','7','今天状态不错啊0022','1');
insert into employee_attendance_data values ('EA000023','E000012','2016-08-08','2016-07-04','7','今天状态不错啊0023','1');
insert into employee_attendance_data values ('EA000024','E000012','2016-12-17','2016-05-11','8','今天状态不错啊0024','1');
insert into employee_attendance_data values ('EA000025','E000013','2017-09-19','2017-08-10','6','今天状态不错啊0025','1');
insert into employee_attendance_data values ('EA000026','E000013','2016-03-03','2018-10-18','8','今天状态不错啊0026','1');
insert into employee_attendance_data values ('EA000027','E000014','2017-12-28','2017-01-20','7','今天状态不错啊0027','1');
insert into employee_attendance_data values ('EA000028','E000014','2017-01-04','2017-06-09','8','今天状态不错啊0028','1');
insert into employee_attendance_data values ('EA000029','E000015','2016-06-09','2019-01-12','7','今天状态不错啊0029','1');
insert into employee_attendance_data values ('EA000030','E000015','2018-08-03','2018-04-22','8','今天状态不错啊0030','1');
insert into employee_attendance_data values ('EA000031','E000016','2018-12-05','2016-08-07','7','今天状态不错啊0031','1');
insert into employee_attendance_data values ('EA000032','E000016','2018-07-28','2016-05-08','6','今天状态不错啊0032','1');

	
insert into employee_qualifier_data values ('EQ000001','E000001','2018-01-22','认证药剂师','高级','考试成绩当年第一名','1');
insert into employee_qualifier_data values ('EQ000002','E000001','2018-11-15','认证架构师','中级','考试成绩当年第一名0002','1');
insert into employee_qualifier_data values ('EQ000003','E000002','2016-09-26','认证会计师','初级','考试成绩当年第一名0003','1');
insert into employee_qualifier_data values ('EQ000004','E000002','2018-11-13','认证经济师','高级','考试成绩当年第一名0004','1');
insert into employee_qualifier_data values ('EQ000005','E000003','2017-05-13','OCP','中级','考试成绩当年第一名0005','1');
insert into employee_qualifier_data values ('EQ000006','E000003','2016-04-10','CCNA','初级','考试成绩当年第一名0006','1');
insert into employee_qualifier_data values ('EQ000007','E000004','2016-11-25','CCNP','高级','考试成绩当年第一名0007','1');
insert into employee_qualifier_data values ('EQ000008','E000004','2018-02-19','认证药剂师','中级','考试成绩当年第一名0008','1');
insert into employee_qualifier_data values ('EQ000009','E000005','2016-10-07','认证架构师','初级','考试成绩当年第一名0009','1');
insert into employee_qualifier_data values ('EQ000010','E000005','2017-09-18','认证会计师','高级','考试成绩当年第一名0010','1');
insert into employee_qualifier_data values ('EQ000011','E000006','2017-08-05','认证经济师','中级','考试成绩当年第一名0011','1');
insert into employee_qualifier_data values ('EQ000012','E000006','2018-10-08','OCP','初级','考试成绩当年第一名0012','1');
insert into employee_qualifier_data values ('EQ000013','E000007','2017-04-29','CCNA','高级','考试成绩当年第一名0013','1');
insert into employee_qualifier_data values ('EQ000014','E000007','2016-02-17','CCNP','中级','考试成绩当年第一名0014','1');
insert into employee_qualifier_data values ('EQ000015','E000008','2016-06-18','认证药剂师','初级','考试成绩当年第一名0015','1');
insert into employee_qualifier_data values ('EQ000016','E000008','2016-07-11','认证架构师','高级','考试成绩当年第一名0016','1');
insert into employee_qualifier_data values ('EQ000017','E000009','2018-12-16','认证会计师','中级','考试成绩当年第一名0017','1');
insert into employee_qualifier_data values ('EQ000018','E000009','2016-11-27','认证经济师','初级','考试成绩当年第一名0018','1');
insert into employee_qualifier_data values ('EQ000019','E000010','2016-03-06','OCP','高级','考试成绩当年第一名0019','1');
insert into employee_qualifier_data values ('EQ000020','E000010','2016-11-12','CCNA','中级','考试成绩当年第一名0020','1');
insert into employee_qualifier_data values ('EQ000021','E000011','2016-12-31','CCNP','初级','考试成绩当年第一名0021','1');
insert into employee_qualifier_data values ('EQ000022','E000011','2018-06-21','认证药剂师','高级','考试成绩当年第一名0022','1');
insert into employee_qualifier_data values ('EQ000023','E000012','2017-01-24','认证架构师','中级','考试成绩当年第一名0023','1');
insert into employee_qualifier_data values ('EQ000024','E000012','2018-02-08','认证会计师','初级','考试成绩当年第一名0024','1');
insert into employee_qualifier_data values ('EQ000025','E000013','2016-07-20','认证经济师','高级','考试成绩当年第一名0025','1');
insert into employee_qualifier_data values ('EQ000026','E000013','2017-04-23','OCP','中级','考试成绩当年第一名0026','1');
insert into employee_qualifier_data values ('EQ000027','E000014','2018-06-16','CCNA','初级','考试成绩当年第一名0027','1');
insert into employee_qualifier_data values ('EQ000028','E000014','2016-08-11','CCNP','高级','考试成绩当年第一名0028','1');
insert into employee_qualifier_data values ('EQ000029','E000015','2018-02-23','认证药剂师','中级','考试成绩当年第一名0029','1');
insert into employee_qualifier_data values ('EQ000030','E000015','2018-09-13','认证架构师','初级','考试成绩当年第一名0030','1');
insert into employee_qualifier_data values ('EQ000031','E000016','2018-09-22','认证会计师','高级','考试成绩当年第一名0031','1');
insert into employee_qualifier_data values ('EQ000032','E000016','2017-08-11','认证经济师','中级','考试成绩当年第一名0032','1');

	
insert into employee_education_data values ('EE000001','E000001','2017-05-15','小学','考试成绩当年第一名','1');
insert into employee_education_data values ('EE000002','E000001','2017-11-26','初中','考试成绩当年第一名0002','1');
insert into employee_education_data values ('EE000003','E000002','2016-05-01','高中','考试成绩当年第一名0003','1');
insert into employee_education_data values ('EE000004','E000002','2017-03-06','大学','考试成绩当年第一名0004','1');
insert into employee_education_data values ('EE000005','E000003','2018-01-18','硕士','考试成绩当年第一名0005','1');
insert into employee_education_data values ('EE000006','E000003','2017-06-10','博士','考试成绩当年第一名0006','1');
insert into employee_education_data values ('EE000007','E000004','2018-05-19','职业教育','考试成绩当年第一名0007','1');
insert into employee_education_data values ('EE000008','E000004','2018-06-22','小学','考试成绩当年第一名0008','1');
insert into employee_education_data values ('EE000009','E000005','2018-02-24','初中','考试成绩当年第一名0009','1');
insert into employee_education_data values ('EE000010','E000005','2016-06-26','高中','考试成绩当年第一名0010','1');
insert into employee_education_data values ('EE000011','E000006','2017-12-11','大学','考试成绩当年第一名0011','1');
insert into employee_education_data values ('EE000012','E000006','2017-04-19','硕士','考试成绩当年第一名0012','1');
insert into employee_education_data values ('EE000013','E000007','2018-11-27','博士','考试成绩当年第一名0013','1');
insert into employee_education_data values ('EE000014','E000007','2016-04-08','职业教育','考试成绩当年第一名0014','1');
insert into employee_education_data values ('EE000015','E000008','2016-02-14','小学','考试成绩当年第一名0015','1');
insert into employee_education_data values ('EE000016','E000008','2017-07-27','初中','考试成绩当年第一名0016','1');
insert into employee_education_data values ('EE000017','E000009','2018-09-23','高中','考试成绩当年第一名0017','1');
insert into employee_education_data values ('EE000018','E000009','2016-09-04','大学','考试成绩当年第一名0018','1');
insert into employee_education_data values ('EE000019','E000010','2016-11-01','硕士','考试成绩当年第一名0019','1');
insert into employee_education_data values ('EE000020','E000010','2016-02-02','博士','考试成绩当年第一名0020','1');
insert into employee_education_data values ('EE000021','E000011','2017-03-12','职业教育','考试成绩当年第一名0021','1');
insert into employee_education_data values ('EE000022','E000011','2019-01-01','小学','考试成绩当年第一名0022','1');
insert into employee_education_data values ('EE000023','E000012','2018-09-23','初中','考试成绩当年第一名0023','1');
insert into employee_education_data values ('EE000024','E000012','2016-08-02','高中','考试成绩当年第一名0024','1');
insert into employee_education_data values ('EE000025','E000013','2018-12-01','大学','考试成绩当年第一名0025','1');
insert into employee_education_data values ('EE000026','E000013','2018-02-21','硕士','考试成绩当年第一名0026','1');
insert into employee_education_data values ('EE000027','E000014','2017-10-22','博士','考试成绩当年第一名0027','1');
insert into employee_education_data values ('EE000028','E000014','2018-08-25','职业教育','考试成绩当年第一名0028','1');
insert into employee_education_data values ('EE000029','E000015','2018-04-28','小学','考试成绩当年第一名0029','1');
insert into employee_education_data values ('EE000030','E000015','2017-03-04','初中','考试成绩当年第一名0030','1');
insert into employee_education_data values ('EE000031','E000016','2016-04-30','高中','考试成绩当年第一名0031','1');
insert into employee_education_data values ('EE000032','E000016','2018-09-19','大学','考试成绩当年第一名0032','1');

	
insert into employee_award_data values ('EA000001','E000001','2018-03-20','明星员工','考试成绩当年第一名','1');
insert into employee_award_data values ('EA000002','E000001','2018-06-18','销售之星','考试成绩当年第一名0002','1');
insert into employee_award_data values ('EA000003','E000002','2016-03-28','技术之星','考试成绩当年第一名0003','1');
insert into employee_award_data values ('EA000004','E000002','2018-12-01','管理之星','考试成绩当年第一名0004','1');
insert into employee_award_data values ('EA000005','E000003','2017-09-12','终身成就奖','考试成绩当年第一名0005','1');
insert into employee_award_data values ('EA000006','E000003','2017-03-04','明星员工','考试成绩当年第一名0006','1');
insert into employee_award_data values ('EA000007','E000004','2016-08-22','销售之星','考试成绩当年第一名0007','1');
insert into employee_award_data values ('EA000008','E000004','2017-12-23','技术之星','考试成绩当年第一名0008','1');
insert into employee_award_data values ('EA000009','E000005','2018-05-27','管理之星','考试成绩当年第一名0009','1');
insert into employee_award_data values ('EA000010','E000005','2017-01-24','终身成就奖','考试成绩当年第一名0010','1');
insert into employee_award_data values ('EA000011','E000006','2017-02-09','明星员工','考试成绩当年第一名0011','1');
insert into employee_award_data values ('EA000012','E000006','2016-12-30','销售之星','考试成绩当年第一名0012','1');
insert into employee_award_data values ('EA000013','E000007','2018-12-23','技术之星','考试成绩当年第一名0013','1');
insert into employee_award_data values ('EA000014','E000007','2017-03-20','管理之星','考试成绩当年第一名0014','1');
insert into employee_award_data values ('EA000015','E000008','2018-02-24','终身成就奖','考试成绩当年第一名0015','1');
insert into employee_award_data values ('EA000016','E000008','2016-04-21','明星员工','考试成绩当年第一名0016','1');
insert into employee_award_data values ('EA000017','E000009','2017-08-26','销售之星','考试成绩当年第一名0017','1');
insert into employee_award_data values ('EA000018','E000009','2018-03-21','技术之星','考试成绩当年第一名0018','1');
insert into employee_award_data values ('EA000019','E000010','2016-01-19','管理之星','考试成绩当年第一名0019','1');
insert into employee_award_data values ('EA000020','E000010','2018-01-01','终身成就奖','考试成绩当年第一名0020','1');
insert into employee_award_data values ('EA000021','E000011','2017-03-06','明星员工','考试成绩当年第一名0021','1');
insert into employee_award_data values ('EA000022','E000011','2017-01-28','销售之星','考试成绩当年第一名0022','1');
insert into employee_award_data values ('EA000023','E000012','2017-03-09','技术之星','考试成绩当年第一名0023','1');
insert into employee_award_data values ('EA000024','E000012','2017-04-28','管理之星','考试成绩当年第一名0024','1');
insert into employee_award_data values ('EA000025','E000013','2018-09-05','终身成就奖','考试成绩当年第一名0025','1');
insert into employee_award_data values ('EA000026','E000013','2018-12-04','明星员工','考试成绩当年第一名0026','1');
insert into employee_award_data values ('EA000027','E000014','2018-03-07','销售之星','考试成绩当年第一名0027','1');
insert into employee_award_data values ('EA000028','E000014','2017-02-15','技术之星','考试成绩当年第一名0028','1');
insert into employee_award_data values ('EA000029','E000015','2018-12-03','管理之星','考试成绩当年第一名0029','1');
insert into employee_award_data values ('EA000030','E000015','2018-04-05','终身成就奖','考试成绩当年第一名0030','1');
insert into employee_award_data values ('EA000031','E000016','2018-09-20','明星员工','考试成绩当年第一名0031','1');
insert into employee_award_data values ('EA000032','E000016','2018-05-09','销售之星','考试成绩当年第一名0032','1');

	
insert into employee_salary_sheet_data values ('ESS000001','E000001','SG000001','2675.85','980.85','758.27','603.02','1001.62','975.16','6.80',NULL,'PAID_OFF','1');
insert into employee_salary_sheet_data values ('ESS000002','E000001','SG000001','2694.39','789.74','766.85','638.56','807.16','1145.92','8.25',NULL,'PAID_OFF0002','1');
insert into employee_salary_sheet_data values ('ESS000003','E000001','SG000001','2699.93','912.83','715.35','669.15','1075.96','1090.97','6.69',NULL,'PAID_OFF0003','1');
insert into employee_salary_sheet_data values ('ESS000004','E000001','SG000001','2235.74','726.33','986.30','607.81','800.82','1169.33','8.20',NULL,'PAID_OFF0004','1');
insert into employee_salary_sheet_data values ('ESS000005','E000002','SG000001','2983.94','829.29','768.90','696.52','888.33','1107.60','6.78',NULL,'PAID_OFF0005','1');
insert into employee_salary_sheet_data values ('ESS000006','E000002','SG000001','2552.64','833.59','885.57','685.83','819.02','935.76','8.14',NULL,'PAID_OFF0006','1');
insert into employee_salary_sheet_data values ('ESS000007','E000002','SG000001','2928.77','817.54','844.28','567.59','1024.09','937.79','8.00',NULL,'PAID_OFF0007','1');
insert into employee_salary_sheet_data values ('ESS000008','E000002','SG000001','2329.80','922.21','721.18','567.67','961.01','1115.83','7.35',NULL,'PAID_OFF0008','1');
insert into employee_salary_sheet_data values ('ESS000009','E000003','SG000001','2116.34','870.41','764.88','579.69','855.63','1131.09','7.50',NULL,'PAID_OFF0009','1');
insert into employee_salary_sheet_data values ('ESS000010','E000003','SG000001','2269.52','701.08','747.48','572.84','1027.11','1132.58','8.67',NULL,'PAID_OFF0010','1');
insert into employee_salary_sheet_data values ('ESS000011','E000003','SG000001','2900.92','716.37','849.88','633.80','849.37','1200.57','8.64',NULL,'PAID_OFF0011','1');
insert into employee_salary_sheet_data values ('ESS000012','E000003','SG000001','2850.55','861.39','918.80','713.74','888.04','1010.58','7.56',NULL,'PAID_OFF0012','1');
insert into employee_salary_sheet_data values ('ESS000013','E000004','SG000001','2860.17','705.94','721.42','775.00','795.39','1198.17','8.83',NULL,'PAID_OFF0013','1');
insert into employee_salary_sheet_data values ('ESS000014','E000004','SG000001','2191.32','759.40','757.19','684.53','1034.81','875.77','7.35',NULL,'PAID_OFF0014','1');
insert into employee_salary_sheet_data values ('ESS000015','E000004','SG000001','2574.26','981.45','791.90','651.69','1026.75','1055.39','6.95',NULL,'PAID_OFF0015','1');
insert into employee_salary_sheet_data values ('ESS000016','E000004','SG000001','2221.23','826.93','971.16','591.15','989.39','953.35','7.18',NULL,'PAID_OFF0016','1');
insert into employee_salary_sheet_data values ('ESS000017','E000005','SG000001','2419.11','863.45','753.56','673.78','845.48','947.69','8.79',NULL,'PAID_OFF0017','1');
insert into employee_salary_sheet_data values ('ESS000018','E000005','SG000001','2972.23','988.50','790.41','651.57','787.22','931.22','8.78',NULL,'PAID_OFF0018','1');
insert into employee_salary_sheet_data values ('ESS000019','E000005','SG000001','2141.87','799.46','908.31','649.35','1034.85','991.42','6.30',NULL,'PAID_OFF0019','1');
insert into employee_salary_sheet_data values ('ESS000020','E000005','SG000001','2156.55','817.92','761.35','735.01','1030.45','983.19','8.23',NULL,'PAID_OFF0020','1');
insert into employee_salary_sheet_data values ('ESS000021','E000006','SG000001','2884.61','868.81','846.27','743.00','829.26','1015.86','8.01',NULL,'PAID_OFF0021','1');
insert into employee_salary_sheet_data values ('ESS000022','E000006','SG000001','2155.71','995.60','756.22','780.99','945.35','892.37','7.49',NULL,'PAID_OFF0022','1');
insert into employee_salary_sheet_data values ('ESS000023','E000006','SG000001','2378.11','749.99','842.37','589.35','1045.60','1163.00','7.19',NULL,'PAID_OFF0023','1');
insert into employee_salary_sheet_data values ('ESS000024','E000006','SG000001','2145.01','768.99','726.98','675.37','946.67','1038.22','7.01',NULL,'PAID_OFF0024','1');
insert into employee_salary_sheet_data values ('ESS000025','E000007','SG000001','2538.55','982.85','980.73','704.44','904.39','862.99','7.84',NULL,'PAID_OFF0025','1');
insert into employee_salary_sheet_data values ('ESS000026','E000007','SG000001','2700.17','895.83','733.54','790.60','833.95','1137.77','6.46',NULL,'PAID_OFF0026','1');
insert into employee_salary_sheet_data values ('ESS000027','E000007','SG000001','2693.24','897.18','816.85','733.36','1010.97','954.45','7.40',NULL,'PAID_OFF0027','1');
insert into employee_salary_sheet_data values ('ESS000028','E000007','SG000001','2170.63','990.97','804.76','572.03','905.34','1068.92','7.95',NULL,'PAID_OFF0028','1');
insert into employee_salary_sheet_data values ('ESS000029','E000008','SG000001','2180.01','906.36','735.88','733.28','874.67','1004.58','6.74',NULL,'PAID_OFF0029','1');
insert into employee_salary_sheet_data values ('ESS000030','E000008','SG000001','2459.61','879.38','927.03','623.55','1032.33','864.90','7.47',NULL,'PAID_OFF0030','1');
insert into employee_salary_sheet_data values ('ESS000031','E000008','SG000001','2423.46','747.10','886.11','677.78','1060.15','1163.92','7.73',NULL,'PAID_OFF0031','1');
insert into employee_salary_sheet_data values ('ESS000032','E000008','SG000001','2483.34','801.29','776.37','556.01','934.49','1032.52','7.36',NULL,'PAID_OFF0032','1');
insert into employee_salary_sheet_data values ('ESS000033','E000009','SG000002','2472.26','783.04','748.06','741.35','1042.00','1197.94','6.23',NULL,'PAID_OFF0033','1');
insert into employee_salary_sheet_data values ('ESS000034','E000009','SG000002','2906.98','743.62','718.01','555.37','947.86','991.69','6.86',NULL,'PAID_OFF0034','1');
insert into employee_salary_sheet_data values ('ESS000035','E000009','SG000002','2595.86','720.15','911.87','636.02','976.77','1041.44','6.87',NULL,'PAID_OFF0035','1');
insert into employee_salary_sheet_data values ('ESS000036','E000009','SG000002','2997.48','806.95','739.99','631.95','813.80','1072.92','7.05',NULL,'PAID_OFF0036','1');
insert into employee_salary_sheet_data values ('ESS000037','E000010','SG000002','2502.66','825.21','960.72','668.18','903.92','1115.84','7.97',NULL,'PAID_OFF0037','1');
insert into employee_salary_sheet_data values ('ESS000038','E000010','SG000002','2825.68','723.46','789.05','744.08','1094.24','1006.10','7.64',NULL,'PAID_OFF0038','1');
insert into employee_salary_sheet_data values ('ESS000039','E000010','SG000002','2660.92','907.11','718.93','780.12','995.42','911.31','7.41',NULL,'PAID_OFF0039','1');
insert into employee_salary_sheet_data values ('ESS000040','E000010','SG000002','2383.64','842.53','957.45','560.49','938.78','990.96','6.30',NULL,'PAID_OFF0040','1');
insert into employee_salary_sheet_data values ('ESS000041','E000011','SG000002','2234.12','955.90','894.32','763.81','829.80','1137.17','7.17',NULL,'PAID_OFF0041','1');
insert into employee_salary_sheet_data values ('ESS000042','E000011','SG000002','2802.21','704.68','774.01','733.69','1024.87','1200.20','6.89',NULL,'PAID_OFF0042','1');
insert into employee_salary_sheet_data values ('ESS000043','E000011','SG000002','2979.92','819.93','795.27','702.34','776.09','861.76','7.59',NULL,'PAID_OFF0043','1');
insert into employee_salary_sheet_data values ('ESS000044','E000011','SG000002','2419.75','954.77','974.78','617.51','894.54','1002.90','7.35',NULL,'PAID_OFF0044','1');
insert into employee_salary_sheet_data values ('ESS000045','E000012','SG000002','2803.47','900.45','709.66','573.12','1088.71','1120.53','6.27',NULL,'PAID_OFF0045','1');
insert into employee_salary_sheet_data values ('ESS000046','E000012','SG000002','2423.21','753.83','933.05','769.04','881.40','1027.95','8.61',NULL,'PAID_OFF0046','1');
insert into employee_salary_sheet_data values ('ESS000047','E000012','SG000002','2488.52','811.06','805.47','623.66','958.63','1109.15','8.46',NULL,'PAID_OFF0047','1');
insert into employee_salary_sheet_data values ('ESS000048','E000012','SG000002','2483.93','958.40','784.09','766.33','1011.12','1030.67','7.87',NULL,'PAID_OFF0048','1');
insert into employee_salary_sheet_data values ('ESS000049','E000013','SG000002','2189.49','772.91','828.46','624.62','873.31','1098.76','7.22',NULL,'PAID_OFF0049','1');
insert into employee_salary_sheet_data values ('ESS000050','E000013','SG000002','2317.90','843.26','868.65','791.59','965.10','926.48','6.53',NULL,'PAID_OFF0050','1');
insert into employee_salary_sheet_data values ('ESS000051','E000013','SG000002','2933.74','820.30','788.59','761.95','810.79','1068.65','6.27',NULL,'PAID_OFF0051','1');
insert into employee_salary_sheet_data values ('ESS000052','E000013','SG000002','2304.53','870.13','785.36','661.50','874.39','977.13','8.06',NULL,'PAID_OFF0052','1');
insert into employee_salary_sheet_data values ('ESS000053','E000014','SG000002','2332.19','885.75','813.07','755.10','859.11','1028.64','7.78',NULL,'PAID_OFF0053','1');
insert into employee_salary_sheet_data values ('ESS000054','E000014','SG000002','2488.93','892.57','990.00','592.36','784.68','961.96','6.71',NULL,'PAID_OFF0054','1');
insert into employee_salary_sheet_data values ('ESS000055','E000014','SG000002','2796.77','715.74','909.55','740.77','1051.37','1146.95','6.57',NULL,'PAID_OFF0055','1');
insert into employee_salary_sheet_data values ('ESS000056','E000014','SG000002','2130.13','855.49','720.54','567.20','871.08','900.10','6.22',NULL,'PAID_OFF0056','1');
insert into employee_salary_sheet_data values ('ESS000057','E000015','SG000002','2632.47','867.28','891.81','672.82','1078.89','898.95','7.90',NULL,'PAID_OFF0057','1');
insert into employee_salary_sheet_data values ('ESS000058','E000015','SG000002','2243.46','886.58','793.62','586.74','932.90','873.11','8.31',NULL,'PAID_OFF0058','1');
insert into employee_salary_sheet_data values ('ESS000059','E000015','SG000002','2471.50','824.14','928.82','656.40','903.01','1161.21','7.85',NULL,'PAID_OFF0059','1');
insert into employee_salary_sheet_data values ('ESS000060','E000015','SG000002','2746.16','798.32','988.03','619.08','826.20','920.54','7.14',NULL,'PAID_OFF0060','1');
insert into employee_salary_sheet_data values ('ESS000061','E000016','SG000002','2401.70','998.88','846.83','624.11','1083.30','1130.96','7.08',NULL,'PAID_OFF0061','1');
insert into employee_salary_sheet_data values ('ESS000062','E000016','SG000002','2370.01','866.28','963.18','604.98','964.72','1026.97','7.07',NULL,'PAID_OFF0062','1');
insert into employee_salary_sheet_data values ('ESS000063','E000016','SG000002','2564.90','796.67','947.64','615.75','1031.70','972.56','7.91',NULL,'PAID_OFF0063','1');
insert into employee_salary_sheet_data values ('ESS000064','E000016','SG000002','2943.76','825.09','801.62','732.82','843.97','944.89','8.30',NULL,'PAID_OFF0064','1');

	
insert into paying_off_data values ('PO000001','出纳','E000001','2016-03-08','5132.82','1');
insert into paying_off_data values ('PO000002','出纳0002','E000001','2016-06-10','4699.14','1');
insert into paying_off_data values ('PO000003','出纳0003','E000002','2016-12-08','4561.66','1');
insert into paying_off_data values ('PO000004','出纳0004','E000002','2016-11-13','4014.70','1');
insert into paying_off_data values ('PO000005','出纳0005','E000003','2017-10-31','5199.67','1');
insert into paying_off_data values ('PO000006','出纳0006','E000003','2018-03-23','3938.01','1');
insert into paying_off_data values ('PO000007','出纳0007','E000004','2016-05-09','5021.72','1');
insert into paying_off_data values ('PO000008','出纳0008','E000004','2017-12-20','4854.70','1');
insert into paying_off_data values ('PO000009','出纳0009','E000005','2018-04-21','4751.49','1');
insert into paying_off_data values ('PO000010','出纳0010','E000005','2018-09-24','4032.03','1');
insert into paying_off_data values ('PO000011','出纳0011','E000006','2016-08-08','4251.76','1');
insert into paying_off_data values ('PO000012','出纳0012','E000006','2017-03-16','3857.56','1');
insert into paying_off_data values ('PO000013','出纳0013','E000007','2017-12-02','4803.30','1');
insert into paying_off_data values ('PO000014','出纳0014','E000007','2018-04-12','4860.63','1');
insert into paying_off_data values ('PO000015','出纳0015','E000008','2019-01-12','3772.79','1');
insert into paying_off_data values ('PO000016','出纳0016','E000008','2017-08-14','3854.28','1');
insert into paying_off_data values ('PO000017','出纳0017','E000009','2017-09-20','4636.13','1');
insert into paying_off_data values ('PO000018','出纳0018','E000009','2017-01-01','4708.76','1');
insert into paying_off_data values ('PO000019','出纳0019','E000010','2016-08-03','4379.84','1');
insert into paying_off_data values ('PO000020','出纳0020','E000010','2018-09-06','4069.57','1');
insert into paying_off_data values ('PO000021','出纳0021','E000011','2016-08-30','4861.43','1');
insert into paying_off_data values ('PO000022','出纳0022','E000011','2017-06-25','4449.16','1');
insert into paying_off_data values ('PO000023','出纳0023','E000012','2017-08-03','5067.43','1');
insert into paying_off_data values ('PO000024','出纳0024','E000012','2016-11-18','5015.95','1');
insert into paying_off_data values ('PO000025','出纳0025','E000013','2016-02-13','4305.87','1');
insert into paying_off_data values ('PO000026','出纳0026','E000013','2017-01-23','3762.06','1');
insert into paying_off_data values ('PO000027','出纳0027','E000014','2017-01-23','4820.35','1');
insert into paying_off_data values ('PO000028','出纳0028','E000014','2016-12-31','4822.23','1');
insert into paying_off_data values ('PO000029','出纳0029','E000015','2018-02-17','4398.65','1');
insert into paying_off_data values ('PO000030','出纳0030','E000015','2017-10-08','4151.90','1');
insert into paying_off_data values ('PO000031','出纳0031','E000016','2018-01-01','4300.65','1');
insert into paying_off_data values ('PO000032','出纳0032','E000016','2017-10-29','3910.90','1');

	
insert into user_domain_data values ('UD000001','用户区域','1');

	
insert into user_white_list_data values ('UWL000001','clariones','tester;ios-spokesperson','UD000001','1');
insert into user_white_list_data values ('UWL000002','13808188512','tester;ios-spokesperson0002','UD000001','1');

	
insert into sec_user_data values ('SU000001','login','13900000001','','C183EC89F92A462CF45B95504792EC4625E847C90536EEFE512D1C9DB8602E95','0','2019-01-01 09:53:28','2019-01-05 20:00:08','UD000001',NULL,'BLOCKED','1');
insert into sec_user_data values ('SU000002','login0002','13900000002','suddy_chang@163.com','AC2F95628244C6975EB2C36942EA879ED93D93F5895EF3157733E4629FA86B92','9999999','2018-12-30 22:28:34','2019-01-01 00:33:32','UD000001',NULL,'BLOCKED0002','1');

	
insert into sec_user_blocking_data values ('SUB000001','currentUser()','2018-12-31 19:06:20','这个用户多次发送违反社区的帖子，现在把他给屏蔽了','1');

	
insert into user_app_data values ('UA000001','审车平台','SU000001','users',1,'MXWR','CarInspectionPlatform','CIP000001','/link/to/app','1');
insert into user_app_data values ('UA000002','账户管理','SU000001','bank',1,'MXWR','UserDomain','UD000001','/link/to/app0002','1');
insert into user_app_data values ('UA000003','接车公司','SU000001','wechat',1,'MXWR','CarReceivingServiceCompany','CRSC000001','/link/to/app0003','1');
insert into user_app_data values ('UA000004','审车公司','SU000002','bar-chart',1,'MXWR','CarInspectionServiceCompany','CISC000001','/link/to/app0004','1');
insert into user_app_data values ('UA000005','维修公司','SU000002','user',1,'MXWR','CarRepairingServiceCompany','CRSC000001','/link/to/app0005','1');
insert into user_app_data values ('UA000006','顾客','SU000002','users',1,'MXWR','CustomerInfo','CI000001','/link/to/app0006','1');

	
insert into list_access_data values ('LA000001','列表','levelOneCategoryList',1,1,1,1,1,'UA000001','1');
insert into list_access_data values ('LA000002','列表0002','levelOneCategoryList0002',1,1,1,1,1,'UA000001','1');
insert into list_access_data values ('LA000003','列表0003','levelOneCategoryList0003',1,1,1,1,1,'UA000002','1');
insert into list_access_data values ('LA000004','列表0004','levelOneCategoryList0004',1,1,1,1,1,'UA000003','1');
insert into list_access_data values ('LA000005','列表0005','levelOneCategoryList0005',1,1,1,1,1,'UA000004','1');
insert into list_access_data values ('LA000006','列表0006','levelOneCategoryList0006',1,1,1,1,1,'UA000004','1');
insert into list_access_data values ('LA000007','列表0007','levelOneCategoryList0007',1,1,1,1,1,'UA000005','1');
insert into list_access_data values ('LA000008','列表0008','levelOneCategoryList0008',1,1,1,1,1,'UA000006','1');

	
insert into object_access_data values ('OA000001','控制访问列表1','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000001','1');
insert into object_access_data values ('OA000002','控制访问列表10002','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000001','1');
insert into object_access_data values ('OA000003','控制访问列表10003','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000002','1');
insert into object_access_data values ('OA000004','控制访问列表10004','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000003','1');
insert into object_access_data values ('OA000005','控制访问列表10005','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000004','1');
insert into object_access_data values ('OA000006','控制访问列表10006','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000004','1');
insert into object_access_data values ('OA000007','控制访问列表10007','FranchiseeStoreCountryCenter','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','catalogList','UA000005','1');
insert into object_access_data values ('OA000008','控制访问列表10008','AccountSet','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','levelOneCategoryList','UA000006','1');

	
insert into login_history_data values ('LH000001','2019-01-12 21:31:04','192.168.1.1','登陆成功','SU000001','1');
insert into login_history_data values ('LH000002','2019-01-10 04:31:59','192.168.1.2','登陆成功0002','SU000001','1');
insert into login_history_data values ('LH000003','2019-01-03 02:31:55','192.168.1.1','登陆成功0003','SU000002','1');
insert into login_history_data values ('LH000004','2019-01-10 05:10:46','192.168.1.2','登陆成功0004','SU000002','1');

	
insert into generic_form_data values ('GF000001','登记输入单','姓名就是你身份证上的名字','1');

	
insert into form_message_data values ('FM000001','字段组合错误','GF000001','success','1');
insert into form_message_data values ('FM000002','字段组合错误0002','GF000001','info','1');

	
insert into form_field_message_data values ('FFM000001','输入错误','name','GF000001','success','1');
insert into form_field_message_data values ('FFM000002','输入错误0002','name0002','GF000001','info','1');

	
insert into form_field_data values ('FF000001','姓名','name','name','text','GF000001','姓名就是你身份证上的名字','李一一','姓名就是你身份证上的名字','基础信息','maybe any value','a value expression',true,true,0,'','','1');
insert into form_field_data values ('FF000002','年龄','age','name0002','longtext','GF000001','姓名就是你身份证上的名字0002','李一一0002','姓名就是你身份证上的名字0002','扩展信息','maybe any value0002','a value expression0002',false,false,0,'','','1');
insert into form_field_data values ('FF000003','出生地','birth_place','name0003','date','GF000001','姓名就是你身份证上的名字0003','李一一0003','姓名就是你身份证上的名字0003','基础信息','maybe any value0003','a value expression0003',true,true,0,'','','1');
insert into form_field_data values ('FF000004','国籍','country','name0004','date_time','GF000001','姓名就是你身份证上的名字0004','李一一0004','姓名就是你身份证上的名字0004','扩展信息','maybe any value0004','a value expression0004',false,false,0,'男,女','男,女','1');

	
insert into form_action_data values ('FA000001','功能','name','save','default','genericFormManager/name/name0002/name0003/','GF000001','1');
insert into form_action_data values ('FA000002','功能0002','name0002','update','warning','genericFormManager/name/name0002/name0003/0002','GF000001','1');

/*
Mysql innodb's foreign key has index automatically

*/

create unique index idx_retail_store_country_center_version on retail_store_country_center_data(id, version);

create unique index idx_catalog_version on catalog_data(id, version);

alter table catalog_data add constraint catalog4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_level_one_category_version on level_one_category_data(id, version);

alter table level_one_category_data add constraint level_one_category4catalog_fk
	foreign key(catalog) references catalog_data(id) on delete cascade on update cascade;
create unique index idx_level_two_category_version on level_two_category_data(id, version);

alter table level_two_category_data add constraint level_two_category4parent_category_fk
	foreign key(parent_category) references level_one_category_data(id) on delete cascade on update cascade;
create unique index idx_level_three_category_version on level_three_category_data(id, version);

alter table level_three_category_data add constraint level_three_category4parent_category_fk
	foreign key(parent_category) references level_two_category_data(id) on delete cascade on update cascade;
create unique index idx_product_version on product_data(id, version);

alter table product_data add constraint product4parent_category_fk
	foreign key(parent_category) references level_three_category_data(id) on delete cascade on update cascade;
create unique index idx_sku_version on sku_data(id, version);

alter table sku_data add constraint sku4product_fk
	foreign key(product) references product_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_province_center_version on retail_store_province_center_data(id, version);

alter table retail_store_province_center_data add constraint retail_store_province_center4country_fk
	foreign key(country) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_province_center_department_version on province_center_department_data(id, version);

alter table province_center_department_data add constraint province_center_department4province_center_fk
	foreign key(province_center) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_province_center_employee_version on province_center_employee_data(id, version);

alter table province_center_employee_data add constraint province_center_employee4department_fk
	foreign key(department) references province_center_department_data(id) on delete cascade on update cascade;
alter table province_center_employee_data add constraint province_center_employee4province_center_fk
	foreign key(province_center) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_city_service_center_version on retail_store_city_service_center_data(id, version);

alter table retail_store_city_service_center_data add constraint retail_store_city_service_center4belongs_to_fk
	foreign key(belongs_to) references retail_store_province_center_data(id) on delete cascade on update cascade;
create unique index idx_city_partner_version on city_partner_data(id, version);

alter table city_partner_data add constraint city_partner4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_version on potential_customer_data(id, version);

alter table potential_customer_data add constraint potential_customer4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
alter table potential_customer_data add constraint potential_customer4city_partner_fk
	foreign key(city_partner) references city_partner_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_contact_person_version on potential_customer_contact_person_data(id, version);

alter table potential_customer_contact_person_data add constraint potential_customer_contact_person4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
create unique index idx_potential_customer_contact_version on potential_customer_contact_data(id, version);

alter table potential_customer_contact_data add constraint potential_customer_contact4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
alter table potential_customer_contact_data add constraint potential_customer_contact4city_partner_fk
	foreign key(city_partner) references city_partner_data(id) on delete cascade on update cascade;
alter table potential_customer_contact_data add constraint potential_customer_contact4contact_to_fk
	foreign key(contact_to) references potential_customer_contact_person_data(id) on delete cascade on update cascade;
create unique index idx_city_event_version on city_event_data(id, version);

alter table city_event_data add constraint city_event4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
create unique index idx_event_attendance_version on event_attendance_data(id, version);

alter table event_attendance_data add constraint event_attendance4potential_customer_fk
	foreign key(potential_customer) references potential_customer_data(id) on delete cascade on update cascade;
alter table event_attendance_data add constraint event_attendance4city_event_fk
	foreign key(city_event) references city_event_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_version on retail_store_data(id, version);

alter table retail_store_data add constraint retail_store4retail_store_country_center_fk
	foreign key(retail_store_country_center) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4city_service_center_fk
	foreign key(city_service_center) references retail_store_city_service_center_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4creation_fk
	foreign key(creation) references retail_store_creation_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4investment_invitation_fk
	foreign key(investment_invitation) references retail_store_investment_invitation_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4franchising_fk
	foreign key(franchising) references retail_store_franchising_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4decoration_fk
	foreign key(decoration) references retail_store_decoration_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4opening_fk
	foreign key(opening) references retail_store_opening_data(id) on delete cascade on update cascade;
alter table retail_store_data add constraint retail_store4closing_fk
	foreign key(closing) references retail_store_closing_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_creation_version on retail_store_creation_data(id, version);

create unique index idx_retail_store_investment_invitation_version on retail_store_investment_invitation_data(id, version);

create unique index idx_retail_store_franchising_version on retail_store_franchising_data(id, version);

create unique index idx_retail_store_decoration_version on retail_store_decoration_data(id, version);

create unique index idx_retail_store_opening_version on retail_store_opening_data(id, version);

create unique index idx_retail_store_closing_version on retail_store_closing_data(id, version);

create unique index idx_retail_store_member_version on retail_store_member_data(id, version);

alter table retail_store_member_data add constraint retail_store_member4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_version on consumer_order_data(id, version);

alter table consumer_order_data add constraint consumer_order4consumer_fk
	foreign key(consumer) references retail_store_member_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4confirmation_fk
	foreign key(confirmation) references supply_order_confirmation_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4approval_fk
	foreign key(approval) references supply_order_approval_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4processing_fk
	foreign key(processing) references supply_order_processing_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4shipment_fk
	foreign key(shipment) references supply_order_shipment_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4delivery_fk
	foreign key(delivery) references supply_order_delivery_data(id) on delete cascade on update cascade;
alter table consumer_order_data add constraint consumer_order4store_fk
	foreign key(store) references retail_store_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_confirmation_version on consumer_order_confirmation_data(id, version);

create unique index idx_consumer_order_approval_version on consumer_order_approval_data(id, version);

create unique index idx_consumer_order_processing_version on consumer_order_processing_data(id, version);

create unique index idx_consumer_order_shipment_version on consumer_order_shipment_data(id, version);

create unique index idx_consumer_order_delivery_version on consumer_order_delivery_data(id, version);

create unique index idx_consumer_order_line_item_version on consumer_order_line_item_data(id, version);

alter table consumer_order_line_item_data add constraint consumer_order_line_item4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_shipping_group_version on consumer_order_shipping_group_data(id, version);

alter table consumer_order_shipping_group_data add constraint consumer_order_shipping_group4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_payment_group_version on consumer_order_payment_group_data(id, version);

alter table consumer_order_payment_group_data add constraint consumer_order_payment_group4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_consumer_order_price_adjustment_version on consumer_order_price_adjustment_data(id, version);

alter table consumer_order_price_adjustment_data add constraint consumer_order_price_adjustment4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_coupon_version on retail_store_member_coupon_data(id, version);

alter table retail_store_member_coupon_data add constraint retail_store_member_coupon4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_wishlist_version on member_wishlist_data(id, version);

alter table member_wishlist_data add constraint member_wishlist4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_reward_point_version on member_reward_point_data(id, version);

alter table member_reward_point_data add constraint member_reward_point4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_reward_point_redemption_version on member_reward_point_redemption_data(id, version);

alter table member_reward_point_redemption_data add constraint member_reward_point_redemption4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_member_wishlist_product_version on member_wishlist_product_data(id, version);

alter table member_wishlist_product_data add constraint member_wishlist_product4owner_fk
	foreign key(owner) references member_wishlist_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_address_version on retail_store_member_address_data(id, version);

alter table retail_store_member_address_data add constraint retail_store_member_address4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_gift_card_version on retail_store_member_gift_card_data(id, version);

alter table retail_store_member_gift_card_data add constraint retail_store_member_gift_card4owner_fk
	foreign key(owner) references retail_store_member_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_member_gift_card_consume_record_version on retail_store_member_gift_card_consume_record_data(id, version);

alter table retail_store_member_gift_card_consume_record_data add constraint retail_store_member_gift_card_consume_record4owner_fk
	foreign key(owner) references retail_store_member_gift_card_data(id) on delete cascade on update cascade;
alter table retail_store_member_gift_card_consume_record_data add constraint retail_store_member_gift_card_consume_record4biz_order_fk
	foreign key(biz_order) references consumer_order_data(id) on delete cascade on update cascade;
create unique index idx_goods_supplier_version on goods_supplier_data(id, version);

alter table goods_supplier_data add constraint goods_supplier4belong_to_fk
	foreign key(belong_to) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_supplier_product_version on supplier_product_data(id, version);

alter table supplier_product_data add constraint supplier_product4supplier_fk
	foreign key(supplier) references goods_supplier_data(id) on delete cascade on update cascade;
create unique index idx_product_supply_duration_version on product_supply_duration_data(id, version);

alter table product_supply_duration_data add constraint product_supply_duration4product_fk
	foreign key(product) references supplier_product_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_version on supply_order_data(id, version);

alter table supply_order_data add constraint supply_order4buyer_fk
	foreign key(buyer) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4seller_fk
	foreign key(seller) references goods_supplier_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4confirmation_fk
	foreign key(confirmation) references supply_order_confirmation_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4approval_fk
	foreign key(approval) references supply_order_approval_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4processing_fk
	foreign key(processing) references supply_order_processing_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4picking_fk
	foreign key(picking) references supply_order_picking_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4shipment_fk
	foreign key(shipment) references supply_order_shipment_data(id) on delete cascade on update cascade;
alter table supply_order_data add constraint supply_order4delivery_fk
	foreign key(delivery) references supply_order_delivery_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_confirmation_version on supply_order_confirmation_data(id, version);

create unique index idx_supply_order_approval_version on supply_order_approval_data(id, version);

create unique index idx_supply_order_processing_version on supply_order_processing_data(id, version);

create unique index idx_supply_order_picking_version on supply_order_picking_data(id, version);

create unique index idx_supply_order_shipment_version on supply_order_shipment_data(id, version);

create unique index idx_supply_order_delivery_version on supply_order_delivery_data(id, version);

create unique index idx_supply_order_line_item_version on supply_order_line_item_data(id, version);

alter table supply_order_line_item_data add constraint supply_order_line_item4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_shipping_group_version on supply_order_shipping_group_data(id, version);

alter table supply_order_shipping_group_data add constraint supply_order_shipping_group4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_supply_order_payment_group_version on supply_order_payment_group_data(id, version);

alter table supply_order_payment_group_data add constraint supply_order_payment_group4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_version on retail_store_order_data(id, version);

alter table retail_store_order_data add constraint retail_store_order4buyer_fk
	foreign key(buyer) references retail_store_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4seller_fk
	foreign key(seller) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4confirmation_fk
	foreign key(confirmation) references retail_store_order_confirmation_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4approval_fk
	foreign key(approval) references retail_store_order_approval_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4processing_fk
	foreign key(processing) references retail_store_order_processing_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4picking_fk
	foreign key(picking) references retail_store_order_picking_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4shipment_fk
	foreign key(shipment) references retail_store_order_shipment_data(id) on delete cascade on update cascade;
alter table retail_store_order_data add constraint retail_store_order4delivery_fk
	foreign key(delivery) references retail_store_order_delivery_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_confirmation_version on retail_store_order_confirmation_data(id, version);

create unique index idx_retail_store_order_approval_version on retail_store_order_approval_data(id, version);

create unique index idx_retail_store_order_processing_version on retail_store_order_processing_data(id, version);

create unique index idx_retail_store_order_picking_version on retail_store_order_picking_data(id, version);

create unique index idx_retail_store_order_shipment_version on retail_store_order_shipment_data(id, version);

create unique index idx_retail_store_order_delivery_version on retail_store_order_delivery_data(id, version);

create unique index idx_retail_store_order_line_item_version on retail_store_order_line_item_data(id, version);

alter table retail_store_order_line_item_data add constraint retail_store_order_line_item4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_shipping_group_version on retail_store_order_shipping_group_data(id, version);

alter table retail_store_order_shipping_group_data add constraint retail_store_order_shipping_group4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_retail_store_order_payment_group_version on retail_store_order_payment_group_data(id, version);

alter table retail_store_order_payment_group_data add constraint retail_store_order_payment_group4biz_order_fk
	foreign key(biz_order) references retail_store_order_data(id) on delete cascade on update cascade;
create unique index idx_warehouse_version on warehouse_data(id, version);

alter table warehouse_data add constraint warehouse4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_storage_space_version on storage_space_data(id, version);

alter table storage_space_data add constraint storage_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_smart_pallet_version on smart_pallet_data(id, version);

alter table smart_pallet_data add constraint smart_pallet4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_goods_shelf_version on goods_shelf_data(id, version);

alter table goods_shelf_data add constraint goods_shelf4storage_space_fk
	foreign key(storage_space) references storage_space_data(id) on delete cascade on update cascade;
alter table goods_shelf_data add constraint goods_shelf4supplier_space_fk
	foreign key(supplier_space) references supplier_space_data(id) on delete cascade on update cascade;
alter table goods_shelf_data add constraint goods_shelf4damage_space_fk
	foreign key(damage_space) references damage_space_data(id) on delete cascade on update cascade;
create unique index idx_goods_shelf_stock_count_version on goods_shelf_stock_count_data(id, version);

alter table goods_shelf_stock_count_data add constraint goods_shelf_stock_count4shelf_fk
	foreign key(shelf) references goods_shelf_data(id) on delete cascade on update cascade;
create unique index idx_stock_count_issue_track_version on stock_count_issue_track_data(id, version);

alter table stock_count_issue_track_data add constraint stock_count_issue_track4stock_count_fk
	foreign key(stock_count) references goods_shelf_stock_count_data(id) on delete cascade on update cascade;
create unique index idx_goods_allocation_version on goods_allocation_data(id, version);

alter table goods_allocation_data add constraint goods_allocation4goods_shelf_fk
	foreign key(goods_shelf) references goods_shelf_data(id) on delete cascade on update cascade;
create unique index idx_goods_version on goods_data(id, version);

alter table goods_data add constraint goods4sku_fk
	foreign key(sku) references sku_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4receiving_space_fk
	foreign key(receiving_space) references receiving_space_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4goods_allocation_fk
	foreign key(goods_allocation) references goods_allocation_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4smart_pallet_fk
	foreign key(smart_pallet) references smart_pallet_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4shipping_space_fk
	foreign key(shipping_space) references shipping_space_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4transport_task_fk
	foreign key(transport_task) references transport_task_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4retail_store_fk
	foreign key(retail_store) references retail_store_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4biz_order_fk
	foreign key(biz_order) references supply_order_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4retail_store_order_fk
	foreign key(retail_store_order) references retail_store_order_data(id) on delete cascade on update cascade;
alter table goods_data add constraint goods4packaging_fk
	foreign key(packaging) references goods_packaging_data(id) on delete cascade on update cascade;
create unique index idx_goods_packaging_version on goods_packaging_data(id, version);

create unique index idx_goods_movement_version on goods_movement_data(id, version);

alter table goods_movement_data add constraint goods_movement4goods_fk
	foreign key(goods) references goods_data(id) on delete cascade on update cascade;
create unique index idx_supplier_space_version on supplier_space_data(id, version);

alter table supplier_space_data add constraint supplier_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_receiving_space_version on receiving_space_data(id, version);

alter table receiving_space_data add constraint receiving_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_shipping_space_version on shipping_space_data(id, version);

alter table shipping_space_data add constraint shipping_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_damage_space_version on damage_space_data(id, version);

alter table damage_space_data add constraint damage_space4warehouse_fk
	foreign key(warehouse) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_warehouse_asset_version on warehouse_asset_data(id, version);

alter table warehouse_asset_data add constraint warehouse_asset4owner_fk
	foreign key(owner) references warehouse_data(id) on delete cascade on update cascade;
create unique index idx_transport_fleet_version on transport_fleet_data(id, version);

alter table transport_fleet_data add constraint transport_fleet4owner_fk
	foreign key(owner) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_transport_truck_version on transport_truck_data(id, version);

alter table transport_truck_data add constraint transport_truck4owner_fk
	foreign key(owner) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_truck_driver_version on truck_driver_data(id, version);

alter table truck_driver_data add constraint truck_driver4belongs_to_fk
	foreign key(belongs_to) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_transport_task_version on transport_task_data(id, version);

alter table transport_task_data add constraint transport_task4end_fk
	foreign key(end) references retail_store_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4driver_fk
	foreign key(driver) references truck_driver_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4truck_fk
	foreign key(truck) references transport_truck_data(id) on delete cascade on update cascade;
alter table transport_task_data add constraint transport_task4belongs_to_fk
	foreign key(belongs_to) references transport_fleet_data(id) on delete cascade on update cascade;
create unique index idx_transport_task_track_version on transport_task_track_data(id, version);

alter table transport_task_track_data add constraint transport_task_track4movement_fk
	foreign key(movement) references transport_task_data(id) on delete cascade on update cascade;
create unique index idx_account_set_version on account_set_data(id, version);

alter table account_set_data add constraint account_set4country_center_fk
	foreign key(country_center) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table account_set_data add constraint account_set4retail_store_fk
	foreign key(retail_store) references retail_store_data(id) on delete cascade on update cascade;
alter table account_set_data add constraint account_set4goods_supplier_fk
	foreign key(goods_supplier) references goods_supplier_data(id) on delete cascade on update cascade;
create unique index idx_accounting_subject_version on accounting_subject_data(id, version);

alter table accounting_subject_data add constraint accounting_subject4account_set_fk
	foreign key(account_set) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_period_version on accounting_period_data(id, version);

alter table accounting_period_data add constraint accounting_period4account_set_fk
	foreign key(account_set) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_type_version on accounting_document_type_data(id, version);

alter table accounting_document_type_data add constraint accounting_document_type4accounting_period_fk
	foreign key(accounting_period) references account_set_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_version on accounting_document_data(id, version);

alter table accounting_document_data add constraint accounting_document4accounting_period_fk
	foreign key(accounting_period) references accounting_period_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4document_type_fk
	foreign key(document_type) references accounting_document_type_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4creation_fk
	foreign key(creation) references accounting_document_creation_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4confirmation_fk
	foreign key(confirmation) references accounting_document_confirmation_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4auditing_fk
	foreign key(auditing) references accounting_document_auditing_data(id) on delete cascade on update cascade;
alter table accounting_document_data add constraint accounting_document4posting_fk
	foreign key(posting) references accounting_document_posting_data(id) on delete cascade on update cascade;
create unique index idx_accounting_document_creation_version on accounting_document_creation_data(id, version);

create unique index idx_accounting_document_confirmation_version on accounting_document_confirmation_data(id, version);

create unique index idx_accounting_document_auditing_version on accounting_document_auditing_data(id, version);

create unique index idx_accounting_document_posting_version on accounting_document_posting_data(id, version);

create unique index idx_original_voucher_version on original_voucher_data(id, version);

alter table original_voucher_data add constraint original_voucher4belongs_to_fk
	foreign key(belongs_to) references accounting_document_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4creation_fk
	foreign key(creation) references original_voucher_creation_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4confirmation_fk
	foreign key(confirmation) references original_voucher_confirmation_data(id) on delete cascade on update cascade;
alter table original_voucher_data add constraint original_voucher4auditing_fk
	foreign key(auditing) references original_voucher_auditing_data(id) on delete cascade on update cascade;
create unique index idx_original_voucher_creation_version on original_voucher_creation_data(id, version);

create unique index idx_original_voucher_confirmation_version on original_voucher_confirmation_data(id, version);

create unique index idx_original_voucher_auditing_version on original_voucher_auditing_data(id, version);

create unique index idx_accounting_document_line_version on accounting_document_line_data(id, version);

alter table accounting_document_line_data add constraint accounting_document_line4belongs_to_fk
	foreign key(belongs_to) references accounting_document_data(id) on delete cascade on update cascade;
alter table accounting_document_line_data add constraint accounting_document_line4accounting_subject_fk
	foreign key(accounting_subject) references accounting_subject_data(id) on delete cascade on update cascade;
create unique index idx_level_one_department_version on level_one_department_data(id, version);

alter table level_one_department_data add constraint level_one_department4belongs_to_fk
	foreign key(belongs_to) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_level_two_department_version on level_two_department_data(id, version);

alter table level_two_department_data add constraint level_two_department4belongs_to_fk
	foreign key(belongs_to) references level_one_department_data(id) on delete cascade on update cascade;
create unique index idx_level_three_department_version on level_three_department_data(id, version);

alter table level_three_department_data add constraint level_three_department4belongs_to_fk
	foreign key(belongs_to) references level_two_department_data(id) on delete cascade on update cascade;
create unique index idx_skill_type_version on skill_type_data(id, version);

alter table skill_type_data add constraint skill_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_responsibility_type_version on responsibility_type_data(id, version);

alter table responsibility_type_data add constraint responsibility_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_reason_version on termination_reason_data(id, version);

alter table termination_reason_data add constraint termination_reason4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_type_version on termination_type_data(id, version);

alter table termination_type_data add constraint termination_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_occupation_type_version on occupation_type_data(id, version);

alter table occupation_type_data add constraint occupation_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_leave_type_version on leave_type_data(id, version);

alter table leave_type_data add constraint leave_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_salary_grade_version on salary_grade_data(id, version);

alter table salary_grade_data add constraint salary_grade4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_interview_type_version on interview_type_data(id, version);

alter table interview_type_data add constraint interview_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_training_course_type_version on training_course_type_data(id, version);

alter table training_course_type_data add constraint training_course_type4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_public_holiday_version on public_holiday_data(id, version);

alter table public_holiday_data add constraint public_holiday4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_termination_version on termination_data(id, version);

alter table termination_data add constraint termination4reason_fk
	foreign key(reason) references termination_reason_data(id) on delete cascade on update cascade;
alter table termination_data add constraint termination4type_fk
	foreign key(type) references termination_type_data(id) on delete cascade on update cascade;
create unique index idx_view_version on view_data(id, version);

create unique index idx_employee_version on employee_data(id, version);

alter table employee_data add constraint employee4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4department_fk
	foreign key(department) references level_three_department_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4occupation_fk
	foreign key(occupation) references occupation_type_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4responsible_for_fk
	foreign key(responsible_for) references responsibility_type_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4current_salary_grade_fk
	foreign key(current_salary_grade) references salary_grade_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4job_application_fk
	foreign key(job_application) references job_application_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4profession_interview_fk
	foreign key(profession_interview) references profession_interview_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4hr_interview_fk
	foreign key(hr_interview) references hr_interview_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4offer_approval_fk
	foreign key(offer_approval) references offer_approval_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4offer_acceptance_fk
	foreign key(offer_acceptance) references offer_acceptance_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4employee_boarding_fk
	foreign key(employee_boarding) references employee_boarding_data(id) on delete cascade on update cascade;
alter table employee_data add constraint employee4termination_fk
	foreign key(termination) references termination_data(id) on delete cascade on update cascade;
create unique index idx_job_application_version on job_application_data(id, version);

create unique index idx_profession_interview_version on profession_interview_data(id, version);

create unique index idx_hr_interview_version on hr_interview_data(id, version);

create unique index idx_offer_approval_version on offer_approval_data(id, version);

create unique index idx_offer_acceptance_version on offer_acceptance_data(id, version);

create unique index idx_employee_boarding_version on employee_boarding_data(id, version);

create unique index idx_instructor_version on instructor_data(id, version);

alter table instructor_data add constraint instructor4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
create unique index idx_company_training_version on company_training_data(id, version);

alter table company_training_data add constraint company_training4company_fk
	foreign key(company) references retail_store_country_center_data(id) on delete cascade on update cascade;
alter table company_training_data add constraint company_training4instructor_fk
	foreign key(instructor) references instructor_data(id) on delete cascade on update cascade;
alter table company_training_data add constraint company_training4training_course_type_fk
	foreign key(training_course_type) references training_course_type_data(id) on delete cascade on update cascade;
create unique index idx_scoring_version on scoring_data(id, version);

create unique index idx_employee_company_training_version on employee_company_training_data(id, version);

alter table employee_company_training_data add constraint employee_company_training4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_company_training_data add constraint employee_company_training4training_fk
	foreign key(training) references company_training_data(id) on delete cascade on update cascade;
alter table employee_company_training_data add constraint employee_company_training4scoring_fk
	foreign key(scoring) references scoring_data(id) on delete cascade on update cascade;
create unique index idx_employee_skill_version on employee_skill_data(id, version);

alter table employee_skill_data add constraint employee_skill4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_skill_data add constraint employee_skill4skill_type_fk
	foreign key(skill_type) references skill_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_performance_version on employee_performance_data(id, version);

alter table employee_performance_data add constraint employee_performance4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_work_experience_version on employee_work_experience_data(id, version);

alter table employee_work_experience_data add constraint employee_work_experience4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_leave_version on employee_leave_data(id, version);

alter table employee_leave_data add constraint employee_leave4who_fk
	foreign key(who) references employee_data(id) on delete cascade on update cascade;
alter table employee_leave_data add constraint employee_leave4type_fk
	foreign key(type) references leave_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_interview_version on employee_interview_data(id, version);

alter table employee_interview_data add constraint employee_interview4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_interview_data add constraint employee_interview4interview_type_fk
	foreign key(interview_type) references interview_type_data(id) on delete cascade on update cascade;
create unique index idx_employee_attendance_version on employee_attendance_data(id, version);

alter table employee_attendance_data add constraint employee_attendance4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_qualifier_version on employee_qualifier_data(id, version);

alter table employee_qualifier_data add constraint employee_qualifier4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_education_version on employee_education_data(id, version);

alter table employee_education_data add constraint employee_education4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_award_version on employee_award_data(id, version);

alter table employee_award_data add constraint employee_award4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
create unique index idx_employee_salary_sheet_version on employee_salary_sheet_data(id, version);

alter table employee_salary_sheet_data add constraint employee_salary_sheet4employee_fk
	foreign key(employee) references employee_data(id) on delete cascade on update cascade;
alter table employee_salary_sheet_data add constraint employee_salary_sheet4current_salary_grade_fk
	foreign key(current_salary_grade) references salary_grade_data(id) on delete cascade on update cascade;
alter table employee_salary_sheet_data add constraint employee_salary_sheet4paying_off_fk
	foreign key(paying_off) references paying_off_data(id) on delete cascade on update cascade;
create unique index idx_paying_off_version on paying_off_data(id, version);

alter table paying_off_data add constraint paying_off4paid_for_fk
	foreign key(paid_for) references employee_data(id) on delete cascade on update cascade;
create unique index idx_user_domain_version on user_domain_data(id, version);

create unique index idx_user_white_list_version on user_white_list_data(id, version);

alter table user_white_list_data add constraint user_white_list4domain_fk
	foreign key(domain) references user_domain_data(id) on delete cascade on update cascade;
create unique index idx_sec_user_version on sec_user_data(id, version);

alter table sec_user_data add constraint sec_user4domain_fk
	foreign key(domain) references user_domain_data(id) on delete cascade on update cascade;
alter table sec_user_data add constraint sec_user4blocking_fk
	foreign key(blocking) references sec_user_blocking_data(id) on delete cascade on update cascade;
create unique index idx_sec_user_blocking_version on sec_user_blocking_data(id, version);

create unique index idx_user_app_version on user_app_data(id, version);

alter table user_app_data add constraint user_app4sec_user_fk
	foreign key(sec_user) references sec_user_data(id) on delete cascade on update cascade;
create unique index idx_list_access_version on list_access_data(id, version);

alter table list_access_data add constraint list_access4app_fk
	foreign key(app) references user_app_data(id) on delete cascade on update cascade;
create unique index idx_object_access_version on object_access_data(id, version);

alter table object_access_data add constraint object_access4app_fk
	foreign key(app) references user_app_data(id) on delete cascade on update cascade;
create unique index idx_login_history_version on login_history_data(id, version);

alter table login_history_data add constraint login_history4sec_user_fk
	foreign key(sec_user) references sec_user_data(id) on delete cascade on update cascade;
create unique index idx_generic_form_version on generic_form_data(id, version);

create unique index idx_form_message_version on form_message_data(id, version);

alter table form_message_data add constraint form_message4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_field_message_version on form_field_message_data(id, version);

alter table form_field_message_data add constraint form_field_message4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_field_version on form_field_data(id, version);

alter table form_field_data add constraint form_field4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
create unique index idx_form_action_version on form_action_data(id, version);

alter table form_action_data add constraint form_action4form_fk
	foreign key(form) references generic_form_data(id) on delete cascade on update cascade;
-- create extra index for time, number and mobile phone

create index retail_store_country_center4founded_idx on retail_store_country_center_data(founded);
create index retail_store_country_center4version_idx on retail_store_country_center_data(version);
create index catalog4version_idx on catalog_data(version);
create index level_one_category4version_idx on level_one_category_data(version);
create index level_two_category4version_idx on level_two_category_data(version);
create index level_three_category4version_idx on level_three_category_data(version);
create index product4last_update_time_idx on product_data(last_update_time);
create index product4version_idx on product_data(version);
create index sku4price_idx on sku_data(price);
create index sku4version_idx on sku_data(version);
create index retail_store_province_center4founded_idx on retail_store_province_center_data(founded);
create index retail_store_province_center4last_update_time_idx on retail_store_province_center_data(last_update_time);
create index retail_store_province_center4version_idx on retail_store_province_center_data(version);
create index province_center_department4founded_idx on province_center_department_data(founded);
create index province_center_department4version_idx on province_center_department_data(version);
create index province_center_employee4mobile_idx on province_center_employee_data(mobile);
create index province_center_employee4founded_idx on province_center_employee_data(founded);
create index province_center_employee4version_idx on province_center_employee_data(version);
create index retail_store_city_service_center4founded_idx on retail_store_city_service_center_data(founded);
create index retail_store_city_service_center4last_update_time_idx on retail_store_city_service_center_data(last_update_time);
create index retail_store_city_service_center4version_idx on retail_store_city_service_center_data(version);
create index city_partner4mobile_idx on city_partner_data(mobile);
create index city_partner4last_update_time_idx on city_partner_data(last_update_time);
create index city_partner4version_idx on city_partner_data(version);
create index potential_customer4mobile_idx on potential_customer_data(mobile);
create index potential_customer4last_update_time_idx on potential_customer_data(last_update_time);
create index potential_customer4version_idx on potential_customer_data(version);
create index potential_customer_contact_person4mobile_idx on potential_customer_contact_person_data(mobile);
create index potential_customer_contact_person4version_idx on potential_customer_contact_person_data(version);
create index potential_customer_contact4contact_date_idx on potential_customer_contact_data(contact_date);
create index potential_customer_contact4last_update_time_idx on potential_customer_contact_data(last_update_time);
create index potential_customer_contact4version_idx on potential_customer_contact_data(version);
create index city_event4mobile_idx on city_event_data(mobile);
create index city_event4last_update_time_idx on city_event_data(last_update_time);
create index city_event4version_idx on city_event_data(version);
create index event_attendance4version_idx on event_attendance_data(version);
create index retail_store4founded_idx on retail_store_data(founded);
create index retail_store4latitude_idx on retail_store_data(latitude);
create index retail_store4longitude_idx on retail_store_data(longitude);
create index retail_store4last_update_time_idx on retail_store_data(last_update_time);
create index retail_store4version_idx on retail_store_data(version);
create index retail_store_creation4version_idx on retail_store_creation_data(version);
create index retail_store_investment_invitation4version_idx on retail_store_investment_invitation_data(version);
create index retail_store_franchising4version_idx on retail_store_franchising_data(version);
create index retail_store_decoration4version_idx on retail_store_decoration_data(version);
create index retail_store_opening4version_idx on retail_store_opening_data(version);
create index retail_store_closing4version_idx on retail_store_closing_data(version);
create index retail_store_member4mobile_phone_idx on retail_store_member_data(mobile_phone);
create index retail_store_member4version_idx on retail_store_member_data(version);
create index consumer_order4last_update_time_idx on consumer_order_data(last_update_time);
create index consumer_order4version_idx on consumer_order_data(version);
create index consumer_order_confirmation4confirm_time_idx on consumer_order_confirmation_data(confirm_time);
create index consumer_order_confirmation4version_idx on consumer_order_confirmation_data(version);
create index consumer_order_approval4approve_time_idx on consumer_order_approval_data(approve_time);
create index consumer_order_approval4version_idx on consumer_order_approval_data(version);
create index consumer_order_processing4process_time_idx on consumer_order_processing_data(process_time);
create index consumer_order_processing4version_idx on consumer_order_processing_data(version);
create index consumer_order_shipment4ship_time_idx on consumer_order_shipment_data(ship_time);
create index consumer_order_shipment4version_idx on consumer_order_shipment_data(version);
create index consumer_order_delivery4delivery_time_idx on consumer_order_delivery_data(delivery_time);
create index consumer_order_delivery4version_idx on consumer_order_delivery_data(version);
create index consumer_order_line_item4sku_id_idx on consumer_order_line_item_data(sku_id);
create index consumer_order_line_item4price_idx on consumer_order_line_item_data(price);
create index consumer_order_line_item4quantity_idx on consumer_order_line_item_data(quantity);
create index consumer_order_line_item4amount_idx on consumer_order_line_item_data(amount);
create index consumer_order_line_item4version_idx on consumer_order_line_item_data(version);
create index consumer_order_shipping_group4amount_idx on consumer_order_shipping_group_data(amount);
create index consumer_order_shipping_group4version_idx on consumer_order_shipping_group_data(version);
create index consumer_order_payment_group4version_idx on consumer_order_payment_group_data(version);
create index consumer_order_price_adjustment4amount_idx on consumer_order_price_adjustment_data(amount);
create index consumer_order_price_adjustment4version_idx on consumer_order_price_adjustment_data(version);
create index retail_store_member_coupon4version_idx on retail_store_member_coupon_data(version);
create index member_wishlist4version_idx on member_wishlist_data(version);
create index member_reward_point4point_idx on member_reward_point_data(point);
create index member_reward_point4version_idx on member_reward_point_data(version);
create index member_reward_point_redemption4point_idx on member_reward_point_redemption_data(point);
create index member_reward_point_redemption4version_idx on member_reward_point_redemption_data(version);
create index member_wishlist_product4version_idx on member_wishlist_product_data(version);
create index retail_store_member_address4mobile_phone_idx on retail_store_member_address_data(mobile_phone);
create index retail_store_member_address4version_idx on retail_store_member_address_data(version);
create index retail_store_member_gift_card4remain_idx on retail_store_member_gift_card_data(remain);
create index retail_store_member_gift_card4version_idx on retail_store_member_gift_card_data(version);
create index retail_store_member_gift_card_consume_record4occure_time_idx on retail_store_member_gift_card_consume_record_data(occure_time);
create index retail_store_member_gift_card_consume_record4amount_idx on retail_store_member_gift_card_consume_record_data(amount);
create index retail_store_member_gift_card_consume_record4version_idx on retail_store_member_gift_card_consume_record_data(version);
create index goods_supplier4contact_number_idx on goods_supplier_data(contact_number);
create index goods_supplier4last_update_time_idx on goods_supplier_data(last_update_time);
create index goods_supplier4version_idx on goods_supplier_data(version);
create index supplier_product4version_idx on supplier_product_data(version);
create index product_supply_duration4quantity_idx on product_supply_duration_data(quantity);
create index product_supply_duration4price_idx on product_supply_duration_data(price);
create index product_supply_duration4version_idx on product_supply_duration_data(version);
create index supply_order4total_amount_idx on supply_order_data(total_amount);
create index supply_order4last_update_time_idx on supply_order_data(last_update_time);
create index supply_order4version_idx on supply_order_data(version);
create index supply_order_confirmation4confirm_time_idx on supply_order_confirmation_data(confirm_time);
create index supply_order_confirmation4version_idx on supply_order_confirmation_data(version);
create index supply_order_approval4approve_time_idx on supply_order_approval_data(approve_time);
create index supply_order_approval4version_idx on supply_order_approval_data(version);
create index supply_order_processing4process_time_idx on supply_order_processing_data(process_time);
create index supply_order_processing4version_idx on supply_order_processing_data(version);
create index supply_order_picking4process_time_idx on supply_order_picking_data(process_time);
create index supply_order_picking4version_idx on supply_order_picking_data(version);
create index supply_order_shipment4ship_time_idx on supply_order_shipment_data(ship_time);
create index supply_order_shipment4version_idx on supply_order_shipment_data(version);
create index supply_order_delivery4delivery_time_idx on supply_order_delivery_data(delivery_time);
create index supply_order_delivery4version_idx on supply_order_delivery_data(version);
create index supply_order_line_item4sku_id_idx on supply_order_line_item_data(sku_id);
create index supply_order_line_item4amount_idx on supply_order_line_item_data(amount);
create index supply_order_line_item4quantity_idx on supply_order_line_item_data(quantity);
create index supply_order_line_item4version_idx on supply_order_line_item_data(version);
create index supply_order_shipping_group4amount_idx on supply_order_shipping_group_data(amount);
create index supply_order_shipping_group4version_idx on supply_order_shipping_group_data(version);
create index supply_order_payment_group4version_idx on supply_order_payment_group_data(version);
create index retail_store_order4total_amount_idx on retail_store_order_data(total_amount);
create index retail_store_order4last_update_time_idx on retail_store_order_data(last_update_time);
create index retail_store_order4version_idx on retail_store_order_data(version);
create index retail_store_order_confirmation4confirm_time_idx on retail_store_order_confirmation_data(confirm_time);
create index retail_store_order_confirmation4version_idx on retail_store_order_confirmation_data(version);
create index retail_store_order_approval4approve_time_idx on retail_store_order_approval_data(approve_time);
create index retail_store_order_approval4version_idx on retail_store_order_approval_data(version);
create index retail_store_order_processing4process_time_idx on retail_store_order_processing_data(process_time);
create index retail_store_order_processing4version_idx on retail_store_order_processing_data(version);
create index retail_store_order_picking4process_time_idx on retail_store_order_picking_data(process_time);
create index retail_store_order_picking4version_idx on retail_store_order_picking_data(version);
create index retail_store_order_shipment4ship_time_idx on retail_store_order_shipment_data(ship_time);
create index retail_store_order_shipment4version_idx on retail_store_order_shipment_data(version);
create index retail_store_order_delivery4delivery_time_idx on retail_store_order_delivery_data(delivery_time);
create index retail_store_order_delivery4version_idx on retail_store_order_delivery_data(version);
create index retail_store_order_line_item4sku_id_idx on retail_store_order_line_item_data(sku_id);
create index retail_store_order_line_item4amount_idx on retail_store_order_line_item_data(amount);
create index retail_store_order_line_item4quantity_idx on retail_store_order_line_item_data(quantity);
create index retail_store_order_line_item4version_idx on retail_store_order_line_item_data(version);
create index retail_store_order_shipping_group4amount_idx on retail_store_order_shipping_group_data(amount);
create index retail_store_order_shipping_group4version_idx on retail_store_order_shipping_group_data(version);
create index retail_store_order_payment_group4version_idx on retail_store_order_payment_group_data(version);
create index warehouse4latitude_idx on warehouse_data(latitude);
create index warehouse4longitude_idx on warehouse_data(longitude);
create index warehouse4last_update_time_idx on warehouse_data(last_update_time);
create index warehouse4version_idx on warehouse_data(version);
create index storage_space4latitude_idx on storage_space_data(latitude);
create index storage_space4longitude_idx on storage_space_data(longitude);
create index storage_space4version_idx on storage_space_data(version);
create index smart_pallet4latitude_idx on smart_pallet_data(latitude);
create index smart_pallet4longitude_idx on smart_pallet_data(longitude);
create index smart_pallet4version_idx on smart_pallet_data(version);
create index goods_shelf4version_idx on goods_shelf_data(version);
create index goods_shelf_stock_count4count_time_idx on goods_shelf_stock_count_data(count_time);
create index goods_shelf_stock_count4version_idx on goods_shelf_stock_count_data(version);
create index stock_count_issue_track4count_time_idx on stock_count_issue_track_data(count_time);
create index stock_count_issue_track4version_idx on stock_count_issue_track_data(version);
create index goods_allocation4latitude_idx on goods_allocation_data(latitude);
create index goods_allocation4longitude_idx on goods_allocation_data(longitude);
create index goods_allocation4version_idx on goods_allocation_data(version);
create index goods4max_package_idx on goods_data(max_package);
create index goods4expire_time_idx on goods_data(expire_time);
create index goods4version_idx on goods_data(version);
create index goods_packaging4package_time_idx on goods_packaging_data(package_time);
create index goods_packaging4version_idx on goods_packaging_data(version);
create index goods_movement4move_time_idx on goods_movement_data(move_time);
create index goods_movement4facility_id_idx on goods_movement_data(facility_id);
create index goods_movement4session_id_idx on goods_movement_data(session_id);
create index goods_movement4latitude_idx on goods_movement_data(latitude);
create index goods_movement4longitude_idx on goods_movement_data(longitude);
create index goods_movement4version_idx on goods_movement_data(version);
create index supplier_space4latitude_idx on supplier_space_data(latitude);
create index supplier_space4longitude_idx on supplier_space_data(longitude);
create index supplier_space4version_idx on supplier_space_data(version);
create index receiving_space4latitude_idx on receiving_space_data(latitude);
create index receiving_space4longitude_idx on receiving_space_data(longitude);
create index receiving_space4version_idx on receiving_space_data(version);
create index shipping_space4latitude_idx on shipping_space_data(latitude);
create index shipping_space4longitude_idx on shipping_space_data(longitude);
create index shipping_space4version_idx on shipping_space_data(version);
create index damage_space4latitude_idx on damage_space_data(latitude);
create index damage_space4longitude_idx on damage_space_data(longitude);
create index damage_space4version_idx on damage_space_data(version);
create index warehouse_asset4version_idx on warehouse_asset_data(version);
create index transport_fleet4last_update_time_idx on transport_fleet_data(last_update_time);
create index transport_fleet4version_idx on transport_fleet_data(version);
create index transport_truck4make_date_idx on transport_truck_data(make_date);
create index transport_truck4version_idx on transport_truck_data(version);
create index truck_driver4contact_number_idx on truck_driver_data(contact_number);
create index truck_driver4version_idx on truck_driver_data(version);
create index transport_task4begin_time_idx on transport_task_data(begin_time);
create index transport_task4latitude_idx on transport_task_data(latitude);
create index transport_task4longitude_idx on transport_task_data(longitude);
create index transport_task4version_idx on transport_task_data(version);
create index transport_task_track4track_time_idx on transport_task_track_data(track_time);
create index transport_task_track4latitude_idx on transport_task_track_data(latitude);
create index transport_task_track4longitude_idx on transport_task_track_data(longitude);
create index transport_task_track4version_idx on transport_task_track_data(version);
create index account_set4effective_date_idx on account_set_data(effective_date);
create index account_set4last_update_time_idx on account_set_data(last_update_time);
create index account_set4version_idx on account_set_data(version);
create index accounting_subject4accounting_subject_class_code_idx on accounting_subject_data(accounting_subject_class_code);
create index accounting_subject4version_idx on accounting_subject_data(version);
create index accounting_period4start_date_idx on accounting_period_data(start_date);
create index accounting_period4end_date_idx on accounting_period_data(end_date);
create index accounting_period4version_idx on accounting_period_data(version);
create index accounting_document_type4version_idx on accounting_document_type_data(version);
create index accounting_document4accounting_document_date_idx on accounting_document_data(accounting_document_date);
create index accounting_document4version_idx on accounting_document_data(version);
create index accounting_document_creation4make_date_idx on accounting_document_creation_data(make_date);
create index accounting_document_creation4version_idx on accounting_document_creation_data(version);
create index accounting_document_confirmation4make_date_idx on accounting_document_confirmation_data(make_date);
create index accounting_document_confirmation4version_idx on accounting_document_confirmation_data(version);
create index accounting_document_auditing4make_date_idx on accounting_document_auditing_data(make_date);
create index accounting_document_auditing4version_idx on accounting_document_auditing_data(version);
create index accounting_document_posting4make_date_idx on accounting_document_posting_data(make_date);
create index accounting_document_posting4version_idx on accounting_document_posting_data(version);
create index original_voucher4version_idx on original_voucher_data(version);
create index original_voucher_creation4make_date_idx on original_voucher_creation_data(make_date);
create index original_voucher_creation4version_idx on original_voucher_creation_data(version);
create index original_voucher_confirmation4make_date_idx on original_voucher_confirmation_data(make_date);
create index original_voucher_confirmation4version_idx on original_voucher_confirmation_data(version);
create index original_voucher_auditing4make_date_idx on original_voucher_auditing_data(make_date);
create index original_voucher_auditing4version_idx on original_voucher_auditing_data(version);
create index accounting_document_line4amount_idx on accounting_document_line_data(amount);
create index accounting_document_line4version_idx on accounting_document_line_data(version);
create index level_one_department4founded_idx on level_one_department_data(founded);
create index level_one_department4version_idx on level_one_department_data(version);
create index level_two_department4founded_idx on level_two_department_data(founded);
create index level_two_department4version_idx on level_two_department_data(version);
create index level_three_department4founded_idx on level_three_department_data(founded);
create index level_three_department4version_idx on level_three_department_data(version);
create index skill_type4version_idx on skill_type_data(version);
create index responsibility_type4version_idx on responsibility_type_data(version);
create index termination_reason4version_idx on termination_reason_data(version);
create index termination_type4version_idx on termination_type_data(version);
create index occupation_type4version_idx on occupation_type_data(version);
create index leave_type4version_idx on leave_type_data(version);
create index salary_grade4version_idx on salary_grade_data(version);
create index interview_type4version_idx on interview_type_data(version);
create index training_course_type4version_idx on training_course_type_data(version);
create index public_holiday4version_idx on public_holiday_data(version);
create index termination4version_idx on termination_data(version);
create index view4interview_time_idx on view_data(interview_time);
create index view4version_idx on view_data(version);
create index employee4cell_phone_idx on employee_data(cell_phone);
create index employee4last_update_time_idx on employee_data(last_update_time);
create index employee4version_idx on employee_data(version);
create index job_application4application_time_idx on job_application_data(application_time);
create index job_application4version_idx on job_application_data(version);
create index profession_interview4interview_time_idx on profession_interview_data(interview_time);
create index profession_interview4version_idx on profession_interview_data(version);
create index hr_interview4interview_time_idx on hr_interview_data(interview_time);
create index hr_interview4version_idx on hr_interview_data(version);
create index offer_approval4approve_time_idx on offer_approval_data(approve_time);
create index offer_approval4version_idx on offer_approval_data(version);
create index offer_acceptance4accept_time_idx on offer_acceptance_data(accept_time);
create index offer_acceptance4version_idx on offer_acceptance_data(version);
create index employee_boarding4employ_time_idx on employee_boarding_data(employ_time);
create index employee_boarding4version_idx on employee_boarding_data(version);
create index instructor4cell_phone_idx on instructor_data(cell_phone);
create index instructor4last_update_time_idx on instructor_data(last_update_time);
create index instructor4version_idx on instructor_data(version);
create index company_training4time_start_idx on company_training_data(time_start);
create index company_training4duration_hours_idx on company_training_data(duration_hours);
create index company_training4last_update_time_idx on company_training_data(last_update_time);
create index company_training4version_idx on company_training_data(version);
create index scoring4score_idx on scoring_data(score);
create index scoring4version_idx on scoring_data(version);
create index employee_company_training4version_idx on employee_company_training_data(version);
create index employee_skill4version_idx on employee_skill_data(version);
create index employee_performance4version_idx on employee_performance_data(version);
create index employee_work_experience4start_idx on employee_work_experience_data(start);
create index employee_work_experience4end_idx on employee_work_experience_data(end);
create index employee_work_experience4version_idx on employee_work_experience_data(version);
create index employee_leave4leave_duration_hour_idx on employee_leave_data(leave_duration_hour);
create index employee_leave4version_idx on employee_leave_data(version);
create index employee_interview4version_idx on employee_interview_data(version);
create index employee_attendance4enter_time_idx on employee_attendance_data(enter_time);
create index employee_attendance4leave_time_idx on employee_attendance_data(leave_time);
create index employee_attendance4duration_hours_idx on employee_attendance_data(duration_hours);
create index employee_attendance4version_idx on employee_attendance_data(version);
create index employee_qualifier4qualified_time_idx on employee_qualifier_data(qualified_time);
create index employee_qualifier4version_idx on employee_qualifier_data(version);
create index employee_education4complete_time_idx on employee_education_data(complete_time);
create index employee_education4version_idx on employee_education_data(version);
create index employee_award4complete_time_idx on employee_award_data(complete_time);
create index employee_award4version_idx on employee_award_data(version);
create index employee_salary_sheet4base_salary_idx on employee_salary_sheet_data(base_salary);
create index employee_salary_sheet4bonus_idx on employee_salary_sheet_data(bonus);
create index employee_salary_sheet4reward_idx on employee_salary_sheet_data(reward);
create index employee_salary_sheet4personal_tax_idx on employee_salary_sheet_data(personal_tax);
create index employee_salary_sheet4social_security_idx on employee_salary_sheet_data(social_security);
create index employee_salary_sheet4housing_found_idx on employee_salary_sheet_data(housing_found);
create index employee_salary_sheet4job_insurance_idx on employee_salary_sheet_data(job_insurance);
create index employee_salary_sheet4version_idx on employee_salary_sheet_data(version);
create index paying_off4paid_time_idx on paying_off_data(paid_time);
create index paying_off4amount_idx on paying_off_data(amount);
create index paying_off4version_idx on paying_off_data(version);
create index user_domain4version_idx on user_domain_data(version);
create index user_white_list4version_idx on user_white_list_data(version);
create index sec_user4mobile_idx on sec_user_data(mobile);
create index sec_user4verification_code_idx on sec_user_data(verification_code);
create index sec_user4verification_code_expire_idx on sec_user_data(verification_code_expire);
create index sec_user4last_login_time_idx on sec_user_data(last_login_time);
create index sec_user4version_idx on sec_user_data(version);
create index sec_user_blocking4block_time_idx on sec_user_blocking_data(block_time);
create index sec_user_blocking4version_idx on sec_user_blocking_data(version);
create index user_app4object_id_idx on user_app_data(object_id);
create index user_app4version_idx on user_app_data(version);
create index list_access4version_idx on list_access_data(version);
create index object_access4version_idx on object_access_data(version);
create index login_history4login_time_idx on login_history_data(login_time);
create index login_history4version_idx on login_history_data(version);
create index generic_form4version_idx on generic_form_data(version);
create index form_message4version_idx on form_message_data(version);
create index form_field_message4version_idx on form_field_message_data(version);
create index form_field4version_idx on form_field_data(version);
create index form_action4version_idx on form_action_data(version);










delete from sec_user_data;
delete from user_app_data;

/*
+--------------------------+-------------+------+-----+---------+-------+
| Field                    | Type        | Null | Key | Default | Extra |
+--------------------------+-------------+------+-----+---------+-------+
| id                       | varchar(64) | NO   | PRI | NULL    |       |
| login                    | varchar(20) | YES  |     | NULL    |       |
| mobile                   | varchar(11) | YES  | MUL | NULL    |       |
| email                    | varchar(76) | YES  |     | NULL    |       |
| pwd                      | varchar(64) | YES  |     | NULL    |       |
| verification_code        | int(11)     | YES  | MUL | NULL    |       |
| verification_code_expire | datetime    | YES  | MUL | NULL    |       |
| last_login_time          | datetime    | YES  | MUL | NULL    |       |
| domain                   | varchar(48) | YES  | MUL | NULL    |       |
| blocking                 | varchar(48) | YES  | MUL | NULL    |       |
| current_status           | varchar(28) | YES  |     | NULL    |       |
| version                  | int(11)     | YES  | MUL | NULL    |       |
+--------------------------+-------------+------+-----+---------+-------+


*/

insert into sec_user_data values('SU000001','u000001','13900000001','1000001@qq.com','258D9BB89BBC1F2A6CDDD3A4CB300E6CD9B83F3FC9984619DF1A59F6051F1F44','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000001','双链小超全国运营中心','SU000001','store',1,'MXWR','RetailStoreCountryCenter','RSCC000001','/link/to/app','1'); -- REFER COUNT: 24
insert into user_app_data values('UA000002','My Account','SU000001','lock',1,'MXWR','SecUser','SU000001','/link/to/app','1'); -- REFER COUNT: 24
insert into sec_user_data values('SU000002','u000002','13900000002','1000002@qq.com','7FEABCC19D638787655F9FFC2C22755D5771184D85D000147D643D22F6617F7B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000003','双链小超城市服务中心','SU000002','city',1,'MXWR','RetailStoreCityServiceCenter','RSCSC000001','/link/to/app','1'); -- REFER COUNT: 4
insert into user_app_data values('UA000004','My Account','SU000002','lock',1,'MXWR','SecUser','SU000002','/link/to/app','1'); -- REFER COUNT: 4
insert into sec_user_data values('SU000003','u000003','13900000003','1000003@qq.com','8169C17063461B0B0CC210CE5EF682E9517A19170F7DCA3C76170229D765DE7A','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000005','双链小超','SU000003','store',1,'MXWR','RetailStore','RS000001','/link/to/app','1'); -- REFER COUNT: 5
insert into user_app_data values('UA000006','My Account','SU000003','lock',1,'MXWR','SecUser','SU000003','/link/to/app','1'); -- REFER COUNT: 5
insert into sec_user_data values('SU000004','u000004','13900000004','1000004@qq.com','025745F4A4EA0C11059911E40714470F323C42836B1137D66AD3F85210A725CF','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000007','双链小超的创作','SU000004','store',1,'MXWR','RetailStoreCreation','RSC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000008','My Account','SU000004','lock',1,'MXWR','SecUser','SU000004','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000005','u000005','13900000005','1000005@qq.com','F8D472FBE8716BFB66C0A9BC73208FE4C5971051D240D9AC3B5EBCEF05CD5FFA','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000009','生超招商','SU000005','store',1,'MXWR','RetailStoreInvestmentInvitation','RSII000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000010','My Account','SU000005','lock',1,'MXWR','SecUser','SU000005','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000006','u000006','13900000006','1000006@qq.com','FEE10F101DD4B9D2C98FAA1A672821DF22B9FA662528ED5B885B60C0979E6530','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000011','生超的特许经营','SU000006','store',1,'MXWR','RetailStoreFranchising','RSF000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000012','My Account','SU000006','lock',1,'MXWR','SecUser','SU000006','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000007','u000007','13900000007','1000007@qq.com','016B4A47737559D64FC1369AA4D8CFD0B47E11F4C6219E80946C0E47A4C1C74B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000013','生超装修','SU000007','store',1,'MXWR','RetailStoreDecoration','RSD000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000014','My Account','SU000007','lock',1,'MXWR','SecUser','SU000007','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000008','u000008','13900000008','1000008@qq.com','3DD09D08D4A34BD5367C120455333331A0E1D012FC3305AEE702107B03FDA311','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000015','生超开业','SU000008','store',1,'MXWR','RetailStoreOpening','RSO000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000016','My Account','SU000008','lock',1,'MXWR','SecUser','SU000008','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000009','u000009','13900000009','1000009@qq.com','8ECA1BC35EC1B832DE602E278203B99FA6395ED23F6C4428450FE3512266B7A8','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000017','商店关闭','SU000009','store',1,'MXWR','RetailStoreClosing','RSC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000018','My Account','SU000009','lock',1,'MXWR','SecUser','SU000009','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000010','u000010','13900000010','1000010@qq.com','A2A6C75CE3F23C1756D1A4DF43AFEE7D25FE2726925A5AD9157D23073CFCBE2A','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000019','生超会员','SU000010','store',1,'MXWR','RetailStoreMember','RSM000001','/link/to/app','1'); -- REFER COUNT: 7
insert into user_app_data values('UA000020','My Account','SU000010','lock',1,'MXWR','SecUser','SU000010','/link/to/app','1'); -- REFER COUNT: 7
insert into sec_user_data values('SU000011','u000011','13900000011','1000011@qq.com','0DA7439FCC9C3C54DD9F8A6CC50141FAFF9443A80507BD3FA332474A59CF1E4B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000021','消费者订单','SU000011','first-order',1,'MXWR','ConsumerOrder','CO000001','/link/to/app','1'); -- REFER COUNT: 5
insert into user_app_data values('UA000022','My Account','SU000011','lock',1,'MXWR','SecUser','SU000011','/link/to/app','1'); -- REFER COUNT: 5
insert into sec_user_data values('SU000012','u000012','13900000012','1000012@qq.com','F6EA28692696304975223A15F42335C078D0A14DF8FB1DBC34DC4328E55E9428','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000023','客户订单确认','SU000012','at',1,'MXWR','ConsumerOrderConfirmation','COC000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000024','My Account','SU000012','lock',1,'MXWR','SecUser','SU000012','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000013','u000013','13900000013','1000013@qq.com','59D53828EE0A84D385E25B1394648115971690AACAB4F77841DDB10D60E6661C','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000025','消费者的订单审批','SU000013','first-order',1,'MXWR','ConsumerOrderApproval','COA000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000026','My Account','SU000013','lock',1,'MXWR','SecUser','SU000013','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000014','u000014','13900000014','1000014@qq.com','50D3D254F86D290337E3B83EF356B913E1F5093B803AD48D2E0BC59E9309194B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000027','消费者的订单处理','SU000014','first-order',1,'MXWR','ConsumerOrderProcessing','COP000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000028','My Account','SU000014','lock',1,'MXWR','SecUser','SU000014','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000015','u000015','13900000015','1000015@qq.com','75CD84F62C9C413B8F366D883D29D8DD95FDF68C588893C45F68DCBB4DF03905','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000029','消费者的订单发货','SU000015','first-order',1,'MXWR','ConsumerOrderShipment','COS000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000030','My Account','SU000015','lock',1,'MXWR','SecUser','SU000015','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000016','u000016','13900000016','1000016@qq.com','EEBE214BE0970861D97A6DC68A36EE1529075E10D7C14F961C1BF74228B70B8A','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000031','消费者订单交货','SU000016','first-order',1,'MXWR','ConsumerOrderDelivery','COD000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000032','My Account','SU000016','lock',1,'MXWR','SecUser','SU000016','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000017','u000017','13900000017','1000017@qq.com','C37E721BD259B06E7221367D8808A8283AE56AFD387F404FFF7A62535064C217','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000033','供应订单','SU000017','first-order',1,'MXWR','SupplyOrder','SO000001','/link/to/app','1'); -- REFER COUNT: 4
insert into user_app_data values('UA000034','My Account','SU000017','lock',1,'MXWR','SecUser','SU000017','/link/to/app','1'); -- REFER COUNT: 4
insert into sec_user_data values('SU000018','u000018','13900000018','1000018@qq.com','9A783D466D9076F8AADF564D3A42D8FC75341B0F39F218A3FC93C071A91F724C','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000035','供应订单确认','SU000018','at',1,'MXWR','SupplyOrderConfirmation','SOC000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000036','My Account','SU000018','lock',1,'MXWR','SecUser','SU000018','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000019','u000019','13900000019','1000019@qq.com','0B34D82ACE51E52A5B0BC0EE9D13CA4B022DFFB2E2C4D1C687995B74FDAD86D1','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000037','供应订单审批','SU000019','first-order',1,'MXWR','SupplyOrderApproval','SOA000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000038','My Account','SU000019','lock',1,'MXWR','SecUser','SU000019','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000020','u000020','13900000020','1000020@qq.com','55BF0A7E8AF57AE2CC16D2D53DE8D670204614B7C7AF2E70C34586EC0EABDE13','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000039','供应订单处理','SU000020','first-order',1,'MXWR','SupplyOrderProcessing','SOP000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000040','My Account','SU000020','lock',1,'MXWR','SecUser','SU000020','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000021','u000021','13900000021','1000021@qq.com','0320BEE5B930A5E9897C73919EEE92EEA59768AFEDFB141040B4D16A67303212','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000041','供应订单拣货','SU000021','first-order',1,'MXWR','SupplyOrderPicking','SOP000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000042','My Account','SU000021','lock',1,'MXWR','SecUser','SU000021','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000022','u000022','13900000022','1000022@qq.com','1647992FD5B5ABA16BFB44AB69EBF62B570B941218C4B21FF2ECEECEE89E22EB','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000043','供应货','SU000022','first-order',1,'MXWR','SupplyOrderShipment','SOS000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000044','My Account','SU000022','lock',1,'MXWR','SecUser','SU000022','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000023','u000023','13900000023','1000023@qq.com','3E26D4C1FE499EC82C01D391958BAB4DD228A5C1B05A9B732D3A18F0F690D5C0','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000045','供应订单交货','SU000023','first-order',1,'MXWR','SupplyOrderDelivery','SOD000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000046','My Account','SU000023','lock',1,'MXWR','SecUser','SU000023','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000024','u000024','13900000024','1000024@qq.com','7339881A3B652649B84E90FF31856B4E76E034AB07BB003804A1075FA61114C9','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000047','生超的订单','SU000024','store',1,'MXWR','RetailStoreOrder','RSO000001','/link/to/app','1'); -- REFER COUNT: 4
insert into user_app_data values('UA000048','My Account','SU000024','lock',1,'MXWR','SecUser','SU000024','/link/to/app','1'); -- REFER COUNT: 4
insert into sec_user_data values('SU000025','u000025','13900000025','1000025@qq.com','B2E0FB243A1E13D1BE88838DC95C8C2ADFD84EA5284767F9CEA46692FB0B9FDC','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000049','生超订单确认','SU000025','store',1,'MXWR','RetailStoreOrderConfirmation','RSOC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000050','My Account','SU000025','lock',1,'MXWR','SecUser','SU000025','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000026','u000026','13900000026','1000026@qq.com','3BCA067E5BCF0C2CC0D431861487AD13E1C72112442D0C787C0E9E9F9BE6CA98','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000051','生超订单批准','SU000026','store',1,'MXWR','RetailStoreOrderApproval','RSOA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000052','My Account','SU000026','lock',1,'MXWR','SecUser','SU000026','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000027','u000027','13900000027','1000027@qq.com','9E1BCD8D3A2C67C050E19A10BB926F4192DAC8C6469DCE612C51513993695A23','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000053','生超订单处理','SU000027','store',1,'MXWR','RetailStoreOrderProcessing','RSOP000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000054','My Account','SU000027','lock',1,'MXWR','SecUser','SU000027','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000028','u000028','13900000028','1000028@qq.com','33CE2324B49F66CEEDC755EC0FEFFCF7A2D76FD0F67F273B9FE4C72DE1F2D3CA','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000055','生超订单拣货','SU000028','store',1,'MXWR','RetailStoreOrderPicking','RSOP000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000056','My Account','SU000028','lock',1,'MXWR','SecUser','SU000028','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000029','u000029','13900000029','1000029@qq.com','B09DD8565B6E8C606093AFF2EBD54A108F8E19EF8DD275E0DC68C313C900B1BB','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000057','生超订单出货','SU000029','store',1,'MXWR','RetailStoreOrderShipment','RSOS000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000058','My Account','SU000029','lock',1,'MXWR','SecUser','SU000029','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000030','u000030','13900000030','1000030@qq.com','A01E8A2CD567A3D0410A8A18ACAD748FF0868E69B08308635B10953750F21FE4','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000059','生超订单交付','SU000030','store',1,'MXWR','RetailStoreOrderDelivery','RSOD000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000060','My Account','SU000030','lock',1,'MXWR','SecUser','SU000030','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000031','u000031','13900000031','1000031@qq.com','C74960B402577201324731FD96E05BC8619EAEE323CABB0D25A8DA67E334A9A0','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000061','仓库','SU000031','warehouse',1,'MXWR','Warehouse','W000001','/link/to/app','1'); -- REFER COUNT: 7
insert into user_app_data values('UA000062','My Account','SU000031','lock',1,'MXWR','SecUser','SU000031','/link/to/app','1'); -- REFER COUNT: 7
insert into sec_user_data values('SU000032','u000032','13900000032','1000032@qq.com','A7617ECA8D8A69C956A67997CE8685FC8805792D24C5051DD5956D6B17B94AC1','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000063','货物包装','SU000032','audible',1,'MXWR','GoodsPackaging','GP000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000064','My Account','SU000032','lock',1,'MXWR','SecUser','SU000032','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000033','u000033','13900000033','1000033@qq.com','11A0895E8C08A2E245BFE64F283F9DF59835701B84FFE5842F2BF31DE3B1C85F','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000065','会计文件的创建','SU000033','at',1,'MXWR','AccountingDocumentCreation','ADC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000066','My Account','SU000033','lock',1,'MXWR','SecUser','SU000033','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000034','u000034','13900000034','1000034@qq.com','4344F14D92E4841607F9BA8577B7A3856E2993231B7C2B73A157E0CFDB64893B','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000067','会计的确认文件','SU000034','at',1,'MXWR','AccountingDocumentConfirmation','ADC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000068','My Account','SU000034','lock',1,'MXWR','SecUser','SU000034','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000035','u000035','13900000035','1000035@qq.com','67E391021C2043429BB52357D062C583A992C70D2A1127DFE2A9A69017560456','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000069','会计凭证的审核','SU000035','battery-full',1,'MXWR','AccountingDocumentAuditing','ADA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000070','My Account','SU000035','lock',1,'MXWR','SecUser','SU000035','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000036','u000036','13900000036','1000036@qq.com','3BD7D50AE860711823DB306C010C0D182AA9EDCC7E2675C3936676B4655669D1','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000071','会计凭证过帐','SU000036','battery-half',1,'MXWR','AccountingDocumentPosting','ADP000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000072','My Account','SU000036','lock',1,'MXWR','SecUser','SU000036','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000037','u000037','13900000037','1000037@qq.com','802EE1149F9E4698FB179F49ADB6B784F66207E23957B91621E3D312B183695C','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000073','原始凭证制作','SU000037','at',1,'MXWR','OriginalVoucherCreation','OVC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000074','My Account','SU000037','lock',1,'MXWR','SecUser','SU000037','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000038','u000038','13900000038','1000038@qq.com','51244DF89BC6DFDEEF58FB4210A2F25B1039ED60E67715A31087F1C7FBF65D3E','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000075','原始凭证的确认','SU000038','at',1,'MXWR','OriginalVoucherConfirmation','OVC000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000076','My Account','SU000038','lock',1,'MXWR','SecUser','SU000038','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000039','u000039','13900000039','1000039@qq.com','59ED0D812FEF0375AA63BA6FA29F129BA4103BD49E23D68FC6CC488C9E352E45','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000077','原始凭证的审核','SU000039','beer',1,'MXWR','OriginalVoucherAuditing','OVA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000078','My Account','SU000039','lock',1,'MXWR','SecUser','SU000039','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000040','u000040','13900000040','1000040@qq.com','3499E63CEFFE9657CA3EBD5B2EED4BA7BC682769AEF61956E2DB973A7821CDC2','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000079','观','SU000040','street-view',1,'MXWR','View','V000001','/link/to/app','1'); -- REFER COUNT: 0
insert into user_app_data values('UA000080','My Account','SU000040','lock',1,'MXWR','SecUser','SU000040','/link/to/app','1'); -- REFER COUNT: 0
insert into sec_user_data values('SU000041','u000041','13900000041','1000041@qq.com','5331611C266C09941342104143C60F62F5970C5C3AEFBE757652EC3B25BD4AB6','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000081','员工','SU000041','blackberry',1,'MXWR','Employee','E000001','/link/to/app','1'); -- REFER COUNT: 12
insert into user_app_data values('UA000082','My Account','SU000041','lock',1,'MXWR','SecUser','SU000041','/link/to/app','1'); -- REFER COUNT: 12
insert into sec_user_data values('SU000042','u000042','13900000042','1000042@qq.com','02E80FABAEAA5501D22DAE06ACBDCAC3A394CAE41A9E43EA524380F31AEE6F1A','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000083','工作申请','SU000042','at',1,'MXWR','JobApplication','JA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000084','My Account','SU000042','lock',1,'MXWR','SecUser','SU000042','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000043','u000043','13900000043','1000043@qq.com','3D65069FCDFF474D645603E23033F7C1EAE55D5D7FDB1DA7A3259E3A649BF103','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000085','专业面试','SU000043','blind',1,'MXWR','ProfessionInterview','PI000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000086','My Account','SU000043','lock',1,'MXWR','SecUser','SU000043','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000044','u000044','13900000044','1000044@qq.com','B566A5804FDAB64CB05510E2E002F4A3B90D4456D877C350FBFF59611A9EEEC0','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000087','人力资源部面试','SU000044','battery-three-quarters',1,'MXWR','HrInterview','HI000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000088','My Account','SU000044','lock',1,'MXWR','SecUser','SU000044','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000045','u000045','13900000045','1000045@qq.com','655E5FD3A47AA4B348D1C24B18731BF1F2BC1289B383AFABFB6E45C989D37DC4','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000089','审批工作要约','SU000045','blogger-b',1,'MXWR','OfferApproval','OA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000090','My Account','SU000045','lock',1,'MXWR','SecUser','SU000045','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000046','u000046','13900000046','1000046@qq.com','EAF943DBC614662A229BFC93A06C8CF0660AC468A658FF9D80B85BA53FA19493','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000091','接受工作要约','SU000046','bluetooth',1,'MXWR','OfferAcceptance','OA000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000092','My Account','SU000046','lock',1,'MXWR','SecUser','SU000046','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000047','u000047','13900000047','1000047@qq.com','FF3474C70B540122783CCDF3C527A9A12126D1B352F0CB27BB4A4E2CD8A52287','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000093','员工入职','SU000047','bluetooth-b',1,'MXWR','EmployeeBoarding','EB000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000094','My Account','SU000047','lock',1,'MXWR','SecUser','SU000047','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000048','u000048','13900000048','1000048@qq.com','F4865BBD240B9CA4DE390BB217FAC9CA5F8E8064126CCDBC5D2766315A146658','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000095','评分','SU000048','bomb',1,'MXWR','Scoring','S000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000096','My Account','SU000048','lock',1,'MXWR','SecUser','SU000048','/link/to/app','1'); -- REFER COUNT: 1
insert into sec_user_data values('SU000049','u000049','13900000049','1000049@qq.com','ACA41CC807F339597F04579E3E8310FEC6AA442C9A8C610ED2156CCBD3B2B2C7','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000097','用户域','SU000049','user',1,'MXWR','UserDomain','UD000001','/link/to/app','1'); -- REFER COUNT: 2
insert into user_app_data values('UA000098','My Account','SU000049','lock',1,'MXWR','SecUser','SU000049','/link/to/app','1'); -- REFER COUNT: 2
insert into sec_user_data values('SU000050','u000050','13900000050','1000050@qq.com','4C89280A6409ED05BF483F63233AEE19C769F6AF9E7671E4BFAEE21A6D2FC1E0','9292993','2019-09-09 09:09:09','2019-09-09 09:09:09','UD000001',NULL,'INIT',1);
insert into user_app_data values('UA000099','用户屏蔽','SU000050','user',1,'MXWR','SecUserBlocking','SUB000001','/link/to/app','1'); -- REFER COUNT: 1
insert into user_app_data values('UA000100','My Account','SU000050','lock',1,'MXWR','SecUser','SU000050','/link/to/app','1'); -- REFER COUNT: 1




/*
| 角色        | 用户名           | 密码         |
| ------------- |:-------------:|:-------------------:|
|双链小超全国运营中心|13900000001|DoubleChain!y1|
|双链小超城市服务中心|13900000002|DoubleChain!y1|
|双链小超|13900000003|DoubleChain!y1|
|双链小超的创作|13900000004|DoubleChain!y1|
|生超招商|13900000005|DoubleChain!y1|
|生超的特许经营|13900000006|DoubleChain!y1|
|生超装修|13900000007|DoubleChain!y1|
|生超开业|13900000008|DoubleChain!y1|
|商店关闭|13900000009|DoubleChain!y1|
|生超会员|13900000010|DoubleChain!y1|
|消费者订单|13900000011|DoubleChain!y1|
|客户订单确认|13900000012|DoubleChain!y1|
|消费者的订单审批|13900000013|DoubleChain!y1|
|消费者的订单处理|13900000014|DoubleChain!y1|
|消费者的订单发货|13900000015|DoubleChain!y1|
|消费者订单交货|13900000016|DoubleChain!y1|
|供应订单|13900000017|DoubleChain!y1|
|供应订单确认|13900000018|DoubleChain!y1|
|供应订单审批|13900000019|DoubleChain!y1|
|供应订单处理|13900000020|DoubleChain!y1|
|供应订单拣货|13900000021|DoubleChain!y1|
|供应货|13900000022|DoubleChain!y1|
|供应订单交货|13900000023|DoubleChain!y1|
|生超的订单|13900000024|DoubleChain!y1|
|生超订单确认|13900000025|DoubleChain!y1|
|生超订单批准|13900000026|DoubleChain!y1|
|生超订单处理|13900000027|DoubleChain!y1|
|生超订单拣货|13900000028|DoubleChain!y1|
|生超订单出货|13900000029|DoubleChain!y1|
|生超订单交付|13900000030|DoubleChain!y1|
|仓库|13900000031|DoubleChain!y1|
|货物包装|13900000032|DoubleChain!y1|
|会计文件的创建|13900000033|DoubleChain!y1|
|会计的确认文件|13900000034|DoubleChain!y1|
|会计凭证的审核|13900000035|DoubleChain!y1|
|会计凭证过帐|13900000036|DoubleChain!y1|
|原始凭证制作|13900000037|DoubleChain!y1|
|原始凭证的确认|13900000038|DoubleChain!y1|
|原始凭证的审核|13900000039|DoubleChain!y1|
|观|13900000040|DoubleChain!y1|
|员工|13900000041|DoubleChain!y1|
|工作申请|13900000042|DoubleChain!y1|
|专业面试|13900000043|DoubleChain!y1|
|人力资源部面试|13900000044|DoubleChain!y1|
|审批工作要约|13900000045|DoubleChain!y1|
|接受工作要约|13900000046|DoubleChain!y1|
|员工入职|13900000047|DoubleChain!y1|
|评分|13900000048|DoubleChain!y1|
|用户域|13900000049|DoubleChain!y1|
|用户屏蔽|13900000050|DoubleChain!y1|


*/



/* start with data patch */
/* The sql file is not found from: /Users/Philip/githome/web-code-generator/sky/data-patch/retailscm.sql */


/*

+----------+---------------------------------+---------------------+--------+
| Charset  | Description                     | Default collation   | Maxlen |
+----------+---------------------------------+---------------------+--------+
| gb2312   | GB2312 Simplified Chinese       | gb2312_chinese_ci   |      2 |
| gbk      | GBK Simplified Chinese          | gbk_chinese_ci      |      2 |
| utf8mb4  | UTF-8 Unicode                   | utf8mb4_general_ci  |      4 |
| utf32    | UTF-32 Unicode                  | utf32_general_ci    |      4 |
| gb18030  | China National Standard GB18030 | gb18030_chinese_ci  |      4 |
+----------+---------------------------------+---------------------+--------+

*/
