package com.ez.launer.laundryService.order.model;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDAO {
//    List<Map<String, Object>> orderOfficeView(OrderListSearchVO orderListSearchVO);
    List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO);

    int orderCount(OrderListSearchVO orderListSearchVO);
    OrderViewVO selectUsersOrderView(int usersNo);
    int insertOrder(OrderVO orderVo);
    int selectRecentOrderNo(int userNo);

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //지효가 만든거 시작
    List<Map<String, Object>> adminSelectOrderList(OrderSearchVO searchVo);
    int adminSelectTotalRecord(OrderSearchVO searchVo);
    //지효가 만든거 끝
}
