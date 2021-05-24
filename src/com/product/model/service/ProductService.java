package com.product.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.product.model.dao.ProductDao;
import com.product.model.vo.Product;

public class ProductService {

	private ProductDao dao= new ProductDao();
	
	public List<Product> selectProduct(String proNo) {
		//상품 가져오기 =>상품상세페이지
		Connection conn=getConnection();
		List<Product> list = dao.selectProduct(conn, proNo);
		close(conn);
		return list;
	}
	
<<<<<<< HEAD
	public List<Product> allProduct() {
		Connection conn=getConnection();
		List<Product> list = dao.allProduct(conn);
=======
	public List<Product> allWishes(int userNo){
		//찜상품 가져오기
		Connection conn=getConnection();
		List<Product> list=dao.allWishes(conn,userNo);
>>>>>>> branch 'master' of https://github.com/Haeunlee1/FinalShoesum.git
		close(conn);
		return list;
	}
}
