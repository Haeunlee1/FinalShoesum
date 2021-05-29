package com.board.model.service;

import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;

public class BoardService {
	private BoardDao dao= new BoardDao();
	
	public List<Board> allMyBoards(int memberNo){
		//내가쓴게시글 가져오기
		Connection conn = getConnection();
		List<Board> list = dao.allMyBoards(conn,memberNo);
		close(conn);
		return list;
	}
	
	public List<Board> boardList() {
		
		Connection conn = getConnection();
		List<Board> list = dao.boardList(conn);
		close(conn);
		return list;
		
	}

	public int insertBoard(Board b, int memberNo) {
		//글작성
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, b, memberNo);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		return result;
	}
	
	public Board selectBoard(int boardNo, String qabPw) {
		//비번 맞는 글 찾아오기
		Connection conn= getConnection();
		Board b = dao.selectBoard(conn, boardNo,qabPw);
		close(conn);
		return b;
	}
}
