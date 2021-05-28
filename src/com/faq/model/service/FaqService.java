package com.faq.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.faq.model.dao.FaqDao;
import com.faq.model.vo.Faq;

public class FaqService {
	
	private FaqDao dao = new FaqDao();
	
	public List<Faq> faqList(){
		
		Connection conn = getConnection();
		List<Faq> list = dao.faqList(conn);
		close(conn);
		return list;
		
	}
}
