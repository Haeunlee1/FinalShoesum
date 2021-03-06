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
@WebServlet("/mypage/wishCheckDelete")
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
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String[] checkArr=request.getParameter("checkArr").split(",");
		int result=new ProductService().checkDeleteWish(memberNo,checkArr);
		System.out.println(checkArr);
		String msg=result>0?"관심상품이 삭제되었습니다.":"삭제실패";
		request.setAttribute("loc", "/mypage/mypage.do?memberNo="+memberNo);
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
