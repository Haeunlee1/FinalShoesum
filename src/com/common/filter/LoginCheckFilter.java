package com.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter({"/mypage/*","/cart/*","/checkout/*"})
public class LoginCheckFilter implements Filter {
//마이페이지 등 로그인을 해야지만 들어갈 수 있게 하기
    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = ((HttpServletRequest)request).getSession(false);	
		//HttpServletRequest로 형변환하여 getSession()사용하기
		if(session==null || session.getAttribute("loginMember")==null) {
			//로긴 안 했을 때
			request.setAttribute("msg","로그인 후 이용가능합니다");
			request.setAttribute("loc", "/views/login/login.jsp");  //나중에 로그인페이지로 이동하게 만들기
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			//로그인 시에 doFilter ㄱㄱ 
			chain.doFilter(request, response);
			
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
