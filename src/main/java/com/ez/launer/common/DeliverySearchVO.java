package com.ez.launer.common;

public class DeliverySearchVO extends SearchVO{
	private int usersClassNo;
	private int userNo;
	private String name;
	private String email;
	private String hp;
	private String officeNo;
	
	public DeliverySearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeliverySearchVO(int usersClassNo, int userNo, String name, String email, String hp, String officeNo) {
		super();
		this.usersClassNo = usersClassNo;
		this.userNo = userNo;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.officeNo = officeNo;
	}
	public int getUsersClassNo() {
		return usersClassNo;
	}
	public void setUsersClassNo(int usersClassNo) {
		this.usersClassNo = usersClassNo;
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
	public String getOfficeNo() {
		return officeNo;
	}
	public void setOfficeNo(String officeNo) {
		this.officeNo = officeNo;
	}
	@Override
	public String toString() {
		return "DeliverySearchVO [usersClassNo=" + usersClassNo + ", userNo=" + userNo + ", name=" + name + ", email="
				+ email + ", hp=" + hp + ", officeNo=" + officeNo + ", getUsersClassNo()=" + getUsersClassNo()
				+ ", getUserNo()=" + getUserNo() + ", getName()=" + getName() + ", getEmail()=" + getEmail()
				+ ", getHp()=" + getHp() + ", getOfficeNo()=" + getOfficeNo() + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	
	
	
	
	
	

}
