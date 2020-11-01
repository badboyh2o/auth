package com.nantian.interceptor;

import com.nantian.easytrade.annotation.Interceptor;
import com.nantian.easytrade.core.interceptor.InterceptorHandler;
import com.nantian.service.OperatService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * <p>ClassName: OperatInterceptor</p>
 * <p>Description: 用户操作记录拦截器 </p>
 * <p>Copyright: Copyright©2014</p>
 * <p>Company: 广州南天电脑系统有限公司</p>
 * <p>Date: 2020-01-16</p>
 *
 * @author Marry
 * @version 1.0
 */
@Interceptor("operat")
public class OperatInterceptor implements InterceptorHandler {

    @Autowired
    private OperatService operatService;

    @Override
    public boolean preIntercept() {
        operatService.addOperatRecord();
        return true;
    }

    @Override
    public void afterCompletion() {

    }
}
