prompt PL/SQL Developer import file
prompt Created on 2020��4��8�� by LXH
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
  is '�����ֵ��';
comment on column SYS_DICTIONARY.id
  is 'ID����';
comment on column SYS_DICTIONARY.dict_name
  is '�ֵ�����';
comment on column SYS_DICTIONARY.dict_key
  is '�ֵ�key';
comment on column SYS_DICTIONARY.dict_value
  is '�ֵ�value';
comment on column SYS_DICTIONARY.remark
  is '��ע';
comment on column SYS_DICTIONARY.update_time
  is '����ʱ��';
comment on column SYS_DICTIONARY.creation_time
  is '����ʱ��';
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
  is '�û���¼��¼��';
comment on column SYS_LOGIN_LOG.id
  is '���';
comment on column SYS_LOGIN_LOG.username
  is '��¼�û�';
comment on column SYS_LOGIN_LOG.ip_address
  is '��¼IP��ַ';
comment on column SYS_LOGIN_LOG.equipment
  is '��¼���豸';
comment on column SYS_LOGIN_LOG.extend1
  is '��չ�ֶ�1';
comment on column SYS_LOGIN_LOG.extend2
  is '��չ�ֶ�2';
comment on column SYS_LOGIN_LOG.creation_time
  is '��¼ʱ��	����ֶ�';
comment on column SYS_LOGIN_LOG.path
  is '��¼��־·��';
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
  is '�û�����Ȩ�޼�¼��';
comment on column SYS_OPERAT_LOG.id
  is '���';
comment on column SYS_OPERAT_LOG.account
  is '��¼�û�';
comment on column SYS_OPERAT_LOG.channel
  is '����';
comment on column SYS_OPERAT_LOG.trans_code
  is '������';
comment on column SYS_OPERAT_LOG.push
  is '�ӿ�';
comment on column SYS_OPERAT_LOG.ip_address
  is '��¼IP��ַ';
comment on column SYS_OPERAT_LOG.extend1
  is '��չ�ֶ�1';
comment on column SYS_OPERAT_LOG.extend2
  is '��չ�ֶ�2';
comment on column SYS_OPERAT_LOG.creation_time
  is '��¼ʱ��	����ֶ�';
comment on column SYS_OPERAT_LOG.path
  is '����·��';
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
  is '������';
comment on column SYS_ORG.id
  is 'ID����';
comment on column SYS_ORG.org_no
  is '�������';
comment on column SYS_ORG.name
  is '��������';
comment on column SYS_ORG.parent_id
  is '�ϼ�����ID';
comment on column SYS_ORG.adress
  is '������ַ';
comment on column SYS_ORG.path
  is '����·��';
comment on column SYS_ORG.org_level
  is '�����ȼ� 1ʡ�У�2ʡ���ţ�3�����У�4���㲿�ţ�5����';
comment on column SYS_ORG.org_lvl2_id
  is '���������л�����';
comment on column SYS_ORG.area
  is '������������';
comment on column SYS_ORG.remark
  is '��ע';
comment on column SYS_ORG.status
  is '����״̬  1���ã�0������';
comment on column SYS_ORG.extend1
  is '��չ�ֶ�1';
comment on column SYS_ORG.extend2
  is '��չ�ֶ�2';
comment on column SYS_ORG.creation_time
  is '����ʱ��--  ����ֶ�';
comment on column SYS_ORG.update_time
  is '����ʱ��--  ����ֶ�';
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
  is 'Ȩ�ޱ�';
comment on column SYS_PERMISSION.id
  is 'Ȩ��ID';
comment on column SYS_PERMISSION.name
  is '����';
comment on column SYS_PERMISSION.parent_id
  is 'Ȩ�޵ĸ�ID';
comment on column SYS_PERMISSION.path
  is '·��';
comment on column SYS_PERMISSION.url
  is 'URL��ַ';
comment on column SYS_PERMISSION.big_icon
  is '��ͼ���ַ';
comment on column SYS_PERMISSION.small_icon
  is 'Сͼ���ַ';
comment on column SYS_PERMISSION.sorting
  is '����';
