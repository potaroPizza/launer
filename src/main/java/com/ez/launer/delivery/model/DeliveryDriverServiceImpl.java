package com.ez.launer.delivery.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DeliveryDriverServiceImpl implements DeliveryDriverService{
    private final DeliveryDriverDAO deliveryDriverDAO;

    @Override
    public DeliveryDriverVO selectByNo(int no) {
        return deliveryDriverDAO.selectByNo(no);
    }
}
