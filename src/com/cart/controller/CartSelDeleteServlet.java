package com.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.service.CartService;

/**
 * Servlet implementation class CartSelDeleteServlet
 */
@WebServlet("/cart/cartSelDelete")
public class CartSelDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartSelDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String cartNos = request.getParameter("cartNos");
		String[] cartNosArr = cartNos.split("/");
		
		int result = new CartService().selectDelete(cartNosArr); 
		
		String msg = "";
		if(result>0) {
			msg = "선택항목 삭제 성공!";
		} else {
			msg = "선택 항목 삭제 실패!";
		}
		String loc = "/cart/cartView?userNo="+userNo;
		
		request.setAttribute("msg",msg);
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
