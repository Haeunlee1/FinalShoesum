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
 * Servlet implementation class BoardWirteEndServlet
 */
@WebServlet("/board/boardWriteEnd")
public class BoardWirteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWirteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Board b = new Board();
		b.setQabTitle(request.getParameter("qabTitle"));
		b.setQabContent(request.getParameter("qabContent"));
		b.setQabWriter(request.getParameter("qabWriter"));
		b.setQabPw(Integer.parseInt(request.getParameter("qabPw")));
		
		Integer.parseInt(request.getParameter("memberNo"));
		
		/* member라는 변수에 담아놓은뒤에 쓰기위해서 선언 */
		int member = Integer.parseInt(request.getParameter("memberNo"));
		int result = new BoardService().insertBoard(b);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시글이 등록되었습니다.";
			loc="/board/boardList";
		}else {
			msg="게시글 등록에 실패했습니다.";
			loc="/board/boardForm";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
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
