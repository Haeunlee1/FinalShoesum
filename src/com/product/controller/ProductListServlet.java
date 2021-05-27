package com.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/productlist")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		
		String userType = request.getParameter("userType").toUpperCase();
		System.out.println(userType);
		request.setAttribute("userType", userType);
		
		// userType별 상품 목록 가져오기
		List<Product> list = new ProductService().userProduct(userType);
		request.setAttribute("userProduct", list);
=======
		// TODO Auto-generated method stub
>>>>>>> branch 'master' of https://github.com/Haeunlee1/FinalShoesum.git
		
		// nav bar -> man,woman,kids 클릭시 이동하는 서블렛
		request.getRequestDispatcher("/views/product/product.jsp")
		.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
