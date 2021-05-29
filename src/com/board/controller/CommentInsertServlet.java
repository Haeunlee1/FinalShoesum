package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.BoardComment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/board/commentInsert")
public class CommentInsertServlet extends HttpServlet {
	//댓글 등록
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글 등록 서블릿
		int qabNo=Integer.parseInt(request.getParameter("qabNo"));
		String content=request.getParameter("content");
		
		int result= new BoardService().insertComment(qabNo,content);
		String msg=result>0?"댓글이 등록되었습니다.":"댓글 등록에 실패하였습니다.";
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
