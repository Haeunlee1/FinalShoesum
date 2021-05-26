package com.checkout.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.checkout.model.dao.CheckoutDao;
import com.checkout.model.vo.Checkout;
import com.member.model.vo.Member;

public class CheckoutService {
	
	CheckoutDao dao = new CheckoutDao();
	
	// 회원 정보 
	
	public Member memberInfo(int userNo) {
			
		Connection conn = getConnection();
		Member m = dao.memberInfo(conn,userNo);
		close(conn);
		return m;
		
	}
	
	// 상품 가져오기 from cart
	
	public List<Checkout> checkoutPro(int userNo) {
		
		Connection conn = getConnection();
		List<Checkout> list = dao.checkoutPro(conn,userNo);
		close(conn);
		return list;
		
	}
	
	// 상품 가져오기 form product 
	
	public Checkout checkoutPro(String proNo, int proCount) {
		
		Connection conn = getConnection();
		Checkout c = dao.checkoutPro(conn,proNo,proCount);
		close(conn);
		return c;
	}
	
	
}
