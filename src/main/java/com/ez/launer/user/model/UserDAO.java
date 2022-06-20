package com.ez.launer.user.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDAO {
	UserVO selectByUserid(String userid);

}
