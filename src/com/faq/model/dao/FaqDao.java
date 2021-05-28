package com.faq.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.faq.model.vo.Faq;
import com.member.model.dao.MemberDao;

public class FaqDao {
	
private Properties prop = new Properties();
	
	public FaqDao() {
		try {
			String filePath=MemberDao.class.getResource("/sql/faq_sql.properties").getPath();
			prop.load(new FileReader(filePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Faq> faqList(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet result = null;
		List<Faq> list = new ArrayList();
		Faq q=null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("faqList"));
			result = pstmt.executeQuery();
			while(result.next()) {
				q = new Faq();
				q.setFaqNo(result.getInt("FAQ_NUMBER"));
				q.setFaqTitle(result.getString("FAQ_TITLE"));
				q.setFaqContent(result.getString("FAQ_CONTENT"));
				list.add(q);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(result);
			close(pstmt);
		}
		return list;

	}
}
