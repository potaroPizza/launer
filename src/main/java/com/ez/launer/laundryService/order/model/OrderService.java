package com.ez.launer.laundryService.order.model;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.user.model.UserVO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface OrderService {
    // 박권순 시작
    // 박권순 시작
    // 박권순 시작
    // 박권순 시작
    List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO);
    int orderCount(OrderListSearchVO orderListSearchVO);
    int updateOrder(OrderDeliveryVO orderDeliveryVO);
    int countOrderByDeliveryNo(OrderDeliveryVO orderDeliveryVO);
    List<OrderDeliveryAllVO> selectByDeliveryNo(Map<String, Object> map);
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
    int adminOrderStatusUpdateMulti(List<OrderVO> list);
    int adminOrderStatusUpdate(int orderNo);
    List<Map<String, Object>> adminSelectAll();
    //지효가 만든거 끝
}
