package com.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class MyboardListAjaxServlet
 */
@WebServlet("/member/myboardList")
public class MyboardListAjaxServlet extends HttpServlet {
	//ajax로 내가쓴게시글 불러오기
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyboardListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//내가쓴게시글 불러오기
		int memberNo=1;
		request.setCharacterEncoding("utf-8");
		List<Board> list = new BoardService().allBoards(memberNo);
		request.setAttribute("boardList", list);
		request.getRequestDispatcher("/views/mypage/myboardAjax.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
