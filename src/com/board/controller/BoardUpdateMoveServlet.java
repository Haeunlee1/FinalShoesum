package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.board.model.vo.BoardComment;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/board/boardEdit")
public class BoardUpdateMoveServlet extends HttpServlet {
	//게시글 수정이동 서블릿
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateMoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qabNo = Integer.parseInt(request.getParameter("qabNo"));
		String qabPw="0";
		Board b = new BoardService().selectBoard(qabNo,qabPw);
		BoardComment bc=new BoardService().selectComment(qabNo);
		int memberNo=0;
		if(request.getParameter("memberNo")!=null) {
			memberNo=Integer.parseInt(request.getParameter("memberNo"));
		}
		request.setAttribute("comment", bc);
		request.setAttribute("board", b);
		request.setAttribute("memberNo", memberNo);
		request.getRequestDispatcher("/views/questionBoard/boardEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
