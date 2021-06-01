package com.checkout.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckoutEndServlet
 */
@WebServlet("/checkout/checkoutEnd")
public class CheckoutEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		// 결제 정보 
		
			// 1. 총 가격	
			int totalPrice;
		
			try {
				totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			} catch(NumberFormatException e) {
				totalPrice = 0;
			}
		
			// 2. 회원번호
			int userNo = Integer.parseInt(request.getParameter("memberNo"));
			
			// 3. 상품번호
			String proNo = request.getParameter("proNo");
			
			// 4. 상품수량 
			String proCount = request.getParameter("proCount");
			
			// 장바구니 삭제 여부 
			String cartNo = request.getParameter("cartNo");
			
		// 결제 정보 보내기
		request.setAttribute("price", totalPrice);
		request.setAttribute("userNo", userNo);
		request.setAttribute("proNo", proNo);
		request.setAttribute("proCount", proCount);
		request.setAttribute("cartNo",cartNo);
		
		request.getRequestDispatcher("/views/checkout/checkoutEnd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
