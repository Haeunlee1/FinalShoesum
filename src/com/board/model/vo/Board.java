package com.board.model.vo;

import java.util.Date;

public class Board {
	private int qabNo;
	private String qabTitle;
	private String qabWriter;
	private String qabContent;
	private Date qabDate;
	private int qabPw;
	private int qabState;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int qabNo, String qabTitle, String qabWriter, String qabContent, Date qabDate, int qabPw,
			int qabState) {
		super();
		this.qabNo = qabNo;
		this.qabTitle = qabTitle;
		this.qabWriter = qabWriter;
		this.qabContent = qabContent;
		this.qabDate = qabDate;
		this.qabPw = qabPw;
		this.qabState = qabState;
	}
	
	public Board(int qabNo, String qabTitle, String qabWriter, Date qabDate, int qabPw, int qabState) {
		super();
		this.qabNo = qabNo;
		this.qabTitle = qabTitle;
		this.qabWriter = qabWriter;
		this.qabDate = qabDate;
		this.qabPw = qabPw;
		this.qabState = qabState;
	}

	public int getQabNo() {
		return qabNo;
	}

	public void setQabNo(int qabNo) {
		this.qabNo = qabNo;
	}

	public String getQabTitle() {
		return qabTitle;
	}

	public void setQabTitle(String qabTitle) {
		this.qabTitle = qabTitle;
	}

	public String getQabWriter() {
		return qabWriter;
	}

	public void setQabWriter(String qabWriter) {
		this.qabWriter = qabWriter;
	}

	public String getQabContent() {
		return qabContent;
	}

	public void setQabContent(String qabContent) {
		this.qabContent = qabContent;
	}

	public Date getQabDate() {
		return qabDate;
	}

	public void setQabDate(Date qabDate) {
		this.qabDate = qabDate;
	}

	public int getQabPw() {
		return qabPw;
	}

	public void setQabPw(int qabPw) {
		this.qabPw = qabPw;
	}

	public int getQabState() {
		return qabState;
	}

	public void setQabState(int qabState) {
		this.qabState = qabState;
	}
	
	
}
