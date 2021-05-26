package com.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class MemberRegiesterServlet
 */
@WebServlet(name="memberRegiester",urlPatterns = "/member/regiester")
public class MemberRegiesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberPwCheck = request.getParameter("memberPwCheck");
		String memberNm = request.getParameter("memberNm");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
		String memberAddress = request.getParameter("memberAddress");
		String memberAddressEnd =request.getParameter("memberAddressEnd");
		String memberPostNo = request.getParameter("memberPostNo");

		Member member = new Member(0, memberId, memberPwCheck, memberNm, memberEmail, memberPhone, memberPostNo, memberAddress, memberAddressEnd);	
		
		int result=new MemberService().insertMember(member);
		
		String msg=result>0?member.getMemberId()+"님 회원가입 성공 :)":"회원가입 실패 :(";
		request.setAttribute("msg", msg);
		
		//request.setAttribute("loc", "/views/login/login.jsp");
		request.setAttribute("loc", "/index.jsp"); //메인화면
		
		//=>가입된 회원이 아니라고 뜨는것 , 쿼리스트링을 추가해주자 왜? jsp에서 쿼리스트링으로 넣어줬었음 => helloMVC참고하기
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
