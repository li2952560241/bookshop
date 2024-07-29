package com.daniel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daniel.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * LoginInterceptor 的拦截器类，用于在处理 HTTP 请求之前、之后和完成处理时执行特定的逻辑。
 * 这个拦截器主要用于登录认证，确保用户在访问特定页面之前已登录。
 * 登录认证的拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{

    /**
     * Handler执行完成之后调用这个方法
     */
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception exc)
            throws Exception {

    }

    /**
     * Handler执行之后，ModelAndView返回之前调用这个方法
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {
    }

    /**
     * Handler执行之前调用这个方法
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("/users")>=0){
            return true;
        }
        //获取Session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user != null){
            return true;
        }
        //不符合条件的，跳转到登录界面
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);

        return false;
    }

}


