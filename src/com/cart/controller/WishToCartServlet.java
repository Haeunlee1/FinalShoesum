package com.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;

/**
 * Servlet implementation class WishToCartServlet
 */
@WebServlet("/mypage/wishToCart")
public class WishToCartServlet extends HttpServlet {
	//찜한상품에서 장바구니로 이동
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//찜한상품 장바구니 이동=>갯수는 일단 1개
		//찜 테이블에서 찜번호로 삭제 후 카트에 담기
		//int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		int likeNo=Integer.parseInt(request.getParameter("likeNo"));
		System.out.println(likeNo);
		//System.out.println(likeNo);
		/*
		 * //카트에 추가하기 int addCart=new CartService().
		 * 
		 * //찜테이블에서 삭제하기 int deleteWish = new
		 * ProductService().deleteWish(memberNo,likeNo);
		 * System.out.println("찜삭제"+deleteWish);
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
