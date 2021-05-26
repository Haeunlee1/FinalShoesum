package com.board.model.service;

import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;

public class BoardService {
	private BoardDao dao= new BoardDao();
	
	public List<Board> allBoards(int memberNo){
		//내가쓴게시글 가져오기
		Connection conn = getConnection();
		List<Board> list = dao.allBoards(conn,memberNo);
		close(conn);
		return list;
	}
	
	public List<Board> boardList() {
		
		Connection conn = getConnection();
		List<Board> list = dao.boardList(conn);
		close(conn);
		return list;
		
	}
}
