package com.cart.model.vo;

public class Cart {
	
	
	private int cartNum;
	private int cartProCount;
	private int proNum;
	private String proName;
	private int proPrice;
	private int proSize;
	private String proColor;
	private String proImgSrc;
	private int memberNo;
	
	
	 
	 
	public Cart() {
		// TODO Auto-generated constructor stub
	}




	public Cart(int cartNum, int cartProCount, int proNum, String proName, int proPrice, int proSize, String proColor,
			String proImgSrc, int memberNo) {
		super();
		this.cartNum = cartNum;
		this.cartProCount = cartProCount;
		this.proNum = proNum;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proSize = proSize;
		this.proColor = proColor;
		this.proImgSrc = proImgSrc;
		this.memberNo = memberNo;
	}




	public int getCartNum() {
		return cartNum;
	}




	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}




	public int getCartProCount() {
		return cartProCount;
	}




	public void setCartProCount(int cartProCount) {
		this.cartProCount = cartProCount;
	}




	public int getProNum() {
		return proNum;
	}




	public void setProNum(int proNum) {
		this.proNum = proNum;
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




	public String getProImgSrc() {
		return proImgSrc;
	}




	public void setProImgSrc(String proImgSrc) {
		this.proImgSrc = proImgSrc;
	}




	public int getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	

	
	
	
	
	
		
	
	
	
	
}
