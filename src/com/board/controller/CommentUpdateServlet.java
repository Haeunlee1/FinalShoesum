package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;

/**
 * Servlet implementation class CommentUpdateServlet
 */
@WebServlet("/board/updateComment")
public class CommentUpdateServlet extends HttpServlet {
	//댓글수정(관리자만)
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글수정 관리자만
		int qabNo=Integer.parseInt(request.getParameter("qabNo"));
		String content=request.getParameter("content");
		int result=new BoardService().updateComment(qabNo,content);
		String msg=result>0?"댓글이 수정되었습니다.":"댓글 수정에 실패하였습니다.";
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
