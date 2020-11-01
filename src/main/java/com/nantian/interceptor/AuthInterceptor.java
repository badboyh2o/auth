package com.nantian.interceptor;

import com.nantian.easytrade.annotation.Interceptor;
import com.nantian.easytrade.core.interceptor.InterceptorHandler;
import com.nantian.easytrade.http.core.ApplicationContext;
import com.nantian.enumeration.ErrorCodeEnum;
import com.nantian.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>ClassName: AuthInterceptor</p>
 * <p>Description: 用户权限验证拦截器 </p>
 * <p>Copyright: Copyright©2014</p>
 * <p>Company: 广州南天电脑系统有限公司</p>
 * <p>Date: 2019-11-30</p>
 *
 * @author 刘晓辉
 * @version 1.0
 */
@Interceptor("auth")
public class AuthInterceptor implements InterceptorHandler {

    @Autowired
    PermissionService permissionService;

    @Override
    public boolean preIntercept() {
        ApplicationContext context = ApplicationContext.getContext();
        String url = context.getChannel() + "/" + context.getTransCode() + "/" + context.getPushName();
        boolean result = permissionService.checkPermission(url);
        if (!result) {
            context.setErrorMsg(ErrorCodeEnum.INSUFFICIENT_PERMISSIONS_ERROR.getErrcode(), ErrorCodeEnum.INSUFFICIENT_PERMISSIONS_ERROR.getErrmsg());
        }
        return result;
    }

    @Override
    public void afterCompletion() {

    }
}
