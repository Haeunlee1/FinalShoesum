package com.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/product/productDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//상품 디테일로 보내주는 서블릿
		//상품 jsp에서 그 상품의 번호를 넘겨받기
		String proNo=request.getParameter("proNo");
		
		/*
		 * HttpSession session=request.getSession(false); if(session!=null) { int
		 * memberNo=Integer.parseInt(request.getParameter("memberNo")); int result = new
		 * ProductService().selectWish(memberNo,proNo); //클릭한 상품이 해당 유저의 찜 목록에 있는지 확인하기
		 * }
		 */
		
		if(request.getParameter("hotpd")!=null&&request.getParameter("sale")!=null) {
			String hotpd=request.getParameter("hotpd");
			double sale=Double.parseDouble(request.getParameter("sale"));
			
			request.setAttribute("hotpd", hotpd);
			request.setAttribute("sale", sale);
		}
		
		List<Product> list = new ProductService().selectProduct(proNo);
		request.setAttribute("list",list );
		request.getRequestDispatcher("/views/product/product_detail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
