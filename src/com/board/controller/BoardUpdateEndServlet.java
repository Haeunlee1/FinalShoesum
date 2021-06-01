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
 * Servlet implementation class BoardUpdateEndServlet
 */
@WebServlet("/board/boardUpdateEnd")
public class BoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글번호,회원번호 일치하는지 확인 후 수정하기
		Board b = new Board();
		b.setQabTitle(request.getParameter("qab_cate"));
		b.setQabContent(request.getParameter("qab_content"));
		b.setQabWriter(request.getParameter("memberId"));
		b.setQabPw(request.getParameter("qabPw"));
		int qabNo=Integer.parseInt(request.getParameter("qabNo"));
		int result = new BoardService().updateBoard(b, qabNo);

		String msg=result>0?"게시글이 수정되었습니다.":"게시글 수정에 실패했습니다. 다시 시도해주세요.";
		String loc="";
		int memberNo=Integer.parseInt(request.getParameter("memberNo"));
		if(result>0) {
			if(memberNo!=-1) {		//수정 성공 & 마이페이지 접근
				memberNo=Integer.parseInt(request.getParameter("memberNo"));
				loc="/mypage/mypage.do?memberNo="+memberNo+"&type=board";
			}else {
				loc="/board/boardView.do?admin_check=a&boardNo="+qabNo;
			}
		}else {
			if(memberNo!=-1) {		//수정 실패 & 마이페이지 접근
				memberNo=Integer.parseInt(request.getParameter("memberNo"));
				loc="/mypage/mypage.do?memberNo="+memberNo+"&type=board";
			}else {
				loc="/board/boardEdit?qabNo="+qabNo;
			}
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
