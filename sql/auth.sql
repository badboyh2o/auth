prompt PL/SQL Developer import file
prompt Created on 2020年4月8日 by LXH
set feedback off
set define off
prompt Creating SYS_DICTIONARY...
create table SYS_DICTIONARY
(
  id            NUMBER(18) not null,
  dict_name     VARCHAR2(40) not null,
  dict_key      VARCHAR2(40) not null,
  dict_value    VARCHAR2(128) not null,
  remark        VARCHAR2(128),
  update_time   DATE default sysdate,
  creation_time DATE default sysdate not null
)
;
comment on table SYS_DICTIONARY
  is '数据字典表';
comment on column SYS_DICTIONARY.id
  is 'ID主键';
comment on column SYS_DICTIONARY.dict_name
  is '字典名称';
comment on column SYS_DICTIONARY.dict_key
  is '字典key';
comment on column SYS_DICTIONARY.dict_value
  is '字典value';
comment on column SYS_DICTIONARY.remark
  is '备注';
comment on column SYS_DICTIONARY.update_time
  is '更新时间';
comment on column SYS_DICTIONARY.creation_time
  is '创建时间';
create index DICT_KEY_INDEX on SYS_DICTIONARY (DICT_KEY);
create index DICT_NAME_INDEX on SYS_DICTIONARY (DICT_NAME);
alter table SYS_DICTIONARY
  add primary key (ID);

prompt Creating SYS_LOGIN_LOG...
create table SYS_LOGIN_LOG
(
  id            NUMBER(18) not null,
  username      VARCHAR2(64) not null,
  ip_address    VARCHAR2(32) not null,
  equipment     VARCHAR2(32) not null,
  extend1       VARCHAR2(64),
  extend2       VARCHAR2(128),
  creation_time DATE default sysdate,
  path          VARCHAR2(256)
)
;
comment on table SYS_LOGIN_LOG
  is '用户登录记录表';
comment on column SYS_LOGIN_LOG.id
  is '编号';
comment on column SYS_LOGIN_LOG.username
  is '登录用户';
comment on column SYS_LOGIN_LOG.ip_address
  is '登录IP地址';
comment on column SYS_LOGIN_LOG.equipment
  is '登录的设备';
comment on column SYS_LOGIN_LOG.extend1
  is '扩展字段1';
comment on column SYS_LOGIN_LOG.extend2
  is '扩展字段2';
comment on column SYS_LOGIN_LOG.creation_time
  is '登录时间	审计字段';
comment on column SYS_LOGIN_LOG.path
  is '登录日志路径';
create index LOG_EQUIPMENT_INDEX on SYS_LOGIN_LOG (EQUIPMENT);
create index LOG_IP_ADDRESS_INDEX on SYS_LOGIN_LOG (IP_ADDRESS);
create index LOG_USERNAME_INDEX on SYS_LOGIN_LOG (USERNAME);
alter table SYS_LOGIN_LOG
  add primary key (ID);

prompt Creating SYS_OPERAT_LOG...
create table SYS_OPERAT_LOG
(
  id            NUMBER(18) not null,
  account       VARCHAR2(64) not null,
  channel       VARCHAR2(32) not null,
  trans_code    VARCHAR2(32) not null,
  push          VARCHAR2(32) not null,
  ip_address    VARCHAR2(32) not null,
  extend1       VARCHAR2(64),
  extend2       VARCHAR2(128),
  creation_time DATE default sysdate not null,
  path          VARCHAR2(256)
)
;
comment on table SYS_OPERAT_LOG
  is '用户操作权限记录表';
comment on column SYS_OPERAT_LOG.id
  is '编号';
comment on column SYS_OPERAT_LOG.account
  is '登录用户';
comment on column SYS_OPERAT_LOG.channel
  is '渠道';
comment on column SYS_OPERAT_LOG.trans_code
  is '交易码';
comment on column SYS_OPERAT_LOG.push
  is '接口';
comment on column SYS_OPERAT_LOG.ip_address
  is '登录IP地址';
comment on column SYS_OPERAT_LOG.extend1
  is '扩展字段1';
comment on column SYS_OPERAT_LOG.extend2
  is '扩展字段2';
comment on column SYS_OPERAT_LOG.creation_time
  is '登录时间	审计字段';
