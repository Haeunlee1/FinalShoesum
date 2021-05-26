package com.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class WIshListServlet
 */
@WebServlet("/mypage/wishlist")
public class WIshListServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WIshListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//찜한 상품 목록 가져오기
		//아이디가 아닌 넘버로 가져오기
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		
		//Product객체로 가져오기
		List<Product> list = new ProductService().allWishes(memberNo);
		request.setAttribute("wishlist", list);
		request.setAttribute("memberNo", memberNo);
		request.getRequestDispatcher("/views/mypage/wishlistAjax.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
