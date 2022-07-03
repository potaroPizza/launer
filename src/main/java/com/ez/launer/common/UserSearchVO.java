package com.ez.launer.common;


import java.util.Date;

public class UserSearchVO extends SearchVO{
	private int userCode;
	private int userNo;
	private String name;
	private String email;
	private String hp;
	
	public UserSearchVO() {
		super();
		
	}

	public UserSearchVO(int userCode, int userNo, String name, String email, String hp) {
		super();
		this.userCode = userCode;
		this.userNo = userNo;
		this.name = name;
		this.email = email;
		this.hp = hp;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	@Override
	public String toString() {
		return "UserSearchVO [userCode=" + userCode + ", userNo=" + userNo + ", name=" + name + ", email=" + email
				+ ", hp=" + hp + ", getUserCode()=" + getUserCode() + ", getUserNo()=" + getUserNo() + ", getName()="
				+ getName() + ", getEmail()=" + getEmail() + ", getHp()=" + getHp() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	
	
}
