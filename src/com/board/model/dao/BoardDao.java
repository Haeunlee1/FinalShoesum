package com.board.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.board.model.vo.Board;
import com.member.model.dao.MemberDao;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			String filePath=MemberDao.class.getResource("/sql/board_sql.properties").getPath();
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> allMyBoards(Connection conn, int memberNo){
		//내가쓴 게시글 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Board> list=new ArrayList();
		Board b=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("allMyBoards"));
			pstmt.setInt(1, memberNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				b= new Board();
				b.setQabNo(rs.getInt("qab_number"));
				b.setQabTitle(rs.getString("qab_title"));
				b.setQabWriter(rs.getString("qab_writer"));
				b.setQabContent(rs.getString("qab_content"));
				b.setQabDate(rs.getDate("qab_date"));
				b.setQabPw(rs.getString("qab_pw"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	/* 질문게시판 가져오기 */
	public List<Board> boardList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet result = null;
		List<Board> list = new ArrayList();
		Board b=null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardList"));
			result = pstmt.executeQuery();
			while(result.next()) {
				b = new Board();
				b.setQabNo(result.getInt("QAB_NUMBER"));
				b.setQabTitle(result.getString("QAB_TITLE"));
				b.setQabWriter(result.getString("QAB_WRITER"));
				b.setQabDate(result.getDate("QAB_DATE"));
				b.setCommentNo(result.getString("comment_number"));
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

	/* 글쓰기 */
	public int insertBoard(Connection conn, Board b, int memberNo) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1,b.getQabTitle());
			pstmt.setString(2, b.getQabWriter());
			pstmt.setString(3,b.getQabPw());
			pstmt.setString(4, b.getQabContent());
			pstmt.setInt(5, memberNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public Board selectBoard(Connection conn, int boardNo,String qabPw) {
		//비번으로 게시글 불러오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Board b=null;
		try {
			if(qabPw.equals("0")) {
				//관리자라면
				pstmt=conn.prepareStatement(prop.getProperty("selectBoardAdmin"));
				pstmt.setInt(1, boardNo);
			}else {
				pstmt=conn.prepareStatement(prop.getProperty("selectBoard"));
				pstmt.setInt(1, boardNo);
				pstmt.setString(2, qabPw);
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				b=new Board();
				b.setQabNo(rs.getInt("qab_number"));
				b.setQabTitle(rs.getString("qab_title"));
				b.setQabWriter(rs.getString("qab_writer"));
				b.setQabDate(rs.getDate("qab_date"));
				b.setQabPw(rs.getString("qab_pw"));
				b.setQabContent(rs.getString("qab_content"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
		
	}
}
