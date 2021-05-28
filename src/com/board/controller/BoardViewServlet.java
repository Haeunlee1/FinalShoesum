package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/board/boardView.do")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비밀번호만 넘겨서 맞는 게시글 보여주기
		int qabPw=0;
		if(request.getParameter("admin_check")==null) {
			qabPw = Integer.parseInt(request.getParameter("input_pw"));
		}else {
			//관리자라면
			qabPw =0;
		}
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		Board b = new BoardService().selectBoard(boardNo,qabPw);
		
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views/questionBoard/boardView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
