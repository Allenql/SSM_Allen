package com.sust.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

@WebFilter(urlPatterns = "/*", initParams = {@WebInitParam(name = "charSet", value = "UTF-8")})
public class CharacterFilter implements Filter {
    private String charSet = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        charSet = filterConfig.getInitParameter("charSet");
        System.out.println("编码过滤 ==========" + charSet);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding(this.charSet);
        filterChain.doFilter(servletRequest, servletResponse);  //继续向下转发
        System.out.println("doFilter ===============");
    }

    @Override
    public void destroy() {

    }
}
