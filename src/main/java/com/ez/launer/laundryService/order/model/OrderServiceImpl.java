package com.ez.launer.laundryService.order.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.delivery.model.OrderListSearchVO;
import com.ez.launer.user.model.UserVO;

import lombok.RequiredArgsConstructor;

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
	@Transactional	// 트랜잭션 관리하는 어노테이션
	public int adminOrderStatusUpdateMulti(List<OrderVO> list) {
		int cnt = 0;
		
		try {
			for(OrderVO vo : list) {
				int orderNo = vo.getNo();
				if(orderNo != 0) {	// 체크박스에 체크한 경우만 삭제처리
					cnt = orderDAO.adminOrderStatusUpdate(orderNo);
				}
			}
		} catch (RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			//원래 @Transactional이거 쓰면 try-catch없어야 알아서 다 하는데 
			//try-catch문을 쓰면 명시적으로 rollback처리를 해줘야함
			//try-catch문을 쓴 이유는 cnt = -1; 때문임
			//컨트롤러에서 cnt의 결과로 예외처리를 해야하기 때문임.
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int adminOrderStatusUpdate(int orderNo) {
		return orderDAO.adminOrderStatusUpdate(orderNo);
	}
	
	//지효가 만든거 끝
}
