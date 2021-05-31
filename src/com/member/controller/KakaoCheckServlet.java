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
 * Servlet implementation class KakaoCheckServlet
 */
@WebServlet("/kakao/kakaoCheck")
public class KakaoCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName = request.getParameter("kakaoName");
		String email = request.getParameter("kakaoEmail");
		
		System.out.println(userName);
		System.out.println(email);
		
		Member m = new MemberService().kakaoCheck(userName,email);
		System.out.println(m);
	
		if(m!=null) {
			// session 객체 생성 ! 
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			response.sendRedirect(request.getContextPath());
		} else {
			request.getRequestDispatcher("/kakao/register?userName="+userName+"&email="+email).forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
