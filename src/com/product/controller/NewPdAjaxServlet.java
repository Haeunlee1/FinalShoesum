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
 * Servlet implementation class NewPdAjaxServlet
 */
@WebServlet("/product/newPdAjax")
public class NewPdAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPdAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 가장 마지막에 등록한 상품 5가지 가져오기
		List<Product> recentpd = new ProductService().recentProduct();
		request.setAttribute("recentpd", recentpd);
	
		// index에 newproduct 상품 5개 나타나도록 하는 jsp로 이동
		request.getRequestDispatcher("/views/product/newPdAjax.jsp")
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
