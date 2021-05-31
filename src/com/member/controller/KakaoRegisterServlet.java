package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class KakaoRegisterServlet
 */
@WebServlet("/kakao/register")
public class KakaoRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		int result = new MemberService().kakaoRegister(userName,email);
		
		String msg = "";
		String loc = "";
		if(result>0) {
			Member m = new MemberService().kakaoCheck(userName,email);
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			msg = "로그인 성공";
		} else {
			msg = "로그인 실패";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
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
