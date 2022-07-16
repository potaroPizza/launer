package com.ez.launer.user.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.launer.common.UserSearchVO;
import com.ez.launer.office.model.OfficeVO;

@Mapper
public interface UserDAO {
	public int insertUser(UserAllVO vo);
	public int insertAddress(UserAllVO vo);
	public int chkEmail(String email);
	public int chkSocial(String email);
	public int chkHp(String hp);
	public int insertDriver(DriverAllVO vo);
	public int insertAccount(DriverAllVO vo);
	public int chkDmail(String email);
	public int chkDhp(String hp);
	public UserVO selectByEmail(String email);
	String selectPwd2(String email);
	DriverVO selectByDmail(String dmail);
	String selectPwd3(String dmail);
	String findEmail(UserVO vo);
	String findDmail(DriverAllVO vo);
	int randomPwd(UserVO vo);
	int randomDpwd(DriverAllVO vo);
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
	int deleteUser(int no);
	String selectPwd(int no);
	int updateUserHp(UserAllVO vo);
	int updateUserAddress(UserAllVO vo);
	int editPwd(UserVO vo);
	List<OfficeVO>selectOffice();
	
	
	
	/* 한서현 */
	public List<UserVO> selectUser(UserSearchVO userSearchVo); // adminManager
	int insertKakaoUser(UserVO userVo);
	int accIsExist(String email);
	int isAddressExist(int no);
	int insertAddressOnlyPart(UserAddressVO addressVo);
	int getUserTotalRecord(UserSearchVO userSearchVo);
	int insertBranchManager(UserVO userVo);
	public List<UserVO> withdrawUsers();
	int insertToday (Map<String,Object> map);


	/* 박권순 */
	int insertSnsUser(UserVO userVO);
	int socialReJoin(int no);
	

}