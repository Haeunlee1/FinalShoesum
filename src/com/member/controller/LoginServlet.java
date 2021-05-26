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
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="loginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		
		System.out.println(memberId);
		System.out.println(memberPw);
		
		Member m=new MemberService().login(memberId, memberPw);
		String msg = "";
		if(m != null) {
			HttpSession session=request.getSession();
			msg = m.getMemberId()+"님 로그인 성공 :)";
			session.setAttribute("loginMember",  m);
			request.setAttribute("loc", "/index.jsp");
		}else {
			msg = "로그인 실패 :)";
			request.setAttribute("loc", "/views/login/login.jsp");
		}
		
		request.setAttribute("msg", msg);
		
		//=>가입된 회원이 아니라고 뜨는것 , 쿼리스트링을 추가해주자 왜? jsp에서 쿼리스트링으로 넣어줬었음 => helloMVC참고하기
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
