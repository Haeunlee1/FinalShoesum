package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.service.CartService;
import com.member.model.service.MemberService;

/**
 * Servlet implementation class InsertOrderedListServlet
 */
@WebServlet("/mypage/insertOrderedList")
public class InsertOrderedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOrderedListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String proNo = request.getParameter("proNo");
		String proCount = request.getParameter("proCount");
		String cartNo = request.getParameter("cartNo");
		System.out.println(cartNo);
		
		int result = new MemberService().insertOrder(userNo,proNo,proCount);
		
		if(!cartNo.equals("-1")) {
			
			if(cartNo.contains("/")) {
				// 여러 카트 항목 
				String[] cartNoArr = cartNo.split("/");
				result += new CartService().selectDelete(cartNoArr);
				
			} else {
				// 단일 카드 항목
				result += new  CartService().cartDelete(Integer.parseInt(cartNo));
			}
			
		}
		
		
		String msg = "";
		String loc = "";
		if(result>0) {
			msg = "구매 성공!";
		} else {
			msg = "구매실패";
		}
		
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
