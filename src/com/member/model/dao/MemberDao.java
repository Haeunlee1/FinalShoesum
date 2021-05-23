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
	
	
	
	
	
	
	public List<Ordered> basicOrdered(Connection conn, String id){
		//주문내역 가져오기. 날짜 & 아이디 / 기본화면=>3개월이내 조회, db에 넘겨주기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Ordered> list= new ArrayList();
		Ordered o = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("basicOrdered"));
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//결과가 있으면 list에 담기
				o=new Ordered();
				o.setOrderDate(rs.getDate("order_date"));
				o.setOrderNo(rs.getInt("order_pro_no"));
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
	
	public List<Ordered> selectOrdered(Connection conn, String id, String before, String after){
		//기간설정해서 가져오기
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Ordered> list= new ArrayList();
		Ordered o = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectOrdered"));
			pstmt.setString(1, id);
			pstmt.setString(2, before);
			pstmt.setString(3, after);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//결과가 있으면 list에 담기
				o=new Ordered();
				o.setOrderDate(rs.getDate("order_date"));
				o.setOrderNo(rs.getInt("order_pro_no"));
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
}
