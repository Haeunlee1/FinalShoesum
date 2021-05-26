package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Ordered;

/**
 * Servlet implementation class OrderedSearchServlet
 */
@WebServlet("/mypage/orderedSearch")
public class OrderedSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderedSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기간 정해서 주문내역 가져오기
		String before=request.getParameter("before");
		String after=request.getParameter("after");
		System.out.println(before+"/"+after);
		//일단 아이디값으로 넘겨보기
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
	
		List<Ordered> list = new MemberService().selectOrdered(memberNo,before,after);
		request.setAttribute("orderList", list);
		request.getRequestDispatcher("/views/mypage/mypage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
