一、开发环境：
	jdk 1.7及以上
	maven
	redis
	tomcat


二、启动项目：
	准备好oracle 数据库，plsql将/sql 脚本导入数据库;
	导入/design/lib/框架包 到maven本地仓库;
	导入auth项目,修改项目配置文件中jdbc.properties的jdbc信息；
	启动redis;
	maven install;
	部署在tomcat中运行
	管理员用户密码：admin/123456


三、项目设计：
1、使用了redis作为外部缓存,
      已实现 redis session共享，
      已实现 权限数据缓存，
   // TODO 数据库mybatis二级缓存， myabtis-redis 整合(spring缓存机制，注意更新缓存)
   
   https://www.jianshu.com/p/c1c955d8069b
   https://github.com/alexxiyang/shiro-redis shiro整合redis



   redis缓存的数据: 权限、session数据
		auth_auth: 									-- spring容器初始化完毕，写入缓存；update数据库需要更新缓存；
			{api/user/add: ["admin", "common"], } 	
		shiro:session:								-- 存放当前用户SysUser 和 当前用户拥有的角色；登录 认证成功才创建session？
			jsessionid1: {
				username:  {userName: "xiaoming" }						-- 登录成功后，或修改个人信息的时候，保存到session
				auth.xiaoming.roles: [id...]							-- 登录成功后，保存到session
				org_info: {}											-- 登录成功后，保存到session
			}
        
        
2、认证授权：
	shiro 				session管理、身份认证；
	ET-servlet-Incepter	授权；ET分发器分发请求后, 使用 auth 拦截器负责授权；
						从session取出当前用户具有的角色名字，对比redis中该url具有权限的所有角色名字；


			
			