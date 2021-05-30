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
		
		int cPage;
		int numPerpage=9;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		String userType = request.getParameter("userType").toUpperCase();
		request.setAttribute("userType", userType);
		
		String category = request.getParameter("category");
		request.setAttribute("category", category);
			
	    // userType, category 별 상품 목록 가져오기
		List<Product> userCategoryProduct = new ProductService().userCategoryProduct(userType,category,cPage,numPerpage);
		request.setAttribute("userCategoryProduct", userCategoryProduct);
		
		int totalData=new ProductService().selectProdcutCount(category);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<div class=\"pageBar-icon\">&lt;</div>";
		}else {
			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
			+"/product/productlist?userType="+userType+"&cPage="+(pageNo-1)+"'>&lt;</div>";
		}
	
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<div class=\"pageBar-icon\" style=\"background-color:rgb(52, 152, 219);color:white\">"+pageNo+"</div>";
			}else {
				pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
				+"/product/productlist?userType="+userType+"&cPage="+pageNo+"'>"+pageNo+"</div>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<div class=\"pageBar-icon\">&gt;</div>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()
			+"/notice/noticelist?cPage="+pageNo+"'>[다음]</a>";
			
			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
			+"/product/productlist?userType="+userType+"&cPage="+pageNo+"'>&gt;</div>";
			
		}
		
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/product/productList.jsp")
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
