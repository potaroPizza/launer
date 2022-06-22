package com.ez.launer.user.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
	int deleteUser(int no);
	String selectPwd(int no);
	int updateUserHp(UserAllVO vo);
	int updateUserAddress(UserAllVO Vo);
	
}