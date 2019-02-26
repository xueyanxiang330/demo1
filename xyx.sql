# 供应商表
CREATE TABLE `md_supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuan_id` int(11) NOT NULL DEFAULT '0' COMMENT '小暖ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `item_code` varchar(30) NOT NULL DEFAULT '' COMMENT '总部编码',
  `supplier_name` varchar(200) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `en_name` varchar(30) NOT NULL DEFAULT '' COMMENT '英文名',
  `simple_name` varchar(30) NOT NULL DEFAULT '' COMMENT '拼音简写',
  `tax_code` varchar(200) NOT NULL DEFAULT '' COMMENT '统一社会信用代码(营业执照编号)',
  `license_img` text COMMENT '营业执照照片(json)',
  `legal_name` varchar(30) NOT NULL DEFAULT '' COMMENT '法人代表',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '办公地址',
  `company_type` int(11) NOT NULL DEFAULT '0' COMMENT '企业类型',
  `register_capital` varchar(30) NOT NULL DEFAULT '' COMMENT '注册资本',
  `register_capital_currency` int(11) NOT NULL DEFAULT '0' COMMENT '注册资本币种',
  `service_province` text COMMENT '供应商服务区域(json)',
  `supplier_agent_authorization` text COMMENT '供应商代理授权',
  `is_dealer` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是经销商(1->是;0->否;)',
  `is_producer` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是生产商(1->是;0->否;)',
  `salesman_name` varchar(30) NOT NULL DEFAULT '' COMMENT '销售联系人',
  `salesman_mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '销售手机',
  `salesman_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '销售座机',
  `salesman_mail` varchar(30) NOT NULL DEFAULT '' COMMENT '销售邮箱',
  `company_establish_time` varchar(30) NOT NULL DEFAULT '' COMMENT '企业成立日期',
  `company_business_start_time` varchar(30) NOT NULL DEFAULT '' COMMENT '企业营业开始日期',
  `company_business_end_time` varchar(30) NOT NULL DEFAULT '' COMMENT '企业营业结束日期',
  `animal_license_code` varchar(30) NOT NULL DEFAULT '' COMMENT '兽医经营许可证编号',
  `animal_license_register_time` varchar(30) NOT NULL DEFAULT '' COMMENT '兽医经营许可证注册日期',
  `animal_license_start_time` varchar(30) NOT NULL DEFAULT '' COMMENT '兽医经营许可证开始日期',
  `animal_license_end_time` varchar(30) NOT NULL DEFAULT '' COMMENT '兽医经营许可证结束日期',
  `animal_license_img` text COMMENT '兽医经营许可证照片(json)',
  `finance_name` varchar(30) NOT NULL DEFAULT '' COMMENT '财务联系人',
  `finance_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '财务电话',
  `finance_mail` varchar(30) NOT NULL DEFAULT '' COMMENT '财务邮箱',
  `finance_bank` varchar(30) NOT NULL DEFAULT '' COMMENT '收款开户行',
  `finance_account` varchar(30) NOT NULL DEFAULT '' COMMENT '收款账号',
  `finance_account_name` varchar(30) NOT NULL DEFAULT '' COMMENT '收款户名',
  `finance_account_type` int(11) NOT NULL DEFAULT '0' COMMENT '收款账号性质',
  `finance_currency_type` int(11) NOT NULL DEFAULT '0' COMMENT '收款币种',
  `supplier_tax_code` varchar(30) NOT NULL DEFAULT '' COMMENT '供应商税号',
  `finance_invoice_type` int(11) NOT NULL DEFAULT '0' COMMENT '发票性质',
  `finance_invoice_tax_rate` varchar(30) NOT NULL DEFAULT '' COMMENT '发票税率',
  `pay_period_type` int(11) NOT NULL DEFAULT '0' COMMENT '结算周期',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注',
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否删除(0->未删除;1->已删除;)',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '供应商状态(1->启用;2->冻结;3->停用)',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '供应商类型标识(1->医院自建;2->总部下发)',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `operator_name` varchar(60) NOT NULL DEFAULT '' COMMENT '操作人',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `old_leader` varchar(30) NOT NULL DEFAULT '' COMMENT '负责人',
  `old_telephone` varchar(30) NOT NULL DEFAULT '' COMMENT '联系电话1',
  `old_fax_number` varchar(30) NOT NULL DEFAULT '' COMMENT '传真号码',
  `old_postal_code` varchar(30) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `old_scope_business` varchar(30) NOT NULL DEFAULT '' COMMENT '经营范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小暖供应商数据表';


# 产品类型
CREATE TABLE `md_product_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_code` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品类型编码',
  `type_name` varchar(255) NOT NULL DEFAULT '' COMMENT '产品类型名称',
  `category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '所属大类：1-库存类  2-服务类',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品类型表';

