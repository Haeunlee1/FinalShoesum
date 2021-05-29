package com.product.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String reviewCont;
	private int reviewRating;
	private String reviewProNo;
	private String reviewMemId;
	private Date reviewDate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, String reviewCont, int reviewRating, String reviewProNo, String reviewMemId,
			Date reviewDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewCont = reviewCont;
		this.reviewRating = reviewRating;
		this.reviewProNo = reviewProNo;
		this.reviewMemId = reviewMemId;
		this.reviewDate = reviewDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewCont() {
		return reviewCont;
	}

	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewProNo() {
		return reviewProNo;
	}

	public void setReviewProNo(String reviewProNo) {
		this.reviewProNo = reviewProNo;
	}

	public String getReviewMemId() {
		return reviewMemId;
	}

	public void setReviewMemId(String reviewMemId) {
		this.reviewMemId = reviewMemId;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	
	
	
	
}
