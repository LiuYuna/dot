create table `sys_tenant`
(
    `id`          int unsigned primary key auto_increment,
    `tenant_id`   varchar(20) not null comment '租户ID',
    `tenant_name` varchar(20) not null comment '租户名称',
    `remark`      varchar(100) comment '备注',
    `status`      tinyint(1)          default 0 comment '租户状态（0：正常、1：禁用）',
    `create_by`   int unsigned comment '创建人ID',
    `update_by`   int unsigned comment '更新人ID',
    `create_time` datetime            default current_timestamp comment '创建时间',
    `update_time` datetime on update current_timestamp comment '更新时间',
    `is_deleted`  tinyint(1) unsigned default 0 comment '是否删除（0：未删除、1：已删除）'
) comment '租户表';

create table `sys_user`
(
    `id`          int unsigned primary key auto_increment,
    `tenant_id`   int unsigned comment '租户ID（为null代表是系统用户）',
    `nickname`    varchar(20) not null comment '昵称',
    `username`    varchar(20) not null unique comment '用户名',
    `password`    varchar(20) not null comment '密码',
    `email`       varchar(50) unique comment '邮箱',
    `telephone`   char(11) unique comment '手机号',
    `avatar_url`  varchar(100) comment '头像URL',
    `sex`         tinyint(1) unsigned default 0 comment '性别（0：未知、1：男、2：女）',
    `remark`      varchar(100) comment '备注',
    `status`      tinyint(1) unsigned default 0 comment '用户状态（0：正常、1：禁用）',
    `create_by`   int unsigned comment '创建人ID',
    `update_by`   int unsigned comment '更新人ID',
    `create_time` datetime            default current_timestamp comment '创建时间',
    `update_time` datetime on update current_timestamp comment '更新时间',
    `is_deleted`  tinyint(1) unsigned default 0 comment '是否删除（0：未删除、1：已删除）'
) comment '用户表';

create table `sys_config`
(
    `id`          int unsigned primary key auto_increment,
    `tenant_id`   int unsigned     not null comment '租户ID',
    `key`         varchar(50)      not null comment '配置键',
    `value`       varchar(100)     not null comment '配置值',
    `type`        tinyint unsigned not null comment '配置类型（YAML、JSON、TEXT、XML）',
    `description` varchar(100) comment '配置描述',
    `create_by`   int unsigned comment '创建人ID',
    `update_by`   int unsigned comment '更新人ID',
    `create_time` datetime            default current_timestamp comment '创建时间',
    `update_time` datetime on update current_timestamp comment '更新时间',
    `is_deleted`  tinyint(1) unsigned default 0 comment '是否删除（0：未删除、1：已删除）'
    -- TODO 添加字段
) comment '系统配置表';

create table `sys_login_config`
(
    `id`               int unsigned primary key auto_increment,
    `tenant_id`        int unsigned not null comment '租户ID',
    `user_id`          int unsigned not null comment '用户ID',
    `ipv4_blacklist`   text comment 'IPV4黑名单（在黑名单IP，无法登录系统）',
    `ipv6_blacklist`   text comment 'IPV6黑名单（在黑名单IP，无法登录系统）',
    `device_blacklist` text comment '设备黑名单（在黑名单设备，无法登录系统）',
    `is_enable_2fa`    tinyint(1) default 0 comment '是否开启双因子认证（0：关闭、1：开启）'
) comment '登录配置表';

create table `sys_login_log`
(
    `id`          int unsigned primary key auto_increment,
    `tenant_id`   int unsigned        not null comment '租户ID',
    `user_id`     int unsigned        not null comment '用户ID',
    `ipv4`        varchar(20) comment '登录IPV4',
    `ipv6`        varchar(50) comment '登录IPv6',
    `status`      tinyint(1) unsigned not null comment '登录状态',
    `create_time` datetime            default current_timestamp comment '登录时间',
    `is_deleted`  tinyint(1) unsigned default 0 comment '是否删除（0：未删除、1：已删除）'
) comment '登录日志表';