# 对象类型
CREATE TABLE `md_obj_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_type_code` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品类型编码',
  `product_type_name` varchar(15) NOT NULL DEFAULT '' COMMENT '产品类型名称',
  `obj_code` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对象类型编码',
  `obj_name` varchar(15) NOT NULL DEFAULT '' COMMENT '对象类型名称',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象类型表';

# 产品字段配置表
CREATE TABLE `md_column_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '产品类型',
  `obj_type` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对象类型',
  `obj_col` varchar(200) NOT NULL DEFAULT '' COMMENT '字段',
  `obj_col_name` varchar(200) NOT NULL DEFAULT '' COMMENT '字段名',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填 1 必填 0 非必填',
  `is_head_control` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否总部管控字段',
  `data_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '数据类型',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品字段配置表';

# 产品目录表
CREATE TABLE `md_product_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` int(11) NOT NULL COMMENT '产品类型',
  `org_id` int(11) unsigned NOT NULL COMMENT '医院ID',
  `nuan_id` int(11) unsigned NOT NULL COMMENT '小暖ID',
  `company_id` int(11) unsigned NOT NULL COMMENT '公司ID',
  `category_name` varchar(255) NOT NULL COMMENT '目录名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `item_code` varchar(100) NOT NULL DEFAULT '' COMMENT '总部编码',
  `category_level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '目录层级',
  `id_path` varchar(200) NOT NULL DEFAULT '' COMMENT '目录id路径',
  `name_path` varchar(200) NOT NULL DEFAULT '' COMMENT '目录名称路径',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已经删除',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品目录表';


# 产品表
CREATE TABLE `md_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` int(11) NOT NULL COMMENT '产品类型',
  `obj_type` int(11) NOT NULL DEFAULT '0' COMMENT '对象类型',
  `org_id` int(11) unsigned NOT NULL COMMENT '医院ID',
  `nuan_id` int(11) unsigned NOT NULL COMMENT '小暖ID',
  `company_id` int(11) unsigned NOT NULL COMMENT '公司ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目录编码',
  `category_name` varchar(100) NOT NULL DEFAULT '' COMMENT '目录名称',
  `item_code` varchar(50) NOT NULL DEFAULT '' COMMENT '总部编码',
  `product_name` varchar(200) NOT NULL DEFAULT '' COMMENT '产品名称',
  `pinyin_abbr` varchar(100) NOT NULL DEFAULT '' COMMENT '拼音简写',
  `english_name` varchar(200) NOT NULL DEFAULT '' COMMENT '英文名',
  `common_name` varchar(100) NOT NULL DEFAULT '' COMMENT '通用名',
  `brand_id` varchar(100) NOT NULL DEFAULT '' COMMENT '品牌id',
  `brand_name` varchar(200) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `img` varchar(300) NOT NULL DEFAULT '' COMMENT '产品图片--需要确定小暖端最大长度',
  `bar_code` varchar(20) NOT NULL DEFAULT '' COMMENT '条形码',
  `producer_id` varchar(100) NOT NULL DEFAULT '' COMMENT '生产商ID',
  `producer_name` varchar(200) NOT NULL DEFAULT '' COMMENT '生产商名称',
  `is_standard` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否标准产品',
  `sell_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '销售单价',
  `can_negative_stock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否允许零库存销售',
  `cost_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '成本价',
  `ref_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '入库含税参考价',
  `can_order` tinyint(2) NOT NULL DEFAULT '1' COMMENT '可订',
  `can_sell` tinyint(2) NOT NULL DEFAULT '1' COMMENT '可销',
  `disabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '停用',
  `store_unit_id` int(11) NOT NULL DEFAULT '0' COMMENT '出入库单位ID',
  `store_unit_name` varchar(50) NOT NULL DEFAULT '' COMMENT '出入库单位名称',
  `pack_specific` varchar(200) NOT NULL DEFAULT '' COMMENT '包装规格',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '备注／注意事项',
  `ingredient` varchar(200) NOT NULL DEFAULT '' COMMENT '药品成分',
  `handle_level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '处置等级',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐用药',
  `is_temp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否临时采购',
  `use_way_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用方式id',
  `use_way_name` varchar(50) NOT NULL DEFAULT '' COMMENT '使用方式名称',
  `dosing_way_id` int(11) NOT NULL DEFAULT '0' COMMENT '投药方式id',
  `dosing_way_name` varchar(50) NOT NULL DEFAULT '' COMMENT '投药方式名称',
  `not_banned` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否非禁',
  `have_batch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有批次',
  `not_control` tinyint(1) NOT NULL DEFAULT '1' COMMENT '非管控',
  `not_reusable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '非复用',
  `dosing_unit_id` int(11) NOT NULL DEFAULT '0' COMMENT '投药单位ID',
  `dosing_unit_name` varchar(50) NOT NULL DEFAULT '' COMMENT '投药单位名称',
  `specific_conversion` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '规格换算',
  `member_price` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT '会员价',
  `producer_inner_code` varchar(200) NOT NULL DEFAULT '' COMMENT '生产商内部编码--总部字段',
  `local_currency_id` int(11) NOT NULL DEFAULT '0' COMMENT '本位币id--总部字段',
  `local_currency_name` varchar(50) NOT NULL DEFAULT '' COMMENT '本位币名称--总部字段',
  `approval_sn` varchar(200) NOT NULL DEFAULT '' COMMENT '批准文号--总部字段',
  `producer_country_id` int(11) NOT NULL DEFAULT '0' COMMENT '生产国和地区id--总部字段',
  `producer_country` varchar(50) NOT NULL DEFAULT '' COMMENT '生产国和地区名称--总部字段',
  `is_validity_control` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否效期管理--总部字段',
  `validity_day` int(11) NOT NULL DEFAULT '0' COMMENT '效期:天',
  `dosage_by_weight_range` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否按体重范围设置单次用量',
  `dosage_by_weight_increment` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否按体重递增设置单次用量',
  `standard_dosage` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '标准体重投药量',
  `standard_weight` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '标准体重',
  `weight_incre_level` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '体重增量(体重每增加weight_incre_level，投药量增加dosage_incre_level)',
  `dosage_incre_level` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '标准差(体重每增加weight_incre_level，投药量增加的百分比)',
  `cate` int(11) NOT NULL DEFAULT '0' COMMENT '所属分类--医疗服务类产品字段',
  `service_scope` int(11) NOT NULL DEFAULT '0' COMMENT '服务范围--医疗服务类产品字段',
  `is_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否总部下发/是否下发管控',
  `is_price_control` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否价格管控',
  `rel_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关联类型',
  `service_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '服务状态 启用 1 停用 0',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_orgId_nuanId` (`org_id`,`nuan_id`) COMMENT '机构产品ID唯一索引',
  KEY `index_orgId_objType` (`org_id`,`obj_type`) COMMENT '机构产品对象类型索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主数据产品表';

# 药品投药量关联表
CREATE TABLE `md_product_dosage_by_weight` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_type` int(11) NOT NULL COMMENT '产品类型',
  `company_id` int(11) unsigned NOT NULL COMMENT '公司ID',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `org_id` int(11) unsigned NOT NULL COMMENT '医院ID',
  `single_dosage` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '单次用量',
  `min_weight` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '最小体重',
  `max_weight` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '最大体重',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='按体重设置单次用量';

