package com.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;
import com.product.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/review/insertReview")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = Integer.parseInt(request.getParameter("memberNo")); 
		String proNo = request.getParameter("proNo");
		String content = request.getParameter("review_content");
		int rating = Integer.parseInt(request.getParameter("getRating"));
		
		Review r = new Review();
		r.setReviewCont(content);
		r.setReviewProNo(proNo);
		r.setReviewRating(rating);
		r.setReviewMemNo(userNo);
		
		int result = new ProductService().insertReview(r);
		String msg = "";
		if(result>0) {
			msg = "리뷰 등록 성공!";
		} else {
			msg = "리뷰 등록 실패!";
		}
		String loc = "/product/productDetail?proNo="+proNo;
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
