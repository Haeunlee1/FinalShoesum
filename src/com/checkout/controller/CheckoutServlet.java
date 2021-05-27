package com.checkout.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.checkout.model.service.CheckoutService;
import com.checkout.model.vo.Checkout;
import com.member.model.vo.Member;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/checkout/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 파라미터 값 가져오기
		
		// 유저번호 
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		// 제품상세로부터 상품가격 받아오기
		int proPrice;
		try {
		proPrice = Integer.parseInt(request.getParameter("proPrice"));
		} catch(NumberFormatException e) {
			proPrice = 0;
		}
		// 카트번호
		String cartNo = request.getParameter("cartNo");
		
		// 제품 수량 분기 처리
		int proCount;
		try {
			proCount = Integer.parseInt(request.getParameter("proCount"));
		} catch(NumberFormatException e) {
			proCount = 0;
		}
		
		// 제품번호 
		String proNo = request.getParameter("proNo");
		
		// 출처
		String from = request.getParameter("from"); 
		
		

		// 멤머데이터 , 상품 데이터 가져오기
		Member m = new CheckoutService().memberInfo(userNo);
		request.setAttribute("member",m);
		
		// 분기처리하기
		
		List<Checkout> list = null;
		
		switch (from) {
		
		
		case "c":
			list = new CheckoutService().checkoutPro(cartNo);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/checkout/checkoutCart.jsp").forward(request, response);
			break;
			
		case "p":
			list = new CheckoutService().checkoutPro(proNo,proCount,proPrice);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/checkout/checkoutPro.jsp").forward(request,response);
			break;
		};
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
