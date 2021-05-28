package com.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.service.CartService;

/**
 * Servlet implementation class CartPutInServlet
 */
@WebServlet("/cart/cartPutIn")
public class CartPutInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartPutInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int proCount = Integer.parseInt(request.getParameter("proCount"));
		String proNo = request.getParameter("proNo");
		
		
		int result = new CartService().insertCart(userNo,proNo,proCount);
		String msg = null;
		String loc = null;
		if(result > 0) {
		msg = "장바구니에 넣기 성공";
		loc = "/product/productDetail?proNo="+proNo;
		} else {
		msg = "장바구니에 넣기 실패";
		loc = "";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
	
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
