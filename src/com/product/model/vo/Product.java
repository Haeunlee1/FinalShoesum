package com.product.model.vo;

import java.util.List;

public class Product {
	//상품
	private String proNo;
	private String proName;
	private int price;
	private String images1;	 //이미지주소들
	private String images2;	 //이미지주소들
	private String images3;	 //이미지주소들
	private String images4;	 //이미지주소들
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String proNo, String proName, int price, String images1,
			String images2, String images3, String images4) {
		super();
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.images1 = images1;
		this.images2 = images2;
		this.images3 = images3;
		this.images4 = images4;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImages1() {
		return images1;
	}

	public void setImages1(String images1) {
		this.images1 = images1;
	}

	public String getImages2() {
		return images2;
	}

	public void setImages2(String images2) {
		this.images2 = images2;
	}

	public String getImages3() {
		return images3;
	}

	public void setImages3(String images3) {
		this.images3 = images3;
	}

	public String getImages4() {
		return images4;
	}

	public void setImages4(String images4) {
		this.images4 = images4;
	}

	
	
	
}
