package com.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardCheckPasswordServlet
 */
@WebServlet("/board/checkPw.do")
public class BoardCheckPasswordServlet extends HttpServlet {
	//게시판 상세보기 전 비번체크 화면이동하는 서블릿
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCheckPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 상세보기 전 비번체크 화면이동하는 서블릿
		int boardNo=Integer.parseInt(request.getParameter("boardNo"));
		request.setAttribute("boardNo", boardNo);
		request.getRequestDispatcher("/views/questionBoard/boardCheckPw.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
