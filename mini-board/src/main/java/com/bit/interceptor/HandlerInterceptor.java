package com.bit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HandlerInterceptor extends HandlerInterceptorAdapter {

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    
    Integer loginUser = (Integer) request.getSession().getAttribute("loginUser");
    String pathInfo = request.getRequestURI().toString();
    
    System.out.println(pathInfo);
    System.out.println(loginUser);
    
    if(loginUser != null) {
      if(pathInfo.equals("/login") || pathInfo.equals("/join")) {
        response.sendRedirect("/mypage");
        
      } else if(pathInfo.startsWith("/admin")) {
        if(loginUser != 1) {
          response.sendRedirect("/mypage");
        }
      }
    } else {
      switch(pathInfo) {
        case "/login": case "/join": 
          return true;
        default: 
          System.out.println("오냐");
          response.sendRedirect("/login");
          return false;
      }
    }
    return true;
  }
}