comment on column SYS_OPERAT_LOG.path
  is '操作路径';
alter table SYS_OPERAT_LOG
  add primary key (ID);

prompt Creating SYS_ORG...
create table SYS_ORG
(
  id            NUMBER(18) not null,
  org_no        VARCHAR2(32) not null,
  name          VARCHAR2(64) not null,
  parent_id     VARCHAR2(32),
  adress        VARCHAR2(256),
  path          VARCHAR2(256) not null,
  org_level     NUMBER(5) not null,
  org_lvl2_id   VARCHAR2(32),
  area          VARCHAR2(3),
  remark        VARCHAR2(256),
  status        VARCHAR2(3) not null,
  extend1       VARCHAR2(64),
  extend2       VARCHAR2(128),
  creation_time DATE default sysdate not null,
  update_time   DATE default sysdate
)
;
comment on table SYS_ORG
  is '机构表';
comment on column SYS_ORG.id
  is 'ID主键';
comment on column SYS_ORG.org_no
  is '机构编号';
comment on column SYS_ORG.name
  is '机构名称';
comment on column SYS_ORG.parent_id
  is '上级机构ID';
comment on column SYS_ORG.adress
  is '机构地址';
comment on column SYS_ORG.path
  is '机构路径';
comment on column SYS_ORG.org_level
  is '机构等级 1省行，2省部门，3二级行，4网点部门，5网点';
comment on column SYS_ORG.org_lvl2_id
  is '所属二级行机构号';
comment on column SYS_ORG.area
  is '机构所属区域';
comment on column SYS_ORG.remark
  is '备注';
comment on column SYS_ORG.status
  is '机构状态  1可用；0不可用';
comment on column SYS_ORG.extend1
  is '扩展字段1';
comment on column SYS_ORG.extend2
  is '扩展字段2';
comment on column SYS_ORG.creation_time
  is '创建时间--  审计字段';
comment on column SYS_ORG.update_time
  is '更新时间--  审计字段';
create index NAME_INDEX on SYS_ORG (NAME);
create index ORG_LEVEL_INDEX on SYS_ORG (ORG_LEVEL);
create index ORG_STATUS on SYS_ORG (STATUS);
create index PATH_INDEX on SYS_ORG (PATH);
alter table SYS_ORG
  add primary key (ID);
alter table SYS_ORG
  add constraint ORG_NO_ONLY unique (ORG_NO);

prompt Creating SYS_PERMISSION...
create table SYS_PERMISSION
(
  id            NUMBER(18) not null,
  name          VARCHAR2(32) not null,
  parent_id     NUMBER(18),
  path          VARCHAR2(256) not null,
  url           VARCHAR2(64),
  big_icon      VARCHAR2(128),
  small_icon    VARCHAR2(128),
  sorting       NUMBER(5),
  type          VARCHAR2(3) not null,
  status        VARCHAR2(3) not null,
  extend1       VARCHAR2(64),
  extend2       VARCHAR2(128),
  creation_time DATE default sysdate not null,
  update_time   DATE default sysdate,
  hide          VARCHAR2(1)
)
;
comment on table SYS_PERMISSION
  is '权限表';
comment on column SYS_PERMISSION.id
  is '权限ID';
comment on column SYS_PERMISSION.name
  is '名称';
comment on column SYS_PERMISSION.parent_id
  is '权限的父ID';
comment on column SYS_PERMISSION.path
  is '路径';
comment on column SYS_PERMISSION.url
  is 'URL地址';
comment on column SYS_PERMISSION.big_icon
  is '大图标地址';
comment on column SYS_PERMISSION.small_icon
  is '小图标地址';
comment on column SYS_PERMISSION.sorting
  is '排序';
comment on column SYS_PERMISSION.type
  is '类型.1分类，2菜单，3操作';
comment on column SYS_PERMISSION.status
  is '权限状态	0:不可用；1可用；当置0时，该权限下的所有子权限均不可用';
comment on column SYS_PERMISSION.extend1
  is '扩展字段1';
comment on column SYS_PERMISSION.extend2
  is '扩展字段2';
comment on column SYS_PERMISSION.creation_time
  is '创建时间	审计字段';
comment on column SYS_PERMISSION.update_time
  is '更新时间	审计字段';
