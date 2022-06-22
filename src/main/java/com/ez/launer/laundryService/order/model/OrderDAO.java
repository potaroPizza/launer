package com.ez.launer.laundryService.order.model;

import com.ez.launer.delivery.model.OrderListSearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OrderDAO {
//    List<Map<String, Object>> orderOfficeView(OrderListSearchVO orderListSearchVO);
    List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO);

    int orderCount(OrderListSearchVO orderListSearchVO);
    Map<String, Object> selectUsersOrderView(int usersNo);
    int insertOrder(OrderVO orderVo);
    
    
}
