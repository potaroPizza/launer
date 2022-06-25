package com.ez.launer.laundryService.order.model;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.user.model.UserVO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDAO {
    // 박권순 시작
    // 박권순 시작
    // 박권순 시작
    // 박권순 시작
    // List<Map<String, Object>> orderOfficeView(OrderListSearchVO orderListSearchVO);
    List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO);

    int orderCount(OrderListSearchVO orderListSearchVO);
    int updateOrder(OrderDeliveryVO orderDeliveryVO);
    // 박권순 끝
    // 박권순 끝
    // 박권순 끝
    // 박권순 끝



    OrderViewVO selectUsersOrderView(int usersNo);
    int insertOrder(OrderVO orderVo);
    int selectRecentOrderNo(int userNo);
    int insertOrderDetails(OrderDetailVO orderDetailVo);
    int insertPointList(Map<String, Object>map);
    int updateUserPoint(UserVO userVo);
    int updatePaymentDate(int orderNo);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //지효가 만든거 시작
    List<Map<String, Object>> adminSelectOrderList(OrderSearchVO searchVo);
    int adminSelectTotalRecord(OrderSearchVO searchVo);
    AdminOrderDetailVO adminSelectOrderDetail(int orderNo);
    int adminOrderStatusUpdate(int orderNo);
    List<Map<String, Object>> adminSelectAll();
    //지효가 만든거 끝
}
