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
 * Servlet implementation class MemberRegiesterServlet
 */
@WebServlet("/member/idFind")
public class MemberIdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNm = request.getParameter("memberNm");
		String memberEmail = request.getParameter("memberEmail");
		
		
		Member m=new MemberService().selectMemberId(memberNm, memberEmail);
		String msg = "";
		if(m != null) {
			msg = m.getMemberName()+"님의 아이디는 "+m.getMemberId()+" 입니다.:)";
			request.setAttribute("loc", "/views/login/login.jsp");
		}else {
			msg = "존재하지 않는 회원정보 입니다.:)";
			request.setAttribute("loc", "/views/member/find.jsp");
		}
		request.setAttribute("msg", msg);
		

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
