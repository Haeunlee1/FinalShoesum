package com.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;

/**
 * Servlet implementation class WishCheckDeleteServlet
 */
@WebServlet("/member/wishCheckDelete")
public class WishCheckDeleteServlet extends HttpServlet {
	//체크된 관심상품만 지우기
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishCheckDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo=Integer.parseInt(request.getParameter("userNo"));
		String[] checkArr=request.getParameter("checkArr").split(",");
		//String checkArr=String.join(",",request.getParameter("checkArr"));
		int result=new ProductService().checkDeleteWish(userNo,checkArr);
		
		String msg=result>0?"선택한 상품이 삭제되었습니다":"삭제실패";
		request.setAttribute("loc", "/member/mypage.do");
		request.setAttribute("msg", msg);
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
