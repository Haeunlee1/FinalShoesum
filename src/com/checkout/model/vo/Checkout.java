package com.checkout.model.vo;

public class Checkout {
	
	
	private String proNo;
	private String proName;
	private int proPrice;
	private int proCount;
	private int cartNo;
	
	public Checkout() {
		// TODO Auto-generated constructor stub
	}

	public Checkout(String proNo, String proName, int proPrice, int proCount, int cartNo) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proCount = proCount;
		this.cartNo = cartNo;
	}

	public String getProNo() {
		return proNo;
	}

	public void setProNo(String proNo) {
		this.proNo = proNo;
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

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	
	
}
