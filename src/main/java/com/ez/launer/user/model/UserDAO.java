package com.ez.launer.user.model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	public int insertUser(UserAllVO vo);
	public int insertAddress(UserAllVO vo);
	public int chkEmail(String email);
	public int chkHp(String hp);
	public int insertDriver(DriverAllVO vo);
	public int insertAccount(DriverAllVO vo);
	public int chkDmail(String email);
	public int chkDhp(String hp);
	UserVO selectByEmail(String email);
	String selectPwd2(String email);
	DriverAllVO selectByDmail(String email);
	String selectPwd3(String email);
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
	int deleteUser(int no);
	String selectPwd(int no);
	int updateUserHp(UserAllVO vo);
	int updateUserAddress(UserAllVO vo);
	int editPwd(UserVO vo);
	
	
	
	/* 한서현 */
	int insertKakaoUser(UserVO userVo);
	int accIsExist(String email);
	int isAddressExist(int no);
	int insertAddressOnlyPart(UserAddressVO addressVo);


	/* 박권순 */
	int insertSnsUser(UserVO userVO);
	

}