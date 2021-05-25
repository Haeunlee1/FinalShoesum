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
		//마이페이지 클릭시 바로 주문내역 보여야함 db에서 가져오기
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String after = sdf.format(date);
		
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE , -90);
		String before = new SimpleDateFormat("yyyy-MM-dd").format(day.getTime());
		//테스트 session
		//아이디 test의 주문내역 가져오기 => 나중에 추가로 뭘로 가져올건지 생각해보기 
		HttpSession session=request.getSession();
		//session.setAttribute("id","test");
		//String id="test";
		String id="111";
		
		//기본 3개월이내 주문내역 / 주문내역 지정시 그 값 받아서 같이 넘기기
		List<Ordered> list = new MemberService().basicOrdered(id);
		request.setAttribute("orderList", list);
		request.setAttribute("before", before);
		request.setAttribute("after", after);
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
