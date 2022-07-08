package com.ez.launer.user.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ez.launer.common.UserSearchVO;
import com.ez.launer.office.model.OfficeVO;

public interface UserService {
	
	//이메일 중복확인에서 사용하는 상수
		public static final int USABLE_EMAIL=1;  //사용가능한 이메일
		public static final int UNUSABLE_EMAIL=2; //중복이라 사용불가능한 이메일
	
	//휴대전화 번호 중복확인에서 사용하는 상수
		public static final int USABLE_HP=1;  //사용가능한 이메일
		public static final int UNUSABLE_HP=2; //중복이라 사용불가능한 이메일
	
	//로그인 체크시 사용하는 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	public static final int NONE_USEREMAIL=3;// 아이디 존재하지 않음
	
	//서비스지역 확인하는 상수
	public static final int POSSIBLE_AREA=1; //서비스 가능 지역
	public static final int IMPOSSIBLE_AREA=2;//서비스 불가능 지역
	
	public int insertUser(UserAllVO vo);
	public int insertAddress(UserAllVO vo);
	public int chkEmail(String email);
	public int chkHp(String hp);
	public int insertDriver(DriverAllVO vo);
	public int insertAccount(DriverAllVO vo);
	public int chkDmail(String email);
	public int chkDhp(String hp);
	UserVO selectByEmail(String email);
	public int loginChk(String email, String pwd);
	DriverVO selectByDmail(String dmail);
	public int dloginChk(String dmail, String dPwd);
	String findEmail(UserVO vo);
	String findDmail(DriverAllVO vo);
	int randomPwd(UserVO vo);
	int randomDpwd(DriverAllVO vo);
	UserVO selectById(int no);
	HashMap<String,Object> selectByIdAddress(int no);
	int deleteUser(int no);
	public int checkLogin(int no, String pwd);
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
	int insertToday (String userNo, String date);
	int insertToday (Map<String,Object> map);


	/* 박권순 */
	int insertSnsUser(UserVO userVO);
}