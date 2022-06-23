package com.ez.launer.user.model;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.launer.office.model.OfficeDAO;
import com.ez.launer.office.model.OfficeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	private final UserDAO userDao;
	private final OfficeDAO officeDao;

	@Override
	public UserVO selectById(int no) {
		return userDao.selectById(no);
	}

	@Override
	public HashMap<String, Object> selectByIdAddress(int no) {
		return userDao.selectByIdAddress(no);
	}

	@Override
	public int checkLogin(int no, String pwd) {
		String dbPwd = userDao.selectPwd(no);
		int result=0;
		logger.info("결과 리턴 dbPwd={}", dbPwd);
		if(dbPwd != null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=UserService.LOGIN_OK;
			}else {
				result=UserService.DISAGREE_PWD;
			}
		}else {
			result=UserService.NONE_USERID;
		}
		

		logger.info("결과 리턴 result={}", result);
		return result;
	}

	
	@Override
	public int deleteUser(int no) {
		return userDao.deleteUser(no);
	}

	@Override
	public int updateUserHp(UserAllVO vo) {
		return userDao.updateUserHp(vo);
	}

	@Override
	public int updateUserAddress(UserAllVO vo) {
//		List<OfficeVO> list = officeDao.selectAll();
		/*for(OfficeVO officeVo : list) {
			
		}*/
//		vo.getAddress();
		vo.setOfficeNo(1);
		
		return userDao.updateUserAddress(vo);
	}

	@Override
	public int editPwd(UserVO vo) {
		return userDao.editPwd(vo);
	}







}

