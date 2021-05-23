package com.member.model.vo;

import java.util.Date;

public class Ordered {

	//주문내역 화면에 보이는 항목들 변수로 생성
	
	private Date orderDate;
	private int orderNo;
	private String state;
	
	private String proName;
	private int proPrice;
	private int proSize;
	private String proColor;
	private int amount;
	private String proImg;
	
	public Ordered() {
		// TODO Auto-generated constructor stub
	}

	public Ordered(Date orderDate, int orderNo, String state, String proName, int proPrice, int proSize,
			String proColor, int amount, String proImg) {
		super();
		this.orderDate = orderDate;
		this.orderNo = orderNo;
		this.state = state;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proSize = proSize;
		this.proColor = proColor;
		this.amount = amount;
		this.proImg = proImg;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProSize() {
		return proSize;
	}

	public void setProSize(int proSize) {
		this.proSize = proSize;
	}

	public String getProColor() {
		return proColor;
	}

	public void setProColor(String proColor) {
		this.proColor = proColor;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	
	
}
