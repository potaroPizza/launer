package com.ez.launer.delivery.model;

import com.ez.launer.laundryService.order.model.OrderDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;
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
    *
    * 취소를 할 경우..?
    * ORDER_STATUS_NO가 1(수거전)또는 , 4(배송대기)로 변경, PICKUP_DRIVER,
    * 이걸 구별하기 위해서는 groupNo에 따라 1, 4로 바뀌면됨
    * 이건 JS를 이용해서 해주자
    *
    * Map의 orderStatusNo가 1또는 4일 경우 취소로 if걸어준다
    * */
    @Override
    public int insertDeliveryAmount(Map<String, Object> map) {
        int result = 0;
        int type = Integer.parseInt((String)map.get("orderStatusNo"));
        map.put("no", 0);

        try {
            result = orderDAO.updateOrderStatus(map);

            if(result > 0) {
                if(type != 1 && type != 4)
                    result = deliveryDriverDAO.insertDeliveryAmount(map);
            }
        } catch(RuntimeException e) {
            e.printStackTrace();
            result = -1;
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> amountByDeliveryNo(Map<String, Object> map) {
        return deliveryDriverDAO.amountByDeliveryNo(map);
    }

    @Override
    public Map<String, Object> amountAllRecode(Map<String, Object> map) {
        return deliveryDriverDAO.amountAllRecode(map);
    }

    @Override
    public List<Map<String, Object>> selectListAll(Map<String, Object> map) {
        return deliveryDriverDAO.selectListAll(map);
    }
}
