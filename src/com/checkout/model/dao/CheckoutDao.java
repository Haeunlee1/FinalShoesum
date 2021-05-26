package com.checkout.model.dao;

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

import com.checkout.model.vo.Checkout;
import com.member.model.vo.Member;


public class CheckoutDao {
	
	
	private Properties prop = new Properties();
	
	public CheckoutDao() {
		
		String path = CheckoutDao.class.getResource("/sql/checkout_sql.properties").getPath();
		try {
		prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	// 회원정보 
	
	public Member memberInfo(Connection conn, int userNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = new Member();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberInfo"));
			pstmt.setInt(1,userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				m.setMemberNo(rs.getInt("MEMBER_NO"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPw(rs.getString("MEMBER_PW"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setEmail(rs.getString("MEMBER_EMAIL"));
				m.setPhone(rs.getString("MEMBER_PHONE"));
				m.setPostNo(rs.getString("MEMBER_POST_NO"));
				m.setAddress(rs.getString("MEMBER_ADDRESS"));
				m.setAddressEnd(rs.getString("MEMBER_ADDRESS_END"));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		 return m;
	}
	
	// 상품가져오기 from cart 
	
	public List<Checkout> checkoutPro(Connection conn, int userNo){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null ;
		List<Checkout> list = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("checkoutList"));
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Checkout c = new Checkout();
				c.setProNo(rs.getString("PRO_NO"));
				c.setProName(rs.getString("PRO_NAME"));
				c.setProPrice(rs.getInt("PRO_PRICE"));
				c.setProCount(rs.getInt("PRO_COUNT"));
				c.setCartNo(rs.getInt("CART_NUMBER"));
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
	
	
	// 상품가져오기 from product
	
	public Checkout checkoutPro(Connection conn, String proNo, int proCount) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Checkout c = new Checkout();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("checkoutPro"));
			pstmt.setString(1, proNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				c.setProNo(rs.getString("PRO_NO"));
				c.setProName(rs.getString("PRO_NAME"));
				c.setProPrice(rs.getInt("PRO_PRICE"));
				c.setProCount(proCount);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
	
	

}
