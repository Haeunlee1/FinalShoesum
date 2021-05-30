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
@WebServlet("/product/productlistAjax")
public class ProductListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sort = request.getParameter("sort");
		if(sort.substring(0,1).contains("r")) {
			sort = "IMG_NO DESC";
		}else if(sort.substring(0,1).contains("h")) {
			sort = "PRO_PRICE DESC";
		}else {
			sort = "PRO_PRICE ASC";
		}
		
		String userType = request.getParameter("userType");
		userType=userType.toLowerCase();
		request.setAttribute("userType", userType);
		
		String category = request.getParameter("category");
		System.out.println("AjaxServlet :"+category);
		
		
		int cPage;
		int numPerpage=9;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		// 최신순, 높은가격순, 낮은가격순 가져오기(userType, category 경우에 따라 분기처리)
		List<Product> sortProduct = new ProductService().sortProduct(sort,userType,category,cPage,numPerpage);
		request.setAttribute("sortProduct", sortProduct);
		
		int totalData=new ProductService().selectProdcutCount(sort);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<div class=\"pageBar-icon\">&lt;</div>";
		}else {
			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
			+"/product/productlist?userType="+sort+"&cPage="+(pageNo-1)+"'>&lt;</div>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<div class=\"pageBar-icon\" style=\"background-color:rgb(52, 152, 219);color:white\">"+pageNo+"</div>";
			}else {
				pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
				+"/product/productlist?userType="+sort+"&cPage="+pageNo+"'>"+pageNo+"</div>";
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
			+"/product/productlist?userType="+sort+"&cPage="+pageNo+"'>&gt;</div>";
			
		}
		
		request.setAttribute("pageBar", pageBar);
	
		request.getRequestDispatcher("/views/product/productListAjax.jsp")
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
