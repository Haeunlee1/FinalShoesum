package com.member.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.member.model.vo.Member;
import com.member.model.vo.Ordered;
import com.product.model.vo.Product;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		try {
			String filePath=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Member login(Connection conn, String memberId, String memberPw) {
		// 로그인 
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getInt("member_no"));
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberName(rs.getString("member_name"));
				m.setEmail(rs.getString("member_email"));
				m.setPhone(rs.getString("member_phone"));
				m.setPostNo(rs.getString("member_post_no"));
				m.setAddress(rs.getString("member_address"));
				m.setAddressEnd(rs.getString("member_address_end"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	
	
	
	
	
	public List<Ordered> basicOrdered(Connection conn, int no){
		//주문내역 가져오기. 날짜 & 아이디 / 기본화면=>3개월이내 조회, db에 넘겨주기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Ordered> list= new ArrayList();
		Ordered o = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("basicOrdered"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//결과가 있으면 list에 담기
				o=new Ordered();
				o.setOrderDate(rs.getDate("order_date"));
				o.setOrderNo(rs.getInt("order_pro_no"));
				o.setProNo(rs.getString("pro_no"));
				o.setState(rs.getString("order_state"));
				o.setProName(rs.getString("pro_name"));
				o.setProPrice(rs.getInt("pro_price"));
				o.setProSize(rs.getInt("pro_size"));
				o.setProColor(rs.getString("pro_color"));
				o.setAmount(rs.getInt("pro_count"));
				o.setProImg(rs.getString("img_src1"));
				list.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
	
	public List<Ordered> selectOrdered(Connection conn, int memberNo, String before, String after){
		//기간설정해서 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Ordered> list= new ArrayList();
		Ordered o = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectOrdered"));
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, before);
			pstmt.setString(3, after);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//결과가 있으면 list에 담기
				o=new Ordered();
				o.setOrderDate(rs.getDate("order_date"));
				o.setOrderNo(rs.getInt("order_pro_no"));
				o.setProNo(rs.getString("pro_no"));
				o.setState(rs.getString("order_state"));
				o.setProName(rs.getString("pro_name"));
				o.setProPrice(rs.getInt("pro_price"));
				o.setProSize(rs.getInt("pro_size"));
				o.setProColor(rs.getString("pro_color"));
				o.setAmount(rs.getInt("pro_count"));
				o.setProImg(rs.getString("img_src1"));
				list.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int updateMember(Connection conn, Member m) {
		//회원정보수정 (no&id 같으면 수정)
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getPostNo());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getAddressEnd());
			pstmt.setInt(8, m.getMemberNo());
			pstmt.setString(9, m.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMember(Connection conn, Member m) {
		//회원정보 등록 
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertMember"));
			
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getMemberPw());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getEmail());
			pstmt.setString(5,m.getPhone());
			pstmt.setString(6,m.getPostNo());
			pstmt.setString(7,m.getAddress());
			pstmt.setString(8,m.getAddressEnd());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public Member findId(Connection conn, String memberNm, String memberEmail) {
		// 로그인 
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberId"));
			pstmt.setString(1, memberNm);
			pstmt.setString(2, memberEmail);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getInt("member_no"));
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberName(rs.getString("member_name"));
				m.setEmail(rs.getString("member_email"));
				m.setPhone(rs.getString("member_phone"));
				m.setPostNo(rs.getString("member_post_no"));
				m.setAddress(rs.getString("member_address"));
				m.setAddressEnd(rs.getString("member_address_end"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public Member findPw(Connection conn, String memberNm, String memberEmail, String memberId) {
		// 로그인 
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberPw"));
			pstmt.setString(1, memberNm);
			pstmt.setString(2, memberEmail);
			pstmt.setString(3, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberNo(rs.getInt("member_no"));
				m.setMemberId(rs.getString("member_id"));
				m.setMemberPw(rs.getString("member_pw"));
				m.setMemberName(rs.getString("member_name"));
				m.setEmail(rs.getString("member_email"));
				m.setPhone(rs.getString("member_phone"));
				m.setPostNo(rs.getString("member_post_no"));
				m.setAddress(rs.getString("member_address"));
				m.setAddressEnd(rs.getString("member_address_end"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
//HEAD

	public int updateMemberFindPw(Connection conn, Member m) {
		//회원정보수정 (no&id 같으면 수정)
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMemberFindPw"));
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberId());
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Member selectMemberById(Connection conn, String memberId) {
		// 로그인  
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberById"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("member_email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	
	
	// 주문 테이블
	
	public int insertOrderTable(Connection conn,int userNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertOrder"));
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 주문 상세테이블
	public int insertOrderDetail(Connection conn,String proNo,String proCount) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("insertOrderDetail"));
			pstmt.setInt(1,Integer.parseInt(proCount));
			pstmt.setString(2, proNo);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
// branch 'master' of https://github.com/Haeunlee1/FinalShoesum.git
	
}
