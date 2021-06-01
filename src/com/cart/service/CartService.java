package com.cart.service;

import java.sql.Connection;

import java.util.List;

import com.cart.dao.CartDao;
import com.cart.model.vo.Cart;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.rollback;

public class CartService {

	
	private CartDao dao = new CartDao();
	
	
	public List<Cart> cartListView(int userNo){
		
		Connection conn = getConnection();
		
		List<Cart> list = dao.cartListView(conn,userNo);
		close(conn);
		return list;
	}
	
	public int cartDelete(int cartNo) {
		
		Connection conn = getConnection();
		int result = dao.cartDelete(conn,cartNo);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertCart(int userNo, String proNo, int proCount) {
		
		Connection conn = getConnection();
		int result = dao.insertCart(conn,userNo,proNo,proCount);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result; 
	}
	
	public int selectDelete(String[] cartNosArr) {
		
		Connection conn = getConnection();
		
		int result = 0;
		for(String cartNo : cartNosArr) {
			result += dao.selectDelete(conn,cartNo.trim());
		}
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteAll(int userNo) {
		
		Connection conn = getConnection();
		
		int result = dao.deleteAll(conn,userNo);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
}
