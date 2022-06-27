package com.ez.launer.delivery.model;

import com.ez.launer.laundryService.order.model.OrderDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class DeliveryDriverServiceImpl implements DeliveryDriverService{
    private final DeliveryDriverDAO deliveryDriverDAO;
    private final OrderDAO orderDAO;

    @Override
    public DeliveryDriverVO selectByNo(int no) {
        return deliveryDriverDAO.selectByNo(no);
    }

    /*
    * [1] ORDER table 업데이트(status 컬럼)
    * [2] DELIVERY_AMOUNT insert
    * */
    @Override
    public int insertDeliveryAmount(Map<String, Object> map) {
        int result = 0;

        try {
            int cnt = orderDAO.updateOrderStatus(map);
            if(cnt > 0) result = deliveryDriverDAO.insertDeliveryAmount(map);
        } catch(RuntimeException e) {
            e.printStackTrace();
            result = -1;
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }
}