# 模板表
CREATE TABLE `md_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuan_id` int(11) NOT NULL DEFAULT '0' COMMENT '小暖ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '模板价格',
  `source` tinyint(3) NOT NULL DEFAULT '1' COMMENT '来源（1=>自建，2=>连锁）',
  `template_name` varchar(255) NOT NULL COMMENT '模板名称',
  `template_type` int(11) NOT NULL COMMENT '模板类型（922001=>处方，922002=>实验室检查，922003=>影像学检查）',
  `template_code` varchar(255) NOT NULL COMMENT '编号',
  `diseases_id` int(11) DEFAULT NULL COMMENT '病种类型',
  `diseases_name` varchar(30) DEFAULT NULL COMMENT '病种类型名称',
  `template_desc` text COMMENT '适用说明',
  `template_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态是否删除启用（1=>启用，2=>删除）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '模板定价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板管理表';

# 模板详情表
CREATE TABLE `md_template_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品nuan_id',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `nuan_id` int(11) DEFAULT '0' COMMENT '暖ID',
  `product_name` varchar(255) NOT NULL COMMENT '产品名称',
  `specific` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '单价',
  `single_dose` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '单次用量',
  `dosing_unit_id` int(11) DEFAULT NULL COMMENT '投药单位',
  `dosing_unit_name` varchar(30) DEFAULT NULL COMMENT '投药单位名称',
  `time_day` int(11) NOT NULL COMMENT '次/天',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组合类型（1=>模板）',
  `status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '状态（1=>启用，2=>删除）',
  `template_id` int(11) NOT NULL COMMENT '模板关联ID',
  `total_number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `num_days` int(11) NOT NULL DEFAULT '1' COMMENT '天数',
  `group` int(11) DEFAULT NULL COMMENT '分组',
  `total_amount` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '总金额',
  `store_unit_id` int(11) DEFAULT NULL COMMENT '出库单位',
  `store_unit_name` varchar(32) DEFAULT NULL COMMENT '出入库单位名称',
  `dosing_way_id` int(11) DEFAULT '0' COMMENT '投药方式',
  `dosing_way_name` varchar(32) DEFAULT NULL COMMENT '投药方式描述',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板组合详情表';

