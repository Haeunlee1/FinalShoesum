package com.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Ordered;

/**
 * Servlet implementation class MypageMoveServlet
 */
@WebServlet(name="mypagemove",urlPatterns = "/member/mypage.do")
public class MypageMoveServlet extends HttpServlet {
	//메인에서 아이콘 클릭시 마이페이지로 이동, 로그인 되어있어야하는 상태
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		//기본 3개월이내 주문내역 / 주문내역 지정시 그 값 받아서 같이 넘기기
		List<Ordered> list = new MemberService().basicOrdered(memberNo);
		request.setAttribute("orderList", list);
		System.out.println("주문내역갯수:"+list.size());		//rs가 없으면 0이 찍힘 jsp에서 0을 기준으로 분기하기
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
