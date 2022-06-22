package com.ez.launer.laundryService.order.model;

import com.ez.launer.delivery.model.OrderListSearchVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService{
    private final OrderDAO orderDAO;

    @Override
    public List<OrderDeliveryAllVO> orderOfficeView(OrderListSearchVO orderListSearchVO) {
        return orderDAO.orderOfficeView(orderListSearchVO);
    }

    @Override
    public int orderCount(OrderListSearchVO orderListSearchVO) {
        return orderDAO.orderCount(orderListSearchVO);
    }

	@Override
	public OrderViewVO selectUsersOrderView(int usersNo) {
		return orderDAO.selectUsersOrderView(usersNo);
	}

	@Override
	public int insertOrder(OrderVO orderVo) {
		return orderDAO.insertOrder(orderVo);
	}
}