# 单院套餐表
CREATE TABLE `md_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuan_id` int(11) NOT NULL DEFAULT '0' COMMENT '小暖ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `package_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `package_code` varchar(255) NOT NULL COMMENT '套餐编码',
  `original_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '套餐原价',
  `package_price` decimal(30,4) NOT NULL COMMENT '套餐定价',
  `package_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '套餐类型（1=>单院套餐，2=>连锁套餐）',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>正常,2=>已删除,3=>已过期,4=>已接收,5=>对于重置的删除',
  `change_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '单院可修改定价（1=>可以，2=>不可以）',
  `chain_package_id` int(11) DEFAULT NULL COMMENT '连锁套餐PID',
  `issued_id` int(11) DEFAULT NULL COMMENT '下发通知ID',
  `package_desc` text COMMENT '"适用说明"',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '连锁套餐开始生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '连锁套餐生效结束时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐列表';

# 套餐明细表
CREATE TABLE `md_package_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品nuan_id',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `nuan_id` int(11) DEFAULT '0' COMMENT '小暖ID',
  `product_name` varchar(255) NOT NULL COMMENT '产品名称',
  `specific` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '单价',
  `single_dose` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '单次用量',
  `dosing_unit_id` int(11) DEFAULT NULL COMMENT '投药单位',
  `dosing_unit_name` varchar(30) DEFAULT NULL COMMENT '投药单位名称',
  `time_day` int(11) NOT NULL COMMENT '次/天',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组合类型（1=>单院套餐，2=>连锁套餐）',
  `store_unit_id` int(11) DEFAULT NULL COMMENT '出库单位',
  `store_unit_name` varchar(32) DEFAULT NULL COMMENT '出入库单位名称',
  `status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '状态（1=>启用，2=>删除）',
  `package_id` int(11) NOT NULL COMMENT '套餐关联ID',
  `total_number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `num_days` int(11) NOT NULL DEFAULT '1' COMMENT '天数',
  `group` int(11) DEFAULT NULL COMMENT '分组',
  `total_amount` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '总金额',
  `dosing_way_id` int(11) DEFAULT NULL COMMENT '投药方式',
  `dosing_way_name` varchar(32) DEFAULT NULL COMMENT '投药方式描述',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐组合详情表';

