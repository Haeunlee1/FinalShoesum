package com.cart.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.cart.model.vo.Cart;

public class CartDao {
	
	Properties prop = new Properties();
	
	public CartDao() {
		
		String path = CartDao.class.getResource("/sql/cart_sql.properties").getPath();
		try {
		prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Cart> cartListView(Connection conn , int userNo){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Cart> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("cartListView"));
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart c = new Cart();
				c.setCartNo(rs.getInt("CART_NUMBER"));
				c.setCartProCount(rs.getInt("PRO_COUNT"));
				c.setMemberNo(rs.getInt("MEMBER_NO"));
				c.setProColor(rs.getString("PRO_COLOR"));
				c.setProImgSrc(rs.getString("IMG_SRC"));
				c.setProName(rs.getString("PRO_NAME"));
				c.setProNo(rs.getInt("PRO_NO"));
				c.setProPrice(rs.getInt("PRO_PRICE"));
				c.setProSize(rs.getInt("PRO_SIZE"));
				list.add(c);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int cartDelete(Connection conn , int cartNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("cartDelete"));
			pstmt.setInt(1, cartNo);
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
