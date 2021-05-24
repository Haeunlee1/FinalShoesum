package com.product.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.member.model.dao.MemberDao;
import com.product.model.vo.Product;

public class ProductDao {
	private Properties prop= new Properties();
	
	public ProductDao() {
		try {
			String filePath=MemberDao.class.getResource("/sql/product_sql.properties").getPath();
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Product> selectProduct(Connection conn, String proNo) {
		// 상품 가져오기
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectProduct"));
			pstmt.setString(1, proNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
				p.setSize(rs.getInt("pro_size"));
				p.setColor(rs.getString("pro_color"));
				p.setStock(rs.getInt("pro_stock"));
				p.setImages1(rs.getString("img_src1"));
				p.setImages2(rs.getString("img_src2"));
				p.setImages3(rs.getString("img_src3"));
				p.setImages4(rs.getString("img_src4"));
				
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Product> allProduct(Connection conn) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
				p.setSize(rs.getInt("pro_size"));
				p.setColor(rs.getString("pro_color"));
				p.setStock(rs.getInt("pro_stock"));
				p.setImages1(rs.getString("img_src1"));
				p.setImages2(rs.getString("img_src2"));
				p.setImages3(rs.getString("img_src3"));
				p.setImages4(rs.getString("img_src4"));
				
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}
