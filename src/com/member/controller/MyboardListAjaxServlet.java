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
@WebServlet("/mypage/myboardList")
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
		request.setCharacterEncoding("utf-8");
		//페이징처리
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerpage=10;
		
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		List<Board> list = new BoardService().allMyBoards(memberNo,cPage,numPerpage);
		
		//전체 총 게시글 갯수 
		int totalData=new BoardService().allMyBoardCount(memberNo);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<div class=\"pageBar-icon\">&lt;</div>";
		}else {
//			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
//			+"/mypage/myboardList?cPage="+(pageNo-1)+"&memberNo="+memberNo+"'>&lt;</div>";
			pageBar+="<div class=\"pageBar-icon\"><<a href=\"javascript:fn_ajax("+(pageNo-1)+");\">&lt;</div>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<div class=\"pageBar-icon\" style=\"background-color:rgb(52, 152, 219);color:white\">"+pageNo+"</div>";
			}else {
//				pageBar+="<div class=\"pageBar-icon\">"
//						+ "<a href='"+request.getContextPath()
//				+"/mypage/myboardList?cPage="+pageNo+"&memberNo="+memberNo+"'>"+pageNo+"</div>";
				pageBar+="<div class=\"pageBar-icon\"><a href=\"javascript:fn_ajax("+pageNo+");\">"+pageNo+"</div>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<div class=\"pageBar-icon\">&gt;</div>";
		}
		else {
//			pageBar+="<div class=\"pageBar-icon\"><a href='"+request.getContextPath()
//			+"/mypage/myboardList?cPage="+pageNo+"&memberNo="+memberNo+"'>&gt;</div>";
			pageBar+="<div class=\"pageBar-icon\"><a href=\"javascript:fn_ajax("+pageNo+");\">&gt;</div>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.setAttribute("total", totalData);
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("cPage", cPage);
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
