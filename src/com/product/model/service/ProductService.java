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
		//상품번호로 이미지테이블 연결하여 주소들 가져오기
		Connection conn=getConnection();
		List<Product> list = dao.selectProduct(conn, proNo);
		close(conn);
		return list;
	}
	
	public List<Product> allProduct() {
		Connection conn=getConnection();
		List<Product> list = dao.allProduct(conn);
		close(conn);
		return list;
	}
}
