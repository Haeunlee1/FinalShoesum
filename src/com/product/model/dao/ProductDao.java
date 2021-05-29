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
import com.product.model.vo.Review;

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
	
	public List<Product> recentProduct(Connection conn) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("recentProduct"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> userProduct(Connection conn, String userType, int cPage, int numPerpage) {
		// userType에 따른 상품가져오기 -> man, woman, kidss
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("userProduct"));
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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

	public boolean selectWish(Connection conn, int memberNo, String proNo) {
		//상품no와 회원no로 찜테이블에 있는지 없는지 확인하기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean check=false;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectWish"));
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, proNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				check=true;
			}else {
				check=false;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return check;
	}

	public int addWish(Connection conn, int memberNo, String proNo) {
		//상품디테일에서 찜하기 추가
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("addWish"));
			pstmt.setString(1, proNo);
			pstmt.setInt(2, memberNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public List<Product> allWishes(Connection conn, int userNo){
		//찜 목록 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> list =new ArrayList();
		Product p = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("allWishes"));
			pstmt.setInt(1, userNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p=new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
				p.setImages1(rs.getString("img_src1"));
				p.setImages2(rs.getString("img_src2"));
				p.setImages3(rs.getString("img_src3"));
				p.setImages4(rs.getString("img_src4"));
				p.setLikeNo(rs.getInt("like_no"));
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
	
	public int deleteWish(Connection conn, int userNo, String proNo) {
		//관심상품 삭제 => 테이블 버튼 & 체크 삭제
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteWish"));
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	public int selectProductCount(Connection conn, String userType) {
		// 상품 리스트 페이징 처리
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectProductCount"));
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Product> sortProduct(Connection conn, String sort, String userType, int cPage, int numPerpage) {
		// 최신순, 높은가격순, 낮은가격순 가져오기
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			String sql=prop.getProperty("sortProduct");
			sql=sql.replace("#", sort);
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
//			쿼리문에 문장을 넣으면 ''생기는데 이걸 이스케이프 처리할 방법이 있나? 일단 하은이한테도 질문해둠
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	// review 리스트 가져오기 
	public List<Product> categoryProduct(Connection conn, String userType, String category, int cPage, int numPerpage) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("categoryProduct"));
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> categorySortProduct(Connection conn, String sort, String userType, String category, int cPage, int numPerpage) {
		// userType+category별 최신순, 높은가격순, 낮은가격순 가져오기
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			String sql=prop.getProperty("sortProduct");
			sql=sql.replace("#", sort);
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> categoryProduct(Connection conn, String userType, String category, int cPage, int numPerpage) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("categoryProduct"));
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> categorySortProduct(Connection conn, String sort, String userType, String category, int cPage, int numPerpage) {
		// userType+category별 최신순, 높은가격순, 낮은가격순 가져오기
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			String sql=prop.getProperty("sortProduct");
			sql=sql.replace("#", sort);
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> categoryProduct(Connection conn, String userType, String category, int cPage, int numPerpage) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("categoryProduct"));
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Product> categorySortProduct(Connection conn, String sort, String userType, String category, int cPage, int numPerpage) {
		// userType+category별 최신순, 높은가격순, 낮은가격순 가져오기
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		List<Product> list = new ArrayList();
		Product p = null;
		
		try {
			String sql=prop.getProperty("sortProduct");
			sql=sql.replace("#", sort);
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userType.substring(0,1).toLowerCase()+"%");
			pstmt.setString(2, category);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProNo(rs.getString("pro_no"));
				p.setProName(rs.getString("pro_name"));
				p.setPrice(rs.getInt("pro_price"));
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
	
	public List<Review> selectReviewList(Connection conn,String proNo){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList();
		
		try {
			
			pstmt = conn.prepareStatement(prop.getProperty("selectReviewList"));
			pstmt.setString(1, proNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review r = new Review();
				r.setReviewNo(rs.getInt("REVIEW_NO"));
				r.setReviewCont(rs.getString("REVIEW_CONTENT"));
				r.setReviewRating(rs.getInt("REVIEW_RATING"));
				r.setReviewMemId(rs.getString("MEMBER_ID"));
				r.setReviewProNo(rs.getString("PRO_NO"));
				r.setReviewDate(rs.getDate("REVIEW_DATE"));
				r.setReviewMemNo(rs.getInt("MEMBER_NO"));
				list.add(r);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
			return list;
	}
	
	// review 구매여부 확인 
	public boolean checkOrdered(Connection conn, int userNo, String proNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("checkOrdered"));
			pstmt.setInt(1, userNo);
			pstmt.setString(2, proNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				flag = true;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} 
		return flag;
	}
	
	public int insertReview(Connection conn,Review r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(r.getReviewCont());
		System.out.println(r.getReviewMemNo());
		System.out.println( r.getReviewProNo());
		System.out.println(r.getReviewRating());
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setString(1, r.getReviewCont());
			pstmt.setInt(2, r.getReviewMemNo());
			pstmt.setString(3, r.getReviewProNo());
			pstmt.setInt(4, r.getReviewRating());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
