package com.sust.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import java.io.IOException;

@WebFilter(urlPatterns = "/*", initParams = {@WebInitParam(name = "charset", value = "utf-8")})
public class EncodingFilter implements Filter {
    private String charset;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        charset = filterConfig.getInitParameter("charset");
        System.out.println("编码过滤========" + charset);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding(this.charset);
        filterChain.doFilter(servletRequest, servletResponse);
        System.out.println("doFilter() =================");
    }

    @Override
    public void destroy() {

    }
}
