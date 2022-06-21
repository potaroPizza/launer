package com.ez.launer.user.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
}