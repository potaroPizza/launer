package com.ez.launer.user.model;

import java.util.HashMap;

public interface UserService {
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
}