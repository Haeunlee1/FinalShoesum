package com.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;

/**
 * Servlet implementation class WishDeleteServlet
 */
@WebServlet("/member/wishDelete")
public class WishDeleteServlet extends HttpServlet {
	//관심상품 지우기
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원번호, 상품번호로 db에 관심상품 지우기
		int userNo = Integer.parseInt(request.getParameter("memberNo"));
		int likeNo =Integer.parseInt(request.getParameter("likeNo"));
		System.out.println("userNo:"+userNo+" / proNo:"+likeNo);
		int result = new ProductService().deleteWish(userNo, likeNo);
		System.out.println("result"+result);
		String msg=result>0?"관심상품에서 삭제되었습니다":"삭제실패";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/member/mypage.do?memberNo="+userNo);		//추후에 로그인로직 완성되면 userNo넘기기
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
