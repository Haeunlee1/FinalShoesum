package com.common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCTemplate {
	
	
	// connection 생성 
	
	public static Connection getConnection() {
		
		Properties prop = new Properties();
		Connection conn = null;
		
		try {
			String fileName = JDBCTemplate.class.getResource("/driver/driver.properties").getPath();
			prop.load(new FileReader(fileName));
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"),prop.getProperty("id"),prop.getProperty("password"));
			conn.setAutoCommit(false);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	
	// close 오버라이딩 
	
		public static void close(Connection conn) {
			
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		public static void close(PreparedStatement pstmt) {
			
			try {
				if(pstmt!=null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		public static void close(ResultSet rs) {
			
			try {
				if(rs!=null && !rs.isClosed()) {
					rs.close();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		}
	
	// commit
		
		public static void commit(Connection conn) {
			
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.commit();
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	
	// rollback

		public static void rollback(Connection conn) {
			try {
				if(conn!=null && !conn.isClosed()) {
					conn.rollback();
				} 
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
}
