package com.checkout.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	
	public List<Checkout> checkoutPro(Connection conn, String cartNo){
		
		Statement stmt = null;
		ResultSet rs = null ;
		List<Checkout> list = new ArrayList();
		
		
		try {
			
			String[] cartArray = cartNo.split(" / ");
			String cartSql = "";
			for(int i = 0;i<cartArray.length;i++) {
				if(i==cartArray.length-1) {
					cartSql += cartArray[i];
				} else {
					cartSql +=cartArray[i] + ",";
				}
			}
			System.out.println(cartSql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT PRO_NO , PRO_NAME, PRO_PRICE,PRO_COUNT,CART_NUMBER"
					+ " FROM CART JOIN PRODUCT USING(PRO_NO) WHERE CART_NUMBER in("+cartSql +")");
			
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
			close(stmt);
		}
		
		return list;
	}
		
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("checkoutList"));
//			pstmt.setInt(1, cartNo);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				Checkout c = new Checkout();
//				c.setProNo(rs.getString("PRO_NO"));
//				c.setProName(rs.getString("PRO_NAME"));
//				c.setProPrice(rs.getInt("PRO_PRICE"));
//				c.setProCount(rs.getInt("PRO_COUNT"));
//				c.setCartNo(rs.getInt("CART_NUMBER"));
//				list.add(c);
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
				
				
	
	
	// 상품가져오기 from product
	
	public List<Checkout> checkoutPro(Connection conn, String proNo, String proCount) {
		
		Statement stmt = null;
		ResultSet rs = null;
		List<Checkout> list = new ArrayList();
		
		String[] proNoArray = proNo.split("/"); 
		String[] proCountArray = proCount.split("/");
		
		String proNoSql = "";
		
		for(int i = 0; i<proNoArray.length;i++) {
			if(i==proNoArray.length-1) {
				proNoSql += proNoArray[i];
			} else {
				proNoSql += proNoArray[i] + ",";
			}
		}
		
		System.out.println("=====");
		System.out.println(proCountArray[0]);
		System.out.println("=====");
		
		int i = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM PRODUCT WHERE PRO_NO in('"+proNoSql+"')");
			while(rs.next()) {
				Checkout c = new Checkout();
				c.setProNo(rs.getString("PRO_NO"));
				c.setProName(rs.getString("PRO_NAME"));
				c.setProPrice(rs.getInt("PRO_PRICE"));
				c.setProCount(Integer.parseInt(proCountArray[i]));
				i++;
				list.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	
	

}
