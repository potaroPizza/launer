package com.ez.launer.laundryService.order.model;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.user.model.UserVO;

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

	@Override
	public int selectRecentOrderNo(int userNo) {
		return orderDAO.selectRecentOrderNo(userNo);
	}
	
	@Override
	public int insertOrderDetails(OrderDetailVO orderDetailVo) {
		return orderDAO.insertOrderDetails(orderDetailVo);
	}

	@Override
	public int insertPointList(Map<String, Object> map) {
		return orderDAO.insertPointList(map);
	}

	public int updateUserPoint(UserVO userVo) {
		return orderDAO.updateUserPoint(userVo);
	}

	public int updatePaymentDate(int orderNo) {
		return orderDAO.updatePaymentDate(orderNo);
	}

	
	//지효가 만든거 시작
	@Override
	public List<Map<String, Object>> adminSelectOrderList(OrderSearchVO searchVo) {
		return orderDAO.adminSelectOrderList(searchVo);
	}

	@Override
	public int adminSelectTotalRecord(OrderSearchVO searchVo) {
		return orderDAO.adminSelectTotalRecord(searchVo);
	}

	@Override
	public AdminOrderDetailVO adminSelectOrderDetail(int orderNo) {
		return orderDAO.adminSelectOrderDetail(orderNo);
	}

	@Override
	public int adminOrderStatusUpdateMulti(List<OrderVO> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminOrderStatusUpdate(int orderNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	//지효가 만든거 끝
}
