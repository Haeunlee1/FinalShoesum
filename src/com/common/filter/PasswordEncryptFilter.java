package com.common.filter;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class PasswordEncryptFilter
 */
@WebFilter(servletNames= {   //로그인 & 회원가입&회원정보수정&비밀번호수정? 암튼 "password"쓰는 모든 곳
		"profileEditServlet","loginServlet","memberRegiester"
})
public class PasswordEncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PasswordEncryptFilter() {
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
		// place your code here
		PasswordEncryptWrapper pew=new PasswordEncryptWrapper((HttpServletRequest)request);
		// pass the request along the filter chain
		chain.doFilter(pew, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	public static void main(String[] args) {

		
			String val = "1234";
			
			String encPwd="";
			MessageDigest md=null;
			try {
				md=MessageDigest.getInstance("SHA-512");		
			}catch(NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			byte[] bytes=val.getBytes(Charset.forName("utf-8"));
			md.update(bytes);
			encPwd=Base64.getEncoder().encodeToString(md.digest());
			System.out.println(encPwd);
	}
}
