package com.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Date;
import java.util.UUID;

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
@WebServlet("/member/pwFind")
public class MemberPwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNm = request.getParameter("memberNm");
		String memberEmail = request.getParameter("memberEmail");
		String memberId = request.getParameter("memberId");
		
		Member m=new MemberService().selectMemberPw(memberNm, memberEmail, memberId);
		String msg = "";
		if(m != null) {
			m.setMemberPw(randomPassword(10));
			msg = m.getMemberName()+"님의 임시 비밀번호는 "+m.getMemberPw()+" 입니다.:)";
			new MemberService().updateMemberFindPw(m);
			request.setAttribute("loc", "/views/login/login.jsp");
		}else {
			msg = "존재하지 않는 회원정보 입니다.:)";
			request.setAttribute("loc", "/views/member/find.jsp");
		}
		request.setAttribute("msg", msg);

		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private String getSHA512(String val) {
		String encPwd = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes = val.getBytes(Charset.forName("utf-8"));
		md.update(bytes);
		encPwd = Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}

	public static String randomPassword (int length) {  
        int index = 0;  
        char[] charSet = new char[] {  
                '0','1','2','3','4','5','6','7','8','9'  
                ,'A','B','C','D','E','F','G','H','I','J','K','L','M'  
                ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'  
                ,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
                ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};  
          
        StringBuffer sb = new StringBuffer();  
        for (int i=0; i<length; i++) {  
            index =  (int) (charSet.length * Math.random());  
            sb.append(charSet[index]);  
        }  
          
        return sb.toString();  
          
    }  

}
