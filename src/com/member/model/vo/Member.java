package com.member.model.vo;

//member테이블
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String email;
	private String phone;
	private String postNo;
	private String address;
	private String addressEnd;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int memberNo, String memberId, String memberPw, String memberName, String email, String phone,
			String postNo, String address, String addressEnd) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.postNo = postNo;
		this.address = address;
		this.addressEnd = addressEnd;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressEnd() {
		return addressEnd;
	}

	public void setAddressEnd(String addressEnd) {
		this.addressEnd = addressEnd;
	}
	
	
}
