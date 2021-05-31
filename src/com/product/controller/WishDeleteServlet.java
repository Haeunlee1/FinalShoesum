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
@WebServlet("/mypage/wishDelete")
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
		double sale = 0;
		
		String proNo =request.getParameter("proNo");
		int userNo = Integer.parseInt(request.getParameter("memberNo"));
		int result = new ProductService().deleteWish(userNo, proNo);
		
		if(request.getParameter("hotpd")!=null&&request.getParameter("sale")!=null) {
			//핫딜일때
			String hotpd=request.getParameter("hotpd");
			sale=Double.parseDouble(request.getParameter("sale"));
			
			request.setAttribute("hotpd", hotpd);
			request.setAttribute("sale", sale);
			request.getRequestDispatcher("/product/productDetail?proNo="+proNo+"&hotpd=hotpd&sale="+sale).forward(request, response);
		}else if(request.getParameter("pd")!=null&&result>0) {
			//상품디테일에서 넘어왔다면
			request.getRequestDispatcher("/product/productDetail?proNo="+proNo).forward(request, response);
		}else{
			String msg=result>0?"관심상품에서 삭제되었습니다.":"삭제실패";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/mypage/mypage.do?memberNo="+userNo);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
