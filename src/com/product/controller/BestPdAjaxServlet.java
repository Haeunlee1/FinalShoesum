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
 * Servlet implementation class ProductListAjaxServlet
 */
@WebServlet("/product/bestPdAjax")
public class BestPdAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestPdAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 전체 상품 목록 가져오기
		List<Product> list = new ProductService().allProduct();
		request.setAttribute("products", list);
	
		// index에 bestproduct 랜덤으로 나타나도록 하는 jsp로 이동
		request.getRequestDispatcher("/views/product/bestPdAjax.jsp")
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
