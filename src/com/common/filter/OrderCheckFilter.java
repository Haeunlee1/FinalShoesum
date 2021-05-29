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

import com.product.model.service.ProductService;

/**
 * Servlet Filter implementation class OrderCheckFilter
 */
@WebFilter("/review/insertReview")
public class OrderCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public OrderCheckFilter() {
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
		int userNo = Integer.parseInt(((HttpServletRequest)request).getParameter("memberNo"));
		String proNo = ((HttpServletRequest)request).getParameter("proNo");
		
		boolean flag = new ProductService().checkOrdered(userNo,proNo);
		
		if(flag == false) {
			String msg = "상품 구매 후 이용해주세요";
			String loc = "/product/productDetail?proNo="+proNo;
			request.setAttribute("msg",msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		} else {
			chain.doFilter(request, response);
		}
		
		// pass the request along the filter chain
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
