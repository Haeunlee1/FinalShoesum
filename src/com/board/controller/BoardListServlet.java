package com.board.controller;

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
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 전체 리스트
		//페이징처리
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage=12;
		System.out.println("cPage"+cPage);
		List<Board> list = new BoardService().boardList(cPage,numPerpage);
		
		int totalData=new BoardService().allBoardCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<div class=\"pageBar-icon\">&lt;</div>";
		}else {
			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
			+"/board/boardList?cPage="+(pageNo-1)+"'>&lt;</div>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<div class=\"pageBar-icon\" style=\"background-color:rgb(52, 152, 219);color:white\">"+pageNo+"</div>";
			}else {
				pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
				+"/board/boardList?cPage="+pageNo+"'>"+pageNo+"</div>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<div class=\"pageBar-icon\">&gt;</div>";
		}
		else {
			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
			+"/board/boardList?cPage="+pageNo+"'>&gt;</div>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/questionBoard/boardList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
