package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.Base64;
import java.util.List;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;
import com.member.model.vo.Ordered;

public class MemberService {
	
	private MemberDao dao= new MemberDao();
	
	public Member login(String memberId, String memberPw) {
		//로그인
		Connection conn=getConnection();
		Member m=dao.login(conn, memberId, memberPw);
		close(conn);
		return m;
	}
	
	public List<Ordered> basicOrdered(int no){
		//기본 주문내역 페이지
		Connection conn=getConnection();
		List<Ordered> list=dao.basicOrdered(conn, no);
		close(conn);
		return list;
	}
	
	public List<Ordered> selectOrdered(int memberNo, String before, String after){
		//기간설정한 후 주문내역 조회
		Connection conn=getConnection();
		List<Ordered> list=dao.selectOrdered(conn,memberNo, before, after);
		close(conn);
		return list;
	}
	
	public int updateMember(Member m) {
		//회원정보수정
		Connection conn= getConnection();
		int result = dao.updateMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int insertMember(Member m) {
		//회원가입
		Connection conn= getConnection();
		int result = dao.insertMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
	public Member selectMemberId(String memberNm, String memberEmail) {
		//로그인
		Connection conn=getConnection();
		Member m=dao.findId(conn, memberNm, memberEmail);
		close(conn);
		return m;
	}
	
	public Member selectMemberPw(String memberNm, String memberEmail, String memberId) {
		//로그인
		Connection conn=getConnection();
		Member m=dao.findPw(conn, memberNm, memberEmail, memberId);
		close(conn);
		if(m != null) {
			updateMemberFindPw(m);
		}
		return m;
	}

	public int updateMemberFindPw(Member m) {
		//회원정보수정
		Connection conn= getConnection();
		m.setMemberPw(getSHA512(m.getMemberPw()));
		int result = dao.updateMemberFindPw(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	private String getSHA512(String val) {		
		String encPwd="";
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");		
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=val.getBytes(Charset.forName("utf-8"));
		md.update(bytes);
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}

	public Member selectMemberIsCheckId(String memberId) {
		//로그인
		Connection conn=getConnection();
		Member m=dao.selectMemberById(conn, memberId);
		close(conn);
		return m;
	}
	
	
	// 주문 내역 insert
	public int insertOrder(int userNo, String proNo, String proCount) {
		
		int resultOr = 0;
		Connection conn = getConnection();
		
		// 주문 테이블 생성 
		resultOr = dao.insertOrderTable(conn,userNo);
		
		
		// 주문상세 테이블 생성 
		String[] proNoArray = proNo.split("/");
		String[] proCountArray = proCount.split("/");
		
		int resultDe = 0;
		
		// 단일 상품 와 복수개의 상품 분기처리하기 
		
		if(proCountArray.length==1) {
			for(int i=0;i<proNoArray.length;i++) {
				resultDe += dao.insertOrderDetail(conn,proNoArray[i].trim(),proCountArray[i].trim());
			}
		} else {
			for(int i=0;i<proNoArray.length-1;i++) {
				resultDe += dao.insertOrderDetail(conn,proNoArray[i].trim(),proCountArray[i].trim());
			}
		}
		
		// 결과처리하기 
		if(resultOr>0 && resultDe >= proNoArray.length-1) {
			commit(conn);
		} else {
			resultOr = 0;
			rollback(conn);
		}
		close(conn);
		return resultOr;

	}
	
	// kakao 체크 
	
	public Member kakaoCheck(String userName,String email) {
		
		Connection conn = getConnection();
		Member m = dao.kakaoCheck(conn,userName,email);
		close(conn);
		return m;
	}
	
	// Kakao 회원가입
	
	public int kakaoRegister(String userName, String email) {
		Connection conn = getConnection();
		int result = dao.kakaoRegister(conn,userName,email);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public Member checkMember(int memberNo) {
		//로그인된 객체 가져오기
		Connection conn=getConnection();
		Member m =dao.checkMember(conn, memberNo);
		close(conn);
		return m;
	}
	
	public Member checkMember(String memberId) {
		//로그인된 객체 가져오기
		Connection conn=getConnection();
		Member m =dao.checkMember(conn, memberId);
		close(conn);
		return m;
	}
	
}

