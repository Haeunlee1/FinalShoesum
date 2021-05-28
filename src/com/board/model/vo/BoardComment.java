package com.board.model.vo;

import java.util.Date;

public class BoardComment {
//게시판 댓글 객체
	private int commentNo;
	private String commentContent;
	private Date commentDate;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public BoardComment(int commentNo, String commentContent, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	
	
}