# 连锁套餐表
CREATE TABLE `md_chain_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuan_id` int(11) NOT NULL DEFAULT '0' COMMENT '小暖ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `package_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `package_code` varchar(255) NOT NULL DEFAULT '' COMMENT '套餐编码',
  `original_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '套餐原价',
  `package_price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '套餐定价',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>正常,2=>已删除,3=>已下发,4=>已过期',
  `change_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '单院可修改定价（1=>可以，2=>不可以）',
  `package_desc` text COMMENT '适用说明',
  `chain_id` int(11) NOT NULL COMMENT '连锁ID',
  `chain_name` varchar(255) DEFAULT NULL COMMENT '连锁名称',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '连锁套餐开始生效时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '连锁套餐生效结束时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='连锁套餐列表';

# 连锁套餐明细表
CREATE TABLE `md_chain_package_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品nuan_id',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `nuan_id` int(11) NOT NULL DEFAULT '0' COMMENT '暖ID',
  `product_name` varchar(255) NOT NULL COMMENT '产品名称',
  `specific` varchar(255) DEFAULT NULL COMMENT '产品规格',
  `price` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '单价',
  `single_dose` decimal(19,5) NOT NULL DEFAULT '0.00000' COMMENT '单次用量',
  `dosing_unit_id` int(11) DEFAULT NULL COMMENT '投药单位',
  `dosing_unit_name` varchar(30) DEFAULT NULL COMMENT '投药单位名称',
  `store_unit_id` int(11) DEFAULT NULL COMMENT '出库单位',
  `store_unit_name` varchar(32) DEFAULT NULL COMMENT '出入库单位名称',
  `time_day` int(11) NOT NULL COMMENT '次/天',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '组合类型（1=>单院套餐，2=>连锁套餐）',
  `status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '状态（1=>启用，2=>删除）',
  `package_id` int(11) NOT NULL DEFAULT '0' COMMENT '套餐关联ID',
  `total_number` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `num_days` int(11) NOT NULL DEFAULT '1' COMMENT '天数',
  `group` int(11) DEFAULT NULL COMMENT '分组',
  `total_amount` decimal(30,4) NOT NULL DEFAULT '0.0000' COMMENT '总金额',
  `dosing_way_id` int(11) DEFAULT NULL COMMENT '投药方式',
  `dosing_way_name` varchar(32) DEFAULT NULL COMMENT '投药方式描述',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='连锁套餐组合详情表';

# 连锁套餐下发通知中间表
CREATE TABLE `md_package_issued` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) DEFAULT NULL COMMENT '生成的单院套餐ID',
  `chain_package_id` int(11) NOT NULL COMMENT '连锁套餐ID',
  `package_name` varchar(255) NOT NULL COMMENT '连锁套餐名称',
  `chain_id` int(11) DEFAULT '0' COMMENT '连锁ID',
  `center_hospital_id` int(11) NOT NULL COMMENT '中心医院ID',
  `company_id` int(11) NOT NULL COMMENT '中心医院公司ID',
  `receive_hospital_id` int(11) NOT NULL COMMENT '接收医院ID',
  `notice_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '下发通知状态（1=>未接收，2=>已接收，3=>已失效，4=>已删除）',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modify` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='下发操作中间通知表';

# 化验指标设置表
CREATE TABLE `md_assay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nuan_id` int(11) DEFAULT '0' COMMENT '化验指标ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `category_id` varchar(30) NOT NULL DEFAULT '' COMMENT '目录ID',
  `item_code` varchar(30) NOT NULL DEFAULT '' COMMENT '总部编码',
  `assay_name` varchar(200) NOT NULL DEFAULT '' COMMENT '化验名称',
  `unit_id` int(11) NOT NULL DEFAULT '0' COMMENT '单位ID',
  `unit_name` varchar(30) NOT NULL DEFAULT '' COMMENT '单位名称',
  `min` varchar(30) NOT NULL DEFAULT '' COMMENT '最小值',
  `max` varchar(30) NOT NULL DEFAULT '' COMMENT '最大值',
  `remark` varchar(2000) NOT NULL DEFAULT '' COMMENT '注意事项/备注',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '化验类型(1->自动项目;2->手动项目)',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='化验指标设置表';

# 关联化验指标表
CREATE TABLE `md_service_relation_assay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品nuan_iD',
  `product_type` int(11) NOT NULL DEFAULT '0' COMMENT '产品类型',
  `obj_type` int(11) DEFAULT '0' COMMENT '产品对象类型',
  `relation_assay_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联化验设置nuan_ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_PRODUCT_ID` (`product_id`) COMMENT '产品ID普通索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务类/非服务类产品关联化验设置表';