comment on column SYS_PERMISSION.hide
  is '是否隐藏，1是，0否';
create index NAME_IND on SYS_PERMISSION (NAME);
create index PATH_IND on SYS_PERMISSION (PATH);
create index STATUS_IND on SYS_PERMISSION (STATUS);
create index TYPE_IND on SYS_PERMISSION (TYPE);
alter table SYS_PERMISSION
  add primary key (ID);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  id            NUMBER(18) not null,
  role_no       VARCHAR2(32) not null,
  name          VARCHAR2(32) not null,
  eng_name      VARCHAR2(32),
  status        VARCHAR2(3) not null,
  extend1       VARCHAR2(64),
  extend2       VARCHAR2(128),
  creation_time DATE default sysdate not null,
  update_time   DATE default sysdate
)
;
comment on table SYS_ROLE
  is '角色表';
comment on column SYS_ROLE.id
  is '编号';
comment on column SYS_ROLE.role_no
  is '角色编号';
comment on column SYS_ROLE.name
  is '角色名称';
comment on column SYS_ROLE.eng_name
  is '角色英文名称';
comment on column SYS_ROLE.status
  is '状态	0不可用，1可用';
comment on column SYS_ROLE.extend1
  is '扩展字段1';
comment on column SYS_ROLE.extend2
  is '扩展字段2';
comment on column SYS_ROLE.creation_time
  is '创建时间	审计字段';
comment on column SYS_ROLE.update_time
  is '更新时间	审计字段';
create index ROLE_NAME_INDEX on SYS_ROLE (NAME);
create index ROLE_STATUS_INDEX on SYS_ROLE (STATUS);
alter table SYS_ROLE
  add primary key (ID);
alter table SYS_ROLE
  add constraint ROLE_NO_ONLY unique (ROLE_NO);

prompt Creating SYS_ROLE_PERMISSION...
create table SYS_ROLE_PERMISSION
(
  role_id       NUMBER(18) not null,
  permission_id NUMBER(18) not null
)
;
comment on table SYS_ROLE_PERMISSION
  is '角色权限表';
comment on column SYS_ROLE_PERMISSION.role_id
  is '角色ID';
comment on column SYS_ROLE_PERMISSION.permission_id
  is '权限ID';
alter table SYS_ROLE_PERMISSION
  add primary key (ROLE_ID, PERMISSION_ID);

prompt Creating SYS_USER...
create table SYS_USER
(
  id              NUMBER(18) not null,
  username        VARCHAR2(64) not null,
  password        VARCHAR2(64),
  name            VARCHAR2(20) not null,
  org_no          VARCHAR2(32) not null,
  phone_no        VARCHAR2(12),
  landline        VARCHAR2(11),
  id_card         VARCHAR2(18),
  email           VARCHAR2(32),
  adress          VARCHAR2(256),
  zip_code        VARCHAR2(6),
  status          VARCHAR2(3) not null,
  extend1         VARCHAR2(64),
  extend2         VARCHAR2(128),
  login_time      VARCHAR2(7),
  last_login_time DATE,
  error_count     NUMBER(5),
  creation_time   DATE default sysdate not null,
  update_time     DATE default sysdate,
  sex             VARCHAR2(1) default 0
)
;
comment on table SYS_USER
  is '用户表';
comment on column SYS_USER.id
  is 'ID主键';
comment on column SYS_USER.username
  is '帐号';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.name
  is '用户名称';
comment on column SYS_USER.org_no
  is '所属机构ID';
comment on column SYS_USER.phone_no
  is '手机号--11位，加区位';
comment on column SYS_USER.landline
  is '固定号码--三个区位，加分隔线，加7位坐机号';
comment on column SYS_USER.id_card
  is '身份证';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.adress
  is '地址';
comment on column SYS_USER.zip_code
  is '邮政编码';
comment on column SYS_USER.status
  is '状态 0废止；1可用；2临时锁定；3：永久锁定';
comment on column SYS_USER.extend1
  is '扩展字段1';
comment on column SYS_USER.extend2
  is '扩展字段2';
comment on column SYS_USER.login_time
  is '本次登录时间';
comment on column SYS_USER.last_login_time
  is '上一次登录时间';
comment on column SYS_USER.error_count
  is '当天登录错误次数';
