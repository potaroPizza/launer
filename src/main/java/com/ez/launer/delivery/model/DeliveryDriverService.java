package com.ez.launer.delivery.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface DeliveryDriverService {
    DeliveryDriverVO selectByNo(int no);
    int insertDeliveryAmount(Map<String, Object> map);
    List<Map<String, Object>> amountByDeliveryNo(Map<String, Object> map);
    Map<String, Object> amountAllRecode(Map<String, Object> map);
    List<Map<String, Object>> selectListAll(Map<String, Object> map);
    
    
    //로그인 체크시 사용하는 상수
  	public static final int LOGIN_OK=1; //로그인 성공
  	public static final int DISAGREE_PWD=2; //비밀번호 불일치
  	public static final int NONE_USEREMAIL=3;// 아이디 존재하지 않음
    
  	HashMap<String,Object> selectByEdit(int no);
  	int editPwd(DeliveryDriverVO vo);
  	public int checkLogin(int no, String pwd);
  	int updateDeliveryHp(DeliveryDriverAllVO vo);
	int updateAccountInfo(DeliveryDriverAllVO vo);
}
