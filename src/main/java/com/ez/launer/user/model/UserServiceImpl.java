package com.ez.launer.user.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserDAO userDao;

	@Override
	public UserVO selectByUserid(String userid) {
		return userDao.selectByUserid(userid);
	}
}