comment on column SYS_USER.creation_time
  is '创建时间 审计字段';
comment on column SYS_USER.update_time
  is '更新时间 审计字段';
comment on column SYS_USER.sex
  is '性别，默认0；0保密；1男；2女';
create index ORG_NO_INDEX on SYS_USER (ORG_NO);
create index STATUS_INDEX on SYS_USER (STATUS);
create index USER_NAME_INDEX on SYS_USER (NAME);
alter table SYS_USER
  add primary key (ID);
alter table SYS_USER
  add constraint USERNAME_ONLY unique (USERNAME);

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  user_id NUMBER(18) not null,
  role_id NUMBER(18) not null
)
;
comment on table SYS_USER_ROLE
  is '用户角色表';
comment on column SYS_USER_ROLE.user_id
  is '编号';
comment on column SYS_USER_ROLE.role_id
  is '角色编号';
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);

prompt Loading SYS_DICTIONARY...
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148624621047808, 'userSex', '2', '女', '用户性别', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148502029930496, 'userSex', '0', '保密', '用户性别', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148571764428800, 'userSex', '1', '男', '用户性别', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408260, 'userStatus', '3', '永久锁定', '用户状态', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:30:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408257, 'userStatus', '0', '废止', '用户状态', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:27:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408258, 'userStatus', '1', '正常', '用户状态', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:28:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408259, 'userStatus', '2', '临时锁定', '用户状态', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:29:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408261, 'menuType', '1', '分类', '菜单类型', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:20:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408262, 'menuType', '2', '菜单', '菜单类型', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:21:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408263, 'menuType', '3', '操作', '菜单类型', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:21:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331321697636352, 'menuStatus', '1', '正常', '菜单状态', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331472684191744, 'menuType', '1', '分类', '菜单类型', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331121763553280, 'menuStatus', '0', '废除', '菜单状态', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331584705662976, 'menuType', '2', '菜单', '菜单类型', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56332047601635328, 'menuType', '3', '操作', '菜单类型', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56335232814813184, 'userStatus', '0', '废止', '用户字典', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395793250390016, 'userStatus', '1', '正常', '用户字典', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395074342490112, 'roleStatus', '0', '废弃', '角色字典', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395268521988096, 'roleStatus', '1', '正常', '角色字典', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396284978008064, 'orgStatus', '0', '废止', '机构字典', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396499743150080, 'orgStatus', '1', '正常', '机构备注', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397087235117056, 'orgType', '2', '省行部门', '机构分类', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397195368468480, 'orgType', '3', '二级行', '机构分类', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397385911504896, 'orgType', '4', '二级行部门', '机构分类', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397482695069696, 'orgType', '5', '网点', '机构分类', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56423409072214016, 'hiddenStatus', '1', '是', '菜单隐藏', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396894284550144, 'orgType', '1', '省行', '机构分类', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56423297952518144, 'hiddenStatus', '0', '否', '菜单隐藏', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
commit;
prompt 28 records loaded
prompt Loading SYS_LOGIN_LOG...
prompt Table is empty
prompt Loading SYS_OPERAT_LOG...
prompt Table is empty
prompt Loading SYS_ORG...
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803567255162880, '440380000', '广州分行营业部', '440000000', null, '440000000.440380000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803599110901760, '440400000', '广州越秀支行', '440000000', null, '440000000.440400000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803626189328384, '440450000', '广州荔湾支行', '440000000', null, '440000000.440450000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803658988785664, '440690000', '茂名市分行', '440000000', null, '440000000.440690000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803695118520320, '440700000', '肇庆市分行', '440000000', null, '440000000.440700000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803727599210496, '440760000', '清远市分行', '440000000', null, '440000000.440760000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601472, '440102574', '广东省分行营业渠道管理部', '440000000', null, '440000000.440102574', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601473, '440102635', '广东省分行放款中心', '440000000', null, '440000000.440102635', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601474, '440102842', '广东省分行投资托管业务部（养老金业务部）', '440000000', null, '440000000.440102842', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601475, '440270001', '广东省分行营运管理部', '440000000', null, '440000000.440270001', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601476, '440270003', '广东省分行个人贷款中心', '440000000', null, '440000000.440270003', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137920, '440101828', '清远连州支行个人贷款中心', '440760000', null, '440000000.440760000.440101828', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137921, '440101475', '清远广清大道支行', '440760000', null, '440000000.440760000.440101475', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137922, '440760002', '清远市分行人力资源与渠道管理部', '440760000', null, '440000000.440760000.440760002', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137923, '440760007', '清远市分行公司与跨境客户部', '440760000', null, '440000000.440760000.440760007', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137924, '440760009', '清远市分行住房与消费信贷部', '440760000', null, '440000000.440760000.440760009', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51957891858698240, '12341234', '广州天河支行', '440000000', null, '12341234', 3, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833217, '440700045', '肇庆市分行私人银行', '440700000', null, '440000000.440700000.440700045', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833218, '440700801', '肇庆市分行营运管理部', '440700000', null, '440000000.440700000.440700801', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51959366177525760, '123456', '天河支行', '440000000', '科韵路22号', '123456', 3, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833220, '440707203', '肇庆四会建城分理处', '440700000', null, '440000000.440700000.440707203', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51961395683790848, '3463456', '34563456', '440000000', null, '3463456', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51964253577678848, '2434', '234', '440000000', '23423', '2434', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499011, '440460801', '广州芳村支行', '440450000', null, '440000000.440450000.440460801', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:29:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499008, '440450699', '广州荔湾支行渠道与运营管理部', '440450000', null, '440000000.440450000.440450699', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803496279150592, '440470000', '广州开发区支行rfr', '440000000', 'fffr34f43f343443f', '440000000.440470000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803534619283456, '440560000', '广州从化支行', '440000000', null, '440000000.440560000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499009, '440450807', '广州中山八路支行', '440450000', null, '440000000.440450000.440450807', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51964366651920384, '234', '234', '440000000', '234', '234', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53135495420710912, '341500', '赣州分行', '440000000', '赣州市章贡区站前大道155号', '341500', 3, null, null, null, '1', null, null, to_date('30-12-2019', 'dd-mm-yyyy'), to_date('30-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (45113081147428864, '440000000', '广东省行', null, null, '440000000', 1, null, null, null, '1', null, null, to_date('08-12-2019 11:43:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 11:43:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (49548025265393664, '3333', '333', '440000000', null, '49548025265393664', 2, null, null, null, '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (49548162964393984, '555', '555', '440000000', '555', '49548162964393984', 2, null, null, null, '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51626840426811392, '4401103', '广州天河支行', '440000000', null, '4401103', 2, null, null, null, '1', null, null, to_date('26-12-2019', 'dd-mm-yyyy'), to_date('26-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51625960449249280, '440470001', '广州天河支行lm', '440000000', null, '440470001', 3, null, null, null, '1', null, null, to_date('26-12-2019', 'dd-mm-yyyy'), to_date('26-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53585858170982400, '44433', '3333', '440000000', null, '44433', 2, null, null, null, '1', null, null, to_date('31-12-2019', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53591980730748928, '5555', '5555', '440000000', null, '5555', 2, null, null, null, '1', null, null, to_date('31-12-2019', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'));
commit;
prompt 37 records loaded
prompt Loading SYS_PERMISSION...
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60405194038710272, '运维管理', null, '60405194038710272', '运维管理', null, '&#xe609;', 2, '1', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60405491620384768, '操作日志', 60405194038710272, '60405194038710272.60405491620384768', 'views/operat.html', null, null, null, '2', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'), null);
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60418316774412288, '登录日志', 60405194038710272, '60405194038710272.60418316774412288', 'views/logs.html', null, null, null, '2', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'), null);
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425839277117440, '查询', 56021134315098112, '44932177716318208.56021134315098112.56425839277117440', 'api/dict/query', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425544627261440, '更新字典', 56021134315098112, '44932177716318208.56021134315098112.56425544627261440', 'api/dict/update', null, null, 2, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425672901660672, '删除', 56021134315098112, '44932177716318208.56021134315098112.56425672901660672', 'api/dict/delete', null, null, 3, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50626462239428608, '查询', 44940134503944192, '44932177716318208. 44940134503944192.50626462239428608', 'api/org/query', null, null, 2, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('07-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628479758372864, '获取机构树', 44940134503944192, '44932177716318208. 44940134503944192.50628479758372864', 'api/org/queryTree', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628580316811264, '添加', 44940134503944192, '44932177716318208. 44940134503944192.50628580316811264', 'api/org/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628659857592320, '删除', 44940134503944192, '44932177716318208. 44940134503944192.50628659857592320', 'api/org/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628743391350784, '更新', 44940134503944192, '44932177716318208. 44940134503944192.50628743391350784', 'api/org/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628836580397056, '获取指定机构信息', 44940134503944192, '44932177716318208. 44940134503944192.50628836580397056', 'api/org/getOrg', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629558780825600, '查询', 44941535116267520, '44932177716318208. 44941535116267520.50629558780825600', 'api/user/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629649600090112, '获取指定用户信息', 44941535116267520, '44932177716318208. 44941535116267520.50629649600090112', 'api/user/getUser', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629714175594496, '新增', 44941535116267520, '44932177716318208. 44941535116267520.50629714175594496', 'api/user/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629790860054528, '删除', 44941535116267520, '44932177716318208. 44941535116267520.50629790860054528', 'api/user/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629866978283520, '更新', 44941535116267520, '44932177716318208. 44941535116267520.50629866978283520', 'api/user/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630062453821440, '获取可授权的角色列表', 44941535116267520, '44932177716318208. 44941535116267520.50630062453821440', 'api/user/getUserRoles', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630136793665536, '授权', 44941535116267520, '44932177716318208. 44941535116267520.50630136793665536', 'api/user/grant', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630527065264128, '查询', 44941855632396288, '44932177716318208.44941855632396288.50630527065264128', 'api/role/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630612352241664, '新增', 44941855632396288, '44932177716318208.44941855632396288.50630612352241664', 'api/role/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630668090347520, '删除', 44941855632396288, '44932177716318208.44941855632396288.50630668090347520', 'api/role/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630731898294272, '更新', 44941855632396288, '44932177716318208.44941855632396288.50630731898294272', 'api/role/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630822918885376, '获取指定角色权限', 44941855632396288, '44932177716318208.44941855632396288.50630822918885376', 'api/role/getRolePermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630927495467008, '更新角色权限', 44941855632396288, '44932177716318208.44941855632396288.50630927495467008', 'api/role/updateRolePermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631013436755968, '获取指定角色信息', 44941855632396288, '44932177716318208.44941855632396288.50631013436755968', 'api/role/getRole', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631819405824000, '查询', 44942077875982336, '44932177716318208.44942077875982336.50631819405824000', 'api/menu/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631894458699776, '查询菜单树', 44942077875982336, '44932177716318208.44942077875982336.50631894458699776', 'api/menu/queryTree', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631972745383936, '删除', 44942077875982336, '44932177716318208.44942077875982336.50631972745383936', 'api/menu/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50632048247050240, '更新', 44942077875982336, '44932177716318208.44942077875982336.50632048247050240', 'api/menu/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50632115829870592, '获取指定权限', 44942077875982336, '44932177716318208.44942077875982336.50632115829870592', 'api/menu/getPermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (75726481803972608, '操作日志查询', 60405491620384768, '60405194038710272.60405491620384768.75726481803972608', 'api/operat/query', null, null, 2, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50659579247464448, '查询菜单', 63681225541554176, '44932177716318208.63681225541554176.50659579247464448', 'api/index/queryMenu', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44932177716318208, '系统管理', null, '44932177716318208', null, null, '&#xe770;', 1, '1', '1', null, null, to_date('07-12-2019 23:48:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-03-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44940134503944192, '机构管理', 44932177716318208, '44932177716318208. 44940134503944192', 'views/orgs.html', null, null, 0, '2', '1', null, null, to_date('08-12-2019 00:17:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44941535116267520, '用户管理', 44932177716318208, '44932177716318208. 44941535116267520', 'views/users.html', null, null, 3, '2', '1', null, null, to_date('08-12-2019 00:22:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:22:06', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44941855632396288, '角色管理', 44932177716318208, '44932177716318208.44941855632396288', 'views/roles.html', null, null, 4, '2', '1', null, null, to_date('08-12-2019 00:23:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:23:22', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44942077875982336, '权限管理', 44932177716318208, '44932177716318208.44942077875982336', 'views/menu.html', null, null, 5, '2', '1', null, null, to_date('08-12-2019 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (49535597806882816, '新增', 44942077875982336, '44932177716318208.44942077875982336.49535597806882816', 'api/menu/add', null, null, 33, '3', '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56105372565639168, '修改密码', 63681225541554176, '44932177716318208.63681225541554176.56105372565639168', 'api/index/modifyPassword', null, null, 1, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56021134315098112, '字典管理', 44932177716318208, '44932177716318208.56021134315098112', 'views/dictonary.html', null, null, 6, '2', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56350442212560896, '新增', 56021134315098112, '44932177716318208.56021134315098112.56350442212560896', 'api/dict/add', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (63681225541554176, '隐藏菜单', null, '63681225541554176', null, null, null, 0, '1', '1', null, null, to_date('28-01-2020', 'dd-mm-yyyy'), to_date('28-01-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56449599556292608, '获取字典数据', 63681225541554176, '44932177716318208.63681225541554176.56449599556292608', 'api/index/getDictValue', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56062104234627072, '获取当前登录者的信息', 63681225541554176, '44932177716318208.63681225541554176.56062104234627072', 'api/index/getLoginUser', null, null, 1, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56062219687038976, '更新权限名称', 63681225541554176, '44932177716318208.63681225541554176.56062219687038976', 'api/index/updateLoginUser', null, null, 2, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (75726716601110528, '登录日志查询', 60418316774412288, '60405194038710272.60418316774412288.75726716601110528', 'api/login/query', null, null, 2, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (102525348998287360, '登出系统', 44941535116267520, '44932177716318208.44941535116267520.102525348998287360', 'api/login/logout', null, null, 3, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
commit;
prompt 47 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (id, role_no, name, eng_name, status, extend1, extend2, creation_time, update_time)
values (44876042825109504, 'admin', '管理员', null, '1', null, null, to_date('07-12-2019 20:01:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2019 20:01:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ROLE (id, role_no, name, eng_name, status, extend1, extend2, creation_time, update_time)
values (46249053117485056, 'common', '普通人员', null, '1', null, null, to_date('11-12-2019 14:58:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-01-2020', 'dd-mm-yyyy'));
commit;
prompt 2 records loaded
prompt Loading SYS_ROLE_PERMISSION...
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 102525348998287360);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 44932177716318208);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 44940134503944192);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 44941535116267520);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 44941855632396288);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 44942077875982336);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 49535597806882816);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50626462239428608);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50628479758372864);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50628580316811264);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50628659857592320);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50628743391350784);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50628836580397056);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50629558780825600);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50629649600090112);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50629714175594496);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50629790860054528);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50629866978283520);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630062453821440);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630136793665536);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630527065264128);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630612352241664);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630668090347520);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630731898294272);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630822918885376);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50630927495467008);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50631013436755968);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50631819405824000);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50631894458699776);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50631972745383936);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50632048247050240);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50632115829870592);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 50659579247464448);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56021134315098112);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56062104234627072);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56062219687038976);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56105372565639168);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56350442212560896);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56425544627261440);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56425672901660672);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56425839277117440);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 56449599556292608);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 60405194038710272);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 60405491620384768);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 60418316774412288);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 63681225541554176);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 75726481803972608);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (44876042825109504, 75726716601110528);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 50659579247464448);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 56062104234627072);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 56062219687038976);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 56105372565639168);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 56449599556292608);
insert into SYS_ROLE_PERMISSION (role_id, permission_id)
values (46249053117485056, 63681225541554176);
commit;
prompt 53 records loaded
prompt Loading SYS_USER...
insert into SYS_USER (id, username, password, name, org_no, phone_no, landline, id_card, email, adress, zip_code, status, extend1, extend2, login_time, last_login_time, error_count, creation_time, update_time, sex)
values (44875523595440128, 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', '管理员', '440000000', '13112183770', null, null, '314387209@qq.com', null, '321456', '1', null, null, null, null, null, to_date('07-12-2019 20:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
commit;
prompt 1 records loaded
prompt Loading SYS_USER_ROLE...
insert into SYS_USER_ROLE (user_id, role_id)
values (44875523595440128, 44876042825109504);
insert into SYS_USER_ROLE (user_id, role_id)
values (44875523595440128, 46249053117485056);
commit;
prompt 2 records loaded
set feedback on
set define on
prompt Done.
