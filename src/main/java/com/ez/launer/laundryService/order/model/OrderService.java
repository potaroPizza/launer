package com.ez.launer.laundryService.order.model;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.user.model.UserVO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface OrderService {
    List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO);
    int orderCount(OrderListSearchVO orderListSearchVO);
    OrderViewVO selectUsersOrderView(int usersNo);
    int insertOrder(OrderVO orderVo);
    int selectRecentOrderNo(int userNo);
    int insertOrderDetails(OrderDetailVO orderDetailVo);
    int insertPointList(Map<String, Object>map);
    int updateUserPoint(UserVO userVo);
    
    
    
    
    
    
    
    
    //지효가 만든거 시작
    List<Map<String, Object>> adminSelectOrderList(OrderSearchVO searchVo);
    int adminSelectTotalRecord(OrderSearchVO searchVo);
    AdminOrderDetailVO adminSelectOrderDetail(int orderNo);
    int adminOrderStatusUpdateMulti(List<OrderVO> list);
    int adminOrderStatusUpdate(int orderNo);
    List<Map<String, Object>> adminSelectAll();
    //지효가 만든거 끝
}
