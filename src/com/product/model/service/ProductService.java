package com.product.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.product.model.dao.ProductDao;
import com.product.model.vo.Product;
import com.product.model.vo.Review;

public class ProductService {

	private ProductDao dao= new ProductDao();
	
	public List<Product> selectProduct(String proNo) {
		//상품 가져오기 =>상품상세페이지
		Connection conn=getConnection();
		List<Product> list = dao.selectProduct(conn, proNo);
		close(conn);
		return list;
	}

	public List<Product> allProduct() {
		// 전체 상품 리스트 가져오기 -> 메인 bestproduct 사용
		Connection conn=getConnection();
		List<Product> list = dao.allProduct(conn);
		close(conn);
		return list;
	}
	
	public List<Product> recentProduct() {
		// 최근 등록한 상품 5개 가져오기 -> 메인 newproduct 사용
		Connection conn=getConnection();
		List<Product> list = dao.recentProduct(conn);
		close(conn);
		return list;
	}
	
	public List<Product> userProduct(String userType, int cPage, int numPerpage) {
		// userType별 상품 리스트 가져오기
		Connection conn=getConnection();
		List<Product> list = dao.userProduct(conn,userType,cPage,numPerpage);
		close(conn);
		return list;
	}

	public boolean selectWish(int memberNo, String proNo) {
		//상품디테일 눌렀을 때 그 유저의 찜한 상품인지 아닌지 확인하는 로직
		Connection conn=getConnection();
		boolean check = dao.selectWish(conn,memberNo,proNo);
		close(conn);
		return check;
	}
	
	public int addWish(int memberNo, String proNo) {
		//상품디테일에서 찜하기 누르면 추가하기
		Connection conn=getConnection();
		int result=dao.addWish(conn,memberNo,proNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Product> allWishes(int userNo){
		//찜상품 가져오기
		Connection conn=getConnection();
		List<Product> list=dao.allWishes(conn,userNo);
		close(conn);
		return list;
	}
	
	public int deleteWish(int userNo, String proNo) {
		//찜한상품삭제=>테이블 삭제버튼
		Connection conn= getConnection();
		int result = dao.deleteWish(conn, userNo, proNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int checkDeleteWish(int userNo,String[] checkArr) {
		//찜한상품삭제=>테이블 밑 버튼(체크박스)
		Connection conn=getConnection();
		int result=0;
		int count=0;
		for(String pno : checkArr) {	//체크된 배열 반복문 돌면서 지우기
			result+=dao.deleteWish(conn,userNo,pno);
			if(result==0) {
				rollback(conn);
				close(conn);
				return 0;
			}
			count++;
		}
		if(result>=count) commit(conn);
		close(conn);
		return result;
	}
	
	public int selectProdcutCount(String userType) {
		// 상품리스트 페이징 처리
		Connection conn=getConnection();
		int result = dao.selectProductCount(conn, userType);
		close(conn);
		return result;
	}
	
	public List<Product> sortProduct(String sort, String userType, int cPage, int numPerpage) {
		// 최신순, 높은가격순, 낮은가격순 가져오기
		Connection conn = getConnection();
		List<Product> list = dao.sortProduct(conn,sort,userType,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public List<Product> categoryProduct(String userType, String category, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Product> list = dao.categoryProduct(conn,userType,category,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	public List<Product> categorySortProduct(String sort, String userType, String category, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Product> list = dao.categorySortProduct(conn,sort,userType,category,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	// review 리스트 
	public List<Review> selectReviewList(String proNo){
		Connection conn = getConnection();
		List<Review> list = dao.selectReviewList(conn,proNo);
		close(conn);
		return list;
	}
	
	// review 구매여부 확인
	public boolean checkOrdered(int userNo, String proNo) {
		
		Connection conn = getConnection();
		boolean flag = dao.checkOrdered(conn,userNo,proNo);
		close(conn);
		return flag;
	}
	
	// review insert
	public int insertReview(Review r) {
		Connection conn = getConnection();
		int result = dao.insertReview(conn,r);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
}
