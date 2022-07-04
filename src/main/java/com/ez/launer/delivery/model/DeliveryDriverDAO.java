package com.ez.launer.delivery.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.launer.common.DeliverySearchVO;

@Mapper
public interface DeliveryDriverDAO {
    DeliveryDriverVO selectByNo(int no);
    int insertDeliveryAmount(Map<String, Object> map);

    List<Map<String, Object>> amountByDeliveryNo(Map<String, Object> map);

    Map<String, Object> amountAllRecode(Map<String, Object> map);

    List<Map<String, Object>> selectListAll(Map<String, Object> map);
    
    
    //
    HashMap<String,Object> selectByEdit(int no);
    int editPwd(DeliveryDriverVO vo);
    String selectPwd(int no);
    int updateDeliveryHp(DeliveryDriverAllVO vo);
	int updateAccountInfo(DeliveryDriverAllVO vo);
	int deleteDelivery(int no);
	
	//한서현
	List<DeliveryDriverVO> selectDeliveryUser(DeliverySearchVO deliverySearchVo);
	int getDriverTotalRecord(DeliverySearchVO deliverySearchVo);
}
