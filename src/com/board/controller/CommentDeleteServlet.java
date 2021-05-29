package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;

/**
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/board/deleteComment")
public class CommentDeleteServlet extends HttpServlet {
	//댓글 삭제하기
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글 삭제하기
		int qabNo=Integer.parseInt(request.getParameter("qabNo"));
		int result=new BoardService().deleteComment(qabNo);
		String msg=result>0?"댓글이 삭제되었습니다.":"댓글삭제 실패되었습니다.";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", "/board/boardView.do?admin_check=a&boardNo="+qabNo);
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
