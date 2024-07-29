package com.daniel.exception;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;


//DefaultExceptionHandler 的异常处理类，用于处理未经授权的异常（UnauthorizedException），并返回一个相应的视图
@ControllerAdvice
public class DefaultExceptionHandler {
    @ExceptionHandler({UnauthorizedException.class}) // 捕获UnauthorizedException异常
    @ResponseStatus(HttpStatus.UNAUTHORIZED) // 401
    public ModelAndView processUnauthenticatedException(NativeWebRequest request, UnauthorizedException e) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("ex", e); // 将异常对象添加到ModelAndView中
        mv.setViewName("unauthorized"); // unauthorized 未经 授权  没有找到相关的处理页面
        return mv;
    }
}
