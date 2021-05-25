package com.member.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
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
	
	public List<Ordered> basicOrdered(String id){
		//기본 주문내역 페이지
		Connection conn=getConnection();
		List<Ordered> list=dao.basicOrdered(conn, id);
		close(conn);
		return list;
	}
	
	public List<Ordered> selectOrdered(String id, String before, String after){
		//기간설정한 후 주문내역 조회
		Connection conn=getConnection();
		List<Ordered> list=dao.selectOrdered(conn,id, before, after);
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
		return m;
	}
}

