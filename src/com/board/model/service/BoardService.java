package com.board.model.service;

import java.sql.Connection;
import java.util.List;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;
import static com.common.JDBCTemplate.commit;

import com.board.model.dao.BoardDao;
import com.board.model.vo.Board;

public class BoardService {
	
	/* Boarddao 생성 호출 */
	private BoardDao dao = new BoardDao();
	
	/* List를 userNo로 해서 받아옴 */
	public List<Board> boardList(int userNo) {
		
		Connection conn = getConnection();
		List<Board> list = dao.boardList(conn, userNo);
		close(conn);
		return list;
		
	}
	
	
}
