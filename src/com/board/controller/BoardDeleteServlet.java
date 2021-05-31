package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/boardDelete")
public class BoardDeleteServlet extends HttpServlet {
	//게시글 삭제
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 삭제 => 게시글 번호로 받아서 지우기
		int qabNo=Integer.parseInt(request.getParameter("qabNo"));
		int result=new BoardService().deleteBoard(qabNo);
		//게시글의 댓글이 있으면 댓글도 테이블에서 삭제
		if(request.getParameter("bcNo")!=null) {
			result=new BoardService().deleteComment(qabNo);
		}
		
		String msg=result>0?"게시글이 삭제되었습니다":"게시글 삭제에 실패하였습니다";

		//memberNo가 있다 => 마이페이지에서 눌렀다
		if(request.getParameter("memberNo")!=null) {
			int memberNo=Integer.parseInt(request.getParameter("memberNo"));
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/mypage/mypage.do?memberNo="+memberNo+"&type=board");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", msg);
			request.setAttribute("loc", "/board/boardList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
