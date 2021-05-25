package com.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.common.JDBCTemplate.close;

import com.board.model.vo.Board;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<Board> boardList(Connection conn, int userNo){
		PreparedStatement pstmt = null;
		ResultSet result = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardList"));
			pstmt.setInt(1, userNo);
			result = pstmt.executeQuery();
			while(result.next()) {
				Board b = new Board();
				b.setQabNo(result.getInt("QAB_NUMBER"));
				b.setQabTitle(result.getString("QAB_TITLE"));
				b.setQabWriter(result.getString("QAB_WRITER"));
				b.setQabDate(result.getDate("QAB_DATE"));
				b.setQabPw(result.getInt("QAB_PW"));
				b.setQabContent(result.getString("QAB_CONTENT"));
				b.setQabState(result.getInt("QAB_STATE"));
				b.setCommentNo(result.getInt("COMMENT_NUMBER"));
				b.setCommentCtn(result.getString("COMMENT_CONTENT"));
				b.setCommentDate(result.getDate("COMMENT_DATE"));
				list.add(b);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(result);
			close(pstmt);
		}
		return list;
	}
	
	
}
