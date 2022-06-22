package com.ez.launer.user.model;

import java.util.HashMap;

public interface UserService {
	
	//로그인 체크시 사용하는 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	public static final int NONE_USERID=3;	// 아이디 존재하지 않음
	
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
	int deleteUser(int no);
	public int checkLogin(int no, String pwd);
	int updateUserHp(UserAllVO vo);
	int updateUserAddress(UserAllVO vo);
	int editPwd(UserVO vo);
}