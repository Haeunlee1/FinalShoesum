package com.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;

/**
 * Servlet implementation class AddWishServlet
 */
@WebServlet("/mypage/addWish")
public class AddWishServlet extends HttpServlet {
	//찜 상품 추가하기
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo =Integer.parseInt(request.getParameter("memberNo"));
		String proNo=request.getParameter("proNo");
		int result = new ProductService().addWish(memberNo,proNo);
		if(result>0) {
			request.getRequestDispatcher("/product/productDetail?proNo="+proNo).forward(request, response);
		}else {
			String msg="관심상품 등록 실패, 재시도 하세요";
			String loc="/views/product/product_detail.jsp";
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
