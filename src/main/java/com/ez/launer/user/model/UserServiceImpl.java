package com.ez.launer.user.model;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserDAO userDao;

	@Override
	public UserVO selectById(int no) {
		return userDao.selectById(no);
	}

	@Override
	public HashMap<String, Object> selectByIdAddress(int no) {
		return userDao.selectByIdAddress(no);
	}
	
}
	