# 关联产品表
CREATE TABLE `md_service_relation_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品nuan_ID',
  `product_type` int(11) NOT NULL DEFAULT '0' COMMENT '产品类型',
  `obj_type` int(11) DEFAULT '0' COMMENT '产品对象类型',
  `relation_product_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联产品nuan_id',
  `relation_product_name` varchar(200) NOT NULL DEFAULT '' COMMENT '关联产品名称',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `dosage_once` int(11) NOT NULL DEFAULT '0' COMMENT '单次用量',
  `times_one_day` int(11) NOT NULL DEFAULT '0' COMMENT '次/天',
  `days` int(11) NOT NULL DEFAULT '0' COMMENT '天数',
  `dosing_way_id` int(11) NOT NULL DEFAULT '0' COMMENT '用法',
  `is_must` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否必选项(0->非必选;1->必选)',
  `is_add` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否费用累加项(0->非累加;1->累加)',
  `add_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `last_modify` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_PRODUCT_ID` (`product_id`) COMMENT '产品ID普通索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务类/非服务类产品关联项目表';

#通用日志表
CREATE TABLE `md_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT 'HTTP请求方法',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '请求控制器名称',
  `action` varchar(70) NOT NULL DEFAULT '' COMMENT '请求操作名称',
  `request_content_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'HTTP请求的数据格式',
  `http_referer` varchar(255) NOT NULL DEFAULT '' COMMENT 'http来源地址',
  `params` varchar(500) NOT NULL DEFAULT '' COMMENT '请求参数 JSON格式存储',
  `cookies` varchar(500) NOT NULL DEFAULT '' COMMENT 'cookie数据 JSON格式存储',
  `sessions` varchar(500) NOT NULL DEFAULT '' COMMENT '服务端SESSION数据 JSON格式存储',
  `host_name` varchar(50) NOT NULL DEFAULT '' COMMENT '服务器主机域名',
  `host_port` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '服务器主机端口号',
  `user_host` varchar(50) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '客户端用户ip地址 未来可以考虑使用int保存',
  `request_duration` float NOT NULL DEFAULT '0' COMMENT '服务端处理时长',
  `db_duration` float NOT NULL DEFAULT '0' COMMENT '数据库查询总时长',
  `curl_duration` float NOT NULL DEFAULT '0' COMMENT 'cURL远程请求总时长',
  `exception_name` varchar(50) NOT NULL DEFAULT '' COMMENT '服务端异常名称',
  `exception_message` varchar(500) NOT NULL DEFAULT '' COMMENT '异常信息',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名称',
  `orgid` int(11) NOT NULL DEFAULT '0' COMMENT '机构(医院)id',
  `client_edtion` varchar(20) NOT NULL DEFAULT '' COMMENT '小暖客户端发行版标识',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='md系统请求日志表';

# 权限表
CREATE TABLE `md_user_operate_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_code` varchar(255) NOT NULL COMMENT '菜单权限的编码',
  `auth_name` varchar(255) NOT NULL COMMENT '菜单权限的名字',
  `class_name` varchar(100) NOT NULL DEFAULT '' COMMENT '对应的操作的类名,  前面带着目录避免重复，例如：Log/Lists',
  `extra_type` varchar(255) NOT NULL DEFAULT '' COMMENT '额外类型参数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '权限是否失效 0代表失效  1代表启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY ` INDEX_CLASS_NAME` (`class_name`) COMMENT '路径索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主数据用户操作权限表';

# menu配置表
CREATE TABLE `md_menu_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `brand_id` int(11) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT 'menu编码',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'menu名称',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'menu 类型',
  `parent_code` varchar(100) NOT NULL DEFAULT '' COMMENT '父级编码',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  `auth_code` varchar(255) NOT NULL DEFAULT '' COMMENT '权限点编码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0 禁用 1 启用',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `INDEX_MENU_CODE` (`code`) COMMENT 'menu编码索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='menu配置';





