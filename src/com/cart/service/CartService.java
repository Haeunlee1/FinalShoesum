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
	
	public int cartDelete(int cartNum) {
		
		Connection conn = getConnection();
		int result = dao.cartDelete(conn,cartNum);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
}
