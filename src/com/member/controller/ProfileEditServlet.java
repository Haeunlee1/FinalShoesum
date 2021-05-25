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
 * Servlet implementation class ProfileEditServlet
 */
@WebServlet(name="profileEditServlet", urlPatterns="/member/profileEdit")
public class ProfileEditServlet extends HttpServlet {
	//회원정보수정 서블릿
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		String userId="111";
		String passwordNew=request.getParameter("password_new");
		String userName=request.getParameter("userName");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		String postcode=request.getParameter("postcode");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		Member m = new Member(memberNo,userId,passwordNew,userName,email,phone,postcode,address1,address2);
		
		int result=new MemberService().updateMember(m);
		
		String msg=result>0?m.getMemberId()+"님 정보수정 성공 :)":"정보수정 실패 :(";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/");
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
