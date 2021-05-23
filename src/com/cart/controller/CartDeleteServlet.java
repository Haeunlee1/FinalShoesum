package com.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.service.CartService;

/**
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/cart/cartDelete")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userNum = request.getParameter("userNo");
		int cartNum = Integer.parseInt(request.getParameter("cartNo"));
		int result = new CartService().cartDelete(cartNum);
		String msg = "";
		String loc = "";
		
		if(!(result>0)) {
			msg = "삭제 실패";
			loc = "cart/cartView?userNo="+userNum;
		} else {
			msg = "삭제 성공";
			loc = "cart/cartView?userNo="+userNum;
		}
		
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