comment on column SYS_PERMISSION.type
  is '����.1���࣬2�˵���3����';
comment on column SYS_PERMISSION.status
  is 'Ȩ��״̬	0:�����ã�1���ã�����0ʱ����Ȩ���µ�������Ȩ�޾�������';
comment on column SYS_PERMISSION.extend1
  is '��չ�ֶ�1';
comment on column SYS_PERMISSION.extend2
  is '��չ�ֶ�2';
comment on column SYS_PERMISSION.creation_time
  is '����ʱ��	����ֶ�';
comment on column SYS_PERMISSION.update_time
  is '����ʱ��	����ֶ�';
comment on column SYS_PERMISSION.hide
  is '�Ƿ����أ�1�ǣ�0��';
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
  is '��ɫ��';
comment on column SYS_ROLE.id
  is '���';
comment on column SYS_ROLE.role_no
  is '��ɫ���';
comment on column SYS_ROLE.name
  is '��ɫ����';
comment on column SYS_ROLE.eng_name
  is '��ɫӢ������';
comment on column SYS_ROLE.status
  is '״̬	0�����ã�1����';
comment on column SYS_ROLE.extend1
  is '��չ�ֶ�1';
comment on column SYS_ROLE.extend2
  is '��չ�ֶ�2';
comment on column SYS_ROLE.creation_time
  is '����ʱ��	����ֶ�';
comment on column SYS_ROLE.update_time
  is '����ʱ��	����ֶ�';
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
  is '��ɫȨ�ޱ�';
comment on column SYS_ROLE_PERMISSION.role_id
  is '��ɫID';
comment on column SYS_ROLE_PERMISSION.permission_id
  is 'Ȩ��ID';
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
  is '�û���';
comment on column SYS_USER.id
  is 'ID����';
comment on column SYS_USER.username
  is '�ʺ�';
comment on column SYS_USER.password
  is '����';
comment on column SYS_USER.name
  is '�û�����';
comment on column SYS_USER.org_no
  is '��������ID';
comment on column SYS_USER.phone_no
  is '�ֻ���--11λ������λ';
comment on column SYS_USER.landline
  is '�̶�����--������λ���ӷָ��ߣ���7λ������';
comment on column SYS_USER.id_card
  is '���֤';
comment on column SYS_USER.email
  is '����';
comment on column SYS_USER.adress
  is '��ַ';
comment on column SYS_USER.zip_code
  is '��������';
comment on column SYS_USER.status
  is '״̬ 0��ֹ��1���ã�2��ʱ������3����������';
comment on column SYS_USER.extend1
  is '��չ�ֶ�1';
comment on column SYS_USER.extend2
  is '��չ�ֶ�2';
comment on column SYS_USER.login_time
  is '���ε�¼ʱ��';
comment on column SYS_USER.last_login_time
  is '��һ�ε�¼ʱ��';
comment on column SYS_USER.error_count
  is '�����¼�������';
comment on column SYS_USER.creation_time
  is '����ʱ�� ����ֶ�';
comment on column SYS_USER.update_time
  is '����ʱ�� ����ֶ�';
comment on column SYS_USER.sex
  is '�Ա�Ĭ��0��0���ܣ�1�У�2Ů';
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
  is '�û���ɫ��';
comment on column SYS_USER_ROLE.user_id
  is '���';
comment on column SYS_USER_ROLE.role_id
  is '��ɫ���';
alter table SYS_USER_ROLE
  add primary key (USER_ID, ROLE_ID);

