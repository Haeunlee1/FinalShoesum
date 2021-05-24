package com.cart.model.vo;

public class Cart {
	
	
	private int cartNo;
	private int cartProCount;
	private int proNo;
	private String proName;
	private int proPrice;
	private int proSize;
	private String proColor;
	private String proImgSrc;
	private String proCate;
	private int memberNo;
	
	
	 
	 
	public Cart() {
		// TODO Auto-generated constructor stub
	}




	public Cart(int cartNo, int cartProCount, int proNo, String proName, int proPrice, int proSize, String proColor,
			String proImgSrc, String proCate, int memberNo) {
		super();
		this.cartNo = cartNo;
		this.cartProCount = cartProCount;
		this.proNo= proNo;
		this.proName = proName;
		this.proPrice = proPrice;
		this.proSize = proSize;
		this.proColor = proColor;
		this.proImgSrc = proImgSrc;
		this.proCate = proCate;
		this.memberNo = memberNo;
	}




	public int getCartNo() {
		return cartNo;
	}




	public void setCartNo(int cartNo) {
		this.cartNo= cartNo;
	}




	public int getCartProCount() {
		return cartProCount;
	}




	public void setCartProCount(int cartProCount) {
		this.cartProCount = cartProCount;
	}




	public int getProNo() {
		return proNo;
	}




	public void setProNo(int proNo) {
		this.proNo= proNo;
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

	
	public String getProCate() {
		return proCate;
	}


	public void setProCate(String proCate) {
		this.proCate = proCate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	

	
	
	
	
	
		
	
	
	
	
}