prompt Loading SYS_DICTIONARY...
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148624621047808, 'userSex', '2', 'Ů', '�û��Ա�', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148502029930496, 'userSex', '0', '����', '�û��Ա�', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (60148571764428800, 'userSex', '1', '��', '�û��Ա�', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('18-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408260, 'userStatus', '3', '��������', '�û�״̬', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:30:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408257, 'userStatus', '0', '��ֹ', '�û�״̬', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:27:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408258, 'userStatus', '1', '����', '�û�״̬', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:28:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408259, 'userStatus', '2', '��ʱ����', '�û�״̬', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 14:29:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408261, 'menuType', '1', '����', '�˵�����', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:20:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408262, 'menuType', '2', '�˵�', '�˵�����', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:21:02', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (54210938605408263, 'menuType', '3', '����', '�˵�����', to_date('18-01-2020', 'dd-mm-yyyy'), to_date('02-01-2020 15:21:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331321697636352, 'menuStatus', '1', '����', '�˵�״̬', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331472684191744, 'menuType', '1', '����', '�˵�����', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331121763553280, 'menuStatus', '0', '�ϳ�', '�˵�״̬', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56331584705662976, 'menuType', '2', '�˵�', '�˵�����', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56332047601635328, 'menuType', '3', '����', '�˵�����', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56335232814813184, 'userStatus', '0', '��ֹ', '�û��ֵ�', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395793250390016, 'userStatus', '1', '����', '�û��ֵ�', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395074342490112, 'roleStatus', '0', '����', '��ɫ�ֵ�', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56395268521988096, 'roleStatus', '1', '����', '��ɫ�ֵ�', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396284978008064, 'orgStatus', '0', '��ֹ', '�����ֵ�', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396499743150080, 'orgStatus', '1', '����', '������ע', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397087235117056, 'orgType', '2', 'ʡ�в���', '��������', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397195368468480, 'orgType', '3', '������', '��������', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397385911504896, 'orgType', '4', '�����в���', '��������', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56397482695069696, 'orgType', '5', '����', '��������', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56423409072214016, 'hiddenStatus', '1', '��', '�˵�����', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56396894284550144, 'orgType', '1', 'ʡ��', '��������', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
insert into SYS_DICTIONARY (id, dict_name, dict_key, dict_value, remark, update_time, creation_time)
values (56423297952518144, 'hiddenStatus', '0', '��', '�˵�����', to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'));
commit;
prompt 28 records loaded
prompt Loading SYS_LOGIN_LOG...
prompt Table is empty
prompt Loading SYS_OPERAT_LOG...
prompt Table is empty
prompt Loading SYS_ORG...
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803567255162880, '440380000', '���ݷ���Ӫҵ��', '440000000', null, '440000000.440380000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803599110901760, '440400000', '����Խ��֧��', '440000000', null, '440000000.440400000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803626189328384, '440450000', '��������֧��', '440000000', null, '440000000.440450000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803658988785664, '440690000', 'ï���з���', '440000000', null, '440000000.440690000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803695118520320, '440700000', '�����з���', '440000000', null, '440000000.440700000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803727599210496, '440760000', '��Զ�з���', '440000000', null, '440000000.440760000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601472, '440102574', '�㶫ʡ����Ӫҵ��������', '440000000', null, '440000000.440102574', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:00', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:00', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601473, '440102635', '�㶫ʡ���зſ�����', '440000000', null, '440000000.440102635', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601474, '440102842', '�㶫ʡ����Ͷ���й�ҵ�񲿣����Ͻ�ҵ�񲿣�', '440000000', null, '440000000.440102842', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601475, '440270001', '�㶫ʡ����Ӫ�˹���', '440000000', null, '440000000.440270001', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48804248506601476, '440270003', '�㶫ʡ���и��˴�������', '440000000', null, '440000000.440270003', 2, null, null, null, '1', null, null, to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:11:01', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137920, '440101828', '��Զ����֧�и��˴�������', '440760000', null, '440000000.440760000.440101828', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137921, '440101475', '��Զ������֧��', '440760000', null, '440000000.440760000.440101475', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137922, '440760002', '��Զ�з���������Դ����������', '440760000', null, '440000000.440760000.440760002', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137923, '440760007', '��Զ�з��й�˾��羳�ͻ���', '440760000', null, '440000000.440760000.440760007', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48807965549137924, '440760009', '��Զ�з���ס���������Ŵ���', '440760000', null, '440000000.440760000.440760009', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:25:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51957891858698240, '12341234', '�������֧��', '440000000', null, '12341234', 3, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833217, '440700045', '�����з���˽������', '440700000', null, '440000000.440700000.440700045', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833218, '440700801', '�����з���Ӫ�˹���', '440700000', null, '440000000.440700000.440700801', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51959366177525760, '123456', '���֧��', '440000000', '����·22��', '123456', 3, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808497277833220, '440707203', '�����ĻὨ�Ƿ���', '440700000', null, '440000000.440700000.440707203', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:27:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51961395683790848, '3463456', '34563456', '440000000', null, '3463456', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51964253577678848, '2434', '234', '440000000', '23423', '2434', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499011, '440460801', '���ݷ���֧��', '440450000', null, '440000000.440450000.440460801', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:29:26', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499008, '440450699', '��������֧����������Ӫ����', '440450000', null, '440000000.440450000.440450699', 4, null, null, null, '1', null, null, to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803496279150592, '440470000', '���ݿ�����֧��rfr', '440000000', 'fffr34f43f343443f', '440000000.440470000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('19-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48803534619283456, '440560000', '���ݴӻ�֧��', '440000000', null, '440000000.440560000', 3, null, null, null, '1', null, null, to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:08:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (48808902963499009, '440450807', '������ɽ��·֧��', '440450000', null, '440000000.440450000.440450807', 5, null, null, null, '1', null, null, to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('18-12-2019 16:29:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51964366651920384, '234', '234', '440000000', '234', '234', 2, null, null, null, '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53135495420710912, '341500', '���ݷ���', '440000000', '�������¹���վǰ���155��', '341500', 3, null, null, null, '1', null, null, to_date('30-12-2019', 'dd-mm-yyyy'), to_date('30-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (45113081147428864, '440000000', '�㶫ʡ��', null, null, '440000000', 1, null, null, null, '1', null, null, to_date('08-12-2019 11:43:39', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 11:43:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (49548025265393664, '3333', '333', '440000000', null, '49548025265393664', 2, null, null, null, '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (49548162964393984, '555', '555', '440000000', '555', '49548162964393984', 2, null, null, null, '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51626840426811392, '4401103', '�������֧��', '440000000', null, '4401103', 2, null, null, null, '1', null, null, to_date('26-12-2019', 'dd-mm-yyyy'), to_date('26-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (51625960449249280, '440470001', '�������֧��lm', '440000000', null, '440470001', 3, null, null, null, '1', null, null, to_date('26-12-2019', 'dd-mm-yyyy'), to_date('26-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53585858170982400, '44433', '3333', '440000000', null, '44433', 2, null, null, null, '1', null, null, to_date('31-12-2019', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'));
insert into SYS_ORG (id, org_no, name, parent_id, adress, path, org_level, org_lvl2_id, area, remark, status, extend1, extend2, creation_time, update_time)
values (53591980730748928, '5555', '5555', '440000000', null, '5555', 2, null, null, null, '1', null, null, to_date('31-12-2019', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'));
commit;
prompt 37 records loaded
prompt Loading SYS_PERMISSION...
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60405194038710272, '��ά����', null, '60405194038710272', '��ά����', null, '&#xe609;', 2, '1', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60405491620384768, '������־', 60405194038710272, '60405194038710272.60405491620384768', 'views/operat.html', null, null, null, '2', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'), null);
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (60418316774412288, '��¼��־', 60405194038710272, '60405194038710272.60418316774412288', 'views/logs.html', null, null, null, '2', '1', null, null, to_date('27-12-2019', 'dd-mm-yyyy'), to_date('27-12-2019', 'dd-mm-yyyy'), null);
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425839277117440, '��ѯ', 56021134315098112, '44932177716318208.56021134315098112.56425839277117440', 'api/dict/query', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425544627261440, '�����ֵ�', 56021134315098112, '44932177716318208.56021134315098112.56425544627261440', 'api/dict/update', null, null, 2, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56425672901660672, 'ɾ��', 56021134315098112, '44932177716318208.56021134315098112.56425672901660672', 'api/dict/delete', null, null, 3, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50626462239428608, '��ѯ', 44940134503944192, '44932177716318208. 44940134503944192.50626462239428608', 'api/org/query', null, null, 2, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('07-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628479758372864, '��ȡ������', 44940134503944192, '44932177716318208. 44940134503944192.50628479758372864', 'api/org/queryTree', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628580316811264, '���', 44940134503944192, '44932177716318208. 44940134503944192.50628580316811264', 'api/org/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628659857592320, 'ɾ��', 44940134503944192, '44932177716318208. 44940134503944192.50628659857592320', 'api/org/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628743391350784, '����', 44940134503944192, '44932177716318208. 44940134503944192.50628743391350784', 'api/org/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50628836580397056, '��ȡָ��������Ϣ', 44940134503944192, '44932177716318208. 44940134503944192.50628836580397056', 'api/org/getOrg', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629558780825600, '��ѯ', 44941535116267520, '44932177716318208. 44941535116267520.50629558780825600', 'api/user/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629649600090112, '��ȡָ���û���Ϣ', 44941535116267520, '44932177716318208. 44941535116267520.50629649600090112', 'api/user/getUser', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629714175594496, '����', 44941535116267520, '44932177716318208. 44941535116267520.50629714175594496', 'api/user/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629790860054528, 'ɾ��', 44941535116267520, '44932177716318208. 44941535116267520.50629790860054528', 'api/user/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50629866978283520, '����', 44941535116267520, '44932177716318208. 44941535116267520.50629866978283520', 'api/user/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630062453821440, '��ȡ����Ȩ�Ľ�ɫ�б�', 44941535116267520, '44932177716318208. 44941535116267520.50630062453821440', 'api/user/getUserRoles', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630136793665536, '��Ȩ', 44941535116267520, '44932177716318208. 44941535116267520.50630136793665536', 'api/user/grant', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630527065264128, '��ѯ', 44941855632396288, '44932177716318208.44941855632396288.50630527065264128', 'api/role/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630612352241664, '����', 44941855632396288, '44932177716318208.44941855632396288.50630612352241664', 'api/role/add', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630668090347520, 'ɾ��', 44941855632396288, '44932177716318208.44941855632396288.50630668090347520', 'api/role/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630731898294272, '����', 44941855632396288, '44932177716318208.44941855632396288.50630731898294272', 'api/role/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('25-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630822918885376, '��ȡָ����ɫȨ��', 44941855632396288, '44932177716318208.44941855632396288.50630822918885376', 'api/role/getRolePermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50630927495467008, '���½�ɫȨ��', 44941855632396288, '44932177716318208.44941855632396288.50630927495467008', 'api/role/updateRolePermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631013436755968, '��ȡָ����ɫ��Ϣ', 44941855632396288, '44932177716318208.44941855632396288.50631013436755968', 'api/role/getRole', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631819405824000, '��ѯ', 44942077875982336, '44932177716318208.44942077875982336.50631819405824000', 'api/menu/query', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631894458699776, '��ѯ�˵���', 44942077875982336, '44932177716318208.44942077875982336.50631894458699776', 'api/menu/queryTree', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50631972745383936, 'ɾ��', 44942077875982336, '44932177716318208.44942077875982336.50631972745383936', 'api/menu/delete', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50632048247050240, '����', 44942077875982336, '44932177716318208.44942077875982336.50632048247050240', 'api/menu/update', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50632115829870592, '��ȡָ��Ȩ��', 44942077875982336, '44932177716318208.44942077875982336.50632115829870592', 'api/menu/getPermission', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (75726481803972608, '������־��ѯ', 60405491620384768, '60405194038710272.60405491620384768.75726481803972608', 'api/operat/query', null, null, 2, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (50659579247464448, '��ѯ�˵�', 63681225541554176, '44932177716318208.63681225541554176.50659579247464448', 'api/index/queryMenu', null, null, null, '3', '1', null, null, to_date('23-12-2019', 'dd-mm-yyyy'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44932177716318208, 'ϵͳ����', null, '44932177716318208', null, null, '&#xe770;', 1, '1', '1', null, null, to_date('07-12-2019 23:48:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-03-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44940134503944192, '��������', 44932177716318208, '44932177716318208. 44940134503944192', 'views/orgs.html', null, null, 0, '2', '1', null, null, to_date('08-12-2019 00:17:30', 'dd-mm-yyyy hh24:mi:ss'), to_date('23-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44941535116267520, '�û�����', 44932177716318208, '44932177716318208. 44941535116267520', 'views/users.html', null, null, 3, '2', '1', null, null, to_date('08-12-2019 00:22:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:22:06', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44941855632396288, '��ɫ����', 44932177716318208, '44932177716318208.44941855632396288', 'views/roles.html', null, null, 4, '2', '1', null, null, to_date('08-12-2019 00:23:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:23:22', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (44942077875982336, 'Ȩ�޹���', 44932177716318208, '44932177716318208.44942077875982336', 'views/menu.html', null, null, 5, '2', '1', null, null, to_date('08-12-2019 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-12-2019 00:24:11', 'dd-mm-yyyy hh24:mi:ss'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (49535597806882816, '����', 44942077875982336, '44932177716318208.44942077875982336.49535597806882816', 'api/menu/add', null, null, 33, '3', '1', null, null, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('20-12-2019', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56105372565639168, '�޸�����', 63681225541554176, '44932177716318208.63681225541554176.56105372565639168', 'api/index/modifyPassword', null, null, 1, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56021134315098112, '�ֵ����', 44932177716318208, '44932177716318208.56021134315098112', 'views/dictonary.html', null, null, 6, '2', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56350442212560896, '����', 56021134315098112, '44932177716318208.56021134315098112.56350442212560896', 'api/dict/add', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (63681225541554176, '���ز˵�', null, '63681225541554176', null, null, null, 0, '1', '1', null, null, to_date('28-01-2020', 'dd-mm-yyyy'), to_date('28-01-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56449599556292608, '��ȡ�ֵ�����', 63681225541554176, '44932177716318208.63681225541554176.56449599556292608', 'api/index/getDictValue', null, null, 1, '3', '1', null, null, to_date('08-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56062104234627072, '��ȡ��ǰ��¼�ߵ���Ϣ', 63681225541554176, '44932177716318208.63681225541554176.56062104234627072', 'api/index/getLoginUser', null, null, 1, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (56062219687038976, '����Ȩ������', 63681225541554176, '44932177716318208.63681225541554176.56062219687038976', 'api/index/updateLoginUser', null, null, 2, '3', '1', null, null, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (75726716601110528, '��¼��־��ѯ', 60418316774412288, '60405194038710272.60418316774412288.75726716601110528', 'api/login/query', null, null, 2, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
insert into SYS_PERMISSION (id, name, parent_id, path, url, big_icon, small_icon, sorting, type, status, extend1, extend2, creation_time, update_time, hide)
values (102525348998287360, '�ǳ�ϵͳ', 44941535116267520, '44932177716318208.44941535116267520.102525348998287360', 'api/login/logout', null, null, 3, '3', '1', null, null, to_date('01-03-2020', 'dd-mm-yyyy'), to_date('01-03-2020', 'dd-mm-yyyy'), '1');
commit;
prompt 47 records loaded
prompt Loading SYS_ROLE...
insert into SYS_ROLE (id, role_no, name, eng_name, status, extend1, extend2, creation_time, update_time)
values (44876042825109504, 'admin', '����Ա', null, '1', null, null, to_date('07-12-2019 20:01:44', 'dd-mm-yyyy hh24:mi:ss'), to_date('07-12-2019 20:01:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into SYS_ROLE (id, role_no, name, eng_name, status, extend1, extend2, creation_time, update_time)
values (46249053117485056, 'common', '��ͨ��Ա', null, '1', null, null, to_date('11-12-2019 14:58:16', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-01-2020', 'dd-mm-yyyy'));
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
values (44875523595440128, 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', '����Ա', '440000000', '13112183770', null, null, '314387209@qq.com', null, '321456', '1', null, null, null, null, null, to_date('07-12-2019 20:00:06', 'dd-mm-yyyy hh24:mi:ss'), to_date('08-01-2020', 'dd-mm-yyyy'), '0');
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
